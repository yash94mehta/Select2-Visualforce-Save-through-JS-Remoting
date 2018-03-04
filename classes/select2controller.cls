public class select2controller
{
public string test{get;set;}
   public select2controller()
   {

   }
   @RemoteAction
   public static list<wrapper> getOptions()
   {
 
       list<account> abc = [select id,name from account limit 50];
       list<wrapper> wrap =new list<wrapper>();
       for(Account a : abc)
       {
        wrapper w =new wrapper();
        w.id = a.id;
        w.text = a.name;
        wrap.add(w);
       }
      //string results = JSON.serializepretty(wrap);
      //system.debug('results'+results);
      return wrap;
   
   }

public void savelist()
{
system.debug('ttttt'+Apexpages.currentPage().getParameters().get('test123'));

List<wrapper> wrap = (List<wrapper>) JSON.deserialize(Apexpages.currentPage().getParameters().get('test123'), List<wrapper>.class);
for(wrapper w :wrap)
{
system.debug('111' + w);
}
}
public class wrapper
{
public string id{get;set;}
public string text{get;set;}

}

}
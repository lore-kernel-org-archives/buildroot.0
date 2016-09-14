From: Ryan Coe <bluemrp9@gmail.com>
Date: Wed, 14 Sep 2016 11:44:22 -0700
Subject: [Buildroot] [1/1,RFC] mysql: replace mysql with mariadb 10.0
In-Reply-To: <32ce68ee-edba-85bd-7759-d3ed50d72fca@je-eigen-domein.nl>
References: <20160912220551.17934-2-bluemrp9@gmail.com>
 <32ce68ee-edba-85bd-7759-d3ed50d72fca@je-eigen-domein.nl>
Message-ID: <57D99A86.5080308@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris, All,

On 09/14/2016 07:46 AM, Floris Bos wrote:
> Hi,
>
> On 09/13/2016 12:05 AM, Ryan Coe wrote:
>> Replaces the old mysql 5.1 with mariadb 10.0. The package was not 
>> renamed
>> as mariadb is a drop-in replacement for mysql.
>
> Give your patch a try
>
> - openssl is mentioned in the dependencies but not selected in Config.in
That was a mistake on my end.  It will be added for the second version.
>
> - fails to compile for me when using uclibc as C library:
>
> ==
> [ 82%] Building CXX object sql/CMakeFiles/sql.dir/signal_handler.cc.o
> /mnt/nfs/mdbtest/buildroot/output/build/mysql-10.0.27/sql/signal_handler.cc: 
> In function ?void handle_fatal_signal(int)?:
> /mnt/nfs/mdbtest/buildroot/output/build/mysql-10.0.27/sql/signal_handler.cc:274:21: 
> error: ?thd? was not declared in this scope
>       my_write_stderr(thd->query(), MY_MIN(65536U, thd->query_length()));
>                       ^
> /mnt/nfs/mdbtest/buildroot/output/build/mysql-10.0.27/sql/signal_handler.cc: 
> In function ?void handle_fatal_signal(int)?:
> /mnt/nfs/mdbtest/buildroot/output/build/mysql-10.0.27/sql/signal_handler.cc:274:21: 
> error: ?thd? was not declared in this scope
>       my_write_stderr(thd->query(), MY_MIN(65536U, thd->query_length()));
>                       ^
> libmysqld/CMakeFiles/sql_embedded.dir/build.make:590: recipe for 
> target 
> 'libmysqld/CMakeFiles/sql_embedded.dir/__/sql/signal_handler.cc.o' failed
> make[4]: *** 
> [libmysqld/CMakeFiles/sql_embedded.dir/__/sql/signal_handler.cc.o] 
> Error 1
> make[4]: *** Waiting for unfinished jobs....
> ==
I will look into this.  I am using glibc for my project.
>
> - is the custom my.cnf necessary?
I'm not entirely sure about this.  By default, it does not install a 
configuration file.  There are several sample ones installed to 
/usr/share/mysql.  We could use my-small.cnf as it would probably be 
best suited to embedded systems.  The only thing I saw was all of the 
innodb stuff was commented out.  I'm using that for my project. Feedback 
from others would be welcome here.
>
> - any specific reason to choose the older MariaDB 10.0.x branch over 
> the current stable 10.1.x?
> (believe the newer version also comes with systemd support, which may 
> save you from having to create your own unit files)
No, I updated the version to the latest 10.1.17.  That will be part of 
my v2 patch.
>
>> diff --git a/package/Config.in b/package/Config.in
>> index 332f05d..9fca1f6 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -902,8 +902,8 @@ menu "Database"
>>       source "package/kompexsqlite/Config.in"
>>       source "package/leveldb/Config.in"
>>       source "package/libpqxx/Config.in"
>> -    source "package/mongodb/Config.in"
>>       source "package/mysql/Config.in"
>> +    source "package/mongodb/Config.in"
>>       source "package/postgresql/Config.in"
>>       source "package/redis/Config.in"
>>       source "package/sqlcipher/Config.in"
>
> Why move it?
I moved it to keep alphabetical order since I changed the name from 
mysql to mariadb in the Config.in file.
>
>
>
> Yours sincerely,
>
> Floris Bos
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
Thanks,
Ryan Coe

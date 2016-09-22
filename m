From: Floris Bos <bos@je-eigen-domein.nl>
Date: Thu, 22 Sep 2016 13:00:36 +0200
Subject: [Buildroot] [RFC v2] mysql: replace mysql with mariadb 10.1
In-Reply-To: <20160919034340.4233-1-bluemrp9@gmail.com>
References: <20160912220551.17934-2-bluemrp9@gmail.com>
 <20160919034340.4233-1-bluemrp9@gmail.com>
Message-ID: <8401aa55-f9b9-a7e9-a030-97996c8e11e3@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 09/19/2016 05:43 AM, Ryan Coe wrote:
> This patch represents my attempt to replace the aging mysql 5.1 that is
> currently shipped with Buildroot. I am replacing mysql altogether with mariadb
> version 10.1. I have been able to test this with both an arm and a x86_64
> build, and it has also been tested with glibc and uclibc.  I have not tested it
> with systemd.

Still broken on ARM uclibc

==
[ 61%] Building CXX object 
libmysqld/CMakeFiles/sql_embedded.dir/__/sql/item_row.cc.o
/mnt/nfs/buildroot/buildroot/output/build/mysql-10.1.17/sql/signal_handler.cc: 
In function ?void handle_fatal_signal(int)?:
/mnt/nfs/buildroot/buildroot/output/build/mysql-10.1.17/sql/signal_handler.cc:285:21: 
error: ?thd? was not declared in this scope
      my_write_stderr(thd->query(), MY_MIN(65536U, thd->query_length()));
                      ^
==

Seems to be a bug where they declare thd within an #ifdef:

==
#ifdef HAVE_STACKTRACE
   THD *thd;
#endif
==

But the code using thd is not within an #ifdef.


> # Jemalloc was added for TokuDB. Since its configure script seems 
> somewhat broken
> # when it comes to cross-compilation we shall disable it and also 
> disable TokuDB.
> MYSQL_OPTS += -DWITH_JEMALLOC=no
> MYSQL_OPTS += -DWITHOUT_TOKUDB=1

Is this still a problem with 10.1 ?
Recall it tries to use system jemalloc if present, instead of some 
bundled version now.

So could probably make it a soft depedency:

==
ifeq ($(BR2_PACKAGE_JEMALLOC),y)
MYSQL_DEPENDENCIES += jemalloc
endef
==

> wait_for_pid() {
>     WAIT_DELAY=10
>     if [ ! -e $MYSQL_PID ]; then
>         while [ $WAIT_DELAY -gt 0 ]; do
>             if [ -e $MYSQL_PID ]; then
>                 return 0
>             fi
>             sleep 1
>             : $((WAIT_DELAY -= 1))
>         done
>         return 1
>     fi
>     return 0
> }

Is it certain that the server is ready to accept connections if there's 
a pid file?
The sample init file in support-files/mysql.server seems to use 
"mysqladmin ping" instead

==
wait_for_ready () {

   i=0
   while test $i -ne $service_startup_timeout ; do

     if $bindir/mysqladmin ping >/dev/null 2>&1; then
       log_success_msg
       return 0
     elif kill -0 $! 2>/dev/null ; then
       :  # mysqld_safe is still running
     else
       # mysqld_safe is no longer running, abort the wait loop
       break
     fi

     echo $echo_n ".$echo_c"
     i=`expr $i + 1`
     sleep 1

   done

   log_failure_msg
   return 1
}
==



Yours sincerely,

Floris Bos

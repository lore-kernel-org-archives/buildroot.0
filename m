From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Feb 2014 21:15:06 +0100
Subject: [Buildroot] [PATCH 1/2] mysql: add option to build the server
In-Reply-To: <1392244774-15356-1-git-send-email-kuyurix@gmail.com> ("Marcelo
 =?utf-8?Q?Guti=C3=A9rrez=22's?= message of "Wed, 12 Feb 2014 22:39:33
 +0000")
References: <1392244774-15356-1-git-send-email-kuyurix@gmail.com>
Message-ID: <87ios5oab9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcelo" == Marcelo Guti?rrez <kuyurix@gmail.com> writes:

 > From: Marcelo Gutierrez <kuyurix@gmail.com>
 > Signed-off-by: Marcelo Gutierrez (UTN/FRH) <kuyurix@gmail.com>

Thanks, see below for a few comments.


 > diff --git a/package/mysql/mysql-0003-ac_stack_direction-is-unset.patch b/package/mysql/mysql-0003-ac_stack_direction-is-unset.patch
 > new file mode 100644
 > index 0000000..6fef0a9
 > --- /dev/null
 > +++ b/package/mysql/mysql-0003-ac_stack_direction-is-unset.patch
 > @@ -0,0 +1,15 @@
 > +misc.m4: ac_cv_c_stack_direction is unset.
 > +
 > +Signed-off-by: Marcelo Gutierrez (UTN/FRH) <kuyurix@gmail.com>

Ok, please don't forget to send upstream.


 > +++ b/package/mysql/mysql-0004-Fix-gen_lex_hash-execution.patch
 > @@ -0,0 +1,32 @@
 > +Makefile: fix cross-compiling the server
 > +
 > +MySQL Makefile believes it can run code it just compiled, to
 > +generate a header. This does not work for cross-compilation.
 > +
 > +Instead, use a pre-installed host-version of the required tool.
 > +
 > +Signed-off-by: Marcelo Gutierrez (UTN/FRH) <kuyurix@gmail.com>

Like this it cannot go upstream. Would upstream be interested in a patch
doing it right (E.G. using CC_FOR_BUILD)?


 > diff --git a/package/mysql/mysql-0005-bison_3_breaks_mysql_server_build.patch b/package/mysql/mysql-0005-bison_3_breaks_mysql_server_build.patch
 > new file mode 100644
 > index 0000000..918fe24
 > --- /dev/null
 > +++ b/package/mysql/mysql-0005-bison_3_breaks_mysql_server_build.patch
 > @@ -0,0 +1,3310 @@
 > +fix the yacc code in mysql

Fix in what way?


 > +++ b/package/mysql/mysql.mk
 > @@ -25,7 +25,6 @@ MYSQL_CONF_ENV = \
 
 >  MYSQL_CONF_OPT = \
 >  	--without-ndb-binlog \
 > -	--without-server \
 >  	--without-docs \
 >  	--without-man \
 >  	--without-libedit \
 > @@ -34,6 +33,50 @@ MYSQL_CONF_OPT = \
 >  	--enable-thread-safe-client \
 >  	$(ENABLE_DEBUG)
 
 > +ifeq ($(BR2_PACKAGE_MYSQL_SERVER),y)
 > +MYSQL_DEPENDENCIES += host-mysql host-bison
 > +HOST_MYSQL_DEPENDENCIES =
 > +
 > +HOST_MYSQL_CONF_OPT = \
 > +	--with-embedded-server

It is imho cleaner to unconditionally define the host mysql variables,
so the host-autotools-package macro does the right thing.

-- 
Bye, Peter Korsgaard

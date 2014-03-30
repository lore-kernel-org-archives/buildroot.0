From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 30 Mar 2014 23:54:01 +0200
Subject: [Buildroot] [PATCH v2] postgresql: new package
Message-ID: <trinity-c87c01cc-1c84-4994-8cbf-a9d3e9175317-1396216441410@3capp-gmx-bs13>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

thanks for the review...

On Sat, Mar 29, 2014 at 11:57:55AM +0100, Thomas Petazzoni wrote:
> Dear Peter Seiderer,
> 
> On Tue, 18 Mar 2014 23:36:00 +0100, Peter Seiderer wrote:
> > Based on suggested new package by Marco Trapanese ([1]).
> > 
> > [1] http://lists.busybox.net/pipermail/buildroot/2014-February/090661.html
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> 
> I've tried to build this, but it doesn't build here. I'm using the
> following defconfig:
> 
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2014.02-rc1.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_13=y
> BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
> BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> BR2_PACKAGE_POSTGRESQL=y
> BR2_PACKAGE_LIBNDP=y
> 
> The build failure is:
> 
> In file included from regcomp.c:2030:0:
> regc_pg_locale.c: In function ?pg_wc_isdigit?:
> regc_pg_locale.c:312:6: error: dereferencing pointer to incomplete type
> regc_pg_locale.c: In function ?pg_wc_isalpha?:
> regc_pg_locale.c:345:6: error: dereferencing pointer to incomplete type
> regc_pg_locale.c: In function ?pg_wc_isalnum?:
> regc_pg_locale.c:378:6: error: dereferencing pointer to incomplete type
> regc_pg_locale.c: In function ?pg_wc_isupper?:
> regc_pg_locale.c:411:6: error: dereferencing pointer to incomplete type
> regc_pg_locale.c: In function ?pg_wc_islower?:
> regc_pg_locale.c:444:6: error: dereferencing pointer to incomplete type
> regc_pg_locale.c: In function ?pg_wc_isgraph?:
> regc_pg_locale.c:477:6: error: dereferencing pointer to incomplete type
> regc_pg_locale.c: In function ?pg_wc_isprint?:
> regc_pg_locale.c:510:6: error: dereferencing pointer to incomplete type
> regc_pg_locale.c: In function ?pg_wc_ispunct?:
> regc_pg_locale.c:543:6: error: dereferencing pointer to incomplete type
> regc_pg_locale.c: In function ?pg_wc_isspace?:
> regc_pg_locale.c:576:6: error: dereferencing pointer to incomplete type
> regc_pg_locale.c: In function ?pg_wc_toupper?:
> regc_pg_locale.c:617:12: error: dereferencing pointer to incomplete type
> regc_pg_locale.c:617:12: error: dereferencing pointer to incomplete type
> regc_pg_locale.c: In function ?pg_wc_tolower?:
> regc_pg_locale.c:658:12: error: dereferencing pointer to incomplete type
> regc_pg_locale.c:658:12: error: dereferencing pointer to incomplete type
> make[4]: *** [regcomp.o] Erreur 1
> make[4]: quittant le r?pertoire ? /home/thomas/projets/buildroot/output/build/postgresql-9.3.3/src/backend/regex ?
> 

o.k. I will take a look at it...

> Some other comments below.
> 
> > diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
> > new file mode 100644
> > index 0000000..efc296f
> > --- /dev/null
> > +++ b/package/postgresql/Config.in
> > @@ -0,0 +1,13 @@
> > +config BR2_PACKAGE_POSTGRESQL
> > +   bool "PostgreSQL"
> 
> should be lower-case.

mhh, did take a look at package/mysql/Config.in: bool "MySQL" and did the same, use the
offical name which emphasises the SQL..., but I can change this if lower-case Menu entries
are an requirement?

> 
> > +   depends on BR2_INET_IPV6
> > +   select BR2_PACKAGE_READLINE
> > +   select BR2_PACKAGE_ZLIB
> > +   help
> > +     PostgreSQL is a powerful, open source object-relational
> > +     database system.
> > +
> > +     http://www.postgresql.org
> > +
> > +comment "PostgreSQL needs a toolchain w/ IPv6"
> 
> Ditto.

see above...

> 
> > +   depends on !BR2_INET_IPV6
> > diff --git a/package/postgresql/S50postgresql b/package/postgresql/S50postgresql
> > new file mode 100644
> > index 0000000..06cb4d5
> > --- /dev/null
> > +++ b/package/postgresql/S50postgresql
> > @@ -0,0 +1,44 @@
> > +#!/bin/sh
> > +#
> > +# start postgresql
> > +#
> > +
> > +umask 077
> > +
> > +if [ ! -f /srv/pgsql/data/PG_VERSION ]; then
> > +   echo "Initializing postgresql data base..."
> > +   su - postgres -c '/usr/bin/pg_ctl initdb -D /srv/pgsql/data '
> > +   echo "done"
> > +fi
> > +
> > +start() {
> > +   echo -n "Starting postgresql: "
> > +   su - postgres -c '/usr/bin/pg_ctl start -D /srv/pgsql/data -l logfile'
> > +   echo "OK"
> > +}
> > +stop() {
> > +   echo -n "Stopping postgresql: "
> > +   su - postgres -c '/usr/bin/pg_ctl stop -D /srv/pgsql/data -m fast'
> > +   echo "OK"
> > +}
> > +restart() {
> > +   stop
> > +   start
> > +}
> > +
> > +case "$1" in
> > +   start)
> > +           start
> > +           ;;
> > +   stop)
> > +           stop
> > +           ;;
> > +   restart|reload)
> > +           restart
> > +           ;;
> > +   *)
> > +           echo "Usage: $0 {start|stop|restart}"
> > +           exit 1
> > +esac
> > +
> > +exit $?
> > diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> > new file mode 100644
> > index 0000000..f4edc69
> > --- /dev/null
> > +++ b/package/postgresql/postgresql.mk
> > @@ -0,0 +1,44 @@
> > +################################################################################
> > +#
> > +# postgresql
> > +#
> > +################################################################################
> > +
> > +POSTGRESQL_VERSION = 9.3.3
> > +POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
> > +POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)/$(POSTGRESQL_SOURCE)
> 
> This looks weird, why is $(POSTGRESQL_SOURCE) at the end of the site?

o.k, will fix (was copy & paste error)

> 
> > +POSTGRESQL_LICENSE = PostgreSQL
> > +POSTGRESQ_LICENSE_FILES = COPYRIGHT
> > +POSTGRESQL_DEPENDENCIES = readline zlib
> > +POSTGRESQL_CONF_OPT = --prefix=/usr
> 
> This is not needed, as --prefix=/usr is part of the default
> configuration options.

o.k. will change...

> 
> > +
> > +ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> > +   POSTGRESQL_CONF_OPT += --disable-thread-safety
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_TZDATA),y)
> > +   POSTGRESQL_DEPENDENCIES += tzdata
> > +   POSTGRESQL_CONF_OPT += --with-system-tzdata=/usr/share/zoneinfo
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> > +   POSTGRESQL_DEPENDENCIES += openssl
> > +   POSTGRESQL_CONF_OPT += --with-openssl
> > +endif
> 
> Also, there are many, many more configuration options. You don't have
> to support all of them for a first submission, but if you don't support
> a given feature, you should pass --without-<foo> for it so that the
> configure script doesn't mistakenly detect a library from the host. So
> for example: --without-pam --without-python --without-perl, etc.
> 
> I see that you're making readline and zlib mandatory dependencies, but
> they are not: the package has --without-readline and --without-zlib
> options. So instead of mandatory dependencies, you should use:
> 
> ifeq ($(BR2_PACKAGE_READLINE),y)
> POSTGRESQL_CONF_OPT += --with-readline
> POSTGRESQL_DEPENDENDENCIES += readline
> else
> POSTGRESQL_CONF_OPT += --without-readline
> endif
> 

Did follow the PostgreSQL INSTALL hints stating:

     * The GNU Readline library is used by default. It allows psql (the
       PostgreSQL command line SQL interpreter) to remember each command
       you type, and allows you to use arrow keys to recall and edit
       previous commands. This is very helpful and is strongly
       recommended. If you don't want to use it then you must specify the
       "--without-readline" option to "configure". As an alternative, you
       can often use the BSD-licensed "libedit" library, originally
       developed on NetBSD. The "libedit" library is GNU
       Readline-compatible and is used if "libreadline" is not found, or
       if "--with-libedit-preferred" is used as an option to "configure".
       If you are using a package-based Linux distribution, be aware that
       you need both the readline and readline-devel packages, if those

and made the default enabled packages mandatory...

The same for zlib:

     * The zlib compression library is used by default. If you don't want
       to use it then you must specify the "--without-zlib" option to
       "configure". Using this option disables support for compressed
       archives in pg_dump and pg_restore.

But I can make readline/zlib optional (with some comment in the
Config.in file)?

All other features/packages are optional (and disabled as the INSTALL file
states):

   The following packages are optional. They are not required in the
   default configuration, but they are needed when certain build options
   are enabled, as explained below:

So I think there is no need to disable them explicitly?

> > +
> > +define POSTGRESQL_USERS
> > +   postgres -1 postgres -1 * /srv/pgsql/data /bin/sh postgres PostgreSQL Server
> > +endef
> 
> Is /srv a normal location for databases? Isn't /var used in general?

o.k, will change...

> 
> > +
> > +define POSTGRESQL_INSTALL_TARGET_FIXUP
> > +   $(INSTALL) -v -dm700 $(TARGET_DIR)/srv/pgsql/data
> 
> -v seems useless.

o.k., will change...

> 
> Also, is there something that ensures that the /srv/pgsql/data
> directory is owned by the postgres user and group, instead of the
> default root user?
> 
> > +endef
> > +
> > +POSTGRESQL_POST_INSTALL_TARGET_HOOKS += POSTGRESQL_INSTALL_TARGET_FIXUP
> > +
> > +define POSTGRESQL_INSTALL_INIT_SYSV
> > +   $(INSTALL) -m 0755 -D package/postgresql/S50postgresql \
> > +           $(TARGET_DIR)/etc/init.d/S50postgresql
> > +endef
> > +
> > +$(eval $(autotools-package))
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

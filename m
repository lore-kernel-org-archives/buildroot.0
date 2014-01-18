From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2014 01:02:51 +0100
Subject: [Buildroot] [PATCH 1/1] Update MySQL client package
In-Reply-To: <1389990336-6592-1-git-send-email-kuyurix@gmail.com>
References: <1389990336-6592-1-git-send-email-kuyurix@gmail.com>
Message-ID: <20140118000251.GG3982@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcello, All,

On 2014-01-17 20:25 +0000, Marcelo Guti?rrez(UTN/FRH) spake thusly:
> From: Marcelo Gutierrez <kuyurix@gmail.com>
> 
> Added MySQL server support. The patches are based on buildroot-2013.11

Glad to see you eventually managed to build mySQL server. :-)

However, I ahve a few comments, see below:

> Signed-off-by: Marcelo Gutierrez (UTN/FRH) <kuyurix@gmail.com>
> ---
>  package/mysql_client/Config.in                     |   12 ++++-
>  package/mysql_client/S60mysqld                     |   25 +++++++++
>  package/mysql_client/misc.m4.patch                 |   11 ++++
>  package/mysql_client/mysql_client.mk               |   53 ++++++++++++++++++--
>  .../mysql_server/mysql_client-crosscompiling.patch |   23 +++++++++
>  5 files changed, 119 insertions(+), 5 deletions(-)
>  create mode 100644 package/mysql_client/S60mysqld
>  create mode 100644 package/mysql_client/misc.m4.patch
>  create mode 100644 package/mysql_client/mysql_server/mysql_client-crosscompiling.patch
> 
> diff --git a/package/mysql_client/Config.in b/package/mysql_client/Config.in
> index 543bed1..1ee6067 100644
> --- a/package/mysql_client/Config.in
> +++ b/package/mysql_client/Config.in
> @@ -6,8 +6,16 @@ config BR2_PACKAGE_MYSQL_CLIENT
>  	select BR2_PACKAGE_NCURSES
>  	select BR2_PACKAGE_READLINE
>  	help
> -	  MySQL client
> +	  The MySQL Open Source Database System

Since by default only the client is installed, I'd still say so in the
help entry. also, please add the URL to the home of MySQL. Something
along the lines of:

    The MySQL Open Source Database System.

    This option only installs the client. If you want the server, see
    the option below.

    http://website/of/mysql

> -comment "MySQL client needs a toolchain w/ C++, threads"
> +comment "MySQL server and MySQL client needs a toolchain w/ C++, threads"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> +
> +if BR2_PACKAGE_MYSQL_CLIENT
> +	
> +config BR2_PACKAGE_MYSQL_CLIENT_SERVER
> +	bool "MySQL server"
> +
> +endif
> +
> diff --git a/package/mysql_client/S60mysqld b/package/mysql_client/S60mysqld
[--SNIP--unreviewed--]

> diff --git a/package/mysql_client/misc.m4.patch b/package/mysql_client/misc.m4.patch

This should be named:
    mysql_client-0000-short-description.patch

See:
    http://buildroot.net/downloads/manual/manual.html#patch-policy

> new file mode 100644
> index 0000000..afa23f2

You also should add a commiyt-log-like description as header to that
patch, and add your SoB-line as well (see the URL above).

> --- /dev/null
> +++ b/package/mysql_client/misc.m4.patch
> @@ -0,0 +1,11 @@
> +--- mysql-5.1.70.orig/config/ac-macros/misc.m4
> ++++ mysql-5.1.70/config/ac-macros/misc.m4
> +@@ -477,7 +477,7 @@
> +     exit(ptr_f(&a) < 0);
> +   }
> +   ], ac_cv_c_stack_direction=1, ac_cv_c_stack_direction=-1,
> +-   ac_cv_c_stack_direction=)])
> ++   ac_cv_c_stack_direction=0)])
> +  AC_DEFINE_UNQUOTED(STACK_DIRECTION, $ac_cv_c_stack_direction)
> + ])dnl
> + 

> diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
> index fe24ae7..c100eba 100644
> --- a/package/mysql_client/mysql_client.mk
> +++ b/package/mysql_client/mysql_client.mk
> @@ -4,15 +4,26 @@
>  #
>  ################################################################################
>  
> -MYSQL_CLIENT_VERSION = 5.1.70
> +MYSQL_CLIENT_VERSION_MAJOR = 5.1
> +MYSQL_CLIENT_VERSION = $(MYSQL_CLIENT_VERSION_MAJOR).70
>  MYSQL_CLIENT_SOURCE = mysql-$(MYSQL_CLIENT_VERSION).tar.gz
> -MYSQL_CLIENT_SITE = http://downloads.skysql.com/archives/mysql-5.1
> +MYSQL_CLIENT_SITE = http://downloads.skysql.com/archives/mysql-$(MYSQL_CLIENT_VERSION_MAJOR)

You are doing in this patch a change that is unrelated to adding the
server part. Please provide a spearate patch.

>  MYSQL_CLIENT_INSTALL_STAGING = YES
>  MYSQL_CLIENT_DEPENDENCIES = readline ncurses
>  MYSQL_CLIENT_AUTORECONF = YES
>  MYSQL_CLIENT_LICENSE = GPLv2
>  MYSQL_CLIENT_LICENSE_FILES = README COPYING
>  
> +
> +ifeq ($(BR2_PACKAGE_MYSQL_CLIENT_SERVER),y)
> +MYSQL_CLIENT_DEPENDENCIES += host-mysql_client
> +HOST_MYSQL_CLIENT_DEPENDENCIES =
> +HOST_MYSQL_CLIENT_AUTORECONF = YES
> +	
> +HOST_MYSQL_CLIENT_CONF_OPT = \
> +	--with-embedded-server
> +endif
> +
>  MYSQL_CLIENT_CONF_ENV = \
>  	ac_cv_sys_restartable_syscalls=yes \
>  	ac_cv_path_PS=/bin/ps \
> @@ -24,15 +35,50 @@ MYSQL_CLIENT_CONF_ENV = \
>  
>  MYSQL_CLIENT_CONF_OPT = \
>  	--without-ndb-binlog \
> -	--without-server \
>  	--without-docs \
>  	--without-man \
>  	--without-libedit \
>  	--without-readline \
> +	--without-libedit \
> +	--disable-dependency-tracking \
>  	--with-low-memory \
> +	--with-atomic-ops=up \
>  	--enable-thread-safe-client \
> +	--without-query-cache \
> +	--without-plugin-partition \
> +	--without-plugin-daemon_example \
> +	--without-plugin-ftexample \
> +	--without-plugin-archive \
> +	--without-plugin-blackhole \
> +	--without-plugin-example \
> +	--without-plugin-federated \
> +	--without-plugin-ibmdb2i \
> +	--without-plugin-innobase \
> +	--without-plugin-innodb_plugin \
> +	--without-plugin-ndbcluster \
>  	$(ENABLE_DEBUG)
>  
> +ifeq ($(BR2_PACKAGE_MYSQL_CLIENT_SERVER),y)
> +	MYSQL_CLIENT_CONF_OPT += --with-embedded-server
> +
> +define MYSQL_CLIENT_FIX_SERVER
> +	support/scripts/apply-patches.sh $(@D) package/mysql_client/mysql_server mysql_client-crosscompiling.patch
> +endef
> +
> +MYSQL_CLIENT_POST_PATCH_HOOKS += MYSQL_CLIENT_FIX_SERVER

Uh-oh... Why do you want this patch to be conditional? Just move the
patch along the other one, and have it applied everytime. It hsould
not have an impact on the client (and if it does, just fix it so that's
not the case).

Which means you'd also require;
    MYSQL_CLIENT_AUTORECONF = YES

and you can drop HOST_MYSQL_CLIENT_AUTORECONF = YES since it defaults to
the target's value.

> +define HOST_MYSQL_CLIENT_BUILD_CMDS
> +	$(MAKE) -C $(@D)
> +endef

Unneeded, that's the default. However, instead of building the whole of
MySQL, can't we find a smaller build command for the host variant, that
only builds the required program?

> +define HOST_MYSQL_CLIENT_INSTALL_CMDS
> +	cp $(@D)/sql/gen_lex_hash $(@D)/../mysql_client-$(MYSQL_CLIENT_VERSION)/sql/mysql-gen_lex_hash
> +endef 

I'm not sure we want to host-install something like that.

Since it looks like a generated (compiled) file, you should just install
it to $(HOST)/usr/bin:

    define HOST_MYSQL_CLIENT_INSTALL_CMDS
        $(INSTALL) -m 0755 -d $(@D)/sql/gen_lex_hash \
                   $(HOST)/usr/bin/gen_lex_hash
    endef

and the patch should be changed to:

    -      ./gen_lex_hash$(EXEEXT) > $@-t
    +      gen_lex_hash$(EXEEXT) > $@-t

> +else
> +MYSQL_CLIENT_CONF_OPT += --without-server
> +endif
> +
>  define MYSQL_CLIENT_REMOVE_TEST_PROGS
>  	rm -rf $(TARGET_DIR)/usr/mysql-test $(TARGET_DIR)/usr/sql-bench
>  endef
> @@ -45,3 +91,4 @@ MYSQL_CLIENT_POST_INSTALL_TARGET_HOOKS += MYSQL_CLIENT_REMOVE_TEST_PROGS
>  MYSQL_CLIENT_POST_INSTALL_TARGET_HOOKS += MYSQL_CLIENT_ADD_MYSQL_LIB_PATH
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> diff --git a/package/mysql_client/mysql_server/mysql_client-crosscompiling.patch b/package/mysql_client/mysql_server/mysql_client-crosscompiling.patch
> new file mode 100644
> index 0000000..ab9454b
> --- /dev/null
> +++ b/package/mysql_client/mysql_server/mysql_client-crosscompiling.patch

This patch is also missing a commit-log-like description.

> @@ -0,0 +1,23 @@
> +--- mysql-5.1.70/sql/Makefile.am
> ++++ mysql-5.1.70.patch/sql/Makefile.am
> +@@ -177,7 +177,7 @@
> + # this avoid the rebuild of the built files in a source dist
> + lex_hash.h:	gen_lex_hash.cc lex.h
> + 		$(MAKE) $(AM_MAKEFLAGS) gen_lex_hash$(EXEEXT)
> +-		./gen_lex_hash$(EXEEXT) > $@-t
> ++		./mysql-gen_lex_hash$(EXEEXT) > $@-t
> + 		$(MV) $@-t $@
> + 
> + # For testing of udf_example.so
> +
> +--- mysql-5.1.70/sql/Makefile.in
> ++++ mysql-5.1.70.patch/sql/Makefile.in
> +@@ -1310,7 +1310,7 @@
> + # this avoid the rebuild of the built files in a source dist
> + lex_hash.h:	gen_lex_hash.cc lex.h
> + 		$(MAKE) $(AM_MAKEFLAGS) gen_lex_hash$(EXEEXT)
> +-		./gen_lex_hash$(EXEEXT) > $@-t
> ++		./mysql-gen_lex_hash$(EXEEXT) > $@-t
> + 		$(MV) $@-t $@
> + 
> + # We might have some stuff not built in this build, but that we want to install

So, to summup:
  - provide a first patch that makes use of _VERSION_MAJOR
  - add commit-log descrioption to the patches
  - apply all patches unconditionnaly
  - so autoreconf both host and target versions
  - if possible, only build the host-program, not the whole MySQL
  - install host tools to $(HOST)/usr/bin
  - add a blurb in the help entry

Thank you for the patch!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sat, 18 Jan 2014 10:21:49 +0100
Subject: [Buildroot] [PATCH 1/1] Update MySQL client package
In-Reply-To: <1389990336-6592-1-git-send-email-kuyurix@gmail.com>
References: <1389990336-6592-1-git-send-email-kuyurix@gmail.com>
Message-ID: <52DA47AD.1070204@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Marcelo,

> From: Marcelo Gutierrez <kuyurix@gmail.com>
>
> Added MySQL server support. The patches are based on buildroot-2013.11
>
> Signed-off-by: Marcelo Gutierrez (UTN/FRH) <kuyurix@gmail.com>
> ---
>   package/mysql_client/Config.in                     |   12 ++++-
>   package/mysql_client/S60mysqld                     |   25 +++++++++
>   package/mysql_client/misc.m4.patch                 |   11 ++++
>   package/mysql_client/mysql_client.mk               |   53 ++++++++++++++++++--
>   .../mysql_server/mysql_client-crosscompiling.patch |   23 +++++++++
>   5 files changed, 119 insertions(+), 5 deletions(-)
>   create mode 100644 package/mysql_client/S60mysqld
>   create mode 100644 package/mysql_client/misc.m4.patch
>   create mode 100644 package/mysql_client/mysql_server/mysql_client-crosscompiling.patc

[...]

> diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
> index fe24ae7..c100eba 100644
> --- a/package/mysql_client/mysql_client.mk
> +++ b/package/mysql_client/mysql_client.mk
> @@ -4,15 +4,26 @@
>   #
>   ################################################################################
>   
> -MYSQL_CLIENT_VERSION = 5.1.70
> +MYSQL_CLIENT_VERSION_MAJOR = 5.1
> +MYSQL_CLIENT_VERSION = $(MYSQL_CLIENT_VERSION_MAJOR).70
>   MYSQL_CLIENT_SOURCE = mysql-$(MYSQL_CLIENT_VERSION).tar.gz
> -MYSQL_CLIENT_SITE = http://downloads.skysql.com/archives/mysql-5.1
> +MYSQL_CLIENT_SITE = http://downloads.skysql.com/archives/mysql-$(MYSQL_CLIENT_VERSION_MAJOR)

It's in master branch since my commit aa593ddbc19a03b (package: add <pkg>_VERSION_MAJOR variable).


Regards,
Jerzy

>   MYSQL_CLIENT_INSTALL_STAGING = YES
>   MYSQL_CLIENT_DEPENDENCIES = readline ncurses
>   MYSQL_CLIENT_AUTORECONF = YES
>   MYSQL_CLIENT_LICENSE = GPLv2
>   MYSQL_CLIENT_LICENSE_FILES = README COPYING
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
>   MYSQL_CLIENT_CONF_ENV = \
>   	ac_cv_sys_restartable_syscalls=yes \
>   	ac_cv_path_PS=/bin/ps \
> @@ -24,15 +35,50 @@ MYSQL_CLIENT_CONF_ENV = \
>   
>   MYSQL_CLIENT_CONF_OPT = \
>   	--without-ndb-binlog \
> -	--without-server \
>   	--without-docs \
>   	--without-man \
>   	--without-libedit \
>   	--without-readline \
> +	--without-libedit \
> +	--disable-dependency-tracking \
>   	--with-low-memory \
> +	--with-atomic-ops=up \
>   	--enable-thread-safe-client \
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
>   	$(ENABLE_DEBUG)
>   
> +ifeq ($(BR2_PACKAGE_MYSQL_CLIENT_SERVER),y)
> +	MYSQL_CLIENT_CONF_OPT += --with-embedded-server
> +
> +define MYSQL_CLIENT_FIX_SERVER
> +	support/scripts/apply-patches.sh $(@D) package/mysql_client/mysql_server mysql_client-crosscompiling.patch
> +endef
> +
> +MYSQL_CLIENT_POST_PATCH_HOOKS += MYSQL_CLIENT_FIX_SERVER
> +
> +define HOST_MYSQL_CLIENT_BUILD_CMDS
> +	$(MAKE) -C $(@D)
> +endef
> +
> +define HOST_MYSQL_CLIENT_INSTALL_CMDS
> +	cp $(@D)/sql/gen_lex_hash $(@D)/../mysql_client-$(MYSQL_CLIENT_VERSION)/sql/mysql-gen_lex_hash
> +endef
> +
> +else
> +MYSQL_CLIENT_CONF_OPT += --without-server
> +endif
> +
>   define MYSQL_CLIENT_REMOVE_TEST_PROGS
>   	rm -rf $(TARGET_DIR)/usr/mysql-test $(TARGET_DIR)/usr/sql-bench
>   endef
> @@ -45,3 +91,4 @@ MYSQL_CLIENT_POST_INSTALL_TARGET_HOOKS += MYSQL_CLIENT_REMOVE_TEST_PROGS
>   MYSQL_CLIENT_POST_INSTALL_TARGET_HOOKS += MYSQL_CLIENT_ADD_MYSQL_LIB_PATH
>   
>   $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> diff --git a/package/mysql_client/mysql_server/mysql_client-crosscompiling.patch b/package/mysql_client/mysql_server/mysql_client-crosscompiling.patch
> new file mode 100644
> index 0000000..ab9454b
> --- /dev/null
> +++ b/package/mysql_client/mysql_server/mysql_client-crosscompiling.patch
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

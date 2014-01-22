From: =?UTF-8?q?Marcelo=20Guti=C3=A9rrez?= <kuyurix@gmail.com>
Date: Wed, 22 Jan 2014 18:28:28 +0000
Subject: [Buildroot] [PATCH v4] mysql: add option to build the server
Message-ID: <1390415308-8248-1-git-send-email-kuyurix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Marcelo Guti?rrez <kuyurix@gmail.com>
---
Changes v3 -> v4:
	- fix tab/spacing
	- move ifeq block
	- add help text

Changes v2 -> v3:
	- rename field <number> in the patch file name
	- update new options postion
	- update description to Makefile
	- update Config.in

Changes v1 -> v2:
	- fix comments following new policy
	- rename patches
	- remove useless hook points
	- add the URL to the home of MySQL
	- add commit-log description to the patches
	- install host tools to $(HOST_DIR)/usr/bin
	- fix only builds the required program

 package/mysql/Config.in                            |    8 ++++
 .../mysql-0003-ac_stack_direction-is-unset.patch   |   15 +++++++
 .../mysql-0004-Fix-gen_lex_hash-execution.patch    |   32 ++++++++++++++
 package/mysql/mysql.mk                             |   46 +++++++++++++++++++-
 4 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 package/mysql/mysql-0003-ac_stack_direction-is-unset.patch
 create mode 100644 package/mysql/mysql-0004-Fix-gen_lex_hash-execution.patch

diff --git a/package/mysql/Config.in b/package/mysql/Config.in
index 0def957..9bd28c1 100644
--- a/package/mysql/Config.in
+++ b/package/mysql/Config.in
@@ -13,3 +13,11 @@ config BR2_PACKAGE_MYSQL
 comment "MySQL needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+if BR2_PACKAGE_MYSQL
+
+config BR2_PACKAGE_MYSQL_SERVER
+	bool "MySQL server"
+	help
+	  Install the MySQL server on the target.
+endif
diff --git a/package/mysql/mysql-0003-ac_stack_direction-is-unset.patch b/package/mysql/mysql-0003-ac_stack_direction-is-unset.patch
new file mode 100644
index 0000000..6fef0a9
--- /dev/null
+++ b/package/mysql/mysql-0003-ac_stack_direction-is-unset.patch
@@ -0,0 +1,15 @@
+misc.m4: ac_cv_c_stack_direction is unset.
+
+Signed-off-by: Marcelo Gutierrez (UTN/FRH) <kuyurix@gmail.com>
+
+--- mysql-5.1.70.orig/config/ac-macros/misc.m4
++++ mysql-5.1.70/config/ac-macros/misc.m4
+@@ -477,7 +477,7 @@
+     exit(ptr_f(&a) < 0);
+   }
+   ], ac_cv_c_stack_direction=1, ac_cv_c_stack_direction=-1,
+-   ac_cv_c_stack_direction=)])
++   ac_cv_c_stack_direction=0)])
+  AC_DEFINE_UNQUOTED(STACK_DIRECTION, $ac_cv_c_stack_direction)
+ ])dnl
+ 
diff --git a/package/mysql/mysql-0004-Fix-gen_lex_hash-execution.patch b/package/mysql/mysql-0004-Fix-gen_lex_hash-execution.patch
new file mode 100644
index 0000000..b91ed4f
--- /dev/null
+++ b/package/mysql/mysql-0004-Fix-gen_lex_hash-execution.patch
@@ -0,0 +1,32 @@
+Makefile: fix cross-compiling the server
+
+MySQL Makefile believes it can run code it just compiled, to
+generate a header. This does not work for cross-compilation.
+
+Instead, use a pre-installed host-version of the required tool.
+
+Signed-off-by: Marcelo Gutierrez (UTN/FRH) <kuyurix@gmail.com>
+
+--- mysql-5.1.70/sql/Makefile.am
++++ mysql-5.1.70.patch/sql/Makefile.am
+@@ -177,7 +177,7 @@
+ # this avoid the rebuild of the built files in a source dist
+ lex_hash.h:	gen_lex_hash.cc lex.h
+ 		$(MAKE) $(AM_MAKEFLAGS) gen_lex_hash$(EXEEXT)
+-		./gen_lex_hash$(EXEEXT) > $@-t
++		gen_lex_hash$(EXEEXT) > $@-t
+ 		$(MV) $@-t $@
+ 
+ # For testing of udf_example.so
+
+--- mysql-5.1.70/sql/Makefile.in
++++ mysql-5.1.70.patch/sql/Makefile.in
+@@ -1310,7 +1310,7 @@
+ # this avoid the rebuild of the built files in a source dist
+ lex_hash.h:	gen_lex_hash.cc lex.h
+ 		$(MAKE) $(AM_MAKEFLAGS) gen_lex_hash$(EXEEXT)
+-		./gen_lex_hash$(EXEEXT) > $@-t
++		gen_lex_hash$(EXEEXT) > $@-t
+ 		$(MV) $@-t $@
+ 
+ # We might have some stuff not built in this build, but that we want to install
diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index aaf6ba9..79411c0 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -25,7 +25,6 @@ MYSQL_CONF_ENV = \
 
 MYSQL_CONF_OPT = \
 	--without-ndb-binlog \
-	--without-server \
 	--without-docs \
 	--without-man \
 	--without-libedit \
@@ -34,6 +33,50 @@ MYSQL_CONF_OPT = \
 	--enable-thread-safe-client \
 	$(ENABLE_DEBUG)
 
+ifeq ($(BR2_PACKAGE_MYSQL_SERVER),y)
+MYSQL_DEPENDENCIES += host-mysql
+HOST_MYSQL_DEPENDENCIES =
+
+HOST_MYSQL_CONF_OPT = \
+	--with-embedded-server
+
+MYSQL_CONF_OPT += \
+	--disable-dependency-tracking \
+	--with-atomic-ops=up \
+	--with-embedded-server \
+	--without-query-cache \
+	--without-plugin-partition \
+	--without-plugin-daemon_example \
+	--without-plugin-ftexample \
+	--without-plugin-archive \
+	--without-plugin-blackhole \
+	--without-plugin-example \
+	--without-plugin-federated \
+	--without-plugin-ibmdb2i \
+	--without-plugin-innobase \
+	--without-plugin-innodb_plugin \
+	--without-plugin-ndbcluster
+
+define HOST_MYSQL_BUILD_CMDS
+	$(MAKE) -C $(@D)/include my_config.h
+	$(MAKE) -C $(@D)/mysys libmysys.a
+	$(MAKE) -C $(@D)/strings libmystrings.a
+	$(MAKE) -C $(@D)/vio libvio.a
+	$(MAKE) -C $(@D)/dbug libdbug.a
+	$(MAKE) -C $(@D)/regex libregex.a
+	$(MAKE) -C $(@D)/sql gen_lex_hash
+endef
+
+define HOST_MYSQL_INSTALL_CMDS
+	$(INSTALL) -m 0755  $(@D)/sql/gen_lex_hash  $(HOST_DIR)/usr/bin/
+endef
+
+else
+MYSQL_CONF_OPT += \
+	--without-server
+endif
+
+
 define MYSQL_REMOVE_TEST_PROGS
 	rm -rf $(TARGET_DIR)/usr/mysql-test $(TARGET_DIR)/usr/sql-bench
 endef
@@ -46,3 +89,4 @@ MYSQL_POST_INSTALL_TARGET_HOOKS += MYSQL_REMOVE_TEST_PROGS
 MYSQL_POST_INSTALL_TARGET_HOOKS += MYSQL_ADD_MYSQL_LIB_PATH
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.10.4

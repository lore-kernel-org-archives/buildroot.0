From: =?UTF-8?q?Marcelo=20Guti=C3=A9rrez?= <kuyurix@gmail.com>
Date: Sun, 19 Jan 2014 23:02:18 +0000
Subject: [Buildroot] [PATCH v3 2/2] add support for building the server
In-Reply-To: <1390172539-5207-1-git-send-email-kuyurix@gmail.com>
References: <1390172539-5207-1-git-send-email-kuyurix@gmail.com>
Message-ID: <1390172539-5207-2-git-send-email-kuyurix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Marcelo Guti?rrez(UTN/FRH)" <kuyurix@gmail.com>

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


Signed-off-by: Marcelo Guti?rrez(UTN/FRH) <kuyurix@gmail.com>
---
 package/mysql/Config.in                            |    7 +++
 .../mysql-0000-ac_stack_direction-is-unset.patch   |   15 ++++++
 .../mysql-0001-Fix-gen_lex_hash-execution.patch    |   32 +++++++++++++
 package/mysql/mysql.mk                             |   48 +++++++++++++++++++-
 4 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 package/mysql/mysql-0000-ac_stack_direction-is-unset.patch
 create mode 100644 package/mysql/mysql-0001-Fix-gen_lex_hash-execution.patch

diff --git a/package/mysql/Config.in b/package/mysql/Config.in
index 229e050..56e7e6e 100644
--- a/package/mysql/Config.in
+++ b/package/mysql/Config.in
@@ -12,3 +12,10 @@ config BR2_PACKAGE_MYSQL
 comment "MySQL needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+if BR2_PACKAGE_MYSQL
+
+config BR2_PACKAGE_MYSQL_SERVER
+        bool "MySQL server"
+
+endif
diff --git a/package/mysql/mysql-0000-ac_stack_direction-is-unset.patch b/package/mysql/mysql-0000-ac_stack_direction-is-unset.patch
new file mode 100644
index 0000000..6fef0a9
--- /dev/null
+++ b/package/mysql/mysql-0000-ac_stack_direction-is-unset.patch
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
diff --git a/package/mysql/mysql-0001-Fix-gen_lex_hash-execution.patch b/package/mysql/mysql-0001-Fix-gen_lex_hash-execution.patch
new file mode 100644
index 0000000..b91ed4f
--- /dev/null
+++ b/package/mysql/mysql-0001-Fix-gen_lex_hash-execution.patch
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
index aaf6ba9..a418eb2 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -14,6 +14,15 @@ MYSQL_AUTORECONF = YES
 MYSQL_LICENSE = GPLv2
 MYSQL_LICENSE_FILES = README COPYING
 
+ifeq ($(BR2_PACKAGE_MYSQL_SERVER),y)
+MYSQL_DEPENDENCIES += host-mysql
+HOST_MYSQL_DEPENDENCIES =
+
+HOST_MYSQL_CONF_OPT = \
+        --with-embedded-server
+endif
+
+
 MYSQL_CONF_ENV = \
 	ac_cv_sys_restartable_syscalls=yes \
 	ac_cv_path_PS=/bin/ps \
@@ -25,7 +34,6 @@ MYSQL_CONF_ENV = \
 
 MYSQL_CONF_OPT = \
 	--without-ndb-binlog \
-	--without-server \
 	--without-docs \
 	--without-man \
 	--without-libedit \
@@ -34,6 +42,44 @@ MYSQL_CONF_OPT = \
 	--enable-thread-safe-client \
 	$(ENABLE_DEBUG)
 
+ifeq ($(BR2_PACKAGE_MYSQL_SERVER),y)
+        MYSQL_CONF_OPT += \
+        --disable-dependency-tracking \
+        --with-atomic-ops=up \
+        --with-embedded-server \
+        --without-query-cache \
+        --without-plugin-partition \
+        --without-plugin-daemon_example \
+        --without-plugin-ftexample \
+        --without-plugin-archive \
+        --without-plugin-blackhole \
+        --without-plugin-example \
+        --without-plugin-federated \
+        --without-plugin-ibmdb2i \
+        --without-plugin-innobase \
+        --without-plugin-innodb_plugin \
+        --without-plugin-ndbcluster
+
+define HOST_MYSQL_BUILD_CMDS
+        $(MAKE) -C $(@D)/include my_config.h
+        $(MAKE) -C $(@D)/mysys libmysys.a
+        $(MAKE) -C $(@D)/strings libmystrings.a
+        $(MAKE) -C $(@D)/vio libvio.a
+        $(MAKE) -C $(@D)/dbug libdbug.a
+        $(MAKE) -C $(@D)/regex libregex.a
+        $(MAKE) -C $(@D)/sql gen_lex_hash
+endef
+
+define HOST_MYSQL_INSTALL_CMDS
+        $(INSTALL) -m 0755  $(@D)/sql/gen_lex_hash  $(HOST_DIR)/usr/bin/
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
-- 
1.7.10.4

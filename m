From: Ryan Coe <bluemrp9@gmail.com>
Date: Sun, 15 Dec 2019 13:33:26 -0800
Subject: [Buildroot] [PATCH v2 3/3] package/mariadb: prefix sysroot in
 mariadb_config
In-Reply-To: <20191215213326.10863-1-bluemrp9@gmail.com>
References: <20191215213326.10863-1-bluemrp9@gmail.com>
Message-ID: <20191215213326.10863-3-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds @CMAKE_SYSROOT@ to mariadb_config.c.in. Without it,
mariadb_config incorrectly returns host paths for include paths and
library paths.

This also removes mariadb_config from the target like is done for
mysql_config.

Reported-by: Alexey Lukyanchuk <skif@skif-web.ru>
Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 ...2-add-sysroot-path-to-mariadb_config.patch | 28 +++++++++++++++++++
 package/mariadb/mariadb.mk                    |  5 ++--
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 package/mariadb/0002-add-sysroot-path-to-mariadb_config.patch

diff --git a/package/mariadb/0002-add-sysroot-path-to-mariadb_config.patch b/package/mariadb/0002-add-sysroot-path-to-mariadb_config.patch
new file mode 100644
index 0000000000..5eca8ec402
--- /dev/null
+++ b/package/mariadb/0002-add-sysroot-path-to-mariadb_config.patch
@@ -0,0 +1,28 @@
+From 7e1b6aafeb9fe6558da7506b304c0efb5ea82281 Mon Sep 17 00:00:00 2001
+From: Ryan Coe <bluemrp9@gmail.com>
+Date: Fri, 13 Dec 2019 17:13:26 -0800
+Subject: [PATCH 1/1] add sysroot path to mariadb_config
+
+Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
+---
+ libmariadb/mariadb_config/mariadb_config.c.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libmariadb/mariadb_config/mariadb_config.c.in b/libmariadb/mariadb_config/mariadb_config.c.in
+index 703c9466a1d9214a85f3638d2e3b4ecfef0c7bd6..f5513333e670373f060a3c2574d1d42facfd0337 100644
+--- a/libmariadb/mariadb_config/mariadb_config.c.in
++++ b/libmariadb/mariadb_config/mariadb_config.c.in
+@@ -5,8 +5,8 @@
+ 
+ static char *mariadb_progname;
+ 
+-#define INCLUDE "-I at CMAKE_INSTALL_PREFIX@/@INSTALL_INCLUDEDIR@ -I at CMAKE_INSTALL_PREFIX@/@INSTALL_INCLUDEDIR@/mysql"
+-#define LIBS    "-L at CMAKE_INSTALL_PREFIX@/@INSTALL_LIBDIR@/ -lmariadb"
++#define INCLUDE "-I at CMAKE_SYSROOT@/@CMAKE_INSTALL_PREFIX@/@INSTALL_INCLUDEDIR@ -I at CMAKE_SYSROOT@/@CMAKE_INSTALL_PREFIX@/@INSTALL_INCLUDEDIR@/mysql"
++#define LIBS    "-L at CMAKE_SYSROOT@/@CMAKE_INSTALL_PREFIX@/@INSTALL_LIBDIR@/ -lmariadb"
+ #define LIBS_SYS "@extra_dynamic_LDFLAGS@"
+ #define CFLAGS  INCLUDE
+ #define VERSION "@MARIADB_CLIENT_VERSION@"
+-- 
+2.24.1
+
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 6ad4a8e6a7..6f8f59f282 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -129,11 +129,12 @@ define MARIADB_INSTALL_INIT_SYSTEMD
 endef
 endif
 
-# We don't need mysql_config on the target as it's only useful in staging
-# We also don't need the test suite on the target
+# We don't need mysql_config or mariadb_config on the target as it's
+# only useful in staging. We also don't need the test suite on the target.
 define MARIADB_POST_INSTALL
 	mkdir -p $(TARGET_DIR)/var/lib/mysql
 	$(RM) $(TARGET_DIR)/usr/bin/mysql_config
+	$(RM) $(TARGET_DIR)/usr/bin/mariadb_config
 	$(RM) -r $(TARGET_DIR)/usr/share/mysql/test
 endef
 
-- 
2.24.1

From: Ryan Coe <bluemrp9@gmail.com>
Date: Thu, 13 Feb 2020 09:46:55 -0800
Subject: [Buildroot] [PATCH v4 1/1] package/mariadb: patch mariadb_config to
 add sysroot path
Message-ID: <20200213174655.17309-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds @CMAKE_SYSROOT@ to mariadb_config.c.in. Without it,
mariadb_config and mysql_config incorrectly returns host paths for
include paths and library paths.

Upstream report and status:
https://jira.mariadb.org/browse/CONC-454
https://github.com/mariadb-corporation/mariadb-connector-c/pull/127

Reported-by: Alexey Lukyanchuk <skif@skif-web.ru>
Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
Changes v3 -> v4:
  - add upstream status (suggested by Peter)
Changes v2 -> v3:
  - remove extra slash between CMAKE_SYSROOT and CMAKE_INSTALL_PREFIX
Changes v1 -> v2:
  - no change
---
 ...2-add-sysroot-path-to-mariadb_config.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/mariadb/0002-add-sysroot-path-to-mariadb_config.patch

diff --git a/package/mariadb/0002-add-sysroot-path-to-mariadb_config.patch b/package/mariadb/0002-add-sysroot-path-to-mariadb_config.patch
new file mode 100644
index 0000000000..e78434f930
--- /dev/null
+++ b/package/mariadb/0002-add-sysroot-path-to-mariadb_config.patch
@@ -0,0 +1,32 @@
+From 7e1b6aafeb9fe6558da7506b304c0efb5ea82281 Mon Sep 17 00:00:00 2001
+From: Ryan Coe <bluemrp9@gmail.com>
+Date: Fri, 13 Dec 2019 17:13:26 -0800
+Subject: [PATCH 1/1] add sysroot path to mariadb_config
+
+Upstream report and status:
+https://jira.mariadb.org/browse/CONC-454
+https://github.com/mariadb-corporation/mariadb-connector-c/pull/127
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
++#define INCLUDE "-I at CMAKE_SYSROOT@@CMAKE_INSTALL_PREFIX@/@INSTALL_INCLUDEDIR@ -I at CMAKE_SYSROOT@@CMAKE_INSTALL_PREFIX@/@INSTALL_INCLUDEDIR@/mysql"
++#define LIBS    "-L at CMAKE_SYSROOT@@CMAKE_INSTALL_PREFIX@/@INSTALL_LIBDIR@/ -lmariadb"
+ #define LIBS_SYS "@extra_dynamic_LDFLAGS@"
+ #define CFLAGS  INCLUDE
+ #define VERSION "@MARIADB_CLIENT_VERSION@"
+-- 
+2.24.1
+
-- 
2.25.0

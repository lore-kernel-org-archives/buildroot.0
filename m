From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 22:22:31 +0200
Subject: [Buildroot] [git commit] package/mariadb: patch mariadb_config to
 add sysroot path
Message-ID: <20200412200827.B951B8E840@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=905e4f2890e92d7b417d9c219fa8d4394cd1c159
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds @CMAKE_SYSROOT@ to mariadb_config.c.in. Without it,
mariadb_config and mysql_config incorrectly returns host paths for
include paths and library paths.

The patch has been accepted upstream at
https://github.com/mariadb-corporation/mariadb-connector-c/commit/b787c0d69cc00af98cd4ee5bc205e1c7ddaf427a

Reported-by: Alexey Lukyanchuk <skif@skif-web.ru>
Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-add-sysroot-path-to-mariadb_config.patch  | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/mariadb/0002-add-sysroot-path-to-mariadb_config.patch b/package/mariadb/0002-add-sysroot-path-to-mariadb_config.patch
new file mode 100644
index 0000000000..d19947f09a
--- /dev/null
+++ b/package/mariadb/0002-add-sysroot-path-to-mariadb_config.patch
@@ -0,0 +1,29 @@
+From 7e1b6aafeb9fe6558da7506b304c0efb5ea82281 Mon Sep 17 00:00:00 2001
+From: Ryan Coe <bluemrp9@gmail.com>
+Date: Fri, 13 Dec 2019 17:13:26 -0800
+Subject: [PATCH] add sysroot path to mariadb_config
+
+Upstream: https://github.com/mariadb-corporation/mariadb-connector-c/commit/b787c0d69cc00af98cd4ee5bc205e1c7ddaf427a
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

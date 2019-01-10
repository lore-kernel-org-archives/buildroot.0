From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 10 Jan 2019 17:43:28 +0100
Subject: [Buildroot] [PATCH 1/1] keepalived: fix if.h namespace collision
Message-ID: <20190110164328.10022-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/d229602f2e477499c86567e0e8a3535513d322e8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...include-files-in-configure-COLLISION-test.patch | 38 ++++++++++++++++++++++
 package/keepalived/keepalived.mk                   |  2 ++
 2 files changed, 40 insertions(+)
 create mode 100644 package/keepalived/0002-Fix-order-of-include-files-in-configure-COLLISION-test.patch

diff --git a/package/keepalived/0002-Fix-order-of-include-files-in-configure-COLLISION-test.patch b/package/keepalived/0002-Fix-order-of-include-files-in-configure-COLLISION-test.patch
new file mode 100644
index 0000000000..76c88a76bf
--- /dev/null
+++ b/package/keepalived/0002-Fix-order-of-include-files-in-configure-COLLISION-test.patch
@@ -0,0 +1,38 @@
+From e4dd33f16fe56d09c8d59d1254a4ed1d8e9bb29c Mon Sep 17 00:00:00 2001
+From: Quentin Armitage <quentin@armitage.org.uk>
+Date: Thu, 6 Dec 2018 12:16:08 +0000
+Subject: [PATCH] Fix order of include files in configure COLLISION test
+
+Since Linux 4.4.11 (commit 1575c09) including linux/if.h after
+net/if.h works, whereas until glibc fix their headers including
+net/if.h after linux/if.h causes compiler redefinition errors.
+
+Unfortunately the test for the collision was done the wrong way
+round, as identified in issue #1079. The patch included in the
+issue report corrects the order of inclusion of the header files.
+
+What we should do is ensure that glibc header files are included
+before Linux header files, so that at least if kernel headers from
+4.4.11 onwards are used, the conflict will not occur.
+
+Signed-off-by: Quentin Armitage <quentin@armitage.org.uk>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from: https://github.com/acassen/keepalived/commit/e4dd33f16fe56d09c8d59d1254a4ed1d8e9bb29c]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7a2e8ce1..9badcc62 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1349,8 +1349,8 @@ AC_MSG_CHECKING([for linux/if.h and net/if.h namespace collision])
+ SAV_CPPFLAGS="$CPPFLAGS"
+ CPPFLAGS="$CPPFLAGS $kernelinc"
+ AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
+-    #include <net/if.h>
+     #include <linux/if.h>
++    #include <net/if.h>
+   ]])],
+   [
+     AC_MSG_RESULT([no])
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 10711cac49..5bb7c5c1ca 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -10,6 +10,8 @@ KEEPALIVED_DEPENDENCIES = host-pkgconf openssl
 KEEPALIVED_LICENSE = GPL-2.0+
 KEEPALIVED_LICENSE_FILES = COPYING
 KEEPALIVED_CONF_OPTS = --disable-hardening
+# We're patching configure.ac
+KEEPALIVED_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 KEEPALIVED_DEPENDENCIES += json-c
-- 
2.14.1

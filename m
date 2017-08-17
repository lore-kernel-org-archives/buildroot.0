From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 17 Aug 2017 06:37:39 +0200
Subject: [Buildroot] [PATCH 1/2] package/openocd: fix uclinux build
Message-ID: <20170817043740.9142-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/cd3/cd3f5b7329f45c2b75ed319caef3c6aa0e94ee2e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0002-configure-enable-build-on-uclinux.patch   | 26 ++++++++++++++++++++++
 package/openocd/openocd.mk                         |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 package/openocd/0002-configure-enable-build-on-uclinux.patch

diff --git a/package/openocd/0002-configure-enable-build-on-uclinux.patch b/package/openocd/0002-configure-enable-build-on-uclinux.patch
new file mode 100644
index 000000000..714d875d4
--- /dev/null
+++ b/package/openocd/0002-configure-enable-build-on-uclinux.patch
@@ -0,0 +1,26 @@
+From 11ea78c4d253bb90296e2dd8c3f7fbf59ba397b6 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Thu, 17 Aug 2017 06:30:31 +0200
+Subject: [PATCH 1/1] configure: enable build on uclinux
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c680bda7..1a7980a0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -327,7 +327,7 @@ AC_ARG_ENABLE([sysfsgpio],
+   [build_sysfsgpio=$enableval], [build_sysfsgpio=no])
+ 
+ AS_CASE([$host_os],
+-  [linux*], [],
++  [linux*|uclinux*], [],
+   [
+     AS_IF([test "x$build_sysfsgpio" = "xyes"], [
+       AC_MSG_ERROR([sysfsgpio is only available on linux])
+-- 
+2.11.0
+
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 96f667b73..986812193 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -7,7 +7,8 @@
 OPENOCD_VERSION = 0.10.0
 OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
 OPENOCD_SITE = http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
-
+# 0002-configure-enable-build-on-uclinux.patch patches configure.ac
+OPENOCD_AUTORECONF = YES
 OPENOCD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 
 OPENOCD_CONF_OPTS = \
-- 
2.11.0

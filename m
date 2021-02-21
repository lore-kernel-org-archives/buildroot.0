From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2021 18:23:07 +0100
Subject: [Buildroot] [PATCH/next v2 1/1] package/libbluray: add optional
 support for libudfread
Message-ID: <20210221172307.289368-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added note that the patch fixes a bug (Yann)

 package/libbluray/0001-libudfread.patch | 32 +++++++++++++++++++++++++
 package/libbluray/libbluray.mk          |  6 +++++
 2 files changed, 38 insertions(+)
 create mode 100644 package/libbluray/0001-libudfread.patch

diff --git a/package/libbluray/0001-libudfread.patch b/package/libbluray/0001-libudfread.patch
new file mode 100644
index 0000000000..7e00069d47
--- /dev/null
+++ b/package/libbluray/0001-libudfread.patch
@@ -0,0 +1,32 @@
+From 24d38b8ec371d89b51f8b65f3085672db12334ff Mon Sep 17 00:00:00 2001
+From: Sebastian Ramacher <sramacher@debian.org>
+Date: Sun, 20 Dec 2020 13:32:33 +0100
+Subject: [PATCH] Update check for new libudfread pkg-config file name
+
+Fixes detection of libudfread due to upstream commit:
+https://code.videolan.org/videolan/libudfread/-/commit/76294a7449e068c527e31aec1a22076bf87c6302
+
+Downloaded from upstream commit:
+https://code.videolan.org/videolan/libbluray/-/commit/24d38b8ec371d89b51f8b65f3085672db12334ff
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index e0e80cce..250db73b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -279,7 +279,7 @@ AM_CONDITIONAL([BDJ_J2SE], [ test x"$BDJ_TYPE" != x"j2me" ])
+ dnl bootclasspath
+ AC_SUBST(BDJ_BOOTCLASSPATH)
+ 
+-PKG_CHECK_MODULES([LIBUDFREAD], [udfread >= 1.1.0],
++PKG_CHECK_MODULES([LIBUDFREAD], [libudfread >= 1.1.0],
+     [with_libudfread=yes
+      AC_DEFINE([HAVE_LIBUDFREAD], [1], [Define to 1 if external libudfread is to be used])
+      PACKAGES="$PACKAGES libudfread >= 1.1.0"
+-- 
+GitLab
+
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index 36f59190b1..e4fca5204f 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -12,6 +12,8 @@ LIBBLURAY_LICENSE = LGPL-2.1+
 LIBBLURAY_LICENSE_FILES = COPYING
 LIBBLURAY_CPE_ID_VENDOR = videolan
 LIBBLURAY_DEPENDENCIES = host-pkgconf
+# 0001-libudfread.patch
+LIBBLURAY_AUTORECONF = YES
 
 LIBBLURAY_CONF_OPTS = --disable-bdjava-jar
 
@@ -19,6 +21,10 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
 LIBBLURAY_DEPENDENCIES += libiconv
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUDFREAD),y)
+LIBBLURAY_DEPENDENCIES += libudfread
+endif
+
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 LIBBLURAY_DEPENDENCIES += freetype
 LIBBLURAY_CONF_OPTS += --with-freetype
-- 
2.29.2

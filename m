From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Sep 2012 08:54:07 -0300
Subject: [Buildroot] [PATCH] libfuse: fix build failures with iconv
Message-ID: <1347018847-29380-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build failures when iconv is present for libfuse users that use
pkgconfig.
For example:
http://git.buildroot.net/buildroot/commit/?id=dd00c5fcd072b4a1e3862c5af29f8c580acadd38

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libfuse/libfuse-iconv.patch |   18 ++++++++++++++++++
 package/libfuse/libfuse.mk          |    2 +-
 2 files changed, 19 insertions(+), 1 deletions(-)
 create mode 100644 package/libfuse/libfuse-iconv.patch

diff --git a/package/libfuse/libfuse-iconv.patch b/package/libfuse/libfuse-iconv.patch
new file mode 100644
index 0000000..9f50032
--- /dev/null
+++ b/package/libfuse/libfuse-iconv.patch
@@ -0,0 +1,18 @@
+Upstream commit efeac22bfa65c845c04adb5e70e6de33b0104fa3 but without
+the need to autoreconf :)
+Fixes libiconv missing in fuse.pc
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura fuse-2.9.1/configure fuse-2.9.1.iconv/configure
+--- fuse-2.9.1/configure	2012-07-19 09:53:29.000000000 -0300
++++ fuse-2.9.1.iconv/configure	2012-09-07 08:47:57.834912620 -0300
+@@ -13237,7 +13237,7 @@
+ 
+   fi
+ 
+-libfuse_libs=$libfuse_libs $LTLIBICONV
++libfuse_libs="$libfuse_libs $LTLIBICONV"
+  if test "$am_cv_func_iconv" = yes; then
+   ICONV_TRUE=
+   ICONV_FALSE='#'
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index c8c0130..779115b 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -9,8 +9,8 @@ LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
 LIBFUSE_SITE = http://downloads.sourceforge.net/project/fuse/fuse-2.X/$(LIBFUSE_VERSION)
 LIBFUSE_LICENSE = GPLv2 LGPLv2.1
 LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
-
 LIBFUSE_INSTALL_STAGING = YES
+LIBFUSE_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 LIBFUSE_CONF_OPT= --disable-nls \
 		--disable-example \
 		--disable-kernel-module \
-- 
1.7.8.6

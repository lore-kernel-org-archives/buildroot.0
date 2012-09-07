From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 7 Sep 2012 15:29:17 +0200
Subject: [Buildroot] [git commit] libfuse: fix build failures with iconv
Message-ID: <20120907193517.EA002995CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a9e4e1b676758f1004bebdd1fd409b8976ebc6ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build failures when iconv is present for libfuse users that use
pkgconfig.
For example:
http://autobuild.buildroot.net/results/4d455831a7b467b9ea1ad54bea6b57607f5560a8/build-end.log

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libfuse/libfuse-iconv.patch |   18 ++++++++++++++++++
 package/libfuse/libfuse.mk          |    2 +-
 2 files changed, 19 insertions(+), 1 deletions(-)

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

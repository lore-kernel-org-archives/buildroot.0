From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 11:15:35 +0200
Subject: [Buildroot] [git commit] package/xorriso: bump version to 1.5.0
Message-ID: <20190804091246.D98DD8DF23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8c07a78b7198c94f78036e7a59d1e0a30c22683
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch for sys/xattr.h handling and replaced it with the new
upstream-provided configure option --disable-xattr-h-pref-attr
https://dev.lovelyhq.com/libburnia/libisofs/commit/848e039e6d5222b07da7ec810ce4cca1c60bd935

Removed autoreconf, not needed anymore.

Added license hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xorriso/0001-use-sys-xattr.h.patch | 33 ------------------------------
 package/xorriso/xorriso.hash               |  4 +++-
 package/xorriso/xorriso.mk                 | 19 ++++++-----------
 3 files changed, 9 insertions(+), 47 deletions(-)

diff --git a/package/xorriso/0001-use-sys-xattr.h.patch b/package/xorriso/0001-use-sys-xattr.h.patch
deleted file mode 100644
index 5ae1aae72e..0000000000
--- a/package/xorriso/0001-use-sys-xattr.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Use system <sys/xattr.h>
-
-The one from attr is no longer installed with latest version.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
-Upstream status: alternate, more complex patch pending...
-
-diff -durN xorriso-1.4.6.orig/configure.ac xorriso-1.4.6/configure.ac
---- xorriso-1.4.6.orig/configure.ac	2016-09-16 15:51:33.000000000 +0200
-+++ xorriso-1.4.6/configure.ac	2018-05-06 23:45:38.377153069 +0200
-@@ -264,7 +264,7 @@
- dnl Check whether there is the header for Linux xattr.
- dnl If not, erase this macro which would enable use of listxattr and others
-         XATTR_DEF="-DLibisofs_with_aaip_xattR"
--        AC_CHECK_HEADER(attr/xattr.h, AC_CHECK_LIB(c, listxattr, X= ,
-+        AC_CHECK_HEADER(sys/xattr.h, AC_CHECK_LIB(c, listxattr, X= ,
-                                                    XATTR_DEF= ), XATTR_DEF= )
-     fi
- elif test x"$LIBBURNIA_SUPP_FATTR" = xextattr
-diff -durN xorriso-1.4.6.orig/libisofs/aaip-os-linux.c xorriso-1.4.6/libisofs/aaip-os-linux.c
---- xorriso-1.4.6.orig/libisofs/aaip-os-linux.c	2016-09-16 15:51:34.000000000 +0200
-+++ xorriso-1.4.6/libisofs/aaip-os-linux.c	2018-05-06 23:47:25.764941583 +0200
-@@ -30,7 +30,7 @@
- #endif
- 
- #ifdef Libisofs_with_aaip_xattR
--#include <attr/xattr.h>
-+#include <sys/xattr.h>
- #endif
- 
- 
diff --git a/package/xorriso/xorriso.hash b/package/xorriso/xorriso.hash
index f1ee9d67ad..b594b91438 100644
--- a/package/xorriso/xorriso.hash
+++ b/package/xorriso/xorriso.hash
@@ -1,2 +1,4 @@
 # Locally computed
-sha256 526f728c7eee6f8c4b69fbf391789e6c80806197c2861cf5922cf7cfe1035784 xorriso-1.4.6.tar.gz
+sha256 a93fa7ae5bb1902198cddfec25201388156932f36f2f5da829bf4fcae9a6062b  xorriso-1.5.0.tar.gz
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256 72e99e72cd68f226415e5d898f3b38e24ae7991ed038ed72d789fff5b060f028  COPYRIGHT
diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
index de431c3ab6..56bf39f764 100644
--- a/package/xorriso/xorriso.mk
+++ b/package/xorriso/xorriso.mk
@@ -4,26 +4,15 @@
 #
 ################################################################################
 
-XORRISO_VERSION = 1.4.6
+XORRISO_VERSION = 1.5.0
 XORRISO_SITE = $(BR2_GNU_MIRROR)/xorriso
 XORRISO_LICENSE = GPL-3.0+
 XORRISO_LICENSE_FILES = COPYING COPYRIGHT
 
-# 0001-use-sys-xattr.h.patch
-XORRISO_DEPENDENCIES = host-pkgconf
-HOST_XORRISO_DEPENDENCIES = host-pkgconf
-XORRISO_AUTORECONF = YES
-
-# Make autoreconf happy
-define XORRISO_NEWS
-	touch $(@D)/NEWS
-endef
-XORRISO_POST_PATCH_HOOKS += XORRISO_NEWS
-HOST_XORRISO_POST_PATCH_HOOKS += XORRISO_NEWS
-
 # Disable everything until we actually need those features, and add the correct
 # host libraries
 HOST_XORRISO_CONF_OPTS = \
+	--disable-xattr-h-pref-attr \
 	--disable-zlib \
 	--disable-bzip2 \
 	--disable-libcdio \
@@ -35,6 +24,10 @@ HOST_XORRISO_CONF_OPTS = \
 # http://lists.gnu.org/archive/html/bug-xorriso/2017-04/msg00004.html
 XORRISO_CONF_OPTS = --disable-libcdio
 
+# we need sys/xattr.h
+XORRISO_CONF_OPTS += \
+	--disable-xattr-h-pref-attr
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 XORRISO_DEPENDENCIES += libiconv
 endif

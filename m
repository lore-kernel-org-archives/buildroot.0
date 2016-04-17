From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Apr 2016 16:43:29 +0200
Subject: [Buildroot] [git commit] gutenprint: fix host build
Message-ID: <20160417144345.03341803EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6a80dff87e0b73e78a4d0dd1d0e70a491453a36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable USB support when CUPS disabled, otherwise host build breaks.
Fixes following autobuild error:
http://autobuild.buildroot.net/results/081b3be918ac1eaa8cfbc5919e00bc1ea267c1df/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Thomas:
 - use Git formatted patch, cherry-picked from upstream
 - remove --without-libusb, not needed.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-allow-USB-backends-to-be-built-if-CUPS-i.patch | 41 ++++++++++++++++++++++
 package/gutenprint/gutenprint.mk                   |  2 +-
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/package/gutenprint/0004-build-Don-t-allow-USB-backends-to-be-built-if-CUPS-i.patch b/package/gutenprint/0004-build-Don-t-allow-USB-backends-to-be-built-if-CUPS-i.patch
new file mode 100644
index 0000000..1ecc89e
--- /dev/null
+++ b/package/gutenprint/0004-build-Don-t-allow-USB-backends-to-be-built-if-CUPS-i.patch
@@ -0,0 +1,41 @@
+From b5e8dc446572c1198a24eff105a394d0f307951e Mon Sep 17 00:00:00 2001
+From: Solomon Peachy <pizza@shaftnet.org>
+Date: Fri, 15 Apr 2016 23:05:43 -0400
+Subject: [PATCH] build:  Don't allow USB backends to be built if CUPS is not
+ enabled.
+
+[Waldemar: backport from upstream commit
+fc1713589fed645f2c8002c3f66dfb69af314716.]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ configure.ac | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 800794b..ba30019 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -442,12 +442,14 @@ dnl if test -z "${[EXTRA_LIBREADLINE_DEPS]}" ; then
+ dnl   [EXTRA_LIBREADLINE_DEPS]=""
+ dnl fi
+ 
+-# libusb-1.0 (For CUPS backends)
+-PKG_CHECK_MODULES([LIBUSB], [libusb-1.0],
+-                  [HAVE_LIBUSB=yes
+-                   BUILD_LIBUSB_BACKENDS=yes],
+-                  [HAVE_LIBUSB=no
+-	           BUILD_LIBUSB_BACKENDS=no])
++# libusb-1.0 (For CUPS backends, but only bother if CUPS is enabled)
++if test "x$BUILD_CUPS" = "xyes" ; then
++ PKG_CHECK_MODULES([LIBUSB], [libusb-1.0],
++                   [HAVE_LIBUSB=yes
++                    BUILD_LIBUSB_BACKENDS=yes],
++                   [HAVE_LIBUSB=no
++	            BUILD_LIBUSB_BACKENDS=no])
++fi
+ 
+ AC_PATH_PROGS([GIMPTOOL2_CHECK], [gimptool-2.0 gimptool])
+ if test -z "${GIMPTOOL2_CHECK}" ; then
+-- 
+2.6.4
+
diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index 7e3024d..aebafe2 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -11,7 +11,7 @@ GUTENPRINT_SOURCE = gutenprint-$(GUTENPRINT_VERSION).tar.bz2
 GUTENPRINT_LICENSE = GPLv2+
 GUTENPRINT_LICENSE_FILES = COPYING
 
-# Needed, as we touch Makefile.am
+# Needed, as we touch Makefile.am and configure.ac
 GUTENPRINT_AUTORECONF = YES
 
 GUTENPRINT_DEPENDENCIES = \

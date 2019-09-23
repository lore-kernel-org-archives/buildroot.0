From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Sep 2019 22:06:48 +0200
Subject: [Buildroot] [git commit] package/sispmctl: bump to version 4.1
Message-ID: <20190923200206.C1DD18F190@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4e0068a74ecc26ec19838cb9df3a48ecca38875
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (already in version)
- Change license file to COPYING and Add its hash

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-configure-add-pkg-config-support.patch    | 70 ----------------------
 package/sispmctl/sispmctl.hash                     |  3 +-
 package/sispmctl/sispmctl.mk                       |  7 +--
 3 files changed, 4 insertions(+), 76 deletions(-)

diff --git a/package/sispmctl/0001-configure-add-pkg-config-support.patch b/package/sispmctl/0001-configure-add-pkg-config-support.patch
deleted file mode 100644
index 9466080641..0000000000
--- a/package/sispmctl/0001-configure-add-pkg-config-support.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 8002a7e6fa965dfd304d098fbc64b0f1a6e3b465 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Sun, 24 Aug 2014 22:34:29 +0200
-Subject: [PATCH 1/1] configure: add pkg-config support
-
-The static linking doesn't works with libusb-compat when using libusb-config.
-Also the CFLAGS initialization with libusb-config --cflags is comented out.
-
-Based on libftdi's patch, add the support for pkg-config to link sispmctl
-correctly.
-
-This allow to add correct include directory to CFLAGS
-(Add -I$(STAGING_DIR)/usr/include and -I$(STAGING_DIR)/usr/include/libusb-1.0)
-Also add needed libraries during static linking (-lusb -lusb-1.0 and -pthread)
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- configure.in | 36 +++++++++++-------------------------
- 1 file changed, 11 insertions(+), 25 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 08d39ea..65d0c1d 100644
---- a/configure.in
-+++ b/configure.in
-@@ -23,31 +23,17 @@ AC_SUBST(WEBDIR)
- AC_ARG_WITH(bindaddr,[  --with-bindaddr=IP bind listening socket to IP], [BINDADDR="$withval"])
- AC_SUBST(BINDADDR)
- 
--
--# Checks for libraries.
--dnl check for libusb-config
--AC_PATH_PROG(HAVELIBUSB, libusb-config, $PATH)
--
--if test -e "$HAVELIBUSB"; then
--   dnl   LIBUSB_CFLAGS=`$HAVELIBUSB --cflags`
--   LIBUSB_LIBS=`$HAVELIBUSB --libs`
--   CFLAGS="$CFLAGS $LIBUSB_CFLAGS"
--   LIBS="$LIBS $LIBUSB_LIBS"
--else
--   AC_MSG_ERROR([*** libusb-config not found. You need a working libusb installation. Version >=0.1.7])
--fi
--
--dnl check for version of libusb
--AC_MSG_CHECKING([if libusb version is >= 0.1.9])
--libusb_version_needed="1009"
--libusb_version=`$HAVELIBUSB --version | sed -e "s/libusb //" | awk 'BEGIN { FS = "."; } { printf "%d", ($''1 * 1000 + $''2) * 1000 + $''3;}'`
--
--if test $libusb_version -lt $libusb_version_needed; then
--   AC_MSG_RESULT(no)
--   AC_MSG_ERROR([*** libusb is too old ($libusb_version). You need a libusb installation newer or equal to 0.1.9.])
--else
--   AC_MSG_RESULT(yes)
--fi
-+dnl check for libusb
-+PKG_CHECK_MODULES(LIBUSB, libusb >= 0.1.11)
-+CFLAGS="$CFLAGS $LIBUSB_CFLAGS"
-+LIBS="$LIBS $LIBUSB_LIBS"
-+
-+dnl Check for recent pkg-config which supports Requires.private
-+case `$PKG_CONFIG --version` in
-+0.?|0.1[0-7]) PKGCONFIG_REQUIRES="Requires"; ;;
-+*) PKGCONFIG_REQUIRES="Requires.private"; ;;
-+esac
-+AC_SUBST(PKGCONFIG_REQUIRES)
- 
- # Checks for header files.
- AC_HEADER_STDC
--- 
-1.9.3
-
diff --git a/package/sispmctl/sispmctl.hash b/package/sispmctl/sispmctl.hash
index 9f34b4399d..f1090c4b8a 100644
--- a/package/sispmctl/sispmctl.hash
+++ b/package/sispmctl/sispmctl.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256  e9a99cc81ef0a93f3484e5093efd14d93cc967221fcd22c151f0bea32eb91da7  sispmctl-3.1.tar.gz
+sha256  bf5177e085cb0168e18e4cfb69645c3095da149ed46f5659d6e757bde3548e40  sispmctl-4.1.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sispmctl/sispmctl.mk b/package/sispmctl/sispmctl.mk
index 85c03382ce..93e7de7694 100644
--- a/package/sispmctl/sispmctl.mk
+++ b/package/sispmctl/sispmctl.mk
@@ -4,15 +4,12 @@
 #
 ################################################################################
 
-SISPMCTL_VERSION = 3.1
+SISPMCTL_VERSION = 4.1
 SISPMCTL_SITE = http://downloads.sourceforge.net/project/sispmctl/sispmctl/sispmctl-$(SISPMCTL_VERSION)
 SISPMCTL_LICENSE = GPL-2.0+
-SISPMCTL_LICENSE_FILES = LICENCE
+SISPMCTL_LICENSE_FILES = COPYING
 SISPMCTL_DEPENDENCIES = libusb-compat
 
 SISPMCTL_CONF_OPTS = --enable-webless
 
-# We're patching configure.in
-SISPMCTL_AUTORECONF = YES
-
 $(eval $(autotools-package))

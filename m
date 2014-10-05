From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 23:35:15 +0200
Subject: [Buildroot] [git commit] package/sispmctl: fix static linking
Message-ID: <20141005213613.86492B0A93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=441ff982fdc8907c7f1bd8ba24bdf50df0c53293
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The static linking doesn't work with libusb-compat when using
libusb-config. Also the CFLAGS initialization with libusb-config
--cflags is comented out.

Based on libftdi's patch, this commit adds the support for pkg-config
to link sispmctl correctly.

This allow to add the correct include directories to CFLAGS (Add
-I$(STAGING_DIR)/usr/include and
-I$(STAGING_DIR)/usr/include/libusb-1.0) and also add the required
libraries during static linking (-lusb -lusb-1.0 and -pthread).

Since configure.ac is modified, the configure script needs to be
regenerated with autoreconf.

Fixes:
http://autobuild.buildroot.net/results/647/6473088e751d3ab3a5227e9d7876966934e66378/build-end.log

Cc: Phil Eichinger <phil.eichinger@gmail.com>
Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...pmctl-01-configure-add-pkg-config-support.patch |   70 ++++++++++++++++++++
 package/sispmctl/sispmctl.mk                       |    4 +-
 2 files changed, 73 insertions(+), 1 deletions(-)

diff --git a/package/sispmctl/sispmctl-01-configure-add-pkg-config-support.patch b/package/sispmctl/sispmctl-01-configure-add-pkg-config-support.patch
new file mode 100644
index 0000000..9466080
--- /dev/null
+++ b/package/sispmctl/sispmctl-01-configure-add-pkg-config-support.patch
@@ -0,0 +1,70 @@
+From 8002a7e6fa965dfd304d098fbc64b0f1a6e3b465 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sun, 24 Aug 2014 22:34:29 +0200
+Subject: [PATCH 1/1] configure: add pkg-config support
+
+The static linking doesn't works with libusb-compat when using libusb-config.
+Also the CFLAGS initialization with libusb-config --cflags is comented out.
+
+Based on libftdi's patch, add the support for pkg-config to link sispmctl
+correctly.
+
+This allow to add correct include directory to CFLAGS
+(Add -I$(STAGING_DIR)/usr/include and -I$(STAGING_DIR)/usr/include/libusb-1.0)
+Also add needed libraries during static linking (-lusb -lusb-1.0 and -pthread)
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ configure.in | 36 +++++++++++-------------------------
+ 1 file changed, 11 insertions(+), 25 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 08d39ea..65d0c1d 100644
+--- a/configure.in
++++ b/configure.in
+@@ -23,31 +23,17 @@ AC_SUBST(WEBDIR)
+ AC_ARG_WITH(bindaddr,[  --with-bindaddr=IP bind listening socket to IP], [BINDADDR="$withval"])
+ AC_SUBST(BINDADDR)
+ 
+-
+-# Checks for libraries.
+-dnl check for libusb-config
+-AC_PATH_PROG(HAVELIBUSB, libusb-config, $PATH)
+-
+-if test -e "$HAVELIBUSB"; then
+-   dnl   LIBUSB_CFLAGS=`$HAVELIBUSB --cflags`
+-   LIBUSB_LIBS=`$HAVELIBUSB --libs`
+-   CFLAGS="$CFLAGS $LIBUSB_CFLAGS"
+-   LIBS="$LIBS $LIBUSB_LIBS"
+-else
+-   AC_MSG_ERROR([*** libusb-config not found. You need a working libusb installation. Version >=0.1.7])
+-fi
+-
+-dnl check for version of libusb
+-AC_MSG_CHECKING([if libusb version is >= 0.1.9])
+-libusb_version_needed="1009"
+-libusb_version=`$HAVELIBUSB --version | sed -e "s/libusb //" | awk 'BEGIN { FS = "."; } { printf "%d", ($''1 * 1000 + $''2) * 1000 + $''3;}'`
+-
+-if test $libusb_version -lt $libusb_version_needed; then
+-   AC_MSG_RESULT(no)
+-   AC_MSG_ERROR([*** libusb is too old ($libusb_version). You need a libusb installation newer or equal to 0.1.9.])
+-else
+-   AC_MSG_RESULT(yes)
+-fi
++dnl check for libusb
++PKG_CHECK_MODULES(LIBUSB, libusb >= 0.1.11)
++CFLAGS="$CFLAGS $LIBUSB_CFLAGS"
++LIBS="$LIBS $LIBUSB_LIBS"
++
++dnl Check for recent pkg-config which supports Requires.private
++case `$PKG_CONFIG --version` in
++0.?|0.1[0-7]) PKGCONFIG_REQUIRES="Requires"; ;;
++*) PKGCONFIG_REQUIRES="Requires.private"; ;;
++esac
++AC_SUBST(PKGCONFIG_REQUIRES)
+ 
+ # Checks for header files.
+ AC_HEADER_STDC
+-- 
+1.9.3
+
diff --git a/package/sispmctl/sispmctl.mk b/package/sispmctl/sispmctl.mk
index d10fe1b..3f3635e 100644
--- a/package/sispmctl/sispmctl.mk
+++ b/package/sispmctl/sispmctl.mk
@@ -10,7 +10,9 @@ SISPMCTL_LICENSE = GPLv2+
 SISPMCTL_LICENSE_FILES = LICENCE
 SISPMCTL_DEPENDENCIES = libusb-compat
 
-SISPMCTL_CONF_ENV = HAVELIBUSB=$(STAGING_DIR)/usr/bin/libusb-config
 SISPMCTL_CONF_OPTS = --enable-webless
 
+# We're patching configure.in
+SISPMCTL_AUTORECONF = YES
+
 $(eval $(autotools-package))

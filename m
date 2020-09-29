From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 30 Sep 2020 01:33:13 +0200
Subject: [Buildroot] [PATCH] package/elfutils: bump to version 0.181
Message-ID: <20200929233314.544672-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Refreshed patch #1 and disable debuginfod.

The debuginfod tools needs to hook into serverinfrastructure,
this currently only exists for Fedora.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 ...nable-disable-progs-configure-option.patch | 25 +++++++++----------
 package/elfutils/elfutils.hash                | 12 ++++-----
 package/elfutils/elfutils.mk                  |  5 +++-
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch b/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch
index 36bd462175..7b3c459321 100644
--- a/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch
+++ b/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch
@@ -27,29 +27,28 @@ diff --git a/Makefile.am b/Makefile.am
 index 2ff444e7bf1d..70443abb4fb6 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -26,9 +26,13 @@ AM_MAKEFLAGS = --no-print-directory
- 
+@@ -26,8 +26,12 @@ AM_MAKEFLAGS = --no-print-directory
+
  pkginclude_HEADERS = version.h
- 
+
 +if ENABLE_PROGS
 +PROGS_SUBDIR = src
 +endif
 +
- # Add doc back when we have some real content.
- SUBDIRS = config m4 lib libelf libebl libdwelf libdwfl libdw libcpu libasm \
--	  backends src po tests
-+	  backends $(PROGS_SUBDIR) po tests
- 
+ SUBDIRS = config m4 lib libelf libcpu backends libebl libdwelf libdwfl libdw \
+-	  libasm debuginfod src po doc tests
++	  libasm debuginfod $(PROGS_SUBDIR) po doc tests
+
  EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING \
  	     COPYING COPYING-GPLV2 COPYING-LGPLV3
 diff --git a/configure.ac b/configure.ac
 index c2c1d90b2133..7b4c38381cca 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -345,6 +345,12 @@ AC_SUBST([LIBEBL_SUBDIR])
- AC_DEFINE_UNQUOTED(LIBEBL_SUBDIR, "$LIBEBL_SUBDIR")
- AH_TEMPLATE([LIBEBL_SUBDIR], [$libdir subdirectory containing libebl modules.])
- 
+@@ -390,6 +390,12 @@
+ 	       [tests_use_rpath=$enableval], [tests_use_rpath=no])
+ AM_CONDITIONAL(TESTS_RPATH, test "$tests_use_rpath" = yes)
+
 +AC_ARG_ENABLE([progs],
 +	AS_HELP_STRING([--enable-progs], [enable progs]),
 +	enable_progs=$enableval,
@@ -59,6 +58,6 @@ index c2c1d90b2133..7b4c38381cca 100644
  dnl zlib is mandatory.
  save_LIBS="$LIBS"
  LIBS=
--- 
+--
 2.11.0
 
diff --git a/package/elfutils/elfutils.hash b/package/elfutils/elfutils.hash
index d8a1ce3915..65ee764bcb 100644
--- a/package/elfutils/elfutils.hash
+++ b/package/elfutils/elfutils.hash
@@ -1,8 +1,6 @@
-# From https://sourceware.org/elfutils/ftp/0.177/md5.sum
-md5 0b583722f911e1632544718d502aab87  elfutils-0.177.tar.bz2
-# From https://sourceware.org/elfutils/ftp/0.177/sha512.sum
-sha512 2779987463a22ed220759e25a09c9a1eb84c0f36db37675136e59aa55c7f8f90b7a7d34ffc4e6a4291d7fa73692a1bd1a303a74270b11d1623b4f9868d19498f  elfutils-0.177.tar.bz2
+# From https://sourceware.org/elfutils/ftp/0.181/sha512.sum
+sha512  d565541d5817f409dc89ebb1ee593366f69c371a1531308eeb67ff934b14a0fab0c9009fd7c23240efbaa1b4e04edac5c425e47d80e3e66ba03dcaf000afea36  elfutils-0.181.tar.bz2
 # Locally calculated
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING-GPLV2
-sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING-LGPLV3
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING-GPLV2
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING-LGPLV3
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index c3df7303b7..3615a16cd0 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELFUTILS_VERSION = 0.177
+ELFUTILS_VERSION = 0.181
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
 ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
@@ -48,6 +48,9 @@ ELFUTILS_DEPENDENCIES += musl-fts
 ELFUTILS_LDFLAGS += -lfts
 endif
 
+# disable for now, needs "distro" support
+ELFUTILS_CONF_OPTS += --disable-libdebuginfod --disable-debuginfod
+
 ELFUTILS_CONF_ENV += \
 	LDFLAGS="$(ELFUTILS_LDFLAGS)"
 
-- 
2.28.0

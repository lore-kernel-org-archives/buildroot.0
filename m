From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 15 Mar 2021 22:08:40 +0100
Subject: [Buildroot] [PATCH v1] package/elfutils: bump version to 0.183
Message-ID: <20210315210840.17649-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- handle new zstd option (disable for host, optional for target)

For details see [1], [2].

[1] https://sourceware.org/pipermail/elfutils-devel/2020q4/003053.html
[2] https://sourceware.org/pipermail/elfutils-devel/2021q1/003486.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...nable-disable-progs-configure-option.patch | 24 ++++++++++---------
 package/elfutils/elfutils.hash                |  4 ++--
 package/elfutils/elfutils.mk                  | 10 +++++++-
 3 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch b/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch
index 7b3c459321..e51f749cf6 100644
--- a/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch
+++ b/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch
@@ -1,4 +1,4 @@
-From dfea82b761b2ea4708fbf9370a5467ae4be525ca Mon Sep 17 00:00:00 2001
+From 73e4da5ca780196d23db8029dcd28f87a0402711 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Mon, 29 May 2017 23:03:48 +0300
 Subject: [PATCH] Add a --{enable,disable}-progs configure option
@@ -18,37 +18,39 @@ Based on the former patch by Thomas Petazzoni.
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Rebased on 0.183]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  Makefile.am  | 6 +++++-
  configure.ac | 6 ++++++
  2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 2ff444e7bf1d..70443abb4fb6 100644
+index 9c47afa..edf8dfc 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -26,8 +26,12 @@ AM_MAKEFLAGS = --no-print-directory
-
+ 
  pkginclude_HEADERS = version.h
-
+ 
 +if ENABLE_PROGS
 +PROGS_SUBDIR = src
 +endif
 +
- SUBDIRS = config m4 lib libelf libcpu backends libebl libdwelf libdwfl libdw \
+ SUBDIRS = config lib libelf libcpu backends libebl libdwelf libdwfl libdw \
 -	  libasm debuginfod src po doc tests
 +	  libasm debuginfod $(PROGS_SUBDIR) po doc tests
-
+ 
  EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING \
  	     COPYING COPYING-GPLV2 COPYING-LGPLV3
 diff --git a/configure.ac b/configure.ac
-index c2c1d90b2133..7b4c38381cca 100644
+index d345495..0dd4b1e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -390,6 +390,12 @@
+@@ -393,6 +393,12 @@ AS_HELP_STRING([--enable-tests-rpath],[build $ORIGIN-using rpath into tests]),
  	       [tests_use_rpath=$enableval], [tests_use_rpath=no])
  AM_CONDITIONAL(TESTS_RPATH, test "$tests_use_rpath" = yes)
-
+ 
 +AC_ARG_ENABLE([progs],
 +	AS_HELP_STRING([--enable-progs], [enable progs]),
 +	enable_progs=$enableval,
@@ -58,6 +60,6 @@ index c2c1d90b2133..7b4c38381cca 100644
  dnl zlib is mandatory.
  save_LIBS="$LIBS"
  LIBS=
---
-2.11.0
+-- 
+2.30.1
 
diff --git a/package/elfutils/elfutils.hash b/package/elfutils/elfutils.hash
index 65ee764bcb..c14a86e31f 100644
--- a/package/elfutils/elfutils.hash
+++ b/package/elfutils/elfutils.hash
@@ -1,5 +1,5 @@
-# From https://sourceware.org/elfutils/ftp/0.181/sha512.sum
-sha512  d565541d5817f409dc89ebb1ee593366f69c371a1531308eeb67ff934b14a0fab0c9009fd7c23240efbaa1b4e04edac5c425e47d80e3e66ba03dcaf000afea36  elfutils-0.181.tar.bz2
+# From https://sourceware.org/elfutils/ftp/0.183/sha512.sum
+sha512  bdafdd738a33cebe4f87849e5e6f1133881e77ef71b27faa0f0234ff80e9674f506957898326c2a55fd8438cbd189f7930597d0b4b9ca6c77921cc0cbd83b6b7  elfutils-0.183.tar.bz2
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING-GPLV2
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index b76b06bcb3..942949547a 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELFUTILS_VERSION = 0.181
+ELFUTILS_VERSION = 0.183
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
 ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
@@ -26,6 +26,7 @@ ELFUTILS_CONF_OPTS += \
 HOST_ELFUTILS_CONF_OPTS = \
 	--with-bzlib \
 	--with-lzma \
+	--without-zstd \
 	--disable-progs
 
 # elfutils gets confused when lfs mode is forced, so don't
@@ -79,6 +80,13 @@ else
 ELFUTILS_CONF_OPTS += --without-lzma
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+ELFUTILS_DEPENDENCIES += zstd
+ELFUTILS_CONF_OPTS += --with-zstd
+else
+ELFUTILS_CONF_OPTS += --without-zstd
+endif
+
 ifeq ($(BR2_PACKAGE_ELFUTILS_PROGS),y)
 ELFUTILS_CONF_OPTS += --enable-progs
 ELFUTILS_LICENSE += , GPL-3.0+ (programs)
-- 
2.30.1

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 17:15:23 +0200
Subject: [Buildroot] [git commit] fwts: bump to version V18.09.00
Message-ID: <20181011151530.77BC982A89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c5832305b96203f4f9c549e010f0e06b256f605
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build- and run-tested on x86_64 and aarch64.
Rebased -Werror removal patch, it didn't apply anymore because one of
the files added a license header at the top.
Added libbsd dependency which is required since V18.08.00 for the
"bsd/string.h" header.
Reordered list of Config.in dependencies to match the toolchain
requirements comment order.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fwts/0001-build-do-not-use-Werror.patch | 19 +++++++++++--------
 package/fwts/Config.in                          |  9 ++++++---
 package/fwts/fwts.hash                          |  2 +-
 package/fwts/fwts.mk                            |  4 ++--
 4 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/package/fwts/0001-build-do-not-use-Werror.patch b/package/fwts/0001-build-do-not-use-Werror.patch
index 5246fd62d2..2dbf5313d5 100644
--- a/package/fwts/0001-build-do-not-use-Werror.patch
+++ b/package/fwts/0001-build-do-not-use-Werror.patch
@@ -1,4 +1,4 @@
-From db480b9f3e3a5c6c12e9dd04e87c8dff9381b8e7 Mon Sep 17 00:00:00 2001
+From 4c202c0fd7e5bd3264c720d715f05573047d9cf5 Mon Sep 17 00:00:00 2001
 From: Erico Nunes <nunes.erico@gmail.com>
 Date: Fri, 12 Aug 2016 23:11:56 +0200
 Subject: [PATCH] fwts: do not use -Werror
@@ -18,7 +18,7 @@ Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
  4 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index e3e7512..64034fa 100644
+index 0109d644..3ca599e1 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1,5 +1,5 @@
@@ -29,7 +29,7 @@ index e3e7512..64034fa 100644
  	  AC_CANONICAL_HOST
  	  AC_CONFIG_MACRO_DIR([m4])
 diff --git a/src/Makefile.am b/src/Makefile.am
-index bc23e8d..599765d 100644
+index 52c637dd..d9d73f1c 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -14,7 +14,7 @@ AM_CPPFLAGS = \
@@ -42,10 +42,10 @@ index bc23e8d..599765d 100644
  bin_PROGRAMS = fwts
  
 diff --git a/src/lib/src/Makefile.am b/src/lib/src/Makefile.am
-index 1b8fd74..163c9ae 100644
+index 54de7f44..e129ed16 100644
 --- a/src/lib/src/Makefile.am
 +++ b/src/lib/src/Makefile.am
-@@ -6,7 +6,7 @@ AM_CPPFLAGS = \
+@@ -24,7 +24,7 @@ AM_CPPFLAGS = \
  	`pkg-config --silence-errors --cflags json-c`	\
  	`pkg-config --cflags glib-2.0 gio-2.0` 		\
  	-DDATAROOTDIR=\"$(datarootdir)\"		\
@@ -55,15 +55,18 @@ index 1b8fd74..163c9ae 100644
  pkglib_LTLIBRARIES = libfwts.la
  
 diff --git a/src/utilities/Makefile.am b/src/utilities/Makefile.am
-index 9a47980..14997df 100644
+index aa37de55..4d5297cc 100644
 --- a/src/utilities/Makefile.am
 +++ b/src/utilities/Makefile.am
-@@ -1,4 +1,4 @@
+@@ -16,7 +16,7 @@
+ # Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
+ #
+ 
 -AM_CPPFLAGS = -Wall -Werror -Wextra -DDATAROOTDIR=\"$(datarootdir)\" \
 +AM_CPPFLAGS = -Wall -Wextra -DDATAROOTDIR=\"$(datarootdir)\" \
  	`pkg-config --silence-errors --cflags json` \
  	`pkg-config --silence-errors --cflags json-c`
  
 -- 
-2.7.4
+2.17.1
 
diff --git a/package/fwts/Config.in b/package/fwts/Config.in
index 37759c61cb..959d871a72 100644
--- a/package/fwts/Config.in
+++ b/package/fwts/Config.in
@@ -1,13 +1,15 @@
 config BR2_PACKAGE_FWTS
 	bool "fwts"
 	depends on BR2_i386 || BR2_x86_64 || BR2_aarch64
-	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_USE_MMU # libglib2
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS # libbsd
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_USE_WCHAR # libglib2, libbsd
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libbsd
 	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_LIBBSD
 	help
 	  Firmware Test Suite (FWTS) is a test suite that performs
 	  sanity checks on firmware. It is intended to identify BIOS and
@@ -21,6 +23,7 @@ config BR2_PACKAGE_FWTS
 
 comment "fwts needs a glibc toolchain w/ wchar, threads"
 	depends on BR2_i386 || BR2_x86_64 || BR2_aarch64
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS # libbsd
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index e23386e1fd..c3f3b57801 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,2 +1,2 @@
 # Hash from: http://fwts.ubuntu.com/release/SHA256SUMS
-sha256 077b57864515ffdd6d655201da750829f9ccffb8f280eb86d01c2ef184cdcb16 fwts-V16.11.00.tar.gz
+sha256 7fcdcf3acecfb92510fcb2faef3ab0db66f639bf3f068cf77a4e0aebba036f93 fwts-V18.09.00.tar.gz
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index 8b0c5b0e5a..15f0afcce3 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-FWTS_VERSION = V16.11.00
+FWTS_VERSION = V18.09.00
 FWTS_SITE = http://fwts.ubuntu.com/release
 FWTS_STRIP_COMPONENTS = 0
 FWTS_LICENSE = GPL-2.0, LGPL-2.1, Custom
 FWTS_LICENSE_FILES = debian/copyright
 FWTS_AUTORECONF = YES
-FWTS_DEPENDENCIES = host-bison host-flex host-pkgconf json-c libglib2 \
+FWTS_DEPENDENCIES = host-bison host-flex host-pkgconf json-c libglib2 libbsd \
 	$(if $(BR2_PACKAGE_DTC),dtc)
 
 $(eval $(autotools-package))

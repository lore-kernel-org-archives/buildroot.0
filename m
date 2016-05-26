From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 May 2016 16:33:47 -0300
Subject: [Buildroot] [PATCH] libpng: bump to version 1.6.22
Message-ID: <1464291227-1261-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebase patch 1 in git format, and rebase patch 2 against 1.6.22.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../0001-Disable-pngfix-and-png-fix-itxt.patch     | 44 ++++++++++++++++++++++
 package/libpng/0001-disable-tools.patch            | 30 ---------------
 ...prefix-to-symbol-names-in-version-script.patch} | 29 +++++++-------
 package/libpng/libpng.hash                         |  6 +--
 package/libpng/libpng.mk                           |  2 +-
 5 files changed, 63 insertions(+), 48 deletions(-)
 create mode 100644 package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch
 delete mode 100644 package/libpng/0001-disable-tools.patch
 rename package/libpng/{0002-ignore-symbol-prefix.patch => 0002-Don-t-append-prefix-to-symbol-names-in-version-script.patch} (64%)

diff --git a/package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch b/package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch
new file mode 100644
index 0000000..30c3623
--- /dev/null
+++ b/package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch
@@ -0,0 +1,44 @@
+From 60c3ee917c8e7a4760b1ef7c3dc2b44a615150d3 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Thu, 26 May 2016 16:26:18 -0300
+Subject: [PATCH] Disable pngfix and png-fix-itxt
+
+Disable the new pngfix and png-fix-itxt tools: they take up space, fail
+to build on some oddball toolchain configurations and aren't
+expected/needed in a non-interactive embedded system.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ Makefile.am | 2 +-
+ Makefile.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 7212951..3430dca 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -18,7 +18,7 @@ check_PROGRAMS += timepng
+ endif
+ 
+ # Utilities - installed
+-bin_PROGRAMS= pngfix png-fix-itxt
++bin_PROGRAMS=
+ 
+ # This ensures that pnglibconf.h gets built at the start of 'make all' or
+ # 'make check', but it does not add dependencies to the individual programs,
+diff --git a/Makefile.in b/Makefile.in
+index a66f6aa..4e67782 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -104,7 +104,7 @@ check_PROGRAMS = pngtest$(EXEEXT) pngunknown$(EXEEXT) \
+ 	pngstest$(EXEEXT) pngvalid$(EXEEXT) pngimage$(EXEEXT) \
+ 	$(am__EXEEXT_1)
+ @HAVE_CLOCK_GETTIME_TRUE at am__append_1 = timepng
+-bin_PROGRAMS = pngfix$(EXEEXT) png-fix-itxt$(EXEEXT)
++bin_PROGRAMS =
+ @PNG_ARM_NEON_TRUE at am__append_2 = arm/arm_init.c\
+ @PNG_ARM_NEON_TRUE@	arm/filter_neon.S arm/filter_neon_intrinsics.c
+ 
+-- 
+2.7.3
+
diff --git a/package/libpng/0001-disable-tools.patch b/package/libpng/0001-disable-tools.patch
deleted file mode 100644
index e30eca9..0000000
--- a/package/libpng/0001-disable-tools.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Disable the new pngfix and png-fix-itxt tools: they take up space, fail to
-build on some oddball toolchain configurations and aren't expected/needed
-in a non-interactive embedded system.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura libpng-1.6.10.orig/Makefile.am libpng-1.6.10/Makefile.am
---- libpng-1.6.10.orig/Makefile.am	2014-03-17 08:51:25.812005079 -0300
-+++ libpng-1.6.10/Makefile.am	2014-03-17 09:14:28.807586433 -0300
-@@ -10,7 +10,7 @@
- check_PROGRAMS= pngtest pngunknown pngstest pngvalid pngimage
- 
- # Utilities - installed
--bin_PROGRAMS= pngfix png-fix-itxt
-+bin_PROGRAMS=
- 
- # This ensures that pnglibconf.h gets built at the start of 'make all' or
- # 'make check', but it does not add dependencies to the individual programs,
-diff -Nura libpng-1.6.10.orig/Makefile.in libpng-1.6.10/Makefile.in
---- libpng-1.6.10.orig/Makefile.in	2014-03-17 08:51:25.807005070 -0300
-+++ libpng-1.6.10/Makefile.in	2014-03-17 09:14:44.846617623 -0300
-@@ -87,7 +87,7 @@
- host_triplet = @host@
- check_PROGRAMS = pngtest$(EXEEXT) pngunknown$(EXEEXT) \
- 	pngstest$(EXEEXT) pngvalid$(EXEEXT) pngimage$(EXEEXT)
--bin_PROGRAMS = pngfix$(EXEEXT) png-fix-itxt$(EXEEXT)
-+bin_PROGRAMS =
- @PNG_ARM_NEON_TRUE at am__append_1 = arm/arm_init.c\
- @PNG_ARM_NEON_TRUE@	arm/filter_neon.S arm/filter_neon_intrinsics.c
- 
diff --git a/package/libpng/0002-ignore-symbol-prefix.patch b/package/libpng/0002-Don-t-append-prefix-to-symbol-names-in-version-script.patch
similarity index 64%
rename from package/libpng/0002-ignore-symbol-prefix.patch
rename to package/libpng/0002-Don-t-append-prefix-to-symbol-names-in-version-script.patch
index 5a8ede5..0754e21 100644
--- a/package/libpng/0002-ignore-symbol-prefix.patch
+++ b/package/libpng/0002-Don-t-append-prefix-to-symbol-names-in-version-script.patch
@@ -1,7 +1,7 @@
-From dbfea83a7436cbac34cc883ab2b7befacaf02c40 Mon Sep 17 00:00:00 2001
-From: Danomi Manchego <danomimanchego123@gmail.com>
-Date: Tue, 23 Jun 2015 13:54:42 -0400
-Subject: libpng: don't append prefix to symbol names in version script
+From 473fdecd9a580b45251480b8ccbbb1927c598310 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Thu, 26 May 2016 16:27:13 -0300
+Subject: [PATCH] Don't append prefix to symbol names in version script
 
 Even if Blackfin GNU toolchain add prefix '_' to all symbols,
 symbol prefix is not accepted in the link flag --version-script.
@@ -9,19 +9,20 @@ Don't append prefix in the symbols in the version script file.
 
 Original patch by: Sonic Zhang <sonic.zhang@analog.com>
 
-Rebase to apply cleanly.
+[Gustavo: update for 1.6.22]
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
- Makefile.am |    2 +-
- Makefile.in |    2 +-
+ Makefile.am | 2 +-
+ Makefile.in | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index dcc5439..e543c81 100644
+index 3430dca..db6a7a2 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -231,7 +231,7 @@ contrib/tools/pngfix.o: pnglibconf.h
+@@ -236,7 +236,7 @@ contrib/tools/pngfix.o: pnglibconf.h
  # interfering with the symbol file format.
  SYMBOL_CFLAGS = -DPNGLIB_LIBNAME='PNG at PNGLIB_MAJOR@@PNGLIB_MINOR at _0'\
  		-DPNGLIB_VERSION='@PNGLIB_VERSION@'\
@@ -31,18 +32,18 @@ index dcc5439..e543c81 100644
  
  if DO_PNG_PREFIX
 diff --git a/Makefile.in b/Makefile.in
-index 975f931..a3e0552 100644
+index 4e67782..5f468d9 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -747,7 +747,7 @@ SUFFIXES = .chk .out
+@@ -754,7 +754,7 @@ SUFFIXES = .chk .out
  # interfering with the symbol file format.
  SYMBOL_CFLAGS = -DPNGLIB_LIBNAME='PNG at PNGLIB_MAJOR@@PNGLIB_MINOR at _0' \
  	-DPNGLIB_VERSION='@PNGLIB_VERSION@' \
 -	-DSYMBOL_PREFIX='$(SYMBOL_PREFIX)' -DPNG_NO_USE_READ_MACROS \
 +	-DSYMBOL_PREFIX='' -DPNG_NO_USE_READ_MACROS \
- 	-DPNG_BUILDING_SYMBOL_TABLE $(am__append_5)
+ 	-DPNG_BUILDING_SYMBOL_TABLE $(am__append_6)
  
  # EXT_LIST is a list of the possibly library directory extensions, this exists
 -- 
-1.7.9.5
+2.7.3
 
diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 3b2db43..e9d3674 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.21/
-md5	3bacb4728f6694a64ad9052769d6a4ce	libpng-1.6.21.tar.xz
-sha1	978b2f4e007eda56032001493ddb97d20f0ab291	libpng-1.6.21.tar.xz
+# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.22/
+md5	f4ca54a3d945b8678fafed168c503f3b	libpng-1.6.22.tar.xz
+sha1	e82ec5ba0e05698c221c78f70b4c5513eb40e199	libpng-1.6.22.tar.xz
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 7ce4a3a..df2cbcd 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.21
+LIBPNG_VERSION = 1.6.22
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
-- 
2.7.3

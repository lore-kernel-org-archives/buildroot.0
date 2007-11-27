From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 27 Nov 2007 13:40:58 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libmad
Message-ID: <20071127214058.83C1730049@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-27 13:40:57 -0800 (Tue, 27 Nov 2007)
New Revision: 20553

Log:
Fix libmad configure order according to issue 0001571, revert old fix

Modified:
   trunk/buildroot/package/libmad/libmad-0.15.1b-optimization.patch.avr32
   trunk/buildroot/package/libmad/libmad.mk


Changeset:
Modified: trunk/buildroot/package/libmad/libmad-0.15.1b-optimization.patch.avr32
===================================================================
--- trunk/buildroot/package/libmad/libmad-0.15.1b-optimization.patch.avr32	2007-11-27 21:15:15 UTC (rev 20552)
+++ trunk/buildroot/package/libmad/libmad-0.15.1b-optimization.patch.avr32	2007-11-27 21:40:57 UTC (rev 20553)
@@ -139,20 +139,19 @@
  unsigned short mad_bit_crc(struct mad_bitptr, unsigned int, unsigned short);
  
  # endif
-diff --git a/configure b/configure
-index ee421cc..7a9f0c8 100755
---- a/configure
-+++ b/configure
-@@ -1048,7 +1048,7 @@ Optional Features:
-   --enable-speed          optimize for speed over accuracy
-   --enable-accuracy       optimize for accuracy over speed
-   --enable-fpm=ARCH       use ARCH-specific fixed-point math routines (one of:
--                          intel, arm, mips, sparc, ppc, 64bit, default)
-+                          intel, arm, avr32, mips, sparc, ppc, 64bit, default)
-   --enable-sso            use subband synthesis optimization
-   --disable-aso           disable architecture-specific optimizations
-   --enable-strict-iso     use strict ISO/IEC interpretations
-@@ -21477,6 +21477,7 @@ if test "${enable_fpm+set}" = set; then
+diff --git a/configure.ac b/configure.ac
+index 9b79399..063cb9b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -274,13 +274,14 @@ fi
+ AC_MSG_CHECKING(for architecture-specific fixed-point math routines)
+ AC_ARG_ENABLE(fpm, AC_HELP_STRING([--enable-fpm=ARCH],
+ 		   [use ARCH-specific fixed-point math routines
+-		    (one of: intel, arm, mips, sparc, ppc, 64bit, default)]),
++		    (one of: intel, arm, avr32, mips, sparc, ppc, 64bit, default)]),
+ [
+     case "$enableval" in
+ 	yes)                             ;;
  	no|default|approx) FPM="DEFAULT" ;;
  	intel|i?86)        FPM="INTEL"   ;;
  	arm)               FPM="ARM"     ;;
@@ -160,7 +159,7 @@
  	mips)              FPM="MIPS"    ;;
  	sparc)             FPM="SPARC"   ;;
  	ppc|powerpc)       FPM="PPC"     ;;
-@@ -21498,6 +21499,7 @@ then
+@@ -298,6 +299,7 @@ then
      case "$host" in
  	i?86-*)     FPM="INTEL"  ;;
  	arm*-*)     FPM="ARM"    ;;
@@ -168,7 +167,7 @@
  	mips*-*)    FPM="MIPS"   ;;
  	sparc*-*)   FPM="SPARC"  ;;
  	powerpc*-*) FPM="PPC"    ;;
-@@ -21554,6 +21556,11 @@ then
+@@ -343,6 +345,11 @@ then
  	    ASO="$ASO -DASO_IMDCT"
  	    ASO_OBJS="imdct_l_arm.lo"
  	    ;;
@@ -180,19 +179,20 @@
  	mips*-*)
  	    ASO="$ASO -DASO_INTERLEAVE2"
  	    ASO="$ASO -DASO_ZEROCHECK"
-diff --git a/configure.ac b/configure.ac
-index 9b79399..063cb9b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -274,13 +274,14 @@ fi
- AC_MSG_CHECKING(for architecture-specific fixed-point math routines)
- AC_ARG_ENABLE(fpm, AC_HELP_STRING([--enable-fpm=ARCH],
- 		   [use ARCH-specific fixed-point math routines
--		    (one of: intel, arm, mips, sparc, ppc, 64bit, default)]),
-+		    (one of: intel, arm, avr32, mips, sparc, ppc, 64bit, default)]),
- [
-     case "$enableval" in
- 	yes)                             ;;
+diff --git a/configure b/configure
+index ee421cc..7a9f0c8 100755
+--- a/configure
++++ b/configure
+@@ -1048,7 +1048,7 @@ Optional Features:
+   --enable-speed          optimize for speed over accuracy
+   --enable-accuracy       optimize for accuracy over speed
+   --enable-fpm=ARCH       use ARCH-specific fixed-point math routines (one of:
+-                          intel, arm, mips, sparc, ppc, 64bit, default)
++                          intel, arm, avr32, mips, sparc, ppc, 64bit, default)
+   --enable-sso            use subband synthesis optimization
+   --disable-aso           disable architecture-specific optimizations
+   --enable-strict-iso     use strict ISO/IEC interpretations
+@@ -21477,6 +21477,7 @@ if test "${enable_fpm+set}" = set; then
  	no|default|approx) FPM="DEFAULT" ;;
  	intel|i?86)        FPM="INTEL"   ;;
  	arm)               FPM="ARM"     ;;
@@ -200,7 +200,7 @@
  	mips)              FPM="MIPS"    ;;
  	sparc)             FPM="SPARC"   ;;
  	ppc|powerpc)       FPM="PPC"     ;;
-@@ -298,6 +299,7 @@ then
+@@ -21498,6 +21499,7 @@ then
      case "$host" in
  	i?86-*)     FPM="INTEL"  ;;
  	arm*-*)     FPM="ARM"    ;;
@@ -208,7 +208,7 @@
  	mips*-*)    FPM="MIPS"   ;;
  	sparc*-*)   FPM="SPARC"  ;;
  	powerpc*-*) FPM="PPC"    ;;
-@@ -343,6 +345,11 @@ then
+@@ -21554,6 +21556,11 @@ then
  	    ASO="$ASO -DASO_IMDCT"
  	    ASO_OBJS="imdct_l_arm.lo"
  	    ;;

Modified: trunk/buildroot/package/libmad/libmad.mk
===================================================================
--- trunk/buildroot/package/libmad/libmad.mk	2007-11-27 21:15:15 UTC (rev 20552)
+++ trunk/buildroot/package/libmad/libmad.mk	2007-11-27 21:40:57 UTC (rev 20553)
@@ -38,13 +38,8 @@
 	)
 	touch $@
 
-# This rule runs 'libtoolize' since the ltmain.sh which comes in the tarball
-# is unsuitable with new libtool versions (causing shared libraries to build
-# without the .so extension).
-
 $(LIBMAD_DIR)/libmad.la: $(LIBMAD_DIR)/.configured
 	rm -f $@
-	(cd $(LIBMAD_DIR); libtoolize --force)
 	$(MAKE) -C $(LIBMAD_DIR)
 
 $(STAGING_DIR)/usr/lib/libmad.so.0: $(LIBMAD_DIR)/libmad.la

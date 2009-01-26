From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 14:49:37 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/liboil
Message-ID: <20090126144938.07E82768D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-26 14:49:37 +0000 (Mon, 26 Jan 2009)
New Revision: 25053

Log:
liboil: don't build examples

Added:
   trunk/buildroot/package/liboil/liboil-0.3.15-arm-vfp.patch

Removed:
   trunk/buildroot/package/liboil/liboil-vfp.patch

Modified:
   trunk/buildroot/package/liboil/liboil.mk


Changeset:
Copied: trunk/buildroot/package/liboil/liboil-0.3.15-arm-vfp.patch (from rev 25052, trunk/buildroot/package/liboil/liboil-vfp.patch)
===================================================================
--- trunk/buildroot/package/liboil/liboil-0.3.15-arm-vfp.patch	                        (rev 0)
+++ trunk/buildroot/package/liboil/liboil-0.3.15-arm-vfp.patch	2009-01-26 14:49:37 UTC (rev 25053)
@@ -0,0 +1,16 @@
+diff --git a/configure.ac b/configure.ac
+index 06a0ac9..b8d1640 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -158,7 +158,10 @@ if test x$HAVE_GCC_ASM = xyes -a x$HAVE_POWERPC = xyes ; then
+     true)
+ fi
+ 
+-if test x$HAVE_GCC_ASM = xyes -a x$HAVE_ARM = xyes ; then
++AC_ARG_ENABLE(vfp,
++  AC_HELP_STRING([--enable-vfp],[compile with Vector Floating-point unit support]),
++  enable_vfp=$enableval,enable_vfp=yes)
++if test "x$enable-vfp" = xyes -a x$HAVE_GCC_ASM = xyes -a x$HAVE_ARM = xyes; then
+   AS_COMPILER_FLAG(["-Wa,-mfpu=vfp"],
+     [LIBOIL_CFLAGS="$LIBOIL_CFLAGS -mfpu=vfp"],
+     true)

Deleted: trunk/buildroot/package/liboil/liboil-vfp.patch
===================================================================
--- trunk/buildroot/package/liboil/liboil-vfp.patch	2009-01-26 14:49:19 UTC (rev 25052)
+++ trunk/buildroot/package/liboil/liboil-vfp.patch	2009-01-26 14:49:37 UTC (rev 25053)
@@ -1,16 +0,0 @@
-diff --git a/configure.ac b/configure.ac
-index 06a0ac9..b8d1640 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -158,7 +158,10 @@ if test x$HAVE_GCC_ASM = xyes -a x$HAVE_POWERPC = xyes ; then
-     true)
- fi
- 
--if test x$HAVE_GCC_ASM = xyes -a x$HAVE_ARM = xyes ; then
-+AC_ARG_ENABLE(vfp,
-+  AC_HELP_STRING([--enable-vfp],[compile with Vector Floating-point unit support]),
-+  enable_vfp=$enableval,enable_vfp=yes)
-+if test "x$enable-vfp" = xyes -a x$HAVE_GCC_ASM = xyes -a x$HAVE_ARM = xyes; then
-   AS_COMPILER_FLAG(["-Wa,-mfpu=vfp"],
-     [LIBOIL_CFLAGS="$LIBOIL_CFLAGS -mfpu=vfp"],
-     true)

Modified: trunk/buildroot/package/liboil/liboil.mk
===================================================================
--- trunk/buildroot/package/liboil/liboil.mk	2009-01-26 14:49:19 UTC (rev 25052)
+++ trunk/buildroot/package/liboil/liboil.mk	2009-01-26 14:49:37 UTC (rev 25053)
@@ -44,12 +44,3 @@
 	# Remove useless bugreport program from the target
 	rm -f $(TARGET_DIR)/usr/bin/oil-bugreport
 	touch $@
-
-
-# Disable some examples that will break the build.
-# There are sveral more that can be removed
-# by someone with time over.
-$(LIBOIL_HOOK_POST_CONFIGURE):
-	$(SED) 's/uberopt//g' $(LIBOIL_DIR)/examples/Makefile
-	$(SED) 's/work//g' $(LIBOIL_DIR)/examples/Makefile
-

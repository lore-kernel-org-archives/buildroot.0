From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 18 Jan 2009 10:51:54 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot: package package/liboil
	toolchain
Message-ID: <20090118105154.4A98777108@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-18 10:51:53 +0000 (Sun, 18 Jan 2009)
New Revision: 24898

Log:
The liboil Makefile will use "-mcpu=vfp" when building for ARM.
The VFP is only available for a few ARM CPUs at the moment,
so this breaks the liboil build.

A patch is available upstream which only enables "-mfpu=vfp"
if "--enable-vfp" is given to "configure".
Autotools needs to be run for liboil for this to take effect.

A new configuration BR2_VFP_FLOAT is added to allow enabling vfp.
If this is "yes", then "-mfpu=vfp" is added to CFLAGS.





Added:
   trunk/buildroot/package/liboil/liboil-vfp.patch

Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/liboil/liboil.mk
   trunk/buildroot/toolchain/Config.in.2


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2009-01-18 09:26:28 UTC (rev 24897)
+++ trunk/buildroot/package/Makefile.in	2009-01-18 10:51:53 UTC (rev 24898)
@@ -71,6 +71,10 @@
 TARGET_CFLAGS+=-msoft-float
 endif
 
+ifeq ($(BR2_VFP_FLOAT),y)
+TARGET_CFLAGS+=-mfpu=vfp
+endif
+
 # enable VIS for v9a and v9b
 ifeq ($(findstring y,$(BR2_sparc_v9a)$(BR2_sparc64_v9a)$(BR2_sparc_v9b)$(BR2_sparc64_v9b)),y)
 TARGET_CFLAGS+=-mvis

Added: trunk/buildroot/package/liboil/liboil-vfp.patch
===================================================================
--- trunk/buildroot/package/liboil/liboil-vfp.patch	                        (rev 0)
+++ trunk/buildroot/package/liboil/liboil-vfp.patch	2009-01-18 10:51:53 UTC (rev 24898)
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

Modified: trunk/buildroot/package/liboil/liboil.mk
===================================================================
--- trunk/buildroot/package/liboil/liboil.mk	2009-01-18 09:26:28 UTC (rev 24897)
+++ trunk/buildroot/package/liboil/liboil.mk	2009-01-18 10:51:53 UTC (rev 24898)
@@ -6,7 +6,7 @@
 LIBOIL_VERSION = 0.3.15
 LIBOIL_SOURCE = liboil-$(LIBOIL_VERSION).tar.gz
 LIBOIL_SITE = http://liboil.freedesktop.org/download
-LIBOIL_AUTORECONF = NO
+LIBOIL_AUTORECONF = YES
 LIBOIL_INSTALL_STAGING = YES
 LIBOIL_INSTALL_TARGET = YES
 
@@ -30,6 +30,10 @@
 LIBOIL_GLIB_DEP = libglib2
 endif
 
+ifeq ($(BR2_VFP_FLOAT),y)
+LIBOIL_CONF_OPT+=--enable-vfp
+endif
+
 LIBOIL_DEPENDENCIES = uclibc $(LIBOIL_GLIB_DEP)
 
 $(eval $(call AUTOTARGETS,package,liboil))
@@ -37,4 +41,4 @@
 $(LIBOIL_HOOK_POST_INSTALL):
 	# Remove useless bugreport program from the target
 	rm -f $(TARGET_DIR)/usr/bin/oil-bugreport
-	touch $@
\ No newline at end of file
+	touch $@

Modified: trunk/buildroot/toolchain/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/Config.in.2	2009-01-18 09:26:28 UTC (rev 24897)
+++ trunk/buildroot/toolchain/Config.in.2	2009-01-18 10:51:53 UTC (rev 24898)
@@ -42,8 +42,17 @@
 
 	  Most people will answer N.
 
-#config BR2_SOFT_FLOAT_FP
-#	bool "Use softfp"
+config BR2_VFP_FLOAT
+	bool "Use ARM Vector Floating Point unit"
+	depends on !BR2_SOFT_FLOAT
+	depends on BR2_arm || BR2_armeb
+	help
+	  Setting this option will enable the "-mfpu=vfp" option.
+	  If your ARM CPU has a Vector Floating Point Unit (VFP)
+	  and the toolchain supports the option, then the 
+	  code can be optimized.
+	  
+	  Most people will answer N.
 
 config BR2_TARGET_OPTIMIZATION
 	string "Target Optimizations"

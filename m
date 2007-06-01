From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  1 Jun 2007 15:16:30 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  package/gmp toolchain
Message-ID: <20070601221630.067824855D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-01 15:16:28 -0700 (Fri, 01 Jun 2007)
New Revision: 18723

Log:
- add BR2_PREFER_STATIC_LIB config option to be able to select if we prefer to build static or dynamic libs/bins.
- depending on the BR2_GNU_BUILD_SUFFIX, set the respective EXEEXT, LIBEXT, SHREXT extensions for use on the target.
Thanks to Tom for suplying a diff which implements these.


Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/Makefile
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/toolchain/Makefile.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-06-01 19:17:36 UTC (rev 18722)
+++ trunk/buildroot/Config.in	2007-06-01 22:16:28 UTC (rev 18723)
@@ -373,6 +373,19 @@
 	help
 	  This option hides outdated/obsolete versions of packages.
 
+config BR2_PREFER_STATIC_LIB
+	bool "prefer static libraries"
+	default n
+	help
+	  Where possible, use static libraries.
+	  This increases your code size a lot and should only be
+	  used with a good reason why not use the default, which
+	  is dynamic libraries.
+
+	  If unsure, say No.
+
+	  WARNING: This is highly experimental at the moment.
+
 endmenu
 
 source "toolchain/Config.in"

Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-06-01 19:17:36 UTC (rev 18722)
+++ trunk/buildroot/Makefile	2007-06-01 22:16:28 UTC (rev 18723)
@@ -66,7 +66,32 @@
 #
 #############################################################
 
+ifneq (,$(findstring linux,$(BR2_GNU_BUILD_SUFFIX)))
+EXEEXT:=
+LIBEXT:=.a
+SHREXT:=.so
+endif
+ifneq (,$(findstring apple,$(BR2_GNU_BUILD_SUFFIX)))
+EXEEXT:=.pear
+LIBEXT:=.dunno
+SHREXT:=.dylib
+endif
+ifneq (,$(findstring cygwin,$(BR2_GNU_BUILD_SUFFIX)))
+EXEEXT:=.exe
+LIBEXT:=.lib
+SHREXT:=.dll
+endif
+ifneq (,$(findstring mingw,$(BR2_GNU_BUILD_SUFFIX)))
+EXEEXT:=.exe
+LIBEXT:=.lib
+SHREXT:=.dll
+endif
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+LIBTGTEXT=$(LIBEXT)
+else
+LIBTGTEXT=$(SHREXT)
+endif
 
 all:   world
 

Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2007-06-01 19:17:36 UTC (rev 18722)
+++ trunk/buildroot/package/gmp/gmp.mk	2007-06-01 22:16:28 UTC (rev 18723)
@@ -18,6 +18,14 @@
 GMP_BE:=no
 endif
 
+# this is a workaround for a bug in GMP, please see 
+# http://gmplib.org/list-archives/gmp-devel/2006-April/000618.html
+ifeq ($(EXEEXT),.exe)
+GMP_CPP_FLAGS:=-DDLL_EXPORT
+else
+GMP_CPP_FLAGS:=
+endif
+
 $(DL_DIR)/$(GMP_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(GMP_SITE)/$(GMP_SOURCE)
 
@@ -35,6 +43,7 @@
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
+		CPPFLAGS="$(GMP_CPP_FLAGS)" \
 		ac_cv_c_bigendian=$(GMP_BE) \
 		$(GMP_DIR)/configure \
 		--target=$(GNU_TARGET_NAME) \
@@ -52,7 +61,7 @@
 		--includedir=/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
-		--enable-shared \
+		$(PREFERRED_LIB_FLAGS) \
 		$(DISABLE_NLS) \
 	);
 	touch $@
@@ -105,12 +114,12 @@
 		CC_FOR_BUILD="$(HOSTCC)" \
 		CC="$(HOSTCC)" \
 		CFLAGS="$(HOST_CFLAGS)" \
+		CPPFLAGS="$(GMP_CPP_FLAGS)" \
 		$(GMP_DIR)/configure \
 		--prefix="$(GMP_HOST_DIR)" \
 		--build=$(GNU_HOST_NAME) \
 		--host=$(GNU_HOST_NAME) \
-		--enable-shared \
-		--enable-static \
+		$(PREFERRED_LIB_FLAGS) \
 		$(DISABLE_NLS) \
 	);
 	touch $@

Modified: trunk/buildroot/toolchain/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/Makefile.in	2007-06-01 19:17:36 UTC (rev 18722)
+++ trunk/buildroot/toolchain/Makefile.in	2007-06-01 22:16:28 UTC (rev 18723)
@@ -10,7 +10,13 @@
 MULTILIB:=--disable-multilib
 endif
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+PREFERRED_LIB_FLAGS:=--enable-static --disable-shared
+else
+PREFERRED_LIB_FLAGS:=--disable-static --enable-shared
+endif
 
+
 # FIXME -- this is temporary
 OPTIMIZE_FOR_CPU=$(ARCH)
 

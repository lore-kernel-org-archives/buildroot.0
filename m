From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Sep 2006 05:48:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xorg
Message-ID: <20060926124844.66F424869E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2006-09-26 05:48:43 -0700 (Tue, 26 Sep 2006)
New Revision: 16225

Log:
Proper !i386 cross compilation support

Modified:
   trunk/buildroot/package/xorg/xorg-config.patch
   trunk/buildroot/package/xorg/xorg.mk


Changeset:
Modified: trunk/buildroot/package/xorg/xorg-config.patch
===================================================================
--- trunk/buildroot/package/xorg/xorg-config.patch	2006-09-26 10:07:41 UTC (rev 16224)
+++ trunk/buildroot/package/xorg/xorg-config.patch	2006-09-26 12:48:43 UTC (rev 16225)
@@ -47,7 +47,7 @@
 +#define XInputDrivers		mouse keyboard
 --- xc/config/cf/cross.def~	Thu May 12 15:28:01 MDT 2005
 +++ xc/config/cf/cross.def	Thu May 12 15:28:01 MDT 2005
-@@ -1,45 +1,45 @@
+@@ -1,45 +1,63 @@
 -/* $XFree86: xc/config/cf/cross.def,v 1.1 2000/12/08 22:09:34 keithp Exp $ */
 +/* $XFree86: xc/config/cf/cross.def,v 1.2 2001/03/30 02:15:17 keithp Exp $ */
  /*
@@ -57,10 +57,27 @@
   * given your local configuration.
   */
 -#if 0
--#undef i386Architecture
-+#define i386Architecture
++/* Undefine any architectures detected */
+ #undef i386Architecture
 -#define Arm32Architecture
++#undef AMD64Architecture
++#undef PpcArchitecture
++#undef SparcArchitecture
++#undef AlphaArchitecture
 +#undef Arm32Architecture
++#undef ia64Architecture
++#undef MipsArchitecture
++
++/* Cross compiling for: */
++#define REPLACE_XORG_ARCHArchitecture
++
++/* MTRR detection in linux.cf is exec'ed before cross.def, so redo it here */
++#undef HasMTRRSupport
++#if defined (i386Architecture) || defined (AMD64Architecture)
++# define HasMTRRSupport	YES
++#else
++# define HasMTRRSupport	NO	/* no for non-ix86 */
++#endif
  
  #undef OptimizedCDebugFlags
 -#define OptimizedCDebugFlags 	-O2

Modified: trunk/buildroot/package/xorg/xorg.mk
===================================================================
--- trunk/buildroot/package/xorg/xorg.mk	2006-09-26 10:07:41 UTC (rev 16224)
+++ trunk/buildroot/package/xorg/xorg.mk	2006-09-26 12:48:43 UTC (rev 16225)
@@ -48,6 +48,27 @@
 HAS_FREETYPE2=NO
 endif
 
+# figure out Xorg's idea of corresponding architecture name
+ifeq ($(BR2_alpha),y)
+XARCH=Alpha
+else ifeq ($(BR2_arm),y)
+XARCH=Arm32
+else ifeq ($(BR2_armeb),y)
+XARCH=Arm32
+else ifeq ($(BR2_i386),y)
+XARCH=i386A
+else ifeq ($(BR2_mips),y)
+XARCH=Mips
+else ifeq ($(BR2_mipsel),y)
+XARCH=Mips
+else ifeq ($(BR2_powerpc),y)
+XARCH=Ppc
+else ifeq ($(BR2_sparc),y)
+XARCH=Sparc
+else ifeq ($(BR2_x86_64),y)
+XARCH=AMD64
+endif
+
 $(DL_DIR)/$(XORG_SOURCE):
 	$(WGET) -P $(DL_DIR) $(XORG_SITE)/$(XORG_SOURCE)
 
@@ -65,6 +86,7 @@
 	$(SED) 's:#.*define.*HasPam.*YES::g' $(XORG_DIR)/config/cf/linux.cf
 	$(SED) 's:#.*define.*CrossCompiling.*NO:#define CrossCompiling YES:g' $(XORG_DIR)/config/cf/Imake.tmpl
 	$(SED) 's:#.*undef.*CrossCompileDir.*:#define CrossCompileDir$(STAGING_DIR)/bin:g' $(XORG_DIR)/config/cf/Imake.tmpl
+	$(SED) 's:REPLACE_XORG_ARCH:$(XARCH):g' $(XORG_DIR)/config/cf/cross.def
 	touch $(XORG_DIR)/.configured
 
 $(XORG_XSERVER): $(XORG_DIR)/.configured

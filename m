From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 30 Mar 2008 22:42:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080331054204.ECD433C3A5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-30 22:42:03 -0700 (Sun, 30 Mar 2008)
New Revision: 21591

Log:
Patch in EXTRA_VERSION

Modified:
   trunk/buildroot/target/linux/Config.in.advanced
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2008-03-30 22:23:39 UTC (rev 21590)
+++ trunk/buildroot/target/linux/Config.in.advanced	2008-03-31 05:42:03 UTC (rev 21591)
@@ -346,6 +346,14 @@
 	default "$(BR2_LINUX26_MM_VERSION).bz2" if BR2_KERNEL_ADD_MM_PATCH
 	default $(BR2_CUSTOM_LINUX26_PATCH) if BR2_LINUX26_CUSTOM
 
+config BR2_EXTRA_VERSION
+	string
+	default ".$(BR2_KERNEL_PATCH_LEVEL)"	if  BR2_KERNEL_ADD_MINORPATCH || BR2_KERNEL_ADD_LATEST_MINORPATCH
+	default "$(BR2_KERNEL_RC_LEVEL)"	if BR2_KERNEL_ADD_LATEST_RC_PATCH
+	default "$(BR2_KERNEL_RC_LEVEL)"	if BR2_KERNEL_ADD_RC_PATCH
+	default "BR2_KERNEL_GIT_LEVEL"		if BR2_KERNEL_ADD_LATEST_SNAPSHOT
+	default	"$(BR2_KERNEL_MM_LEVEL)"	if BR2_KERNEL_ADD_LATEST_MM_PATCH
+	default	"$(BR2_KERNEL_MM_LEVEL)"	if BR2_KERNEL_ADD_MM_PATCH
 endmenu
 
 # -----------------------------------------------

Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-03-30 22:23:39 UTC (rev 21590)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-03-31 05:42:03 UTC (rev 21591)
@@ -103,7 +103,7 @@
 endif
 endif
 
-KERNEL_CONFIG_METHOD:=($(strip $(subst ",,$(BR2_KERNEL_CONFIG_METHOD))),)
+KERNEL_CONFIG_METHOD:=$(strip $(subst ",,$(BR2_KERNEL_CONFIG_METHOD)))
 #"))
 ifeq ($(KERNEL_CONFIG_METHOD),)
 KERNEL_CONFIG_METHOD:=xconfig
@@ -335,7 +335,11 @@
 		$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(KERNEL_CONFIG_METHOD) ; \
 	fi
 endif
+ifneq ($(strip $(subst ",,$(BR2_EXTRA_VERSION))),)
+	$(SED) 's,^EXTRA_VERSION=.*,EXTRA_VERSION=="$(BR2_EXTRA_VERSION)",g'
+endif
 
+
 # -----------------------------------------------------------------------------
 $(LINUX26_DIR)/.configured: $(LINUX26_DIR)/.config
 	$(SED) '/CONFIG_AEABI=y/d' $(LINUX26_DIR)/.config

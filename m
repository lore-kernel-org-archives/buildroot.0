From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 30 Mar 2008 13:04:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080330200459.506283C513@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-30 13:04:55 -0700 (Sun, 30 Mar 2008)
New Revision: 21581

Log:
Allow selection of kernel config tool

Modified:
   trunk/buildroot/target/linux/Config.in.advanced
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2008-03-30 15:56:38 UTC (rev 21580)
+++ trunk/buildroot/target/linux/Config.in.advanced	2008-03-30 20:04:55 UTC (rev 21581)
@@ -416,12 +416,14 @@
 	  Configure Linux by make <board>_defconfig
 
 config BR2_PACKAGE_LINUX_USE_XCONFIG
-	bool "Run make ARCH=$(ARCH) xconfig before build"
+	bool "Run make ARCH=$(ARCH) [xconfig|menuconfig] before build"
 	depends BR2_PACKAGE_LINUX
 	help
 	  Configure Linux by make xconfig
 endchoice
 
+
+
 config BR2_PACKAGE_LINUX_KCONFIG
 	string ".config file"
 	depends on BR2_PACKAGE_LINUX_USE_KCONFIG
@@ -433,6 +435,29 @@
 	  board-imposed value by passing LINUX26_KCONFIG=<path> to
 	  make.
 
+choice
+	prompt "Preferred config tool"
+	default BR2_MAKE_XCONFIG
+	help
+	  Define the preferred tool to invoke if a configuration is invalid
+
+config	BR2_MAKE_XCONFIG
+	bool "make xconfig"
+	help
+	  Run "make menuconfig" if kernel ".config" is invalid
+
+config	BR2_MAKE_MENUCONFIG
+	bool "make menuconfig"
+	help
+	  Run "make menuconfig" if kernel ".config" is invalid
+
+endchoice
+
+config BR2_KERNEL_CONFIG_METHOD
+	string
+	default "xconfig"	if BR2_MAKE_XCONFIG
+	default "menuconfig"	if BR2_MAKE_MENUCONFIG
+
 endmenu
 
 choice

Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-03-30 15:56:38 UTC (rev 21580)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-03-30 20:04:55 UTC (rev 21581)
@@ -103,6 +103,12 @@
 endif
 endif
 
+KERNEL_CONFIG_METHOD:=($(strip $(subst ",,$(BR2_KERNEL_CONFIG_METHOD))),)
+#"))
+ifeq ($(KERNEL_CONFIG_METHOD),)
+KERNEL_CONFIG_METHOD:=xconfig
+endif
+
 # -----------------------------------------------------------------------------
 ifndef LINUX26_FORMAT
 ifneq ($(strip $(subst ",,$(BR2_PACKAGE_LINUX_FORMAT))),)
@@ -302,7 +308,7 @@
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(BOARD_NAME)_defconfig 
 endif
 ifeq ($(BR2_PACKAGE_LINUX_USE_XCONFIG),y)
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) xconfig 
+	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(KERNEL_CONFIG_METHOD)
 endif
 ifeq ($(BR2_PACKAGE_LINUX_USE_KCONFIG),y)
 	# Try user defined config
@@ -326,7 +332,7 @@
 	fi
 	# let the user create his/her own config
 	if [ ! -f "$(LINUX26_DIR)/.config" ] ; then \
-		$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) xconfig ; \
+		$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(KERNEL_CONFIG_METHOD) ; \
 	fi
 endif
 

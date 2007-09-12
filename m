From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 11 Sep 2007 21:34:20 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  docs project
Message-ID: <20070912043420.8EFB3A6064@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-11 21:34:16 -0700 (Tue, 11 Sep 2007)
New Revision: 19819

Log:
Add hooks for creating your own board support package

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/docs/buildroot.html
   trunk/buildroot/project/project.mk


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-09-12 04:06:54 UTC (rev 19818)
+++ trunk/buildroot/Makefile	2007-09-12 04:34:16 UTC (rev 19819)
@@ -35,11 +35,20 @@
 
 # Pull in the user's configuration file
 ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
+ifeq ($(BOARD),)
 -include $(TOPDIR).config
+else
+-include $(TOPDIR)/local/$(BOARD)/$(BOARD).config
 endif
+endif
 ifneq ($(BUILDROOT_DL_DIR),)
 BR2_DL_DIR:=$(BUILDROOT_DL_DIR)
 endif
+ifneq ($(BUILDROOT_LOCAL),)
+LOCAL:=$(BUILDROOT_LOCAL)
+else
+LOCAL:=local
+endif
 
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands

Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2007-09-12 04:06:54 UTC (rev 19818)
+++ trunk/buildroot/docs/buildroot.html	2007-09-12 04:34:16 UTC (rev 19819)
@@ -170,6 +170,44 @@
     tool. 
     The file is stored in the "binaries/<code>$(PROJECT)</code>/" directory</p>
 
+    <h3><a name="local_board_support" id="local_board_support"></a>
+    Creating your own board support</h3>
+
+    <p>Once a package has been unpacked, it is possible to manually update
+    configuration files. Buildroot can automatically save the configuration
+    of buildroot, linux, busybox, uclibc and u-boot in "local/$(PROJECT) by 
+    using the command:
+    </p>
+
+<pre>
+ $ make saveconfig
+</pre>
+
+     <p>Once a buildroot configuration has been created by saveconfig, 
+     the default "$(TOPDIR)/.config" file can be overridden by</p>
+
+<pre>
+ $ make BOARD=&lt;project&gt;
+</pre>
+
+    <p>Buildroot will then use "local/&lt;project&gt;/&lt;project&gt;.config"
+    instead of ".config". </p>
+
+    <p>If you want to modify your board, you can copy the project configuration
+     file to ".config" by using the command:</p> 
+
+<pre>
+ $ make BOARD=&lt;project&gt; getconfig
+</pre>
+
+    <p>You can share your custom board support directory between several buildroot trees
+    by setting the environment variable <code>BUILDROOT_LOCAL</code> to this directory,
+    </p> 
+
+
+    <h3><a name="offline_builds" id="offline_builds"></a>
+    Offline builds</h3>
+
     <p>If you intend to do an offline-build and just want to download all
     sources that you previously selected in &quot;make menuconfig&quot; then
     issue:</p>

Modified: trunk/buildroot/project/project.mk
===================================================================
--- trunk/buildroot/project/project.mk	2007-09-12 04:06:54 UTC (rev 19818)
+++ trunk/buildroot/project/project.mk	2007-09-12 04:34:16 UTC (rev 19819)
@@ -1,6 +1,8 @@
+PROJECT_FILE:=$(LOCAL)/$(PROJECT)/$(PROJECT).config
 
-.PHONY: target-host-info
 
+.PHONY: target-host-info  saveconfig getconfig
+
 target-host-info: $(TARGET_DIR)/etc/issue $(TARGET_DIR)/etc/hostname
 
 $(TARGET_DIR)/etc/issue: .config
@@ -12,3 +14,28 @@
 $(TARGET_DIR)/etc/hostname: .config
 	mkdir -p $(TARGET_DIR)/etc
 	echo "$(TARGET_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
+
+saveconfig: $(CONFIG)/conf
+	mkdir -p $(LOCAL)/$(PROJECT)
+	-cp .config $(PROJECT_FILE)
+	if [ -f $(LINUX26_DIR)/.config ] ; then \
+		cp $(LINUX26_DIR)/.config $(LOCAL)/$(PROJECT)/linux-$(LINUX26_VERSION).config ; \
+		$(SED) '/BR2_PACKAGE_LINUX_KCONFIG/d' $(PROJECT_FILE) ; \
+		echo "BR2_PACKAGE_LINUX_KCONFIG:=$(LOCAL)/$(PROJECT)/linux-$(LINUX26_VERSION).config" >> $(PROJECT_FILE)	; \
+	fi
+	if [ -f $(BUSYBOX_DIR)/.config ] ; then \
+		cp $(BUSYBOX_DIR)/.config $(LOCAL)/$(PROJECT)/busybox-$(BUSYBOX_VERSION).config ; \
+		$(SED) '/BR2_PACKAGE_BUSYBOX_CONFIG/d' $(PROJECT_FILE) ; \
+		echo "BR2_PACKAGE_BUSYBOX_CONFIG:=$(LOCAL)/$(PROJECT)/busybox-$(BUSYBOX_VERSION).config" >> $(PROJECT_FILE) ; \
+	fi
+	if [ -f $(UCLIBC_DIR)/.config ] ; then \
+		cp $(UCLIBC_DIR)/.config $(LOCAL)/$(PROJECT)/uclibc-$(UCLIBC_VER).config ; \
+		$(SED) '/BR2_UCLIBC_CONFIG/d' $(PROJECT_FILE) ; \
+		echo "BR2_UCLIBC_CONFIG:=$(LOCAL)/$(PROJECT)/uclibc-$(UCLIBC_VER).config" >> $(PROJECT_FILE) ; \
+	fi
+	if [ -f $(UBOOT_DIR)/include/configs/$(PROJECT).h ] ; then \
+		cp $(UBOOT_DIR)/include/configs/$(PROJECT).h $(LOCAL)/$(PROJECT)/u-boot/$(PROJECT).h ; \
+	fi
+
+getconfig: $(CONFIG)/conf
+	-cp $(LOCAL)/$(PROJECT)/$(PROJECT).config .config 

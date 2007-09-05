From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 05 Sep 2007 08:39:24 +0200
Subject: [Buildroot] Runtime generation of board support version 2
Message-ID: <1188974365.19258.9.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add runtime generation of board support version 2

$ make saveconfig
will save the current configuration to project/$(PROJECT)

$ make getconfig
will copy the saved config to .config

$ make BOARD=<myproject>
will use project/<myproject>/<myproject>.config
instead of .config

(There is a doc update as well, not included here)

Moved the saveconfig to project/project.mk and added getconfig
Now, the .config file will be updated so that the stuff in 
project/$(PROJECT) will be used for Linux, UCLIBC and busybox.

Comments?


Index: Makefile
===================================================================
--- Makefile	(revision 19784)
+++ Makefile	(arbetskopia)
@@ -35,8 +35,12 @@
 
 # Pull in the user's configuration file
 ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
+ifeq ($(BOARD),)
 -include $(TOPDIR).config
+else
+-include $(TOPDIR)/project/$(BOARD)/$(BOARD).config
 endif
+endif
 ifneq ($(BUILDROOT_DL_DIR),)
 BR2_DL_DIR:=$(BUILDROOT_DL_DIR)
 endif
Index: project/project.mk
===================================================================
--- project/project.mk	(revision 19784)
+++ project/project.mk	(arbetskopia)
@@ -1,6 +1,8 @@
+PROJECT_FILE:=project/$(PROJECT)/$(PROJECT).config
 
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
+	mkdir -p project/$(PROJECT)
+	-cp .config $(PROJECT_FILE)
+	if [ -f $(LINUX26_DIR)/.config ] ; then \
+		cp $(LINUX26_DIR)/.config
project/$(PROJECT)/linux-$(LINUX26_VERSION).config ; \
+		$(SED) '/BR2_PACKAGE_LINUX_KCONFIG/d' $(PROJECT_FILE) ; \
+		echo
"BR2_PACKAGE_LINUX_KCONFIG:=project/$(PROJECT)/linux-$(LINUX26_VERSION).config" >> $(PROJECT_FILE)	; \
+	fi
+	if [ -f $(BUSYBOX_DIR)/.config ] ; then \
+		cp $(BUSYBOX_DIR)/.config
project/$(PROJECT)/busybox-$(BUSYBOX_VERSION).config ; \
+		$(SED) '/BR2_PACKAGE_BUSYBOX_CONFIG/d' $(PROJECT_FILE) ; \
+		echo
"BR2_PACKAGE_BUSYBOX_CONFIG:=project/$(PROJECT)/busybox-$(BUSYBOX_VERSION).config" >> $(PROJECT_FILE) ; \
+	fi
+	if [ -f $(UCLIBC_DIR)/.config ] ; then \
+		cp $(UCLIBC_DIR)/.config
project/$(PROJECT)/uclibc-$(UCLIBC_VER).config ; \
+		$(SED) '/BR2_UCLIBC_CONFIG/d' $(PROJECT_FILE) ; \
+		echo
"BR2_UCLIBC_CONFIG:=project/$(PROJECT)/uclibc-$(UCLIBC_VER).config" >>
$(PROJECT_FILE) ; \
+	fi
+	if [ -f $(UBOOT_DIR)/include/configs/$(PROJECT).h ] ; then \
+		cp $(UBOOT_DIR)/include/configs/$(PROJECT).h
project/$(PROJECT)/u-boot/$(PROJECT).h ; \
+	fi
+
+getconfig: $(CONFIG)/conf
+	-cp project/$(PROJECT)/$(PROJECT).config .config 



-- 
Best Regards,
Ulf Samuelsson          mail:   ulf at atmel.com
Atmel Nordic AB
Box 2033, 174 52 Sundbyberg
Kavalleriv?gen 24, 174 58 Sundbyberg
Sweden
Tel:    +46 8 441 54 22 GSM:    +46 706 224457

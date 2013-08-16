From: jean <jean.sorgemoel@laposte.net>
Date: Fri, 16 Aug 2013 11:22:14 +0200
Subject: [Buildroot] [PATCH 1/1] new package - generate iso with isolinux
	bootloader
In-Reply-To: <y>
References: <y>
Message-ID: <1376644934-4302-1-git-send-email-jean.sorgemoel@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: jean <jean.sorgemoel@laposte.net>
---
 fs/Config.in            |    1 +
 fs/isolinux/Config.in   |  182 ++++++++++++++++++++++++++++++++++++++
 fs/isolinux/isolinux.mk |  226 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 409 insertions(+)
 create mode 100644 fs/isolinux/Config.in
 create mode 100644 fs/isolinux/isolinux.mk

diff --git a/fs/Config.in b/fs/Config.in
index da4c5ff..02294a9 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -11,5 +11,6 @@ source "fs/romfs/Config.in"
 source "fs/squashfs/Config.in"
 source "fs/tar/Config.in"
 source "fs/ubifs/Config.in"
+source "fs/isolinux/Config.in"
 
 endmenu
diff --git a/fs/isolinux/Config.in b/fs/isolinux/Config.in
new file mode 100644
index 0000000..8abe409
--- /dev/null
+++ b/fs/isolinux/Config.in
@@ -0,0 +1,182 @@
+## Menu ISO image with syslinux
+menu "iso image (isolinux bootloader - with initramfs)"
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX
+	bool "iso image (isolinux bootloader)"
+	depends on (BR2_i386 || BR2_x86_64)
+	depends on BR2_LINUX_KERNEL
+	select BR2_TARGET_ROOTFS_INITRAMFS
+	select BR2_TARGET_SYSLINUX
+	select BR2_TARGET_SYSLINUX_ISOLINUX
+	help
+		Build a bootable iso9660 image (with isolinux bootloader and initramfs)
+		You can launch this iso with :
+			qemu -boot d -cdrom rootfs.isolinux
+
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX_JOLIET
+        bool "create iso with Joliet format"
+        depends on BR2_TARGET_ROOTFS_ISO_ISOLINUX
+        help
+              	Create iso image with Joliet format (long file)
+
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX_ROCK_RIDGE
+        bool "Generate Rock Ridge directory information"
+        depends on BR2_TARGET_ROOTFS_ISO_ISOLINUX
+        help
+                Generate Rock Ridge directory information
+
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX_MENU_LINUX
+        string "Name to start linux"
+        depends on BR2_TARGET_ROOTFS_ISO_ISOLINUX
+        default "buildroot"
+        help
+                define message see to select linux 
+
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX_NAME
+        string "Name iso"
+        depends on BR2_TARGET_ROOTFS_ISO_ISOLINUX
+        default "buildroot iso"
+        help
+                cdrom name
+
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX_INPUT_CHARSET
+        string "define parameter input charset"
+        depends on BR2_TARGET_ROOTFS_ISO_ISOLINUX
+	default "iso8859-15"
+        help
+                define parameter input charset 
+		(see program genisoimage : genisoimage -input-charset help)
+
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX_BOOT_MESSAGE
+	string "Message boot for isolinux"
+	depends on BR2_TARGET_ROOTFS_ISO_ISOLINUX
+	default "Buildroot isolinux boot"
+	help
+		define first message see in prompt boot
+		after that, you see all options
+
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX_BOOT_TIMEOUT
+	int "timeout"
+	depends on BR2_TARGET_ROOTFS_ISO_ISOLINUX
+        default "20"
+	help
+		define timeout (second)
+		after this time, boot on default config
+
+config BR2_TARGET_ISO_ISOLINUX_TOOLS_HARDWARE_INFO
+	bool "add tools hardware info"
+        depends on BR2_TARGET_ROOTFS_ISO_ISOLINUX
+        help
+		isolinux menu, you can see hardware info
+
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX_TOOLS_REBOOT
+        bool "add isolinux option reboot"
+        depends on BR2_TARGET_ROOTFS_ISO_ISOLINUX
+        help
+                isolinux menu, you can reboot
+
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX_TOOLS_POWEROFF
+        bool "add isolinux option poweroff"
+        depends on BR2_TARGET_ROOTFS_ISO_ISOLINUX
+        help
+                isolinux menu, you can power off
+
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX_TOOLS_FIRSTDISKBOOT
+        bool "add isolinux option to boot on first disk"
+        depends on BR2_TARGET_ROOTFS_ISO_ISOLINUX
+        help
+                isolinux menu, you can boot on disk
+
+## Keyboard menu
+menu "keyboard"
+depends on BR2_TARGET_ROOTFS_ISO_ISOLINUX
+depends on BR2_PACKAGE_KBD
+
+## Choice default keyboard on boot (isolinux only)
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX_DESIRED_KEYBOARD
+        string
+choice
+	prompt "Default keyboard on isolinux boot"
+	default BR2_TARGET_ROOTFS_ISO_ISOLINUX_DESIRED_KEYBOARD_US if BR2_TARGET_ROOTFS_ISO_ISOLINUX_DESIRED_KEYBOARD = "us"
+	default BR2_TARGET_ROOTFS_ISO_ISOLINUX_DESIRED_KEYBOARD_FR if BR2_TARGET_ROOTFS_ISO_ISOLINUX_DESIRED_KEYBOARD = "fr"
+	default BR2_TARGET_ROOTFS_ISO_ISOLINUX_DESIRED_KEYBOARD_FR_PC if BR2_TARGET_ROOTFS_ISO_ISOLINUX_DESIRED_KEYBOARD = "fr-pc"
+	default BR2_TARGET_ROOTFS_ISO_ISOLINUX_DESIRED_KEYBOARD_DE if BR2_TARGET_ROOTFS_ISO_ISOLINUX_DESIRED_KEYBOARD = "de"
+	default BR2_TARGET_ROOTFS_ISO_ISOLINUX_DESIRED_KEYBOARD_MANUAL if BR2_TARGET_ROOTFS_ISO_ISOLINUX_DESIRED_KEYBOARD = "manual"
+
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX_DESIRED_KEYBOARD_US
+	bool "us"
+
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX_DESIRED_KEYBOARD_FR
+	bool "fr"
+
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX_DESIRED_KEYBOARD_FR_PC
+	bool "fr-pc"
+
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX_DESIRED_KEYBOARD_DE
+	bool "de"
+
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX_DESIRED_KEYBOARD_MANUAL
+	bool "manual"
+	depends on BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_MANUAL_ACTIVATE
+
+endchoice
+## End choice default keyboard on boot (isolinux only)
+
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_US
+	bool "keyboard us"
+	depends on BR2_TARGET_ROOTFS_ISO_ISOLINUX
+        help
+		activate option keyboard us (exist by default)
+
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_FR
+	bool "keyboard fr"
+        depends on BR2_TARGET_ROOTFS_ISO_ISOLINUX
+        help
+                activate option keyboard fr
+
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_FR_PC
+	bool "keyboard fr-pc"
+        depends on BR2_TARGET_ROOTFS_ISO_ISOLINUX
+        help
+                activate option keyboard fr_pc
+
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_DE
+	bool "keyboard de"
+        depends on BR2_TARGET_ROOTFS_ISO_ISOLINUX
+        help
+                activate option keyboard de
+
+
+menu "Manual configuration keyboard"
+
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_MANUAL_ACTIVATE
+	bool "Enable manual configuration"
+	depends on BR2_TARGET_ROOTFS_ISO_ISOLINUX
+	help
+		Activate manual keyboard configuration
+
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_MANUAL_NAME
+        string "Name of keyboard"
+        depends on BR2_TARGET_ROOTFS_ISO_ISOLINUX
+        depends on BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_MANUAL_ACTIVATE
+        default "unknown"
+        help
+                define name to select this keyboard in isolinux menu
+
+config BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_MANUAL_SOURCE
+	string "File source to generate the keyboard map"
+	depends on BR2_TARGET_ROOTFS_ISO_ISOLINUX
+	depends on BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_MANUAL_ACTIVATE
+        default "data/keymaps/i386/qwerty/us.map"
+        help
+                define map file to generate the keyboard configuration
+		root is kbd package 
+		example : data/keymaps/i386/qwerty/gr.map
+
+endmenu
+## End manual configuration keyboard
+
+endmenu
+## End keyboard menu
+
+endmenu
+## End Menu ISO image with syslinux
diff --git a/fs/isolinux/isolinux.mk b/fs/isolinux/isolinux.mk
new file mode 100644
index 0000000..0d9464d
--- /dev/null
+++ b/fs/isolinux/isolinux.mk
@@ -0,0 +1,226 @@
+################################################################################
+#
+# Build the iso96600 with isolinux bootloader (and initramfs)
+#
+################################################################################
+
+BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_BOOT=boot
+BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_ISOLINUX=isolinux
+BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_TOOLS=tools
+BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_KEYBOARD=keyboard
+
+BR2_TARGET_ISO_ISOLINUX_BUILDIMAGE_DIR = $(BUILD_DIR)/isolinux
+BR2_TARGET_ISO_ISOLINUX_BUILDIMAGE_DIR_BOOT = $(BR2_TARGET_ISO_ISOLINUX_BUILDIMAGE_DIR)/$(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_BOOT)
+BR2_TARGET_ISO_ISOLINUX_BUILDIMAGE_DIR_ISOLINUX = $(BR2_TARGET_ISO_ISOLINUX_BUILDIMAGE_DIR)/$(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_ISOLINUX)
+BR2_TARGET_ISO_ISOLINUX_BUILDIMAGE_DIR_TOOLS = $(BR2_TARGET_ISO_ISOLINUX_BUILDIMAGE_DIR)/$(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_TOOLS)
+BR2_TARGET_ISO_ISOLINUX_BUILDIMAGE_DIR_KEYBOARD = $(BR2_TARGET_ISO_ISOLINUX_BUILDIMAGE_DIR)/$(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_KEYBOARD)
+
+BR2_TARGET_ISO_ISOLINUX_BOOT_MESSAGE := $(call qstrip,$(BR2_TARGET_ROOTFS_ISO_ISOLINUX_BOOT_MESSAGE))
+BR2_TARGET_ISO_ISOLINUX_BOOT_TIMEOUT := $(call qstrip,$(BR2_TARGET_ROOTFS_ISO_ISOLINUX_BOOT_TIMEOUT))
+
+BR2_TARGET_ISO_ISOLINUX_KEYBOARD_US = $(KBD_BUILDDIR)data/keymaps/i386/qwerty/us.map
+
+BR2_TARGET_ISO_ISOLINUX_CONFIG = ""
+BR2_TARGET_ISO_BR2_TARGET_ISO_ISOLINUX_BOOT_MSG = ""
+
+define copy_files_isolinux_image_tools
+	cp $(1) $(BR2_TARGET_ISO_ISOLINUX_BUILDIMAGE_DIR_TOOLS);
+endef
+
+define copy_files_isolinux_image_keyboard
+	$(SYSLINUX_BUILDDIR)utils/keytab-lilo \
+	        $(BR2_TARGET_ISO_ISOLINUX_KEYBOARD_US) \
+        	$1 \
+	         > $(BR2_TARGET_ISO_ISOLINUX_BUILDIMAGE_DIR_KEYBOARD)/$(subst -,_,$(notdir $(basename $1))).ktl;
+endef
+
+$(BINARIES_DIR)/rootfs.isolinux: host-cdrkit linux syslinux rootfs-initramfs
+	@$(call MESSAGE,"Generating root filesystem image rootfs.isolinux")
+	@mkdir -p $(BR2_TARGET_ISO_ISOLINUX_BUILDIMAGE_DIR)
+	@mkdir -p $(BR2_TARGET_ISO_ISOLINUX_BUILDIMAGE_DIR_BOOT)
+	@mkdir -p $(BR2_TARGET_ISO_ISOLINUX_BUILDIMAGE_DIR_ISOLINUX)
+	@mkdir -p $(BR2_TARGET_ISO_ISOLINUX_BUILDIMAGE_DIR_TOOLS)
+	@mkdir -p $(BR2_TARGET_ISO_ISOLINUX_BUILDIMAGE_DIR_KEYBOARD)
+
+	@echo -e $(BR2_TARGET_ISO_BR2_TARGET_ISO_ISOLINUX_BOOT_MSG) > $(BR2_TARGET_ISO_ISOLINUX_BUILDIMAGE_DIR)/bootmsg.txt
+
+	@cp $(BINARIES_DIR)/isolinux.bin $(BR2_TARGET_ISO_ISOLINUX_BUILDIMAGE_DIR)/$(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_ISOLINUX)/
+	@cp $(LINUX_IMAGE_PATH) $(BR2_TARGET_ISO_ISOLINUX_BUILDIMAGE_DIR)/$(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_BOOT)/
+
+	@echo -e $(BR2_TARGET_ISO_ISOLINUX_CONFIG) > $(BR2_TARGET_ISO_ISOLINUX_BUILDIMAGE_DIR)/isolinux.cfg
+	
+	@$(foreach file, $(BR2_TARGET_ISO_ISOLINUX_LIST_TOOLS), $(call copy_files_isolinux_image_tools, $(file) ) )
+	@$(foreach file, $(BR2_TARGET_ISO_ISOLINUX_LIST_KEYBOARD), $(call copy_files_isolinux_image_keyboard, $(file) ) )
+
+	$(HOST_DIR)/usr/bin/genisoimage \
+		$(BR2_TARGET_ISO_ISOLINUX_GENISOIMAGE_OPTION) \
+		-o $(BINARIES_DIR)/rootfs.isolinux \
+		-b $(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_ISOLINUX)/isolinux.bin \
+		-no-emul-boot \
+		-c $(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_ISOLINUX)/boot.cat \
+		-boot-load-size 4 \
+		-boot-info-table \
+		-input-charset $(BR2_TARGET_ROOTFS_ISO_ISOLINUX_INPUT_CHARSET) \
+		-V $(BR2_TARGET_ROOTFS_ISO_ISOLINUX_NAME) \
+		$(BR2_TARGET_ISO_ISOLINUX_BUILDIMAGE_DIR)
+
+	- at rm -rf $(BR2_TARGET_ISO_ISOLINUX_BUILDIMAGE_DIR)
+
+rootfs-isolinux: $(BINARIES_DIR)/rootfs.isolinux
+
+################################################################################
+#
+# Toplevel Makefile options
+#
+################################################################################
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO_ISOLINUX),y)
+TARGETS+=rootfs-isolinux
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "display bootmsg.txt\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "default $(BR2_TARGET_ROOTFS_ISO_ISOLINUX_MENU_LINUX)\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "timeout $(BR2_TARGET_ISO_ISOLINUX_BOOT_TIMEOUT)\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "prompt 1\\n"
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO_ISOLINUX_JOLIET),y)
+BR2_TARGET_ISO_ISOLINUX_GENISOIMAGE_OPTION += -J
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO_ISOLINUX_ROCK_RIDGE),y)
+BR2_TARGET_ISO_ISOLINUX_GENISOIMAGE_OPTION += -R
+endif
+
+# By default it us keyboard
+#ifeq ($(BR2_TARGET_ROOTFS_ISO_ISOLINUX_DESIRED_KEYBOARD_US),y)
+#BR2_TARGET_ISO_ISOLINUX_CONFIG += "kbdmap $(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_KEYBOARD)/us.ktl"
+#BR2_TARGET_ISO_ISOLINUX_KEYBOARD_US_ACTIVATED=y
+#endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO_ISOLINUX_DESIRED_KEYBOARD_FR),y)
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "kbdmap $(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_KEYBOARD)/fr.ktl\\n"
+BR2_TARGET_ISO_ISOLINUX_KEYBOARD_FR_ACTIVATED=y
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO_ISOLINUX_DESIRED_KEYBOARD_FR_PC),y)
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "kbdmap $(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_KEYBOARD)/fr_pc.ktl\\n"
+BR2_TARGET_ISO_ISOLINUX_KEYBOARD_FR_PC_ACTIVATED=y
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO_ISOLINUX_DESIRED_KEYBOARD_DE),y)
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "kbdmap $(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_KEYBOARD)/de.ktl\\n"
+BR2_TARGET_ISO_ISOLINUX_KEYBOARD_DE_ACTIVATED=y
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO_ISOLINUX),y)
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "LABEL $(BR2_TARGET_ROOTFS_ISO_ISOLINUX_MENU_LINUX)\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  KERNEL $(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_BOOT)/bzImage\\n"
+BR2_TARGET_ISO_BR2_TARGET_ISO_ISOLINUX_BOOT_MSG += "$(BR2_TARGET_ISO_ISOLINUX_BOOT_MESSAGE)\n"
+BR2_TARGET_ISO_BR2_TARGET_ISO_ISOLINUX_BOOT_MSG += "  $(BR2_TARGET_ROOTFS_ISO_ISOLINUX_MENU_LINUX)) launch linux\n"
+endif
+
+ifeq ($(BR2_TARGET_ISO_ISOLINUX_TOOLS_HARDWARE_INFO),y)
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "LABEL hdt\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  MENU LABEL Hardware Info\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  COM32 $(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_TOOLS)/hdt.c32\\n"
+BR2_TARGET_ISO_BR2_TARGET_ISO_ISOLINUX_BOOT_MSG += "  hdt) hardware info\n"
+BR2_TARGET_ISO_ISOLINUX_LIST_TOOLS += $(SYSLINUX_BUILDDIR)com32/hdt/hdt.c32
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO_ISOLINUX_TOOLS_REBOOT),y)
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "LABEL reboot\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  MENU LABEL Reboot\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  KERNEL $(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_TOOLS)/reboot.c32\\n"
+BR2_TARGET_ISO_BR2_TARGET_ISO_ISOLINUX_BOOT_MSG += "  reboot) reboot server\n"
+BR2_TARGET_ISO_ISOLINUX_LIST_TOOLS += $(SYSLINUX_BUILDDIR)com32/modules/reboot.c32
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO_ISOLINUX_TOOLS_POWEROFF),y)
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "LABEL poweroff\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  MENU LABEL Poweroff\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  KERNEL $(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_TOOLS)/poweroff.com\\n"
+BR2_TARGET_ISO_BR2_TARGET_ISO_ISOLINUX_BOOT_MSG += "  poweroff) poweroff server\n"
+BR2_TARGET_ISO_ISOLINUX_LIST_TOOLS += $(SYSLINUX_BUILDDIR)modules/poweroff.com
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO_ISOLINUX_TOOLS_FIRSTDISKBOOT),y)
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "LABEL hd\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  MENU LABEL Boot from first hard disk\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  localboot 0x80\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  append -\\n"
+BR2_TARGET_ISO_BR2_TARGET_ISO_ISOLINUX_BOOT_MSG += "  hd) boot on first hard disk\n"
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_US),y)
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "LABEL us\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  MENU LABEL keyboard US (qwerty)\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  KERNEL $(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_TOOLS)/kbdmap.c32\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  APPEND $(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_KEYBOARD)/us.ktl\\n"
+BR2_TARGET_ISO_BR2_TARGET_KEYBOARD_OPTION += us
+BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_ACTIVATED=y
+BR2_TARGET_ISO_ISOLINUX_KEYBOARD_US_ACTIVATED=y
+endif
+
+ifeq ($(BR2_TARGET_ISO_ISOLINUX_KEYBOARD_US_ACTIVATED),y)
+BR2_TARGET_ISO_ISOLINUX_LIST_KEYBOARD +=  $(KBD_BUILDDIR)data/keymaps/i386/qwerty/us.map
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_FR),y)
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "LABEL fr\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  MENU LABEL keyboard FR (azerty)\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  KERNEL $(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_TOOLS)/kbdmap.c32\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  APPEND $(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_KEYBOARD)/fr.ktl\\n"
+BR2_TARGET_ISO_BR2_TARGET_KEYBOARD_OPTION += fr
+BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_ACTIVATED=y
+BR2_TARGET_ISO_ISOLINUX_KEYBOARD_FR_ACTIVATED=y
+endif
+
+ifeq ($(BR2_TARGET_ISO_ISOLINUX_KEYBOARD_FR_ACTIVATED),y)
+BR2_TARGET_ISO_ISOLINUX_LIST_KEYBOARD +=  $(KBD_BUILDDIR)data/keymaps/i386/azerty/fr.map
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_FR_PC),y)
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "LABEL frpc\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  MENU LABEL keyboard FR-PC (azerty)\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  KERNEL $(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_TOOLS)/kbdmap.c32\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  APPEND $(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_KEYBOARD)/fr_pc.ktl\\n"
+BR2_TARGET_ISO_BR2_TARGET_KEYBOARD_OPTION += frpc
+BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_ACTIVATED=y
+BR2_TARGET_ISO_ISOLINUX_KEYBOARD_FR_PC_ACTIVATED=y
+endif
+
+ifeq ($(BR2_TARGET_ISO_ISOLINUX_KEYBOARD_FR_PC_ACTIVATED),y)
+BR2_TARGET_ISO_ISOLINUX_LIST_KEYBOARD +=  $(KBD_BUILDDIR)data/keymaps/i386/azerty/fr-pc.map
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_DE),y)
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "LABEL de\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  MENU LABEL keyboard DE (qwertz)\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  KERNEL $(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_TOOLS)/kbdmap.c32\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  APPEND $(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_KEYBOARD)/de.ktl\\n"
+BR2_TARGET_ISO_BR2_TARGET_KEYBOARD_OPTION += de
+BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_ACTIVATED=y
+BR2_TARGET_ISO_ISOLINUX_KEYBOARD_DE_ACTIVATED=y
+endif
+
+ifeq ($(BR2_TARGET_ISO_ISOLINUX_KEYBOARD_DE_ACTIVATED),y)
+BR2_TARGET_ISO_ISOLINUX_LIST_KEYBOARD +=  $(KBD_BUILDDIR)data/keymaps/i386/qwertz/de.map
+endif
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_MANUAL_ACTIVATE),y)
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "LABEL $(BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_MANUAL_NAME)\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  MENU LABEL keyboard $(BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_MANUAL_NAME)\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  KERNEL $(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_TOOLS)/kbdmap.c32\\n"
+BR2_TARGET_ISO_ISOLINUX_CONFIG += "  APPEND $(BR2_TARGET_ISO_ISOLINUX_ROOT_DIR_KEYBOARD)/$(subst -,_,$(notdir $(basename $(BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_MANUAL_SOURCE)))).ktl\\n"
+BR2_TARGET_ISO_ISOLINUX_LIST_KEYBOARD +=  $(KBD_BUILDDIR)$(BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_MANUAL_SOURCE)
+BR2_TARGET_ISO_BR2_TARGET_KEYBOARD_OPTION += $(BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_MANUAL_NAME)
+BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_ACTIVATED=y
+endif
+
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO_ISOLINUX_KEYBOARD_ACTIVATED),y)
+BR2_TARGET_ISO_ISOLINUX_LIST_TOOLS += $(SYSLINUX_BUILDDIR)com32/modules/kbdmap.c32
+endif
+
+ifneq ($(BR2_TARGET_ISO_BR2_TARGET_KEYBOARD_OPTION),)
+BR2_TARGET_ISO_BR2_TARGET_ISO_ISOLINUX_BOOT_MSG += "  $(BR2_TARGET_ISO_BR2_TARGET_KEYBOARD_OPTION)) keyboard option"
+endif
-- 
1.7.10.4

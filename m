From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 09 May 2008 00:09:18 +0200
Subject: [Buildroot] [PATCH] Simple kernel name
Message-ID: <1210284558.8562.3.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here is a complete patch which will allow both a simple name
and the current name of the linux kernel.
It also changes $(BOARD_NAME) -> $(PROJECT) which is more relevant


Index: target/linux/Makefile.in.advanced
===================================================================
--- target/linux/Makefile.in.advanced	(revision 21954)
+++ target/linux/Makefile.in.advanced	(arbetskopia)
@@ -128,43 +128,72 @@
 # VMLINUX
 ifeq ($(LINUX26_FORMAT),vmlinux)
 LINUX26_BINLOC:=$(LINUX26_FORMAT)
-KERNEL_EXT:=
 endif
 
 # --------------
 # UIMAGE
 ifeq ($(LINUX26_FORMAT),uImage)
 LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/$(LINUX26_FORMAT)
-KERNEL_EXT:=.gz
 endif
 
 # --------------
 # ZIMAGE
 ifeq ($(LINUX26_FORMAT),zImage)
 LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/$(LINUX26_FORMAT)
-KERNEL_EXT:=.z
 endif
 
 # --------------
 # BZIMAGE
 ifeq ($(LINUX26_FORMAT),bzImage)
 LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/bzImage
-KERNEL_EXT:=.bz
 endif
 
 endif
 
+# --------------
+# VMLINUX
+ifeq ($(LINUX26_FORMAT),vmlinux)
+KERNEL_EXT:=
+endif
+
+# --------------
+# UIMAGE
+ifeq ($(LINUX26_FORMAT),uImage)
+KERNEL_EXT:=.gz
+endif
+
+# --------------
+# ZIMAGE
+ifeq ($(LINUX26_FORMAT),zImage)
+KERNEL_EXT:=.z
+endif
+
+# --------------
+# BZIMAGE
+ifeq ($(LINUX26_FORMAT),bzImage)
+KERNEL_EXT:=.bz
+endif
+
 #
-----------------------------------------------------------------------------
 # File name for the Linux kernel binary
-LINUX26_KERNEL_NAME:=
$(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE)$(KERNEL_EXT)
 
+ifeq ($(strip $(subst ",,$(BR2_LINUX_NAME_SIMPLE))),y)
+#"))
+LINUX26_KERNEL_NAME:=$(strip $(subst ",,$(LINUX26_FORMAT)))
+#"))
+else
+LINUX26_KERNEL_NAME:=
$(PROJECT)-linux-$(LINUX26_VERSION)-$(DATE)$(KERNEL_EXT)
+endif
 
+
+
+
 ifeq ($(BOARD_NAME),)
 BOARD_NAME=$(ARCH)
 endif
 
 ifndef LINUX26_KERNEL
-LINUX26_KERNEL:=
$(BINARIES_DIR)/$(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE)$(KERNEL_EXT)
+LINUX26_KERNEL:=$(BINARIES_DIR)/$(LINUX26_KERNEL_NAME)
 endif
 
 # for packages that need it
Index: target/linux/Config.in.advanced
===================================================================
--- target/linux/Config.in.advanced	(revision 21954)
+++ target/linux/Config.in.advanced	(arbetskopia)
@@ -540,6 +540,13 @@
 	  board-imposed value by passing LINUX26_FORMAT=<string> to
 	  make.
 
+config BR2_LINUX_NAME_SIMPLE
+	bool "Use traditional Image name"
+	default n
+	depends BR2_PACKAGE_LINUX
+	help
+	  Use the traditional Image name like uImage, bzImage etc.
+
 menu "Destinations for linux kernel binaries"
 
 config BR2_LINUX_COPYTO_ROOTFS

-- 
Best Regards
Ulf Samuelsson
Atmel Nordic AB
Mail: Box 2033, 174 50 Sundbyberg
Visit:Kavalleriv?gen 24, 174 58 Sundbyberg
Phone: +46 8 441 54 22, GSM: +46 706 22 44 57
eMail: ulf at atmel.com

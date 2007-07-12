From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 12 Jul 2007 19:19:16 +0200
Subject: [Buildroot] Linux build files.
Message-ID: <1184260756.5175.57.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here is the target/linux/Config.in and target/linux/Makefile.in 
that I use in my local buildroot from 2007-05-31.
(Did not test it against the latest buildroot, which obviously
needs to happen)


It allows me to:
* Build the  linux kernel
* Select the binary type using a menu choice or free text.
* Select which kernel version to use.
	(Will obviously have to add the latests kernel version)
* Can generate a .config using make XXXX_defconfig
* Can perform "make xconfig" before Linux kernel is built
* Can select to copy the linux kernel into the root fs
* Can copy to secondary location (defaults to /tftpboot)


Would like some comments...

------------------------------------------------------------------------------

menu	"Linux Options"

comment "linux kernel for target device"

config BR2_PACKAGE_LINUX
	bool "linux kernel"
	default n
	help
	  The Linux kernel.
	  http://www.kernel.org/

	  Note: Requires kernel-headers >= 2.6.19 since the other
	        kernel headers are just that (headers) and not full
		kernels. This is a feature.
menu	"Linux Binary Type"
choice
	prompt "Linux Binary Type"
	depends on BR2_PACKAGE_LINUX
	default BR2_LINUX_BIN_UIMAGE
	help
	  Select the specific Linux binary type you want to use

config BR2_LINUX_BIN_BZIMAGE
	bool "bzImage"
	depends BR2_PACKAGE_LINUX
	help
	  	Linux 2.6.19.2

config BR2_LINUX_BIN_ZIMAGE
	bool "zImage"
	depends BR2_PACKAGE_LINUX
	help
	  	Linux 2.6.19.2

config BR2_LINUX_BIN_VMLINUX
	bool "vmlinux"
	depends BR2_PACKAGE_LINUX
	help
	  	Build vmlinux binary

config BR2_LINUX_BIN_UIMAGE
	bool "uImage"
	depends BR2_PACKAGE_LINUX
	help
	  	Build uImage binary

config BR2_LINUX_BIN_CUSTOM
	bool "<custom> Linux binary"
	depends BR2_PACKAGE_LINUX
	help
	  	Build custom Linux binary format
endchoice

config BR2_LINUX_BIN_CUSTOM_BIN
	string "custom kernel binary format"
	depends on BR2_LINUX_BIN_CUSTOM
	default	""
	help
		Which Linux binary format?

config BR2_LINUX26_FORMAT
	string #"kernel binary format"
	depends on BR2_PACKAGE_LINUX
	default "bzImage"			if	BR2_LINUX_BIN_BZIMAGE
	default "uImage"			if	BR2_LINUX_BIN_UIMAGE
	default "vmlinux"			if	BR2_LINUX_BIN_VMLINUX
	default "zImage"			if	BR2_LINUX_BIN_ZIMAGE
	default $(BR2_LINUX_BIN_CUSTOM_BIN)	if	BR2_LINUX_BIN_CUSTOM
	help
	  kernel binary format.
	  Popular values include:
	  - bzImage
	  - zImage
	  - vmlinux
	  and other, architecture dependant formats.

	  Note that the default format is supposed to be set by your
	  board-description, if any.
	  i386 and compatible default to bzImage if nothing was given
	  above.
	  If the above setting is empty, you can change the default
	  board-imposed value by passing LINUX26_FORMAT=<string> to
	  make.

endmenu

menu	"Linux Kernel Version"

choice
	prompt "Linux Kernel Version"
	depends on BR2_PACKAGE_LINUX
	default BR2_LINUX_2_6_20_4
	help
	  Select the specific Linux version you want to use

config BR2_LINUX_2_6_21_1
	bool "Linux 2.6.21.1"
	depends BR2_PACKAGE_LINUX
	help
	  	Linux 2.6.21.1

config BR2_LINUX_2_6_21
	bool "Linux 2.6.21"
	depends BR2_PACKAGE_LINUX
	help
	  	Linux 2.6.21

config BR2_LINUX_2_6_20_4
	bool "Linux 2.6.20.4"
	depends BR2_PACKAGE_LINUX
	help
	  	Linux 2.6.20.4

config BR2_LINUX_2_6_20
	bool "Linux 2.6.20"
	depends BR2_PACKAGE_LINUX
	help
	  	Linux 2.6.20

config BR2_LINUX_2_6_19_2
	bool "Linux 2.6.19.2"
	depends BR2_PACKAGE_LINUX
	help
	  	Linux 2.6.19.2

config BR2_LINUX_2_6_19
	bool "Linux 2.6.19"
	depends BR2_PACKAGE_LINUX
	help
	  	Linux 2.6.19

config BR2_LINUX_2_6_18
	bool "Linux 2.6.18"
	depends BR2_PACKAGE_LINUX
	help
	  	Linux 2.6.18

config BR2_LINUX_2_6_17
	bool "Linux 2.6.17"
	depends BR2_PACKAGE_LINUX
	help
	  	Linux 2.6.17

config BR2_LINUX_2_6_16
	bool "Linux 2.6.16"
	depends BR2_PACKAGE_LINUX
	help
	  	Linux 2.6.16

config BR2_LINUX_2_6_15
	bool "Linux 2.6.15"
	depends BR2_PACKAGE_LINUX
	help
	  	Linux 2.6.15

config BR2_LINUX_2_6_22_RC1
	bool "Linux 2.6.22-rc1"
	depends BR2_PACKAGE_LINUX
	help
	  	Linux 2.6.22-rc1

config BR2_LINUX_2_6_22
	bool "Linux 2.6.22"
	depends BR2_PACKAGE_LINUX
	help
	  	Linux 2.6.22

config BR2_LINUX_CUSTOM
	bool "Linux <custom> version"
	depends BR2_PACKAGE_LINUX
	help
	  	Linux <your selection>

endchoice

config BR2_CUSTOM_DOWNLOAD_LINUX26_VERSION
	string	"Linux Tarball version"
	depends on	BR2_LINUX_CUSTOM
	default "linux-2.6.22"

config BR2_CUSTOM_LINUX26_VERSION
	string	"Linux Version"
	depends on	BR2_LINUX_CUSTOM
	default "linux-2.6.22-version"

config BR2_CUSTOM_LINUX26_RC_PATCH
	string	"RC patch (if needed)"
	depends on	BR2_LINUX_CUSTOM
	default "patch-2.6.22-rc1.bz2"

endmenu

menu	"Patches"

config BR2_LINUX_BSP_PATCH
	string	"Atmel additional patch to apply"
	default "linux-2.6.20.4-atmel.patch.bz2"	if	BR2_TARGET_AVR32 
	default "linux-2.6.20.4-atmel.patch.bz2"	if	BR2_TARGET_AT91
	
config BR2_LINUX_BSP_PATCH
	string	"Additional patch to apply"
	depends on ! (BR2_TARGET_AVR32 || BR2_TARGET_AT91)
	default ""

endmenu

config BR2_DOWNLOAD_LINUX26_VERSION
	string	#"Selected Tarball:"
	default "2.6.15"				if BR2_LINUX_2_6_15
	default "2.6.16"				if BR2_LINUX_2_6_16
	default "2.6.17"				if BR2_LINUX_2_6_17
	default "2.6.18"				if BR2_LINUX_2_6_18
	default "2.6.19"				if BR2_LINUX_2_6_19
	default "2.6.19.2"				if BR2_LINUX_2_6_19_2
	default "2.6.20"				if BR2_LINUX_2_6_20
	default "2.6.20.4"				if BR2_LINUX_2_6_20_4
	default "2.6.21"				if BR2_LINUX_2_6_21
	default "2.6.21.1"				if BR2_LINUX_2_6_21_1
	default "2.6.21"				if BR2_LINUX_2_6_22_RC1
	default "2.6.22"				if BR2_LINUX_2_6_22
	default $(BR2_CUSTOM_DOWNLOAD_LINUX26_VERSION)	if BR2_LINUX_CUSTOM

config BR2_LINUX26_VERSION
	string	#"Selected Version:"
	default "2.6.15"				if BR2_LINUX_2_6_15
	default "2.6.16"				if BR2_LINUX_2_6_16
	default "2.6.17"				if BR2_LINUX_2_6_17
	default "2.6.18"				if BR2_LINUX_2_6_18
	default "2.6.19"				if BR2_LINUX_2_6_19
	default "2.6.19.2"				if BR2_LINUX_2_6_19_2
	default "2.6.20"				if BR2_LINUX_2_6_20
	default "2.6.20.4"				if BR2_LINUX_2_6_20_4
	default "2.6.21"				if BR2_LINUX_2_6_21
	default "2.6.21.1"				if BR2_LINUX_2_6_21_1
	default "2.6.22-rc5"				if BR2_LINUX_2_6_22_RC1
	default "2.6.22"				if BR2_LINUX_2_6_22
	default $(BR2_CUSTOM_LINUX26_VERSION)		if BR2_LINUX_CUSTOM

config BR2_LINUX26_RC_PATCH
	string	#"Selected Patch:"
	default ""						if BR2_LINUX_2_6_15
	default ""						if BR2_LINUX_2_6_16
	default ""						if BR2_LINUX_2_6_17
	default ""						if BR2_LINUX_2_6_18
	default ""						if BR2_LINUX_2_6_19
	default ""						if BR2_LINUX_2_6_19_2
	default ""						if BR2_LINUX_2_6_20
	default ""						if BR2_LINUX_2_6_20_4
	default ""						if BR2_LINUX_2_6_21
	default ""						if BR2_LINUX_2_6_21_1
	default "patch-2.6.22-rc1.bz2"		if BR2_LINUX_2_6_22_RC1
	default ""						if BR2_LINUX_2_6_22
	default $(BR2_CUSTOM_LINUX26_RC_PATCH)		if BR2_LINUX_CUSTOM

comment "linux kernel configuration for target device"

config	BR2_LINUX26_DEFCONFIG
	bool "Build <board>_defconfig "
	depends BR2_PACKAGE_LINUX
	default	n
	help
	  	Configure Linux by make <board>_defconfig

menu	"Configuration file"
	depends on BR2_PACKAGE_LINUX && ! BR2_LINUX26_DEFCONFIG

config BR2_PACKAGE_LINUX_KCONFIG
	string ".config file"
	depends on BR2_PACKAGE_LINUX && ! BR2_LINUX26_DEFCONFIG
	default
"$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(LINUX26_VERSION).config"
	help
	  kernel's .config to use to build a kernel for the target.

	  If the above setting is empty, you can change the default
	  board-imposed value by passing LINUX26_KCONFIG=<path> to
	  make.

config BR2_LINUX_CUSTOMIZE
	bool "Customize  Linux configuration before build"
	depends BR2_PACKAGE_LINUX
	default	n
	help
	  	Configure Linux by make xconfig

endmenu

comment "Destinations for linux kernel binaries"

config BR2_LINUX_IN_ROOTFS
	bool "Copy kernel to root file system"
	depends BR2_PACKAGE_LINUX
	default	n
	help
	  	Copy kernel to <root>/boot directory

menu	"Secondary copy"

config BR2_LINUX_COPYTO
	string "also copy the image to..."
	depends BR2_PACKAGE_LINUX
	default	"/tftpboot"
	help
	  	Copy kernel to secondary location
endmenu

endmenu

------------------------------------------------------------------------------
#############################################################
#
# Linux kernel 2.6 target
#
#############################################################
ifneq ($(filter $(TARGETS),linux26),)
ARCH:=$(strip $(subst ",, $(BR2_ARCH)))

ifeq ($(LINUX_HEADERS_VERSION),)	# -------------------
# Version of Linux to download and then apply patches to
# XXX: andersee, i do not understand why we need this (BF)
DOWNLOAD_LINUX26_VERSION:=$(strip  $(subst ",,
$(BR2_DOWNLOAD_LINUX26_VERSION)))
LINUX26_VERSION:=$(strip  $(subst ",, $(BR2_LINUX26_VERSION)))
LINUX26_RC_PATCH:=$(strip  $(subst ",, $(BR2_LINUX26_RC_PATCH)))
LINUX_BSP_PATCH:=$(strip  $(subst ",, $(BR2_LINUX_BSP_ATMEL_PATCH)))
MKIMAGE:=$(BUILD_DIR)/mkimage

ifeq ($(DOWNLOAD_LINUX26_VERSION),)
DOWNLOAD_LINUX26_VERSION=2.6.19.2
endif
# Version of Linux after applying any patches
LINUX26_VERSION=$(DOWNLOAD_LINUX26_VERSION)


else	# ---------------------------------------------------

# Define DOWNLOAD_LINUX26_VERSION unless defined
ifeq ($(strip $(DOWNLOAD_LINUX26_VERSION)),)
DOWNLOAD_LINUX26_VERSION=$(LINUX_HEADERS_VERSION)
endif

# Define LINUX26_VERSION unless defined
ifeq ($(strip $(LINUX26_VERSION)),)
LINUX26_VERSION=$(LINUX_HEADERS_VERSION)
endif

endif	# ---------------------------------------------------

# Handle case when we want to build using an "rc" patch
# Example: to build 2.6.21-rc1 you need to:
# *  Download linux-2.6.20
# * Apply patch-2.6.21-rc1

LINUX26_SOURCE:=linux-$(DOWNLOAD_LINUX26_VERSION).tar.bz2
LINUX26_SITE=http://ftp.kernel.org/pub/linux/kernel/v2.6
LINUX26_BZCAT:=$(BZCAT)

# Linux kernel binary
LINUX26_FORMAT:=$(strip  $(subst ",, $(BR2_LINUX26_FORMAT)))

# Linux kernel configuration file
ifeq ($(strip $(LINUX26_KCONFIG)),)
LINUX26_KCONFIG=$(BR2_BOARD_PATH)/linux26.config
endif

# File name for the Linux kernel binary
ifeq ($(strip $(LINUX26_KERNEL)),)
#LINUX26_KERNEL=linux-kernel-$(LINUX26_VERSION)-$(KERNEL_ARCH)
LINUX26_KERNEL:=$(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE).gz
endif

ifeq ($(strip $(LINUX26_BINLOC)),)
LINUX26_BINLOC=$(LINUX26_FORMAT)
endif

# Put binary in root file system
ifeq ($(strip $(BR2_LINUX_IN_ROOTFS)),y)
ifeq ($(strip $(LINUX26_TARGET)),)
LINUX26_TARGET:=$(TARGET_DIR)/boot/$(LINUX26_BINLOC)
endif
else
LINUX26_TARGET:=$(BINARIES_DIR)/$(LINUX26_KERNEL)
endif
endif

ifeq ($(strip $(LINUX26_BUILD_DIR)),)
LINUX26_BUILD_DIR=$(TARGET_BUILD_DIR)
endif

ifeq ($(strip $(BR2_LINUX26_DEFCONFIG)),y)
LINUX26_DEFCONFIG=$(BOARD_NAME)_defconfig
endif

# Version of Linux AFTER patches
LINUX26_DIR=$(LINUX26_BUILD_DIR)/linux-$(LINUX26_VERSION)

# for packages that need it
LINUX_VERSION=$(LINUX26_VERSION)
LINUX_DIR=$(LINUX26_DIR)
LINUX_KERNEL=$(LINUX26_KERNEL)

# kernel patches
ifeq ($(strip  $(subst ",, $(LINUX26_PATCH_DIR))),)
LINUX26_PATCH_DIR:=$(BR2_BOARD_PATH)/kernel-patches/
endif
PATCH_DIR=$(strip  $(subst ",, $(LINUX26_PATCH_DIR)))

LINUX26_MAKE_FLAGS = $(TARGET_CONFIGURE_OPTS) ARCH=$(KERNEL_ARCH) \
	PATH=$(TARGET_PATH) INSTALL_MOD_PATH=$(TARGET_DIR) \
	CROSS_COMPILE=$(KERNEL_CROSS)

$(LINUX26_KCONFIG):
	@if [ ! -f "$(LINUX26_KCONFIG)" ] ; then \
		echo ""; \
		echo "You should create a .config for your kernel"; \
		echo "and install it as $(LINUX26_KCONFIG)"; \
		echo ""; \
		sleep 5; \
	fi;

# Check if we have a release candidate.
#	This makes life complex
#	To build linux-2.6.21-rc2 you need to:
#	* Download linux.2.6.20.tar.bz2
#	* Download patch-2.6.21-rc2.bz2
#	I:E you have to download the *previous* major version
 
ifneq	($(LINUX26_RC_PATCH),)
# We have a "release candidate"
LINUX26_RC_PATCH_SOURCE:=
$(TARGET_BUILD_DIR)/linux-patch/$(LINUX26_RC_PATCH)

# Create rule to download the patch
$(LINUX26_RC_PATCH_SOURCE):
	mkdir -p $(TARGET_BUILD_DIR)/linux-patch/
	$(WGET) -P $(TARGET_BUILD_DIR)/linux-patch
$(LINUX26_SITE)/$(LINUX26_RC_PATCH)
#	$(LINUX26_BZCAT)
$(TARGET_BUILD_DIR)/linux-patch/$(LINUX26_RC_PATCH).bz2
else
# We have a vanilla style linux kernel
LINUX26_RC_PATCH_SOURCE:=
endif

ifneq ($(strip $(LINUX_HEADERS_SOURCE)),$(strip $(LINUX26_SOURCE)))
$(DL_DIR)/$(LINUX26_SOURCE):
	 $(WGET) -P $(DL_DIR) $(LINUX26_SITE)/$(LINUX26_SOURCE)
endif

$(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE)
$(LINUX26_RC_PATCH_SOURCE)
	rm -rf $(LINUX26_DIR)
	$(LINUX26_BZCAT) $(DL_DIR)/$(LINUX26_SOURCE) | tar -C
$(LINUX26_BUILD_DIR) $(TAR_OPTIONS) -
ifneq ($(DOWNLOAD_LINUX26_VERSION),$(LINUX26_VERSION))
	# Rename the dir from the downloaded version to the AFTER patch version
	mv -f $(LINUX26_BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION)
$(LINUX26_DIR)
endif
ifneq	($(LINUX26_RC_PATCH),)
	-(cd $(LINUX26_DIR); $(LINUX26_BZCAT) $(LINUX26_RC_PATCH_SOURCE) |
patch -p1)
endif
	-(cd $(TOOL_BUILD_DIR); ln -snf $(LINUX26_DIR) linux)
	rm -f $(LINUX26_DIR)/.kernelrelease
	echo $(LINUX26_VERSION) > $(LINUX26_DIR)/.kernelrelease
	touch $@

$(LINUX26_DIR)/.patched: $(LINUX26_DIR)/.unpacked
	echo $(PATCH_DIR)
	toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR)
	touch $@

$(LINUX26_DIR)/.configured:  $(LINUX26_DIR)/.patched  $(LINUX26_KCONFIG)
	-ls -l $(LINUX26_DIR)/.patched
	-ls -l $(LINUX26_KCONFIG)
	-ls -l $(LINUX26_DIR)/.configured
	-ls -l $(LINUX26_DIR)/.unpacked
	-ls -l $(DL_DIR)/$(LINUX26_SOURCE)
	-ls -l $(LINUX26_RC_PATCH_SOURCE)
ifeq ($(strip $(BR2_LINUX26_DEFCONFIG)),y)
	make -C $(LINUX26_DIR) $(BOARD_NAME)_defconfig
else
	cp -df --preserve=mode,ownership $(LINUX26_KCONFIG)
$(LINUX26_DIR)/.config
endif
ifeq ($(strip $(BR2_LINUX_CUSTOMIZE)),y)
	make -C $(LINUX26_DIR) xconfig
endif
	$(SED) '/CONFIG_AEABI/d' $(LINUX26_DIR)/.config
ifeq ($(BR2_ARM_EABI),y)
	echo "CONFIG_AEABI=y" >> $(LINUX26_DIR)/.config
	$(SED) '/CONFIG_OABI_COMPAT/d' $(LINUX26_DIR)/.config
	echo "# CONFIG_OABI_COMPAT is not set" >> $(LINUX26_DIR)/.config
else
	echo "# CONFIG_AEABI is not set" >> $(LINUX26_DIR)/.config
endif
	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) oldconfig
include/linux/version.h
	touch $@

$(LINUX26_DIR)/.depend_done:  $(LINUX26_DIR)/.configured
	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) prepare
	touch $@

$(LINUX26_DIR)/arch/$(ARCH)/boot/$(LINUX26_FORMAT):
$(LINUX26_DIR)/vmlinux
	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(LINUX26_FORMAT)
	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) modules
	touch -c $@

$(LINUX26_DIR)/vmlinux: $(LINUX26_DIR)/.depend_done
$(STAGING_DIR)/include/linux/version.h
	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) vmlinux
	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) modules
	touch -c $@



#-----------------------------------------------------------------------------------
#	Rule can be enabled by setting
#	LINUX26_TARGET:= $(TARGET_DIR)/boot/$(LINUX26_BINLOC)
#
$(TARGET_DIR)/boot/$(LINUX26_FORMAT): $(LINUX26_DIR)/$(LINUX26_FORMAT)
	[ -d $(TARGET_DIR)/boot/ ] || mkdir $(TARGET_DIR)/boot
	cp -a $(LINUX26_DIR)/$(LINUX26_FORMAT) $(LINUX26_DIR)/System.map
$(TARGET_DIR)/boot/$(LINUX26_FORMAT)
	touch -c $@

#-----------------------------------------------------------------------------------
#	Rule can be enabled by setting
#	LINUX26_TARGET:= $(BINARIES_DIR)/$(LINUX26_KERNEL)
#	LINUX26_FORMAT:= vmlinux

$(BINARIES_DIR)/$(LINUX26_KERNEL):	$(LINUX26_DIR)/uImage
	cp -dpf $(LINUX26_DIR)/uImage $(BINARIES_DIR)/$(LINUX26_KERNEL)
	cp -dpf $(LINUX26_DIR)/uImage /tftpboot/$(LINUX26_KERNEL)
	mkdir	-p $(TARGET_DIR)/boot/
	cp -dpf $(LINUX26_DIR)/.config
$(TARGET_DIR)/boot/$(BOARD_NAME)-linux-$(LINUX26_VERSION).config
	cp -dpf .config	$(TARGET_DIR)/boot/$(BOARD_NAME)-buildroot.config
	cp -dpf $(BUSYBOX_DIR)/.config	$(TARGET_DIR)/boot/busybox.config

$(TARGET_BUILD_DIR)/linux.bin: $(LINUX26_DIR)/vmlinux
	${KERNEL_CROSS}objcopy -O binary -S $(LINUX26_DIR)/vmlinux
$(TARGET_BUILD_DIR)/linux.bin

$(LINUX26_DIR)/uImage:	$(LINUX26_DIR)/arch/$(ARCH)/boot/uImage
	cp	-dpf $(LINUX26_DIR)/arch/$(ARCH)/boot/uImage	$(LINUX26_DIR)/uImage
	

$(TARGET_BUILD_DIR)/xxxx:	$(TARGET_BUILD_DIR)/linux.bin $(MKIMAGE)
	gzip -v9 -c $(TARGET_BUILD_DIR)/linux.bin >
$(TARGET_BUILD_DIR)/linux.bin.gz
	$(MKIMAGE)	-A $(ARCH)		\
				-O linux	\
				-C gzip 	\
				-a 0x20008000	\
				-e 0x20008000	\
				-d $(TARGET_BUILD_DIR)/linux.bin.gz	\
				$(LINUX26_DIR)/uImage
	rm -f $(TARGET_BUILD_DIR)/linux.bin.gz
#-----------------------------------------------------------------------------------

$(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep:
$(LINUX26_TARGET) $(TARGET_DIR)/sbin/modprobe $(LINUX26_DIR)/vmlinux
	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)
	rm -f $(TARGET_DIR)/sbin/cardmgr
	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) \
		DEPMOD=$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 \
		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
	(cd $(TARGET_DIR)/lib/modules; \
	  rm -f drivers; \
	  ln -s $(LINUX26_VERSION)/kernel/drivers .)
	chmod a+x target/depmod.pl
	target/depmod.pl \
		-b $(TARGET_DIR)/lib/modules/$(DOWNLOAD_LINUX26_VERSION) \
		-k $(LINUX26_DIR)/vmlinux \
		-F $(LINUX26_DIR)/System.map \
		> $(TARGET_DIR)/lib/modules/$(shell cat
$(LINUX26_DIR)/include/config/kernel.release 2> /dev/null)/modules.dep
	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/build
	touch -c $@

$(STAGING_DIR)/include/linux/version.h: $(LINUX26_DIR)/.configured
	mkdir -p $(STAGING_DIR)/include
	tar -ch -C $(LINUX26_DIR)/include -f - linux | tar -xf - -C
$(STAGING_DIR)/include/
	tar -ch -C $(LINUX26_DIR)/include -f - asm | tar -xf - -C
$(STAGING_DIR)/include/

linux26-menuconfig: $(LINUX26_DIR)/.patched host-sed
	[ -f $(LINUX26_DIR)/.config ] || cp $(LINUX26_KCONFIG)
$(LINUX26_DIR)/.config
	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) menuconfig
	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured

linux26: cross-depmod26
$(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep
$(LINUX26_TARGET)

linux26-source: $(DL_DIR)/$(LINUX26_SOURCE)

# This has been renamed so we do _NOT_ by default run this on 'make
clean'
linux26clean:
	rm -f $(LINUX26_TARGET)
	rm -f $(TARGET_BUILD_DIR)/linux.bin
	rm -f $(LINUX26_DIR)/uImage
	-$(MAKE) PATH=$(TARGET_PATH) -C $(LINUX26_DIR) clean

linux26-dirclean:
	rm -f $(LINUX26_TARGET)
	rm -f $(TARGET_BUILD_DIR)/linux.bin
	rm -rf $(LINUX26_DIR)

linux-update:
	cp -dpf $(LINUX26_DIR)/.config	$(LINUX26_KCONFIG)

linux-test:
	@echo	"BR2_PACKAGE_LINUX" $(BR2_PACKAGE_LINUX)
	@echo	"BR2_CUSTOM_DOWNLOAD_LINUX26_VERSION"
$(BR2_CUSTOM_DOWNLOAD_LINUX26_VERSION)
	@echo	"BR2_CUSTOM_LINUX26_VERSION" $(BR2_CUSTOM_LINUX26_VERSION)
	@echo	"BR2_CUSTOM_LINUX26_RC_PATCH" $(BR2_CUSTOM_LINUX26_RC_PATCH)
	@echo	"BR2_LINUX_BSP_PATCH" $(BR2_LINUX_BSP_PATCH)
	@echo	"BR2_DOWNLOAD_LINUX26_VERSION" $(BR2_DOWNLOAD_LINUX26_VERSION)
	@echo	"BR2_LINUX26_VERSION" $(BR2_LINUX26_VERSION)
	@echo	"BR2_LINUX26_RC_PATCH" $(BR2_LINUX26_RC_PATCH)
	@echo	"BR2_PACKAGE_LINUX26_KCONFIG" $(BR2_PACKAGE_LINUX_KCONFIG)
	@echo	"BR2_LINUX_BIN_CUSTOM" $(BR2_LINUX_BIN_CUSTOM)
	@echo	"BR2_PACKAGE_LINUX_FORMAT" $(BR2_PACKAGE_LINUX_FORMAT)
	@echo	"BR2_LINUX_IN_ROOTFS" $(BR2_LINUX_IN_ROOTFS)




Best Regards
Ulf Samuelsson

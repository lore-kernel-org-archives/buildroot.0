From: Konstantin Kletschke <kletschke@synertronixx.de>
Date: Wed, 07 Mar 2007 15:49:28 +0100
Subject: [Buildroot] building Kernel with target/device/vendor/board
Message-ID: <874poxglc7.fsf@z1.synertronixx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Actually I am trying to build a custom Kernel to get its modules into
the jffs2 image. My Makefile looks this:

BR2_BOARD_PATH:=target/device/synertronixx/scb9328

ifndef LINUX26_KCONFIG
LINUX26_KCONFIG=$(BR2_BOARD_PATH)/linux26.config
endif

LINUX26_FORMAT=uImage

BR2_PACKAGE_BUSYBOX_CONFIG=$(BR2_BOARD_PATH)/busybox-1.4.0.config
UCLIBC_CONFIG_FILE:=target/device/synertronixx/scb9328/uClibc-0.9.29.config

TARGET_SKELETON=$(BR2_BOARD_PATH)/target_skeleton
TARGET_DEVICE_TABLE=$(BR2_BOARD_PATH)/device_table.txt

This works well after I added 2.6.20 headers support into my buildroot
and after I enabled

BR2_PACKAGE_LINUX=y

buildroot tries to build my 2.6.20 kernel. But it does not apply
patches in LINUX26_PATCH_DIR=$(BR2_BOARD_PATH)/kernel-patches/ because
there is an (strange) ifneq around patching command in
target/linux26.mk:

#KONSTI ifneq ($(strip $(LINUX26_VERSION)),$(strip $(LINUX_HEADERS_VERSION)))
$(DL_DIR)/$(LINUX26_SOURCE):
	 $(WGET) -P $(DL_DIR) $(LINUX26_SITE)/$(LINUX26_SOURCE)

$(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE)
	rm -rf $(LINUX26_DIR)
	$(LINUX26_BZCAT) $(DL_DIR)/$(LINUX26_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
ifneq ($(DOWNLOAD_LINUX26_VERSION),$(LINUX26_VERSION))
	# Rename the dir from the downloaded version to the AFTER patch version
	mv -f $(BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION) $(BUILD_DIR)/linux-$(LINUX26_VERSION)
endif
	touch $@

$(LINUX26_DIR)/.patched: $(LINUX26_DIR)/.unpacked
	toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR)
	touch $@
#KONSTI endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))

If I disable this (already done with the "#KONSTI "s), things are
working like I expect, my .config is apllied and my modules get
installed and all.

Whats the canonical way to install custom headers including vendor
patches? Or did I found a bug?

Regards, Konsti

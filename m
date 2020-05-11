From: lpdev at cordier.org <lpdev@cordier.org>
Date: Mon, 11 May 2020 16:35:10 +0200 (CEST)
Subject: [Buildroot] Adding post image hook
Message-ID: <ea-mime-5eb9629e-6492-6239a409@www-1.mailo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm currently trying to improve my custom buildroot tree (that makes use of BR2_EXTERNAL), especially the final steps. For instance my external tree adds an extra steps through the BR2_ROOTFS_POST_IMAGE_SCRIPT to generate the firmware file. This step also retrieve the version of different softwares present in the final image.

However the post image script comes with a big limitation: we cannot take the advantage of reading variables defined in the Makefile. As stated in the doc, only few environment variables are available. The only way to do so is to use the BR2_ROOTFS_POST_SCRIPT_ARGS, but it is also cumbersome to create a getopt parser in the .sh script.

I would like to know if adding a post image hook in the makefile could help to have a cleaner tree with less .sh files, less getopt parsing, etc.

This would be like:

define GENIMAGE_HOOK
 # Call genimage and other stuf here
endef 

define SWUPDATE_HOOK
 # Call genimage and other stuf here
endef 


BR2_POST_IMAGE_TARGET_HOOKS += GENIMAGE_HOOK
BR2_POST_IMAGE_TARGET_HOOKS += SWUPDATE_HOOK

Those could be defined in the external.mk for instance. I can do a PR if this feature makes sense.



This is how I decided to handle the firmware image generation currently. I'm not sure it's the best way for handling such case, because I'm overriding the default "world" target. I'm opened to any suggestions.

____________________________________________________
# Export some useful variable that can be used in other scripts
export BR2_CUSTOM_BOARDNAME := $(call qstrip,$(BR2_CUSTOM_BOARDNAME))
export BR2_CUSTOM_BOARDVERSION := $(shell git -C $(BR2_EXTERNAL_CUSTOM_PATH) describe --tags --dirty=-dev)

# Make an Firmware Update package.
ifeq ($(BR2_CUSTOM_GENERATE_FIRMWARE),y)
genfirmware: target-post-image
	@$(call MESSAGE,"Compressing the filesystem...")
	pigz -9 -c -n $(BINARIES_DIR)/rootfs.ext4 > $(BINARIES_DIR)/rootfs.ext4.gz

	@$(call MESSAGE,"Generating UEFI partition for the bootloader...")
	$(EXTRA_ENV) ./support/scripts/genimage.sh -c $(BR2_EXTERNAL_CUSTOM_PATH)/board/cstick/genimage_uefi.cfg

	@$(call MESSAGE,"Generating firmware version $(BR2_CUSTOM_BOARDVERSION) for board $(BR2_CUSTOM_BOARDNAME) ")
	(We can use bash script here with any makefile variables defined at this point, such as BR2_OPENCV_VERSION for instance)

# Override the default world target.
.PHONY: world
world: genfirmware
endif

...
____________________________________________________


Thank you for your time,

Louis-Paul CORDIER

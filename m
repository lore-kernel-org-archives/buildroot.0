From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 14:38:35 +0100
Subject: [Buildroot] [PATCH 1/3] fs: apply permissions late
In-Reply-To: <4f9a31b0fb8f87ded9c788cb92d727b6763859ac.1540626349.git.yann.morin.1998@free.fr>
References: <cover.1540626349.git.yann.morin.1998@free.fr>
 <4f9a31b0fb8f87ded9c788cb92d727b6763859ac.1540626349.git.yann.morin.1998@free.fr>
Message-ID: <20181103143835.5b2f9142@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 Oct 2018 09:45:58 +0200, Yann E. MORIN wrote:

> This needs a split of the makedevs call, with the current and first one
> now only responsible for creating the pseudo devices, while the new,
> second call does only set the permissions.

What happens if there are special permissions/extended attributes set
on pseudo devices in the static device table ?

> diff --git a/fs/common.mk b/fs/common.mk
> index 453da6010a..569e5d60c5 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -29,8 +29,8 @@
>  
>  FS_DIR = $(BUILD_DIR)/buildroot-fs
>  FULL_DEVICE_TABLE = $(FS_DIR)/device_table.txt

I no longer like the name FULL_DEVICE_TABLE, nor device_table.txt,
because it's no longer the "full device table".

> -ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
> -	$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
> +ROOTFS_PERMISSION_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE))
> +ROOTFS_STATIC_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
>  USERS_TABLE = $(FS_DIR)/users_table.txt
>  ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
>  
> @@ -81,14 +81,13 @@ ifneq ($(ROOTFS_USERS_TABLES),)
>  	cat $(ROOTFS_USERS_TABLES) >> $(USERS_TABLE)
>  endif
>  	PATH=$(BR_PATH) $(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
> -ifneq ($(ROOTFS_DEVICE_TABLES),)
> -	cat $(ROOTFS_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
> +ifneq ($(ROOTFS_STATIC_DEVICE_TABLES),)
> +	cat $(ROOTFS_STATIC_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
>  ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
>  	$(call PRINTF,$(PACKAGES_DEVICES_TABLE)) >> $(FULL_DEVICE_TABLE)
>  endif
> -endif
> -	$(call PRINTF,$(PACKAGES_PERMISSIONS_TABLE)) >> $(FULL_DEVICE_TABLE)
>  	echo "$(HOST_DIR)/bin/makedevs -d $(FULL_DEVICE_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
> +endif
>  	$(foreach s,$(call qstrip,$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
>  		echo "echo '$(TERM_BOLD)>>>   Executing fakeroot script $(s)$(TERM_RESET)'" >> $(FAKEROOT_SCRIPT); \
>  		echo $(EXTRA_ENV) $(s) $(TARGET_DIR) $(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $(FAKEROOT_SCRIPT)$(sep))
> @@ -108,6 +107,7 @@ define inner-rootfs
>  
>  ROOTFS_$(2)_DIR = $$(FS_DIR)/$(1)
>  ROOTFS_$(2)_TARGET_DIR = $$(ROOTFS_$(2)_DIR)/target
> +ROOTFS_$(2)_PERMISSION_TABLE = $$(ROOTFS_$(2)_DIR)/permissions.txt

There is no reason for this variable to be filesystem-specific, nor for
this permissions.txt file to be generated for each filesystem format.

So I'd prefer to see something like this in fs/common.mk:

ROOTFS_FULL_STATIC_DEVICE_TABLE = $(FS_DIR)/full_static_device_table.txt
ROOTFS_FULL_PERMISSION_TABLE = $(FS_DIR)/full_permission_table.txt

both are generated in fs/common.mk, but only
ROOTFS_FULL_STATIC_DEVICE_TABLE is used in the makedevs call in
fs/common.mk.


>  ROOTFS_$(2)_DEPENDENCIES += rootfs-common
>  
> @@ -149,6 +149,11 @@ $$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
>  	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
>  	echo "set -e" >> $$(FAKEROOT_SCRIPT)
>  	$$(call PRINTF,$$(ROOTFS_COMMON_UNTAR_CMD)) >> $$(FAKEROOT_SCRIPT)
> +ifneq ($$(ROOTFS_PERMISSION_TABLES),)
> +	cat $$(ROOTFS_PERMISSION_TABLES) > $$(ROOTFS_$(2)_PERMISSION_TABLE)
> +endif
> +	$$(call PRINTF,$$(PACKAGES_PERMISSIONS_TABLE)) >> $$(ROOTFS_$(2)_PERMISSION_TABLE)

i.e, those lines would migrate back into fs/common.mk.

> +	echo "$$(HOST_DIR)/bin/makedevs -d $$(ROOTFS_$(2)_PERMISSION_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)

And this would use $(ROOTFS_FULL_PERMISSION_TABLE)

This would make the whole thing more consistent IMO. Of course unless
we decide that pseudo devices in the static device table can have
extended attributes, in which case, the makedevs for static devices
anyway needs to be moved to the per-filesystem code.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

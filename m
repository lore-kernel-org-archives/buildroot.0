From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Nov 2018 23:38:16 +0100
Subject: [Buildroot] [PATCH 3/6 v2] fs: rename internal variable
In-Reply-To: <1a4428b01a76f6189b154cecd1068663ee515332.1542043922.git.yann.morin.1998@free.fr>
References: <cover.1542043922.git.yann.morin.1998@free.fr>
 <1a4428b01a76f6189b154cecd1068663ee515332.1542043922.git.yann.morin.1998@free.fr>
Message-ID: <83baff45-7514-c5bc-0008-0b31981e208b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/11/2018 18:33, Yann E. MORIN wrote:
> In preparation of more renames, rename the variable that points to the
> final users table.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  fs/common.mk | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 358801d44f..d1b6a56913 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -31,9 +31,11 @@ FS_DIR = $(BUILD_DIR)/buildroot-fs
>  FULL_DEVICE_TABLE = $(FS_DIR)/device_table.txt
>  ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
>  	$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
> -USERS_TABLE = $(FS_DIR)/users_table.txt
> +
>  ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
>  
> +ROOTFS_FINAL_USERS_TABLE = $(FS_DIR)/full_users_table.txt

 Nitpicking: make sure the file name is the same as the variable name. Either
name is OK for me, with a light preference for full rather than final.

 With that:
  Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> +
>  ifeq ($(BR2_REPRODUCIBLE),y)
>  define ROOTFS_REPRODUCIBLE
>  	find $(TARGET_DIR) -print0 | xargs -0 -r touch -hd @$(SOURCE_DATE_EPOCH)
> @@ -51,9 +53,9 @@ rootfs-common: $(ROOTFS_COMMON_DEPENDENCIES) target-finalize
>  	rm -rf $(FS_DIR)
>  	mkdir -p $(FS_DIR)
>  
> -	$(call PRINTF,$(PACKAGES_USERS)) >> $(USERS_TABLE)
> +	$(call PRINTF,$(PACKAGES_USERS)) >> $(ROOTFS_FINAL_USERS_TABLE)
>  ifneq ($(ROOTFS_USERS_TABLES),)
> -	cat $(ROOTFS_USERS_TABLES) >> $(USERS_TABLE)
> +	cat $(ROOTFS_USERS_TABLES) >> $(ROOTFS_FINAL_USERS_TABLE)
>  endif
>  ifneq ($(ROOTFS_DEVICE_TABLES),)
>  	cat $(ROOTFS_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
> @@ -119,7 +121,7 @@ $$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
>  	echo "set -e" >> $$(FAKEROOT_SCRIPT)
>  
>  	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
> -	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
> +	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(ROOTFS_FINAL_USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
>  	echo "$$(HOST_DIR)/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
>  	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
>  		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
> 

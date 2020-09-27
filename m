From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Sep 2020 09:15:47 +0200
Subject: [Buildroot] [PATCH 1/1] fs/common.mk: move
 BR2_ROOTFS_POST_FAKEROOT_SCRIPT after pre cmd hooks
In-Reply-To: <20200911003002.5895-1-charles.hardin@chargepoint.com>
References: <20200911003002.5895-1-charles.hardin@chargepoint.com>
Message-ID: <20200927071547.GG11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Charles, All,

On 2020-09-10 17:30 -0700, Charles Hardin spake thusly:
> From: Charles Hardin <ckhardin@gmail.com>
> 
> The fakeroot script does not appear to be used in any of the checked
> in defconfig targets, but it seems that most often the post
> fakeroot script should be done after all the packages rules have
> been applied instead of before.
> 
> Given that a change in systemd moved the SYSTEMD_PRESET_ALL hook to
> a ROOTFS_PRE_CMD_HOOKS, there was no way to use a FAKEROOT script
> to disable a service or fixup a systemd configuration. The systemd
> move makes sense, and this just tries to preserve the same ability
> to fixup a rootfs after all the cmd hooks are processed.
> 
> Refer to commit 65b63785a642bbc565924edf365b5d7c080f961c for
> the change that instigated this reordering.
> 
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  fs/common.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index ec6aa831d1..84e13d1b7e 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -173,11 +173,11 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
>  	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
>  	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(ROOTFS_FULL_USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
>  	echo "$$(HOST_DIR)/bin/makedevs -d $$(ROOTFS_FULL_DEVICES_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
> +	$$(foreach hook,$$(ROOTFS_PRE_CMD_HOOKS),\
> +		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
>  	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
>  		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
>  		echo $$(EXTRA_ENV) $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
> -	$$(foreach hook,$$(ROOTFS_PRE_CMD_HOOKS),\
> -		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
>  
>  	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\
>  		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

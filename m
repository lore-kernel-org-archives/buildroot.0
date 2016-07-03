From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 3 Jul 2016 13:49:45 +0200
Subject: [Buildroot] [PATCH 22/24 v2] fs: add pre- and post-command hooks
In-Reply-To: <a233b4b0fbce3823dca317fe24d8678397a7c8fc.1466622379.git.yann.morin.1998@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
 <a233b4b0fbce3823dca317fe24d8678397a7c8fc.1466622379.git.yann.morin.1998@free.fr>
Message-ID: <1665996e-8fd6-da64-4552-b57b27b06dc9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 22/06/2016 ? 21:07, Yann E. MORIN a ?crit :
> In some cases, the directory structure we want in the filesystem is not
> exactly what we have in target/
> 
> For example, when systemd is used on a read-only rootfs, /var must be a
> tmpfs. However, we may have packages that install stuff in there, and
> set important rights (via the permission-table). So, at build time, we
> need /var to be a symlink to the remanent location (/usr/share/factory)
> while at runtime we need /var to be a directory.
> 
> One option would have seen to be do have /var as a real directory even
> during build time, and in a target-finalize hook, move everything out of
> there and into the "factory" location. However, that's not possible
> because it's too early: some packages may want to set ownership and/or
> acces rights on directories or files in /var, and this is only done in
> the fakeroot script, which is called only later during the assembling of
> the filesystem images.
> 
> Also, there would have been no way to undo the tweak (i.e. we need to
> restore the /var symlink so that subsequent builds continue to work) if
> it were done as a target-finalize hook.
> 
> The only solution is to allow packages to register pre- and post-hooks
> that are called right before and right after the rootfs commands are
> executed.
> 
> Those hooks are not documented on-purpose; they are probably going to be
> used only by systemd.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  fs/common.mk           | 4 ++++
>  package/pkg-generic.mk | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index b7202c3..8feb172 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -92,7 +92,11 @@ endif
>  	$$(call PRINTF,$$(PACKAGES_PERMISSIONS_TABLE)) >> $$(FULL_DEVICE_TABLE)
>  	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
>  endif
> +	$$(foreach hook,$$(FS_INIT_PRE_CMD_HOOKS),\
> +		$$(call PRINTF,$$($$(hook))) >>$$(FAKEROOT_SCRIPT))
                                               ^
>  	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
> +	$$(foreach hook,$$(FS_INIT_POST_CMD_HOOKS),\
> +		$$(call PRINTF,$$($$(hook))) >>$$(FAKEROOT_SCRIPT))
                                               ^

We need a space between >> and $$

With that fixed:
Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

>  	chmod a+x $$(FAKEROOT_SCRIPT)
>  	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
>  	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 4415342..2f80392 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -559,6 +559,8 @@ $(2)_POST_INSTALL_IMAGES_HOOKS  ?=
>  $(2)_PRE_LEGAL_INFO_HOOKS       ?=
>  $(2)_POST_LEGAL_INFO_HOOKS      ?=
>  $(2)_TARGET_FINALIZE_HOOKS      ?=
> +$(2)_FS_PRE_CMD_HOOKS           ?=
> +$(2)_FS_POST_CMD_HOOKS          ?=
>  
>  # human-friendly targets and target sequencing
>  $(1):			$(1)-install
> @@ -860,6 +862,8 @@ ifneq ($$($(2)_USERS),)
>  PACKAGES_USERS += $$($(2)_USERS)$$(sep)
>  endif
>  TARGET_FINALIZE_HOOKS += $$($(2)_TARGET_FINALIZE_HOOKS)
> +FS_INIT_PRE_CMD_HOOKS += $$($(2)_FS_PRE_CMD_HOOKS)
> +FS_INIT_POST_CMD_HOOKS += $$($(2)_FS_POST_CMD_HOOKS)
>  
>  ifeq ($$($(2)_SITE_METHOD),svn)
>  DL_TOOLS_DEPENDENCIES += svn
> 

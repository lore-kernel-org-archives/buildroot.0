From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Jul 2016 17:12:28 +0200
Subject: [Buildroot] [PATCH v2 1/1] overlay: Add archive-based (tar)
 rootfs overlays
In-Reply-To: <1460693286-6245-1-git-send-email-camh@xdna.net>
References: <1460693286-6245-1-git-send-email-camh@xdna.net>
Message-ID: <20160703151228.GA3482@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cam, All,

On 2016-04-15 14:08 +1000, Cam Hutchison spake thusly:
> Add a feature to extract tar archives into the target rootfs when
> building filesystem images. The archives are extracted inside the
> fakeroot used to build the filesystem images so that the ownership and
> permissions of files in the archive are preserved.
> 
> This is useful when an external build process produces rootfs archives
> or software is supplied as an archive that need to be incorporated the
> generated rootfs.
> 
> Configuration options are added to configure a list of paths to archives
> to be extracted, and to configure how many path components to strip from
> paths in those archives. It is not possible to configure a different
> number of components for different archives.

We discussed this during our summer-camp, and came to the conclusion
that this is not flexible engouh.

Also, all tarballs have to be archived with the same "strip-component"
depth. This is not very nice.

So, instead, we've come up with a different solution, which is to allow
arbitrary scrippts to be run in the fakeroot script. I've sent this
patch:
    https://patchwork.ozlabs.org/patch/643751/

Hopefully, that should also cover your use-case (even though you'll have
to also write a little script).

So, I'm marking your patch as rejected in patchwork.

Thanks! :-)

Regards,
Yann E. MORIN.

> Signed-off-by: Cam Hutchison <camh@xdna.net>
> ---
> Changes v1 -> v2:
>  - Use suitable-extractor instead of the tar -a option
>  - Split config option from BR2_ROOTFS_OVERLAY
>  - Add configurable --strip-components
>  - Move archive extraction to fakeroot from target-finalize target
> ---
>  fs/common.mk     |  9 +++++++++
>  system/Config.in | 21 +++++++++++++++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 3a424f6..414e5e6 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -38,6 +38,10 @@ ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
>  USERS_TABLE = $(BUILD_DIR)/_users_table.txt
>  ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
>  
> +define rootfs-extract-overlay
> +$(call suitable-extractor,$(1)) $(1) | tar -xf - -C $(TARGET_DIR) --strip-components=$(call qstrip,$(BR2_ROOTFS_OVERLAY_ARCHIVES_STRIP_COMPONENTS))
> +endef
> +
>  # Since this function will be called from within an $(eval ...)
>  # all variable references except the arguments must be $$-quoted.
>  define ROOTFS_TARGET_INTERNAL
> @@ -91,6 +95,11 @@ endif
>  	printf '$$(subst $$(sep),\n,$$(PACKAGES_PERMISSIONS_TABLE))' >> $$(FULL_DEVICE_TABLE)
>  	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
>  endif
> +ifneq ($$(BR2_ROOTFS_OVERLAY_ARCHIVES),)
> +	$$(foreach archive,$$(call qstrip,$$(BR2_ROOTFS_OVERLAY_ARCHIVES)),\
> +		echo "$$(call rootfs-extract-overlay,$$(archive))" >> $$(FAKEROOT_SCRIPT) \
> +		$$(sep))
> +endif
>  	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
>  	chmod a+x $$(FAKEROOT_SCRIPT)
>  	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
> diff --git a/system/Config.in b/system/Config.in
> index 2e14971..df23ea6 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -429,6 +429,27 @@ config BR2_ROOTFS_OVERLAY
>  	  They are copied as-is into the rootfs, excluding files ending with
>  	  ~ and .git, .svn and .hg directories.
>  
> +config BR2_ROOTFS_OVERLAY_ARCHIVES
> +	string "Root filesystem overlay archives"
> +	default ""
> +	help
> +	  Specify a list of tar archives that are extracted into the
> +	  output filesystem images as they are built. The archives will
> +	  be extracted while running under the fakeroot environment
> +	  used to build the images so they may contain files that only
> +	  root may extract (such as setuid binaries), and permissions
> +	  and ownerships are maintained.
> +
> +config BR2_ROOTFS_OVERLAY_ARCHIVES_STRIP_COMPONENTS
> +	string "Leading path components to strip from overlay archives"
> +	default "0"
> +	help
> +	  The number of leading path components to strip from each
> +	  archive specified under Root filesystem overlay archives.
> +	  The same number of components must be stripped from all
> +	  archives - it is not possible to have a different number of
> +	  components stripped from different archives.
> +
>  config BR2_ROOTFS_POST_BUILD_SCRIPT
>  	string "Custom scripts to run before creating filesystem images"
>  	default ""
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

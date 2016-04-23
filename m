From: Matthew Weber <matt@thewebers.ws>
Date: Fri, 22 Apr 2016 20:57:56 -0500
Subject: [Buildroot] [PATCH v2 1/1] overlay: Add archive-based (tar)
 rootfs overlays
In-Reply-To: <1460693286-6245-1-git-send-email-camh@xdna.net>
References: <1460693286-6245-1-git-send-email-camh@xdna.net>
Message-ID: <CAFt09wMVqWepo-Ott0Y0nL45RnqoFy6tTunBP-OndgzEJoj_hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cam,

On Thu, Apr 14, 2016 at 11:08 PM, Cam Hutchison <camh@xdna.net> wrote:
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
>
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
>         printf '$$(subst $$(sep),\n,$$(PACKAGES_PERMISSIONS_TABLE))' >> $$(FULL_DEVICE_TABLE)
>         echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
>  endif
> +ifneq ($$(BR2_ROOTFS_OVERLAY_ARCHIVES),)
> +       $$(foreach archive,$$(call qstrip,$$(BR2_ROOTFS_OVERLAY_ARCHIVES)),\
> +               echo "$$(call rootfs-extract-overlay,$$(archive))" >> $$(FAKEROOT_SCRIPT) \
> +               $$(sep))
> +endif
>         echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
>         chmod a+x $$(FAKEROOT_SCRIPT)
>         PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
> diff --git a/system/Config.in b/system/Config.in
> index 2e14971..df23ea6 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -429,6 +429,27 @@ config BR2_ROOTFS_OVERLAY
>           They are copied as-is into the rootfs, excluding files ending with
>           ~ and .git, .svn and .hg directories.
>
> +config BR2_ROOTFS_OVERLAY_ARCHIVES
> +       string "Root filesystem overlay archives"
> +       default ""
> +       help
> +         Specify a list of tar archives that are extracted into the
> +         output filesystem images as they are built. The archives will
> +         be extracted while running under the fakeroot environment
> +         used to build the images so they may contain files that only
> +         root may extract (such as setuid binaries), and permissions
> +         and ownerships are maintained.
> +
> +config BR2_ROOTFS_OVERLAY_ARCHIVES_STRIP_COMPONENTS
> +       string "Leading path components to strip from overlay archives"
> +       default "0"
> +       help
> +         The number of leading path components to strip from each
> +         archive specified under Root filesystem overlay archives.
> +         The same number of components must be stripped from all
> +         archives - it is not possible to have a different number of
> +         components stripped from different archives.

Instead of this strip components option, would it be easier to
document the expected pathing for the tar?  If you could apply
specific strip values for each file, I think it would make sense to
have this option.  What is your scenario where this would be required?
 As all files would have to be the same to match whichever value is
used.

Thanks!
Matt

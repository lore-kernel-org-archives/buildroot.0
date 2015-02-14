From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 14 Feb 2015 12:24:16 -0500
Subject: [Buildroot] [RFC 1/2] Makefile: add target-genimage
In-Reply-To: <1423780427-7493-2-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1423780427-7493-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <1423780427-7493-2-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <CANxTyt4ojT7Y+mG9+Je_gY0dD2Ub3nxfcuoXtD1F-sPcbcmY6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vivean,

A couple nitpicks ...

On Thu, Feb 12, 2015 at 5:33 PM, Vivien Didelot
<vivien.didelot@savoirfairelinux.com> wrote:
> genimage is a convenient host tool which eases the generation of images
> and partition layout by providing simple configuration files.
>
> This patch adds a new BR2_ROOTFS_GENIMAGE_CFG menuconfig entry, which is
> a space-separated list of config files. Indeed, you may want to split
> images in different files, or put them all together in the same file.
>
> BR2_ROOTFS_GENIMAGE_HOST_DEPENDENCIES is meant to auto-select the
> packages that genimage may use, such as mkdosfs or mcopy (which copies
> files from/to unmounted vfat images).
>
> The rational behind adding this to Buildroot is that genimage requires

spelling: "rationale".

> an overhead configuration to use it, like temporary directories, host
> dependencies, and images path, that Buildroot is all aware of. This
> minimal addition is optional and allows the user not to write the same
> post-image script to wrap the genimage call.
>
> Finally, the new "target-genimage" make target is called before
> target-post-image so that the post-image script can still clean
> intermediate generated images and do whatever with the very final image.
>
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> ---
>  Makefile         | 17 +++++++++++++++--
>  system/Config.in | 22 ++++++++++++++++++++++
>  2 files changed, 37 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 338c992..1eb1619 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -434,7 +434,7 @@ world: target-post-image
>
>  .PHONY: all world toolchain dirs clean distclean source outputmakefile \
>         legal-info legal-info-prepare legal-info-clean printvars \
> -       target-finalize target-post-image \
> +       target-finalize target-genimage target-post-image \
>         $(TARGETS) $(TARGETS_ROOTFS) \
>         $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
>         $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
> @@ -621,7 +621,20 @@ endif
>                 $(call MESSAGE,"Executing post-build script $(s)"); \
>                 $(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
>
> -target-post-image: $(TARGETS_ROOTFS) target-finalize
> +target-genimage: $(TARGETS_ROOTFS) target-finalize
> +       @$(foreach cfg, $(call qstrip,$(BR2_ROOTFS_GENIMAGE_CFG)), \
> +       $(call MESSAGE,"Executing genimage with config $(cfg)"); \
> +         T=$$(mktemp -d $(BUILD_DIR)/.genimage.XXXXXXXXXX); \
> +         mkdir -p $$T/{root,tmp}; \
> +         $(EXTRA_ENV) output/host/usr/bin/genimage \
> +         --rootpath $$T/root \
> +         --tmppath $$T/tmp \
> +         --inputpath output/images/ \
> +         --outputpath output/images/ \
> +         --config $(cfg); \
> +         rm -rf $$T$(sep))

I don't think the final $(sep) is needed, since this the last line of
a makefile target, as opposed to, say. a template.

Danomi -


> +
> +target-post-image: target-genimage
>         @$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
>                 $(call MESSAGE,"Executing post-image script $(s)"); \
>                 $(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
> diff --git a/system/Config.in b/system/Config.in
> index 95e10ab..2596da8 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -421,6 +421,28 @@ config BR2_ROOTFS_POST_BUILD_SCRIPT
>           argument. Make sure the exit code of those scripts are 0, otherwise
>           make will stop after calling them.
>
> +config BR2_ROOTFS_GENIMAGE_CFG
> +       string "genimage config files to prepare custom images"
> +       default ""
> +       help
> +         Specify a space-separated list of configuration files for genimage to be
> +         run after the build has finished and after Buildroot has packed the files
> +         into selected filesystem images.
> +
> +         This can for example be used to generate a card image with an vfat
> +         partition containing some boot files, and an ext4 rootfs.
> +
> +         genimage is executed from the main Buildroot source directory, with input
> +         and output paths configured to output/images.
> +
> +config BR2_ROOTFS_GENIMAGE_HOST_DEPENDENCIES
> +       bool "genimage host dependencies"
> +       default y
> +       depends on BR2_ROOTFS_GENIMAGE_CFG != ""
> +       select BR2_PACKAGE_HOST_GENIMAGE
> +       select BR2_PACKAGE_HOST_DOSFSTOOLS
> +       select BR2_PACKAGE_HOST_MTOOLS
> +
>  config BR2_ROOTFS_POST_IMAGE_SCRIPT
>         string "Custom scripts to run after creating filesystem images"
>         default ""
> --
> 2.3.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

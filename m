From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 27 Jan 2014 19:31:32 -0500
Subject: [Buildroot] [PATCH 1/5] target: ensure target/ dir is writable
In-Reply-To: <09e0a585c589ccd09d3f85436af4193fb3e1a177.1384454667.git.yann.morin.1998@free.fr>
References: <cover.1384454667.git.yann.morin.1998@free.fr>
 <09e0a585c589ccd09d3f85436af4193fb3e1a177.1384454667.git.yann.morin.1998@free.fr>
Message-ID: <CANxTyt46Sx2m6szFYmHgPmX4vR7ocvwjCEwPdbANNDRE7BJqNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Nathan,

On Thu, Nov 14, 2013 at 1:46 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: Nathan Lynch <ntl@pobox.com>
>
> If the source target skeleton is read-only (eg. because Buildroot's
> source dir is), modifications to the output target (such as creating
> /etc/hostname and /etc/issue) fail.
>
> (This can happen if the Buildroot source dir is NFS-mounted read-only
> to be shared between different machines, for example).
>
> Signed-off-by: Nathan Lynch <ntl@pobox.com>
> [yann.morin.1998 at free.fr: we use rsync now, not cp; --chmod=Du+w
>  suggested by Arnout; clarify commit log]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index c7a0a6d..b2b962c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -433,7 +433,7 @@ RSYNC_VCS_EXCLUSIONS = \
>  $(BUILD_DIR)/.root:
>         mkdir -p $(TARGET_DIR)
>         rsync -a $(RSYNC_VCS_EXCLUSIONS) \
> -               --exclude .empty --exclude '*~' \
> +               --chmod=Du+w --exclude .empty --exclude '*~' \
>                 $(TARGET_SKELETON)/ $(TARGET_DIR)/
>         cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
>         @ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
> @@ -508,7 +508,7 @@ endif
>         @$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
>                 $(call MESSAGE,"Copying overlay $(d)"); \
>                 rsync -a $(RSYNC_VCS_EXCLUSIONS) \
> -                       --exclude .empty --exclude '*~' \
> +                       --chmod=Du+w --exclude .empty --exclude '*~' \
>                         $(d)/ $(TARGET_DIR)$(sep))
>
>         @$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
> --
> 1.8.1.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

What happened to this series (5 patches fixing issues with RO tree)?
I don't see these patches in Patchwork - did they get rejected?

Danomi -

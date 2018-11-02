From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 2 Nov 2018 15:31:19 -0500
Subject: [Buildroot] [PATCH 2/3] fs: be oblivious of pre-existing xattrs
In-Reply-To: <ee8beeb5af2d893714d4aa82915e7068154ba46e.1540626349.git.yann.morin.1998@free.fr>
References: <cover.1540626349.git.yann.morin.1998@free.fr>
 <ee8beeb5af2d893714d4aa82915e7068154ba46e.1540626349.git.yann.morin.1998@free.fr>
Message-ID: <CANQCQpYSOs=6H-Koiws6=j9es_Z1hsUfGLdX8ovU+Z5duV5aQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat, Oct 27, 2018 at 2:46 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Now that we handle permissions in each filesystems, and no longer in the
> intermediate tarball, we no longer need tar to store extended attributes.
>
> What's more, we really want it to store no attributes at all, to be sure
> we don't have rogue extended attributes leaking in...
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>


Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Ran some scenaios as a regression on existing target builds before and
after the change.  I did not use a SElinux enabled system.  I'll keep
that in mind as a scenario that probably needs checked.

> ---
>  fs/common.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/fs/common.mk b/fs/common.mk
> index 569e5d60c5..fd1e80ab93 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -45,6 +45,7 @@ ROOTFS_COMMON_TAR = $(FS_DIR)/rootfs.common.tar
>  # Command to create the common tarball from the base target directory.
>  define ROOTFS_COMMON_TAR_CMD
>         tar cf $(ROOTFS_COMMON_TAR) --numeric-owner \
> +               --no-xattrs \
>                 --exclude=$(notdir $(TARGET_DIR_WARNING_FILE)) \
>                 -C $(TARGET_DIR) .
>  endef
> @@ -52,7 +53,9 @@ endef
>  # Command to extract the common tarball into the per-rootfs target directory
>  define ROOTFS_COMMON_UNTAR_CMD
>         mkdir -p $(TARGET_DIR)
> -       tar xf $(ROOTFS_COMMON_TAR) -C $(TARGET_DIR)
> +       tar xf $(ROOTFS_COMMON_TAR) \
> +               --no-xattrs \
> +               -C $(TARGET_DIR)
>  endef
>
>  .PHONY: rootfs-common
> --
> 2.14.1
>

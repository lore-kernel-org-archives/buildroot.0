From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Jul 2019 00:34:41 +0200
Subject: [Buildroot] [PATCH] fs/cpio: make cpio rootfs reproducible
In-Reply-To: <20190712172320.23108-1-itsatharva@gmail.com>
References: <20190712172320.23108-1-itsatharva@gmail.com>
Message-ID: <e4d54ca8-8d14-a42f-cb71-a370575c0e11@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Atharva,

On 12/07/2019 19:23, Atharva Lele wrote:
> Pass the recommended argument in the CPIO manual to make cpio archives
> reproducible.
> 
> Reference: https://www.gnu.org/software/cpio/manual/cpio.html#Copy_002dpass-mode
> 
> Pre-patch diffoscope output: https://gitlab.com/snippets/1874745
> Post-patch: https://gitlab.com/snippets/1874746
> 
> We can see that post-patch, the archive related differences are removed.
> The differences are arising from utils/bin/getconf. This will have to
> be investigated further. However, that is unrelated to cpio.
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> ---
>  fs/cpio/cpio.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
> index 1f0cafe62f..4847f56d53 100644
> --- a/fs/cpio/cpio.mk
> +++ b/fs/cpio/cpio.mk
> @@ -29,8 +29,12 @@ endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
>  
>  ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_ADD_INIT
>  
> +ifeq ($(BR2_REPRODUCIBLE), y)
> +CPIO_OPTS = --reproducible

 Unfortunately, this option was only introduced in cpio 2.12 (2015). Older
distros, including Debian oldstable and Ubuntu 2016.04, both of which are still
being maintained, have an earlier cpio version (2.11) so don't have this option.

 Therefore, I think we have to check for a suitable system cpio and build
host-cpio if it is not suitable. Or maybe, for reproducible, always build
host-cpio?

 Yann, what do you think?

 Otherwise, the patch looks good. But I've marked it as Changes Requested in
pathchwork.

 Regards,
 Arnout

> +endif
> +
>  define ROOTFS_CPIO_CMD
> -	cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $@
> +	cd $(TARGET_DIR) && find . | cpio $(CPIO_OPTS) --quiet -o -H newc > $@
>  endef
>  
>  ifeq ($(BR2_TARGET_ROOTFS_CPIO_UIMAGE),y)
> 

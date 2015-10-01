From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Oct 2015 08:20:25 +0200
Subject: [Buildroot] [PATCH 3/9] linux: meddle not in the affairs of
 filesystems, for you are tasty with bacon
In-Reply-To: <4efd4ca99366d56f8ae7796f9ae8958f1749b862.1443650034.git.yann.morin.1998@free.fr>
References: <cover.1443650034.git.yann.morin.1998@free.fr>
 <4efd4ca99366d56f8ae7796f9ae8958f1749b862.1443650034.git.yann.morin.1998@free.fr>
Message-ID: <20151001082025.30cdb5ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Wed, 30 Sep 2015 23:54:46 +0200, Yann E. MORIN wrote:
> Currently, the rule to rebuild the Linux kernel with an initramfs
> directly depends on the filesystem image filename.
> 
> This is inherently "bad" from a purity point of view. linux.mk should
> not have to delve into the fs internals.
> 
> Rather, make it directly depend on the "frontal" rule that generates the
> cpio image.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> ---
> This, too, will be useful for the initramfs patch coming next.
> ---
>  linux/linux.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 316f973..864ccbf 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -392,7 +392,7 @@ $(eval $(kconfig-package))
>  # been generated in $(BINARIES_DIR)/rootfs.cpio.
>  $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed
>  $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_images_installed
> -$(LINUX_DIR)/.stamp_initramfs_rebuilt: $(BINARIES_DIR)/rootfs.cpio
> +$(LINUX_DIR)/.stamp_initramfs_rebuilt: rootfs-cpio

Are you sure this is OK ? It creates a dependency of a "real target" on
a "phony target", which means that the "real target" will *always* be
rebuilt, at every invocation of "make". Is this what we want?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

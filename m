From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 23:57:28 +0200
Subject: [Buildroot] [PATCH] boot-wrapper-aarch64: Allow users to
 specify an initrd/initramfs file.
In-Reply-To: <1475880304-21773-2-git-send-email-hollis_blanchard@mentor.com>
References: <1475880304-21773-1-git-send-email-hollis_blanchard@mentor.com>
 <1475880304-21773-2-git-send-email-hollis_blanchard@mentor.com>
Message-ID: <20161025235728.796804cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 7 Oct 2016 15:45:03 -0700, Hollis Blanchard wrote:
> Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
> ---
>  boot/boot-wrapper-aarch64/Config.in               |    8 ++++++++
>  boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk |    4 ++++
>  2 files changed, 12 insertions(+), 0 deletions(-)

Thanks for your patch, sorry for the somewhat slow reply.

> +config BR2_TARGET_BOOT_WRAPPER_AARCH64_RAMDISK
> +	string "Ramdisk"
> +	default ""

I would like this option to include the filesystem produced by
Buildroot (in cpio format) as the initramfs. So something like:

	bool "Include ramdisk in image"
	depends on BR2_TARGET_ROOTFS_CPIO

> +	help
> +	  Embed an initramfs file in the kernel image, and provide

It does not embed the initramfs in the kernel image, but in the boot
wrapper image.

> +	  linux,initrd-start and linux,initrd-end properties in the /chosen device
> +	  tree node.
> +
>  endif
> diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
> index c56bdee..28b2061 100644
> --- a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
> +++ b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
> @@ -30,6 +30,10 @@ BOOT_WRAPPER_AARCH64_CONF_OPTS = \
>  	--with-kernel-dir=$(LINUX_DIR) \
>  	--with-cmdline=$(BR2_TARGET_BOOT_WRAPPER_AARCH64_BOOTARGS)
>  
> +ifneq ($(BR2_TARGET_BOOT_WRAPPER_AARCH64_RAMDISK),)
> +	BOOT_WRAPPER_AARCH64_CONF_OPTS += --with-initrd=$(BR2_TARGET_BOOT_WRAPPER_AARCH64_RAMDISK)

Don't indent code inside conditions.

> +endif

It should be something like:

ifeq ($(BR2_TARGET_BOOT_WRAPPER_AARCH64_RAMDISK),y)
BOOT_WRAPPER_AARCH64_CONF_OPTS += --with-initrd=$(BINARIES_DIR)/rootfs.cpio
BOOT_WRAPPER_AARCH64_DEPENDENCIES += rootfs-cpio
endif

or something along those lines.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

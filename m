From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Jul 2014 19:35:03 +0200
Subject: [Buildroot] [PATCH v2] grub2: Specify boot partition
In-Reply-To: <1404210232-2185-1-git-send-email-jezz@sysmic.org>
References: <1404210232-2185-1-git-send-email-jezz@sysmic.org>
Message-ID: <20140701193503.1060e0aa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue,  1 Jul 2014 12:23:52 +0200, J?r?me Pouiller wrote:
> Since boot partition was not specified, grub tools try to detect it
> automatically. This patch add an option to force it.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Thanks, it works here. However, I have one suggestion below.

> +config BR2_TARGET_GRUB2_BOOT_PARTITION
> +	string "boot partition"
> +	default "(hd0,msdos1)"
> +	help
> +	  Specify the partition where the /boot/grub/grub.cfg is located.
> +	  Use (hd0,msdos1) for the first partition of the first disk if
> +	  using a legacy partition table, or (hd0,gpt1) if using GPT
> +	  partition table.

If we ask the user to include the parenthesis in this definition, then
the menuconfig vision of this option looks a bit weird, because string
options are already enclosed in parenthesis, so it looks like:

	((hd0,msdos1)) boot partition

In menuconfig. Maybe we should instead ask for the value without the
parenthesis, and add them in grub2.mk, so something like:

config BR2_TARGET_GRUB2_BOOT_PARTITION
	string "boot partition"
	default "hd0,msdos1"
	  Specify the partition where the /boot/grub/grub.cfg file is
	  located. Use 'hd0,msdos1' for the first partition of the
	  first disk if using a legacy partition table, or 'hd0,gpt1'
	  if using GPT partition table.

(Notice also that I added the word 'file' in the first sentence).

>  config BR2_TARGET_GRUB2_BUILTIN_MODULES
>  	string "builtin modules"
>  	default "boot linux ext2 fat part_msdos part_gpt normal biosdisk" if BR2_TARGET_GRUB2_I386_PC
> diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
> index 50f93ee..a686b5d 100644
> --- a/boot/grub2/grub2.mk
> +++ b/boot/grub2/grub2.mk
> @@ -11,9 +11,14 @@ GRUB2_LICENSE = GPLv3+
>  GRUB2_LICENSE_FILES = COPYING
>  GRUB2_DEPENDENCIES = host-bison host-flex
>  
> +GRUB2_BUILTIN_MODULES = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES))
> +GRUB2_BUILTIN_CONFIG = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_CONFIG))
> +GRUB2_BOOT_PARTITION = $(call qstrip,$(BR2_TARGET_GRUB2_BOOT_PARTITION))
> +
>  ifeq ($(BR2_TARGET_GRUB2_I386_PC),y)
>  GRUB2_IMAGE = $(BINARIES_DIR)/grub.img
>  GRUB2_CFG = $(TARGET_DIR)/boot/grub/grub.cfg
> +GRUB2_PREFIX = $(GRUB2_BOOT_PARTITION)/boot/grub

And then here, do:

# Yes, the partition specifier needs to be enclosed in parenthesis.
GRUB2_PREFIX = ($(GRUB2_BOOT_PARTITION))/boot/grub

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

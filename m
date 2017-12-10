From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Dec 2017 17:59:19 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: add config option for uboot
 environment padding byte
In-Reply-To: <1512924220-32621-1-git-send-email-johannes.schmitz1@gmail.com>
References: <1512924220-32621-1-git-send-email-johannes.schmitz1@gmail.com>
Message-ID: <20171210165919.GA3510@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johannes, All,

On 2017-12-10 17:43 +0100, Johannes Schmitz spake thusly:
> The size of the uboot environment as well as the padding bytes have to
> be exactly correct in order to generate an image with the correct CRC
> checksum that can be read by the target during boot. Hence add the
> option to specify the padding byte which is used by mkenvimage and
> updated the help texts to inform the user about the importance of these
> parameters.

As said on IRC, I would love to see more commit loges like this one: it
explains the problem, and how the patch solves it.

Yet, a few comments below...

> Signed-off-by: Johannes Schmitz <johannes.schmitz1@gmail.com>
> ---
>  boot/uboot/Config.in | 11 +++++++++--
>  boot/uboot/uboot.mk  | 10 ++++++----
>  2 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 8215912..b52fb81 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -400,8 +400,15 @@ config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
>  config BR2_TARGET_UBOOT_ENVIMAGE_SIZE
>  	string "Size of environment"
>  	help
> -	  Size of envronment, can be prefixed with 0x for hexadecimal
> -	  values.
> +	  Size of environment in bytes, can be prefixed with 0x for hexadecimal
> +	  values. Needs to match exactly for correct CRC checksum calculation.

Now you also state the size must be expressed in bytes, say so in the
commit log as well.

> +config BR2_TARGET_UBOOT_ENVIMAGE_PADDING_BYTE
> +	hex "Padding byte"
> +	default 0x00
> +	help
> +	  The byte used for padding at the end of the environment image.
> +	  Needs to be correct for correct CRC checksum calculation.
>  
>  config BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT
>  	bool "Environment has two copies"
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index a1fac7d..8796e8d 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -251,10 +251,12 @@ define UBOOT_INSTALL_IMAGES_CMDS
>  	)
>  	$(if $(BR2_TARGET_UBOOT_ENVIMAGE),
>  		cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) | \
> -			$(HOST_DIR)/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
> -			$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
> -			$(if $(filter BIG,$(BR2_ENDIAN)),-b) \
> -			-o $(BINARIES_DIR)/uboot-env.bin -)
> +			$(HOST_DIR)/bin/mkenvimage \
> +				$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
> +				$(if $(filter BIG,$(BR2_ENDIAN)),-b) \
> +				-p $(BR2_TARGET_UBOOT_ENVIMAGE_PADDING_BYTE) \
> +				-s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
> +				-o $(BINARIES_DIR)/uboot-env.bin -)

You re-indent here. State so in the commit log.

Otherwise, that's fine.

Of course, this conflicts with my own patch touching the same code, but
it's pretty obvious how to fix it then:
    https://patchwork.ozlabs.org/patch/846557/

Regards,
Yann E. MORIN.

>  	$(if $(BR2_TARGET_UBOOT_BOOT_SCRIPT),
>  		$(HOST_DIR)/bin/mkimage -C none -A $(MKIMAGE_ARCH) -T script \
>  			-d $(call qstrip,$(BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE)) \
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 6 Oct 2016 00:14:44 +0200
Subject: [Buildroot] [PATCH] boot/uboot: Fix SPL binary installation
In-Reply-To: <1475704096-22801-1-git-send-email-festevam@gmail.com>
References: <1475704096-22801-1-git-send-email-festevam@gmail.com>
Message-ID: <9743a2fb-a71d-0d4a-438a-86756522143b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-10-16 23:48, Fabio Estevam wrote:
> Commit fad58cefa4a392b ("boot/uboot: allow to build multiple U-Boot images")
> broke U-Boot SPL binary installation. Taking mx6cubox_defconfig target as an example:
> 
>   LD      u-boot
>   OBJCOPY u-boot-nodtb.bin
>   COPY    u-boot.bin
>   MKIMAGE u-boot.img
>>>> uboot 2016.09.01 Installing to target
>>>> uboot 2016.09.01 Installing to images directory
> cp -dpf /home/fabio/buildroot/output/build/uboot-2016.09.01/u-boot.bin /home/fabio/buildroot/output/images/
> cp -dpf /home/fabio/buildroot/output/build/uboot-2016.09.01/u-boot.img /home/fabio/buildroot/output/images/
> cp -dpf /home/fabio/buildroot/output/build/uboot-2016.09.01/SPL /home/fabio/buildroot/output/images/
> cp: cannot stat '/home/fabio/buildroot/output/build/uboot-2016.09.01/SPL': No such file or directory
> 
> Fix this problem by adding the SPL binary into UBOOT_BINS and UBOOT_MAKE_TARGET
> variables.

 It has been mentioned in a number of threads: a better solution is to always
'make all' in UBOOT_BUILD_CMDS. This will also allow to remove many of the
UBOOT_MAKE_TARGET assignments.

 It hasn't been done yet because such a change should be tested against all the
different U-Boot artefacts, and with different U-Boot versions.

 If you feel up to it and you make this change, please report which combinations
you have tested.


> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  boot/uboot/uboot.mk | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 7379a4d..237ef26 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -71,6 +71,11 @@ UBOOT_BINS += u-boot-dtb.img
>  UBOOT_MAKE_TARGET += all u-boot-dtb.img
>  endif
>  
> +ifeq ($(BR2_TARGET_UBOOT_SPL),y)
> +UBOOT_BINS += $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))

 This is a good idea, and should be done in a separate patch (independent of the
'make all' thing).

 Regards,
 Arnout

> +UBOOT_MAKE_TARGET += $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))
> +endif
> +
>  ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMG),y)
>  UBOOT_BINS += u-boot.img
>  UBOOT_MAKE_TARGET += u-boot.img
> @@ -201,11 +206,6 @@ define UBOOT_INSTALL_IMAGES_CMDS
>  	)
>  	$(if $(BR2_TARGET_UBOOT_FORMAT_NAND),
>  		cp -dpf $(@D)/u-boot.sb $(BINARIES_DIR))
> -	$(if $(BR2_TARGET_UBOOT_SPL),
> -		$(foreach f,$(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)), \
> -			cp -dpf $(@D)/$(f) $(BINARIES_DIR)/
> -		)
> -	)
>  	$(if $(BR2_TARGET_UBOOT_ENVIMAGE),
>  		cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) | \
>  			$(HOST_DIR)/usr/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

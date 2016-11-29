From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Nov 2016 23:01:40 +0100
Subject: [Buildroot] [PATCH 1/1] uboot: support -b option for mkenvimage
In-Reply-To: <1480445612-6188-1-git-send-email-tiago.brusamarello@datacom.ind.br>
References: <1480445612-6188-1-git-send-email-tiago.brusamarello@datacom.ind.br>
Message-ID: <dd9fbe4f-1e39-1140-18e5-7cff61b365e9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29-11-16 19:53, Tiago Brusamarello wrote:
> When generating the environment image the target endianess should
> be taken in account for CRC calculation purposes. For big endian
> targets the -b flag should be passed to the mkenvimage tool.
> 
> Signed-off-by: Tiago Brusamarello <tiago.brusamarello@datacom.ind.br>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 though I do have two minor nits.

> ---
>  boot/uboot/uboot.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 3e347c1..17b80cc 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -223,6 +223,7 @@ define UBOOT_INSTALL_IMAGES_CMDS
>  		cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) | \
>  			$(HOST_DIR)/usr/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
>  			$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
> +			$(if $(findstring "BIG", $(BR2_ENDIAN)),-b) \
                                                ^we don't put spaces macro calls

 Also, we usually use 'filter' rather than 'findstring' to emulate an ifeq in
$(if ...).


 Regards,
 Arnout

>  			-o $(BINARIES_DIR)/uboot-env.bin -)
>  endef
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

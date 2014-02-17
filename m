From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Feb 2014 23:25:43 +0100
Subject: [Buildroot] [PATCH 1/1] uboot: build custom target if custom
 target selected
In-Reply-To: <1392676369-19238-1-git-send-email-laurent.cans@gmail.com>
References: <1392676369-19238-1-git-send-email-laurent.cans@gmail.com>
Message-ID: <53028C67.5060802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/02/14 23:32, Laurent Cans wrote:
> When selecting custom uboot target the installation fail due to incorrect
> target built. So when configuring custom uboot target, build the target
> configured in buildroot configuration instead of legacy one.

 The problem is that this doesn't always work - sometimes the file you
want to use as the image is built as a side-effect of the default target
- this is e.g. the case for the SPL.

 So perhaps the solution is to add another config option to set the make
target.

 Regards,
 Arnout

> 
> Signed-off-by: Laurent Cans <laurent.cans@gmail.com>
> ---
>  boot/uboot/uboot.mk |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 2174584..3e16b7a 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -51,6 +51,7 @@ UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
>  UBOOT_DEPENDENCIES += host-elftosb
>  else ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM),y)
>  UBOOT_BIN          = $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
> +UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
>  else
>  UBOOT_BIN          = u-boot.bin
>  UBOOT_BIN_IFT      = $(UBOOT_BIN).ift
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

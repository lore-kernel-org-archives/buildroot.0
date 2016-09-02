From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 2 Sep 2016 09:13:07 +0200
Subject: [Buildroot] [PATCH 1/2] boot/uboot: add missing SPL build
 dependency
In-Reply-To: <1472741494-7043-2-git-send-email-brain@jikos.cz>
References: <1472741494-7043-1-git-send-email-brain@jikos.cz>
 <1472741494-7043-2-git-send-email-brain@jikos.cz>
Message-ID: <9e8b258d-39e7-1cd4-7530-e295ee7e09b6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-09-16 16:51, Petr Kulhavy wrote:
> If SPL installation is selected make does not always build the SPL binary.

 Please give a concrete example of this so people can verify.

> Add the SPL binary explicitly to the build command.
> 
> Signed-off-by: Petr Kulhavy <brain@jikos.cz>
> ---
>  boot/uboot/uboot.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 7c3512a..a62f7be 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -149,7 +149,7 @@ endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
>  define UBOOT_BUILD_CMDS
>  	$(TARGET_CONFIGURE_OPTS) 	\
>  		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) 		\
> -		$(UBOOT_MAKE_TARGET)
> +		$(UBOOT_MAKE_TARGET) $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))

 Unfortunately, this doesn't work for OMAP3. For OMAP3, the file to be copied is
"MLO", but it is not a target of the top-level Makefile. Instead, it is built
while recursing in the spl subdirectory.

 A workaround is to use two separate make invocations: the first one for the
normal build, the second one to build any additional SPL images. Since MLO
already exists during the second invocation, make won't complain anymore.

 Note BTW that the current situation is already broken for OMAP3 when using a
recent U-Boot. We only call the 'u-boot.img' target, and this _doesn't_ build
MLO. We should also 'make all'. I guess we don't do 'make all' to avoid doing
redundant work when SPL isn't required, but it's kind of useless :-)

 You can test with this defconfig:

BR2_arm=y
BR2_cortex_a8=y
BR2_ARM_EABI=y
BR2_ARM_FPU_VFPV3=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="omap3_evm"
BR2_TARGET_UBOOT_FORMAT_IMG=y
BR2_TARGET_UBOOT_SPL=y
BR2_TARGET_UBOOT_SPL_NAME="MLO"


 Regards,
 Arnout

>  	$(if $(BR2_TARGET_UBOOT_FORMAT_SD),
>  		$(@D)/tools/mxsboot sd $(@D)/u-boot.sb $(@D)/u-boot.sd)
>  	$(if $(BR2_TARGET_UBOOT_FORMAT_NAND),
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

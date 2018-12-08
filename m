From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Dec 2018 17:23:09 +0100
Subject: [Buildroot] [PATCH] boot/afboot-stm32: create destination
 directory during installation
In-Reply-To: <20181208141854.29144-1-thomas.petazzoni@bootlin.com>
References: <20181208141854.29144-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181208162309.GP2561@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-12-08 15:18 +0100, Thomas Petazzoni spake thusly:
> Following d0f4f95e390bcb1c953efa125f5277a8a235396e ("Makefile: rework
> main directory creation logic"), BINARIES_DIR is not implicitly
> created by the main Makefile at the beginning of the build, leaving
> that up to whatever piece of code needs to install something in
> $(BINARIES_DIR).
> 
> The afboot-stm32 package didn't pay attention to this, which this
> commit fixes.
> 
> While at it, we move the afboot-stm32 installation into
> <pkg>_INSTALL_IMAGES_CMDS, because using <pkg>_INSTALL_TARGET_CMDS to
> install only files to BINARIES_DIR is a bit strange.
> 
> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/131217111
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  boot/afboot-stm32/afboot-stm32.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/boot/afboot-stm32/afboot-stm32.mk b/boot/afboot-stm32/afboot-stm32.mk
> index 042b21fa55..5e221cf364 100644
> --- a/boot/afboot-stm32/afboot-stm32.mk
> +++ b/boot/afboot-stm32/afboot-stm32.mk
> @@ -6,13 +6,15 @@
>  
>  AFBOOT_STM32_VERSION = v0.1
>  AFBOOT_STM32_SITE = $(call github,mcoquelin-stm32,afboot-stm32,$(AFBOOT_STM32_VERSION))
> +AFBOOT_STM32_INSTALL_IMAGES = YES
> +AFBOOT_STM32_INSTALL_TARGET = NO
>  
>  define AFBOOT_STM32_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE=$(TARGET_CROSS) all
>  endef
>  
> -define AFBOOT_STM32_INSTALL_TARGET_CMDS
> -	$(INSTALL) -m 0755 $(@D)/stm32*.bin $(BINARIES_DIR)
> +define AFBOOT_STM32_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -m 0755 -t $(BINARIES_DIR) -D $(@D)/stm32*.bin
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.19.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

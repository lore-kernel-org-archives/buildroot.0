From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Sep 2018 21:04:03 +0200
Subject: [Buildroot] [PATCH 7/7 v4] boot/uboot: needs host-{flex,bison}
In-Reply-To: <ed63f1c812145907ef83c6bf245ad5765c67aded.1534522005.git.yann.morin.1998@free.fr>
References: <cover.1534522005.git.yann.morin.1998@free.fr>
 <ed63f1c812145907ef83c6bf245ad5765c67aded.1534522005.git.yann.morin.1998@free.fr>
Message-ID: <20180913210350.36ee310e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Aug 2018 18:06:53 +0200, Yann E. MORIN wrote:
> Recent U-Boot no longer ship the flex/bison generated kconfig parser, as
> of commit e91610da7c8a9fe42f3e5a75f06c3d1a0cb5f815 (kconfig: re-sync
> with Linux 4.17-rc4).
> 
> So, add the conditional kconfig dependencies, as we just did for the
> kernel.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  boot/uboot/uboot.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 04c759be34..bddafe234d 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -449,5 +449,8 @@ endif # BR2_TARGET_UBOOT && BR_BUILDING
>  ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY),y)
>  $(eval $(generic-package))
>  else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
> +UBOOT_KCONFIG_DEPENDENCIES = \
> +	$(BR2_BISON_HOST_DEPENDENCY) \
> +	$(BR2_FLEX_HOST_DEPENDENCY)
>  $(eval $(kconfig-package))
>  endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY

This commit doesn't work well, because even if you chose "legacy build
system", kconfig is used, and it tries to use bison.

Example configuration:

BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="mvebu_mcbin-88f8040"
BR2_TARGET_UBOOT_CUSTOM_VERSION=y
BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.09"

fails with:

>>> uboot 2018.09 Configuring
[...]
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  YACC    scripts/kconfig/zconf.tab.c
/bin/sh: 1: bison: not found
make[3]: *** [scripts/kconfig/zconf.tab.c] Error 127
make[3]: *** Waiting for unfinished jobs....
  LEX     scripts/kconfig/zconf.lex.c
/bin/sh: 1: flex: not found
make[3]: *** [scripts/kconfig/zconf.lex.c] Error 127
make[2]: *** [mvebu_mcbin-88f8040_config] Error 2
make[1]: *** [/home/test/outputs/mainline/build/uboot-2018.09/.stamp_configured] Error 2
make: *** [_all] Error 2

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

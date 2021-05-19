From: Eugen.Hristev at microchip.com <Eugen.Hristev@microchip.com>
Date: Wed, 19 May 2021 11:29:23 +0000
Subject: [Buildroot] [PATCH 3/3] boot/at91bootstrap3: add
 BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3
In-Reply-To: <20210518213749.144355-4-thomas.petazzoni@bootlin.com>
References: <20210518213749.144355-1-thomas.petazzoni@bootlin.com>
 <20210518213749.144355-4-thomas.petazzoni@bootlin.com>
Message-ID: <ebcdcf55-e613-6b37-0faa-26b3d548b5be@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5/19/21 12:37 AM, Thomas Petazzoni wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Some at91bootstrap3 configurations now use Python scripts on the host
> for NAND/PMEC related utilities. In order to be able to use those
> scripts, this commit adds a new
> BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3 which allows to express the
> need for host-python3 as a dependency to build at91bootstrap3.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> [Thomas: this was extracted from a patch from Eugen adding
> at91bootstrap 4.x support.]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>   boot/at91bootstrap3/Config.in         | 8 ++++++++
>   boot/at91bootstrap3/at91bootstrap3.mk | 4 ++++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
> index 18301a0dc0..966e393db5 100644
> --- a/boot/at91bootstrap3/Config.in
> +++ b/boot/at91bootstrap3/Config.in
> @@ -101,3 +101,11 @@ config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE
>            Path to the at91bootstrap3 configuration file
> 
>   endif # BR2_TARGET_AT91BOOTSTRAP3
> +
> +config BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3
> +       bool "needs host-python3"

Hi,

This prompt that appears in menuconfig is a bit unfriendly : it does not 
say who needs the host-python3, and it does not appear to be in the 
at91bootstrap3 -related options.
It is at the same indentation level as the other bootloaders, like 
Barebox, Grub, etc. So I think it's misleading and should be aligned 
with the other At91bootstrap options




> +       help
> +         Enable this option if the at91bootstrap build process needs
> +         Python 3.x to be available on the host. This is needed in
> +         some at91bootstrap configurations to use NAND/PMECC Python
> +         scripts.
> diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
> index fdd87591bb..48200b2b6e 100644
> --- a/boot/at91bootstrap3/at91bootstrap3.mk
> +++ b/boot/at91bootstrap3/at91bootstrap3.mk
> @@ -30,6 +30,10 @@ AT91BOOTSTRAP3_CPE_ID_PRODUCT = at91bootstrap
>   AT91BOOTSTRAP3_INSTALL_IMAGES = YES
>   AT91BOOTSTRAP3_INSTALL_TARGET = NO
> 
> +ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_NEEDS_PYTHON3),y)
> +AT91BOOTSTRAP3_DEPENDENCIES += host-python3
> +endif
> +
>   AT91BOOTSTRAP3_CUSTOM_PATCH_DIR = \
>          $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR))
> 
> --
> 2.31.1
> 

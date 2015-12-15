From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 23:03:51 +0100
Subject: [Buildroot] [PATCH v2] package/uclibc: Enable compile in thumb
 mode configuration option
In-Reply-To: <1450056520-18750-1-git-send-email-paul.enman@gmail.com>
References: <1449269795-17864-1-git-send-email-paul.enman@gmail.com>
 <1450056520-18750-1-git-send-email-paul.enman@gmail.com>
Message-ID: <20151215230351.5dc6e91d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul,

On Sun, 13 Dec 2015 19:28:40 -0600, Paul Enman wrote:
> From: penman <paul.enman@gmail.com>

This is still not good, it should be your full name here as well.

> 
> Signed-off-by: Paul Enman <paul.enman@gmail.com>
> ---
> 
> When buildroot is configured to build uClibc with thumb, it uses a workaround
>  for that relies on interworking between arm and thumb instructions and does
>  not set the config file to enable compile in thumb mode.
> 
> This patch enables buildroot to configure and compile uClibc in thumb mode.

Why do you put all these explanations after the "---" sign? They should
really be part of the commit log.

> 
>  arch/Config.in.arm       | 18 +++++++++---------
>  package/uclibc/uclibc.mk | 12 ++++++++++++
>  2 files changed, 21 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index 67ff384..2d318f2 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -374,6 +374,15 @@ config BR2_ARM_INSTRUCTIONS_ARM
>  	  This option instructs the compiler to generate regular ARM
>  	  instructions, that are all 32 bits wide.
>  
> +config BR2_ARM_INSTRUCTIONS_THUMB2
> +	bool "Thumb2"
> +	depends on BR2_ARM_CPU_HAS_THUMB2
> +	help
> +	  This option instructions the compiler to generate Thumb2
> +	  instructions, which allows to mix 16 bits instructions and
> +	  32 bits instructions. This generally provides a much smaller
> +	  compiled binary size.
> +
>  config BR2_ARM_INSTRUCTIONS_THUMB
>  	bool "Thumb"
>  	depends on BR2_ARM_CPU_HAS_THUMB
> @@ -389,15 +398,6 @@ comment "Thumb1 is not compatible with VFP"
>  	depends on BR2_ARM_CPU_HAS_THUMB
>  	depends on !BR2_ARM_SOFT_FLOAT
>  
> -config BR2_ARM_INSTRUCTIONS_THUMB2
> -	bool "Thumb2"
> -	depends on BR2_ARM_CPU_HAS_THUMB2
> -	help
> -	  This option instructions the compiler to generate Thumb2
> -	  instructions, which allows to mix 16 bits instructions and
> -	  32 bits instructions. This generally provides a much smaller
> -	  compiled binary size.

I don't understand why you are re-ordering the options here. Why are
you doing this?

> +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB2),y)
> +define UCLIBC_ARM_THUMB_CONFIG
> +	$(call KCONFIG_ENABLE_OPT,COMPILE_IN_THUMB_MODE,$(@D)/.config)

According to the help text of this uClibc option:

          Say 'y' here to force building uClibc in thumb mode.
          Say 'n' to use your compiler's default mode.

When you have BR2_ARM_INSTRUCTIONS_THUMB2, the compiler already
produces Thumb2 code by default, because the compiler is built with
--with-mode=thumb.

So could you be more specific on which cases this patch is fixing by
expanding the commit log?

> +	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_CONTEXT_FUNCS,$(@D)/.config)

What is the relation between this and Thumb ?

Also, note that there is already some Thumb-related stuff in uclibc.mk,
which precisely forces to *not* use Thumb (1):

# Thumb build is broken with threads, build in ARM mode
ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
UCLIBC_EXTRA_CFLAGS += -marm
endif

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

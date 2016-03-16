From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Mar 2016 00:01:20 +0100
Subject: [Buildroot] [PATCH 04/16] uclibc: Enable compile in thumb mode
 when selected
In-Reply-To: <1458164602-16983-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56E9E5C0.1020400@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/16/16 22:43, Thomas Petazzoni wrote:
> From: Paul Enman <paul.enman@gmail.com>
>
> Until now, when thumb was selected with threads, we were forcing ARM
> mode to be used, to workaround some problems building uClibc with
> threads in Thumb mode. Also, we were never enabling Thumb mode in
> uClibc when Thumb2 was selected in the configuration.
>
> Therefore, this commit updates the uclibc.mk logic to:
>
>   - Force ARM mode only when gcc 4.7 or 4.8 is selected with Thumb1 and
>     threads. We also explicitly disable COMPILE_IN_THUMB_MODE when we
>     fall in this situation. With newer gcc versions, starting 4.9, this
>     problem is fixed and we can build uClibc in Thumb1 mode.
>
>   - Enable COMPILE_IN_THUMB_MODE when Thumb1 or Thumb2 is selected. We
>     need to disable context functions since they don't build in Thumb
>     mode.
>
>   - Disable COMPILE_IN_THUMB_MODE explicitly otherwise.
>
> This allows to build a Thumb2 toolchain on ARMv7-M for example.

  Principle looks OK to me, but it will of course have to be reworked if you 
follow my suggestion os removing BR2_ARM_INSTRUCTIONS_THUMB2.

>
> Signed-off-by: Paul Enman <paul.enman@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   package/uclibc/uclibc.mk | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index 88a4a8c..ce706e0 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -75,9 +75,23 @@ define UCLIBC_ARM_ABI_CONFIG
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_EABI,$(@D)/.config)
>   endef
>
> -# Thumb build is broken with threads, build in ARM mode
> -ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
> +# Thumb1 build is broken with threads with old gcc versions (4.7 and
> +# 4.8). Since all cores supporting Thumb1 also support ARM, we use ARM
> +# code in this case.
> +ifeq ($(BR2_GCC_VERSION_4_7_X)$(BR2_GCC_VERSION_4_8_X):$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),y:yy)

  This would need to become something like

ifeq 
($(BR2_GCC_VERSION_4_7_X)$(BR2_GCC_VERSION_4_8_X):$(BR2_ARM_INSTRUCTIONS_THUMB):$(BR2_ARM_CPU_HAS_THUMB2):$(BR2_TOOLCHAIN_HAS_THREADS),y:y::y)

  But that is horrible, so some auxiliary variables should be introduced.

  Or actually, it could be

ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
ifeq 
($(BR2_GCC_VERSION_4_7_X)$(BR2_GCC_VERSION_4_8_X):$(BR2_ARM_CPU_HAS_THUMB2):$(BR2_TOOLCHAIN_HAS_THREADS),y::y)
...arm...
else
...thumb...
endif
else
...arm...
endif


  Regards,
  Arnout

>   UCLIBC_EXTRA_CFLAGS += -marm
> +define UCLIBC_ARM_THUMB_CONFIG
> +	$(call KCONFIG_DISABLE_OPT,COMPILE_IN_THUMB_MODE,$(@D)/.config)
> +endef
> +else ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_ARM_INSTRUCTIONS_THUMB2),y)
> +define UCLIBC_ARM_THUMB_CONFIG
> +	$(call KCONFIG_ENABLE_OPT,COMPILE_IN_THUMB_MODE,$(@D)/.config)
> +	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_CONTEXT_FUNCS,$(@D)/.config)
> +endef
> +else
> +define UCLIBC_ARM_THUMB_CONFIG
> +	$(call KCONFIG_DISABLE_OPT,COMPILE_IN_THUMB_MODE,$(@D)/.config)
> +endef
>   endif
>
>   ifeq ($(BR2_UCLIBC_ARM_BX),y)
> @@ -362,6 +376,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
>   	$(UCLIBC_ARC_TYPE_CONFIG)
>   	$(UCLIBC_ARC_PAGE_SIZE_CONFIG)
>   	$(UCLIBC_ARM_ABI_CONFIG)
> +	$(UCLIBC_ARM_THUMB_CONFIG)
>   	$(UCLIBC_ARM_BX_CONFIG)
>   	$(UCLIBC_MIPS_ABI_CONFIG)
>   	$(UCLIBC_MIPS_ISA_CONFIG)
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

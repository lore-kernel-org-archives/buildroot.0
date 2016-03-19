From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Mar 2016 16:47:17 +0100
Subject: [Buildroot] [PATCH v2 05/17] uclibc: remove USE_BX handling
In-Reply-To: <1458335299-27409-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458335299-27409-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56ED7485.8080907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/18/16 22:08, Thomas Petazzoni wrote:
> Now that uClibc is capable of figuring out by itself whether 'bx' can
> be used or not, we can simplify the logic in Buildroot.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  I verified that the other config symbols removed by the previous patch are not 
used in Buildroot.

  Regards,
  Arnout

> ---
>   package/uclibc/Config.in |  5 -----
>   package/uclibc/uclibc.mk | 11 -----------
>   2 files changed, 16 deletions(-)
>
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index 16bf89c..e722908 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -139,11 +139,6 @@ config BR2_UCLIBC_ARC_TYPE
>   	default "ARC_CPU_700"	if BR2_arc770d
>   	default "ARC_CPU_HS"	if BR2_archs38
>
> -config BR2_UCLIBC_ARM_BX
> -	bool
> -	depends on BR2_UCLIBC_TARGET_ARCH = "arm"
> -	default y if (BR2_ARM_CPU_HAS_THUMB || BR2_ARM_CPU_HAS_THUMB2)
> -
>   config BR2_UCLIBC_MIPS_ABI
>   	string
>   	depends on BR2_UCLIBC_TARGET_ARCH = "mips"
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index 88a4a8c..c981d80 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -80,16 +80,6 @@ ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
>   UCLIBC_EXTRA_CFLAGS += -marm
>   endif
>
> -ifeq ($(BR2_UCLIBC_ARM_BX),y)
> -define UCLIBC_ARM_BX_CONFIG
> -	$(call KCONFIG_ENABLE_OPT,USE_BX,$(@D)/.config)
> -endef
> -else
> -define UCLIBC_ARM_BX_CONFIG
> -	$(call KCONFIG_DISABLE_OPT,USE_BX,$(@D)/.config)
> -endef
> -endif
> -
>   endif # arm
>
>   #
> @@ -362,7 +352,6 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
>   	$(UCLIBC_ARC_TYPE_CONFIG)
>   	$(UCLIBC_ARC_PAGE_SIZE_CONFIG)
>   	$(UCLIBC_ARM_ABI_CONFIG)
> -	$(UCLIBC_ARM_BX_CONFIG)
>   	$(UCLIBC_MIPS_ABI_CONFIG)
>   	$(UCLIBC_MIPS_ISA_CONFIG)
>   	$(UCLIBC_SH_TYPE_CONFIG)
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Mar 2016 00:09:05 +0100
Subject: [Buildroot] [PATCH 05/16] uclibc: disable DOPIC on ARM noMMU
In-Reply-To: <1458164602-16983-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56E9E791.3090104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/16/16 22:43, Thomas Petazzoni wrote:
> As explained by Waldemar, enabling DOPIC in uClibc will lead to the
> creation of a Position Independent library. In turn, this will cause
> elf2flt to generate a "Has-PIC-GOT" flat binary, which doesn't work on
> ARM. In fact, elf2flt on ARM really except to have non-PIC code as
                                       ^^^^^^expects

> input, so we must disable DOPIC in the uClibc configuration.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   package/uclibc/uclibc.mk | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index ce706e0..d11c103 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -94,6 +94,14 @@ define UCLIBC_ARM_THUMB_CONFIG
>   endef
>   endif
>
> +ifeq ($(UCLIBC_TARGET_ARCH),arm)
> +ifeq ($(BR2_USE_MMU),)

  If elf2flt is the issue, wouldn't it make more sense to check for BINFMT_FLAT?

  Also, is it really only for arm that this issue exists? Custom xtensa is the 
only other one for which we build an internal toolchain, but I don't know if 
anybody ever tests it...


  Regards,
  Arnout

> +define UCLIBC_ARM_NOMMU
> +	$(call KCONFIG_DISABLE_OPT,DOPIC,$(@D)/.config)
> +endef
> +endif
> +endif
> +
>   ifeq ($(BR2_UCLIBC_ARM_BX),y)
>   define UCLIBC_ARM_BX_CONFIG
>   	$(call KCONFIG_ENABLE_OPT,USE_BX,$(@D)/.config)
> @@ -378,6 +386,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
>   	$(UCLIBC_ARM_ABI_CONFIG)
>   	$(UCLIBC_ARM_THUMB_CONFIG)
>   	$(UCLIBC_ARM_BX_CONFIG)
> +	$(UCLIBC_ARM_NOMMU)
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

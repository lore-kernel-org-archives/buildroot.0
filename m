From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Mar 2016 17:20:09 +0100
Subject: [Buildroot] [PATCH v2 08/17] uclibc: context functions are not
 Thumb-compatible
In-Reply-To: <1458335299-27409-9-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458335299-27409-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56ED7C39.6010104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/18/16 22:08, Thomas Petazzoni wrote:
> On Thumb1 platforms and Thumb2 platforms that support the ARM

  This sentence is a bit weird, unless you realise that we don't have any thumb1 
platforms that don't have ARM instructions.

> instructions set, there is no problem, as the context functions are
> built unconditionally in ARM mode.
>
> However, on Thumb2 platforms that only support the Thumb2 instruction
> set, the context functions cannot build as the assembler code is not
> Thumb-ready. Therefore, those functions must be disabled.

  It may be useful to note that this will break packages that rely on the 
context functions, so that these packages must be disabled for that architecture 
combination.

  BTW, for that reason, it may be better to create a Kconfig blind option to 
encode this situation.

  In summary, a better commit message could be:

uclibc: context functions are not Thumb-compatible

On platforms that do support the ARM instruction set, there is no problem, as 
the context functions are built unconditionally in ARM mode.

However, on platforms that only support the Thumb instruction set, the context 
functions cannot be built since the assembler code is not Thumb-ready. 
Therefore, these functions must be disabled. All Thumb1 platforms support ARM 
instructions, so this is only relevant for Thumb2 platforms (i.e., Cortex-M).

Note that some packages require the context functions, so these will fail to 
build on these platforms. Those will be handled in later patches.


  Regards,
  Arnout

>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   package/uclibc/uclibc.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index e3e45f7..4698132 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -88,6 +88,12 @@ define UCLIBC_ARM_BINFMT_FLAT
>   endef
>   endif
>
> +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB2):$(BR2_ARM_CPU_HAS_ARM),y:)
> +define UCLIBC_ARM_NO_CONTEXT_FUNCS
> +	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_CONTEXT_FUNCS,$(@D)/.config)
> +endef
> +endif
> +
>   endif # arm
>
>   #
> @@ -361,6 +367,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
>   	$(UCLIBC_ARC_PAGE_SIZE_CONFIG)
>   	$(UCLIBC_ARM_ABI_CONFIG)
>   	$(UCLIBC_ARM_BINFMT_FLAT)
> +	$(UCLIBC_ARM_NO_CONTEXT_FUNCS)
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

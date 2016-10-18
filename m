From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2016 20:59:08 +0200
Subject: [Buildroot] [PATCH 1/7] toolchain-wrapper: pass MIPS
 optimizations to TOOLCHAIN_WRAPPER_OPTS
In-Reply-To: <20161016170522.36074-1-Vincent.Riera@imgtec.com>
References: <20161016170522.36074-1-Vincent.Riera@imgtec.com>
Message-ID: <4f2ec66a-0587-2e27-6f6b-317f16e20c8e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Vincent,

On 16-10-16 19:05, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  toolchain/toolchain-wrapper.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
> index af39071..6e480e6 100644
> --- a/toolchain/toolchain-wrapper.mk
> +++ b/toolchain/toolchain-wrapper.mk
> @@ -12,9 +12,14 @@ endif
>  TOOLCHAIN_WRAPPER_ARGS = $($(PKG)_TOOLCHAIN_WRAPPER_ARGS)
>  TOOLCHAIN_WRAPPER_ARGS += -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
>  
> +# MIPS optimization flags
> +TOOLCHAIN_WRAPPER_MIPS_OPTS =

 This is not exactly what I meant, so I've sent a quick patch that does do what
I meant. Wait a little for Thomas to provide feedback on it, and then you can
include it in your series. For now I've marked the series as Superseded and
Changes Requested.

 Regards,
 Arnout

> +
>  # We create a list like '"-mfoo", "-mbar", "-mbarfoo"' so that each flag is a
>  # separate argument when used in execv() by the toolchain wrapper.
>  TOOLCHAIN_WRAPPER_OPTS = \
> +	$(foreach f,$(call qstrip,$(TOOLCHAIN_WRAPPER_MIPS_OPTS)),"$(f)"$(comma))
> +TOOLCHAIN_WRAPPER_OPTS += \
>  	$(foreach f,$(call qstrip,$(BR2_TARGET_OPTIMIZATION)),"$(f)"$(comma))
>  TOOLCHAIN_WRAPPER_ARGS += -DBR_ADDITIONAL_CFLAGS='$(TOOLCHAIN_WRAPPER_OPTS)'
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

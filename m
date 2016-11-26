From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 26 Nov 2016 11:47:39 +0100
Subject: [Buildroot] [PATCH] m68k: add special gcc flag to avoid ICE for
 coldfire
In-Reply-To: <20161126085144.GA23223@waldemar-brodkorb.de>
References: <20161126085144.GA23223@waldemar-brodkorb.de>
Message-ID: <30093dc7-15f9-144b-77c3-e5f2236019a4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-11-16 09:51, Waldemar Brodkorb wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/d47fa41aa860d82471b83ac90967d3a3dacd8611
>   http://autobuild.buildroot.net/results/a21de4747f40a5ce93108c8979fbc0277d040e79

 Did you test whether exception handling still works?

> 
> Requires this as prerequisite:
> http://patchwork.ozlabs.org/patch/683830/
> 
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

 Not sure if this warrants a Sob from me, but OK.

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> Tested-by: Waldemar Brodkorb <wbx@openadk.org>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  toolchain/toolchain-wrapper.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
> index c7b5019..463ba42 100644
> --- a/toolchain/toolchain-wrapper.mk
> +++ b/toolchain/toolchain-wrapper.mk
> @@ -9,6 +9,13 @@ else
>  TOOLCHAIN_WRAPPER_HASH_STYLE = both
>  endif
>  
> +TARGET_FLAGS += $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
> +
> +# Internal error, aborting at dw2gencfi.c:214 in emit_expr_encoded
> +ifeq ($(BR2_m68k_cf),y)
> +TARGET_FLAGS += -fno-dwarf2-cfi-asm
> +endif
> +
>  TOOLCHAIN_WRAPPER_ARGS = $($(PKG)_TOOLCHAIN_WRAPPER_ARGS)
>  TOOLCHAIN_WRAPPER_ARGS += -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

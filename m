From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 25 Nov 2016 01:26:15 +0100
Subject: [Buildroot] Analysis of autobuild failures 18-19/11
In-Reply-To: <e255545b-031a-486d-1203-5e4220ec9280@mind.be>
References: <40bbe29b-2601-f710-970c-065f0b2c639f@mind.be>
 <20161121112128.GP27313@waldemar-brodkorb.de>
 <44bda1d2-3859-54a7-0ffc-f4b193bfc3e8@mind.be>
 <20161123113702.GZ27313@waldemar-brodkorb.de>
 <e255545b-031a-486d-1203-5e4220ec9280@mind.be>
Message-ID: <20161125002615.GB18881@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
Arnout Vandecappelle wrote,

> 
> 
> On 23-11-16 12:37, Waldemar Brodkorb wrote:
> > Hi Arnout,
> > Arnout Vandecappelle wrote,
> > 
> >> On 21-11-16 12:21, Waldemar Brodkorb wrote:
> [snip]
> >>> With gcc -fno-dwarf2-cfi-asm we can disable the CFI generation and
> >>> at least fix the compile errors for those packages.
> >>>  
> >>> Not sure if it will break some exception handling in C++ code or if
> >>> it only disables the ability to debug the code.
> >>
> >>  If it doesn't break things (and you can do runtime test, right?), maybe we
> >> should just pass -fno-dwarf2-cfi-asm in the wrapper for coldfire?
> > 
> > I don't know the internals of the wrapper, could you suggest a
> > patch, then I can do some testing with either Qemu or some real
> > board.
> 
>  First apply http://patchwork.ozlabs.org/patch/683830/, then try this
> (completely untested, of course):
> 
> 
> diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
> index 88f743e..5dd8fb7 100644
> --- a/toolchain/toolchain-wrapper.mk
> +++ b/toolchain/toolchain-wrapper.mk
> @@ -11,6 +11,11 @@ endif
> 
>  TARGET_FLAGS += $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
> 
> +# Internal error, aborting at dw2gencfi.c:214 in emit_expr_encoded
> +ifeq ($(BR2_m68k_cf),y)
> +TARGET_FLAGS += -fno-dwarf2-cfi-asm
> +endif
> +
>  TOOLCHAIN_WRAPPER_ARGS = $($(PKG)_TOOLCHAIN_WRAPPER_ARGS)
>  TOOLCHAIN_WRAPPER_ARGS += -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
> 

Tested with various C++ apps in Qemu/m68k and didn't find a problem.
This would fix all the remaining m68k/coldfire autobuild failures we
have seen so far.

best regards
 Waldemar

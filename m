From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Sep 2018 09:49:54 +0200
Subject: [Buildroot] [PATCH 1/1] arch: add support for RISC-V 64-bit
 (riscv64) architecture
In-Reply-To: <de6c6241-cffd-e5b4-c25b-2849399fa3c1@mind.be>
References: <20180831091154.22530-1-mark.corbin@embecosm.com>
 <20180902214024.464f8a25@windsurf>
 <8e07a0c3-6132-c94c-5732-fc48339878bf@embecosm.com>
 <de6c6241-cffd-e5b4-c25b-2849399fa3c1@mind.be>
Message-ID: <20180904094954.0af85c8e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 4 Sep 2018 00:20:57 +0200, Arnout Vandecappelle wrote:

> >>> +config BR2_riscv64  
> 
>  Since the kernel uses "riscv" for both the 32- and 64-bit version, I'd prefer
> if we'd only have a single "riscv" architecture in Buildroot that will
> eventually cover the 32-bit version as well.
> 
>  So I'd call it "riscv" instead of "riscv64" everywhere. For now, you could add
> a blind (promptless) BR2_RISCV_64 option, which later can become part of a
> choice between 32-bit and 64-bit.
> 
>  However, this is unprecedented in Buildroot (right now all 64-bit architectures
> have a separate symbol) so the other developers may disagree. But for me,
> splitting all those architectures was a mistake (except for some, like arm64,
> which really are a different ISA).

I am fine with this proposal, especially if the kernel uses "riscv" for
both the 32 bit and 64 bit platforms.

Apparently, the architecture part of the tuple is going to be
different, but that's fine.

So, OK for BR2_riscv.

However Arnout, this means it's going to be handled different than x86.
For x86, we have separate i386 and x86-64 top-level architectures in
menuconfig, and then internally, we share the list of CPUs between
both. For RISC-V, you want a single top-level architecture, and a
sub-option to select between 32 and 64 bit.

But I'm fine with your proposal even with this slight inconsistency.

> >>> +config BR2_GCC_TARGET_ARCH
> >>> +#	Instruction set extension characters are appended by arch/arch.mk.riscv
> >>> +	default "rv64i"  
> 
>  I would construct the entire string in make, and leave the symbol undefined in
> .config.

Yes, agreed.

> > a) I guess that I will have to replace every existing BR2_GCC_TARGET_...
> > in the Buildroot configurations with the equivalent GCC_TARGET_... ?
> > This would cover a few packages and the external toolchain.  
> 
>  Yes (as Thomas wrote a few lines above).

Yes, the other places where BR2_GCC_TARGET_... are used should be
changed to use the new GCC_TARGET_... options.

> > b) Would it be reasonable to add quotes back to the various GCC_TARGET_
> > variables once the arch.mk.* files have been included? It seems to me
> > that the existing use of the BR2_GCC_TARGET_ variables expects them to
> > be quoted.  
> 
>  No. The convention is to always qstrip the .config variables, and add the
> quotes back where needed. This makes sure that even if you override the option
> on the command line, the quotes are there.
> 
>  That said, all GCC_TARGET_* variables *must* be either a single word or empty,
> so there is no need to add quotes.

ACK.

> >>> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> >>> index 75e8191f46..6798448bda 100644
> >>> --- a/toolchain/toolchain-buildroot/Config.in
> >>> +++ b/toolchain/toolchain-buildroot/Config.in
> >>> @@ -23,7 +23,7 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
> >>>  choice
> >>>  	prompt "C library"
> >>>  	default BR2_TOOLCHAIN_BUILDROOT_UCLIBC
> >>> -	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_powerpc64
> >>> +	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_powerpc64 || BR2_riscv64  
> >> Ditto: since only glibc is supported on riscv64, it will automatically
> >> be the default selection.  
> > I'll remove this too.  
> 
>  ... here it makes sense to have an explicit default.
> 
>  Indeed, for the binutils version, there is a natural order, and when the overal
> default changes to 2.31 we want riscv to follow. For the C library, however,
> there is no natural order, so (IMO) it makes sense to explicitly select a
> default. Indeed, we add an explicit default for uClibc even though it's the
> first option.
> 
>  Yes, glibc is the only possibility so a default isn't really needed. But if
> musl support is added (before uClibc support) then we do want an explicit
> default for glibc...
> 
>  Again, my colleagues may be of a different opinion. And it's mostly
> bikeshedding anyway.

I won't bikeshed the bikesheding, but I don't find these default very
useful, if only because they are not consistent.

Take BR2_nios2, it is only supported by glibc, but it isn't part of
this "select glibc if BR2_powerpc64". Ditto BR2_sparc64. Ditto
BR2_powerpc64le, etc.

I also believe there is a natural order in the C libraries:

 - uClibc is first, because that has traditionally been the default C
   library in Buildroot, so if it supports the currently selected
   architecture, it should be our default.

 - glibc, because it's otherwise the natural default.

 - musl, coming last, as an alternate option.

So to me, it's very much like the binutils version selection: there is
no need to have explicit "default", as they would be annoying to
maintain, as shown by the current inconsistencies.

> >> Provided this, I think we should not allow enabling/disabling RVA: we
> >> should assume it's always enabled.  
> > I will force the selection of RVA for now, but will still show it in the
> > architecture options. It is possible that it could be come optional at
> > some point in the future.  
> 
>  I would keep the option and make it blind (i.e. remove the prompt).
> 
>  Keep the conditions in the C library selection as well, of course. The comment
> will never be shown, but it's already there fo when the atomics extension does
> become optional.

Meh, I'm not so sure. Is it likely that glibc adds support for
platforms without the atomic operations ? I'm not so sure. So I'd
rather not support it all for now, and add it when/if that becomes
available.

Perhaps we could make the option visible, but forcefully selected by
the BR2_riscv option, so that in practice it cannot be disabled.

>  Speaking of which, what would be the effect of this atomics option on the
> _HAS_SYNC options?

Ah, that's a good point, all the BR2_TOOLCHAIN_HAS_SYNC_{1,2,4,8}
options need to be updated.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

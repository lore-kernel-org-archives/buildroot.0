From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Sep 2018 10:51:53 +0200
Subject: [Buildroot] [PATCH 1/1] arch: add support for RISC-V 64-bit
 (riscv64) architecture
In-Reply-To: <20180904094954.0af85c8e@windsurf>
References: <20180831091154.22530-1-mark.corbin@embecosm.com>
 <20180902214024.464f8a25@windsurf>
 <8e07a0c3-6132-c94c-5732-fc48339878bf@embecosm.com>
 <de6c6241-cffd-e5b4-c25b-2849399fa3c1@mind.be>
 <20180904094954.0af85c8e@windsurf>
Message-ID: <fd90a1b0-3bf4-d5fb-b320-87495d1f46e9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/09/2018 09:49, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 4 Sep 2018 00:20:57 +0200, Arnout Vandecappelle wrote:
> 
>>>>> +config BR2_riscv64  
>>
>>  Since the kernel uses "riscv" for both the 32- and 64-bit version, I'd prefer
>> if we'd only have a single "riscv" architecture in Buildroot that will
>> eventually cover the 32-bit version as well.
>>
>>  So I'd call it "riscv" instead of "riscv64" everywhere. For now, you could add
>> a blind (promptless) BR2_RISCV_64 option, which later can become part of a
>> choice between 32-bit and 64-bit.
>>
>>  However, this is unprecedented in Buildroot (right now all 64-bit architectures
>> have a separate symbol) so the other developers may disagree. But for me,
>> splitting all those architectures was a mistake (except for some, like arm64,
>> which really are a different ISA).
> 
> I am fine with this proposal, especially if the kernel uses "riscv" for
> both the 32 bit and 64 bit platforms.
> 
> Apparently, the architecture part of the tuple is going to be
> different, but that's fine.
> 
> So, OK for BR2_riscv.
> 
> However Arnout, this means it's going to be handled different than x86.
> For x86, we have separate i386 and x86-64 top-level architectures in
> menuconfig, and then internally, we share the list of CPUs between
> both. For RISC-V, you want a single top-level architecture, and a
> sub-option to select between 32 and 64 bit.

 Not just x86, also mips, powerpc and sparc (in the kernel it's one arch, in
Buildroot they are separate). But so I think it's a mistake of Buildroot to
treat these as separate. Just look at how often we have the same condition
repeated for the 32-bit and 64-bit variant of these architectures all over the
place.

 The same could be said about the endianness options BTW, but fortunately RISC-V
is always little-endian :-)


> But I'm fine with your proposal even with this slight inconsistency.
> 
[snip]
>>>> Ditto: since only glibc is supported on riscv64, it will automatically
>>>> be the default selection.  
>>> I'll remove this too.  
>>
>>  ... here it makes sense to have an explicit default.
>>
>>  Indeed, for the binutils version, there is a natural order, and when the overal
>> default changes to 2.31 we want riscv to follow. For the C library, however,
>> there is no natural order, so (IMO) it makes sense to explicitly select a
>> default. Indeed, we add an explicit default for uClibc even though it's the
>> first option.
>>
>>  Yes, glibc is the only possibility so a default isn't really needed. But if
>> musl support is added (before uClibc support) then we do want an explicit
>> default for glibc...
>>
>>  Again, my colleagues may be of a different opinion. And it's mostly
>> bikeshedding anyway.
> 
> I won't bikeshed the bikesheding, but I don't find these default very
> useful, if only because they are not consistent.

 Ah, indeed, it's not consistent. That's not good.

> Take BR2_nios2, it is only supported by glibc, but it isn't part of
> this "select glibc if BR2_powerpc64". Ditto BR2_sparc64. Ditto
> BR2_powerpc64le, etc.

 OK, so indeed if we don't want to add to the inconsistency, there should not be
a default.

> 
> I also believe there is a natural order in the C libraries:

 Fair enough.

 So, remove the explicit default after all.

> 
>  - uClibc is first, because that has traditionally been the default C
>    library in Buildroot, so if it supports the currently selected
>    architecture, it should be our default.
> 
>  - glibc, because it's otherwise the natural default.
> 
>  - musl, coming last, as an alternate option.
> 
> So to me, it's very much like the binutils version selection: there is
> no need to have explicit "default", as they would be annoying to
> maintain, as shown by the current inconsistencies.
> 
>>>> Provided this, I think we should not allow enabling/disabling RVA: we
>>>> should assume it's always enabled.  
>>> I will force the selection of RVA for now, but will still show it in the
>>> architecture options. It is possible that it could be come optional at
>>> some point in the future.  
>>
>>  I would keep the option and make it blind (i.e. remove the prompt).
>>
>>  Keep the conditions in the C library selection as well, of course. The comment
>> will never be shown, but it's already there fo when the atomics extension does
>> become optional.
> 
> Meh, I'm not so sure. Is it likely that glibc adds support for
> platforms without the atomic operations ? I'm not so sure. So I'd
> rather not support it all for now, and add it when/if that becomes
> available.

 I don't think it's likely that glibc will add support for non-atomic variants.
I do think it's likely that uClibc will do that. When uClibc for riscv is added
(and it supports non-atomic), we *do* want to see the comment for glibc.

 However, I'm going to back off from my earlier position. The rule in Buildroot
is: don't add anything that is not useful right away, only add it when it is
actually going to be used.

 The RVA option itself is used, but the comment isn't (it can never become
visible). So drop the comment.


> Perhaps we could make the option visible, but forcefully selected by
> the BR2_riscv option, so that in practice it cannot be disabled.

 Well, that was your original suggestion, and my suggestion was: make the option
invisible. I really don't see the point of a user-visible option that you can't
(de)select.

 Regards,
 Arnout


> 
>>  Speaking of which, what would be the effect of this atomics option on the
>> _HAS_SYNC options?
> 
> Ah, that's a good point, all the BR2_TOOLCHAIN_HAS_SYNC_{1,2,4,8}
> options need to be updated.
> 
> Best regards,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

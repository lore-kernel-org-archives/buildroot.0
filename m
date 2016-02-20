From: Jan Heylen <heyleke@gmail.com>
Date: Sat, 20 Feb 2016 10:34:42 +0100
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in: append endianness
 argument to TARGET_LD for MIPS
In-Reply-To: <56C4F70A.8060506@mind.be>
References: <1455728874-47789-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160217221313.439547e4@free-electrons.com>
 <56C4F70A.8060506@mind.be>
Message-ID: <CAGszK3iYC7MmwnNpqoSHBM7G3o-dpviq+x9yF+DcKtM7d1Sv_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 17, 2016 at 11:41 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 17-02-16 22:13, Thomas Petazzoni wrote:
>> Dear Vicente Olivert Riera,
>>
>> On Wed, 17 Feb 2016 17:07:53 +0000, Vicente Olivert Riera wrote:
>>> We don't use a wrapper for ld in Buildroot like we do for gcc, so when
>>> using ld for linking (instead of gcc) the process can fail if the
>>> appropriate arguments are not passed to it. For instance, this happens
>>> when building perf (Linux -> Linux Kernel Tools -> perf) for MIPS little
>>> endian, and this is how the error message looks like:
> [snip]
>>> +# Append the endianness argument to ld for MIPS architecture in order to
>>> +# avoid problems like this one when using ld instead of gcc for linking:
>>> +# mips-linux-gnu-ld: failed to merge target specific data of file foo.o
>>> +# mips-linux-gnu-ld: foo.o: compiled for a little endian system and
>>> +# target is big endian
>>> +ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
>>> +ifeq ($(BR2_ENDIAN),"BIG")
>>> +TARGET_LD += -EB
>>> +else
>>> +TARGET_LD += -EL
>>> +endif
>>> +endif
>>
>> This is really an horrible fix IMO. First because TARGET_LD is only
>> meant to contain the path to the linker, and not additional flags.
>> Additional flags should go in TARGET_LDFLAGS.
>>
>> And secondly because programs should not use ld directly for linking,
>> but gcc. Remember Vicente, you already fixed this issue in other
>> packages and the fix was to use gcc instead of ld.
>
>  So, are we really going to "fix" all packages that use ld directly? I don't see
> why a package shouldn't be allowed to call ld when it is really doing linking
> without any other toolchainy stuff.
>
>  LDFLAGS has a bit of the same problem: there will probably be packages that
> don't (completely) honour it.
>
>  For CFLAGS, that was the reason why we introduced the wrapper. So I think we
> should just add a wrapper for ld as well.
>
>  Ideally the ld wrapper and the gcc wrapper should be refactored into the same
> source file, but I think we could start out with separate sources and factor later.
>
>  Any takers?
>
>
>  Unless Vicente volunteers to work on an ld wrapper, I guess on the short term
> we should take patches like these. That said, it should really be passed through
> LDFLAGS and not LD itself.

Hi,

I'm following this discussion in the scope of this 'ld wrapper' in
toolchain-wrapper, as there are still other packages out there that
have this issue (e.g. Dmalloc using ld directly). Without proper
knowledge on what is the 'correct' way I saw also following (old)
comment I wanted to point to:

From: http://lists.busybox.net/pipermail/buildroot/2013-june/073430.html
On 6 June 2013, Markos Chandras <hwoarang@gentoo.org> wrote:
[snip]
> I am  inclined to say that binutils do not need to be changed, because
> you should never call the linker directly to do the linking (I recall
> directfb does that and fails with the same problem). You should be
> using gcc instead and it will pass all the appropriate linker flags to
> the linker. Such build systems need fixing instead of trying to
> workaround the problem in the toolchain.
>
> Having said that, the entire patchset [heyleke: topic was ld-toolchain-wrapper] could be seen as a temporary
> workaround for this problem. In the libiscsi case, I need to
> understand why libtool invokes the linker without the correct flags.
> If you try to compile a simple test program using the buildroot
> mip64-linux-gcc toolchain (pass -v as well) you will  notice that gcc
> passes -melf64btsmip correctly.

That  being said and pointed to, there is this old patchset from
Thomas Petazzoni on toolchain-wrapper for 'ld'. The  main principles
are not changes since the original patch, but toolchain-wrapper was
moved and other patches were added later, so I had to rework it a bit,
and tested it, it fixes the issue for mips and dmalloc package, the
original patch and discussion:
Http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/60942

Although it was reviewed back then, it looks like it never made into
the buildroot repository. As said, I've rebased and reworked it a bit,
I'll put it on the mailing list. But as said, I'm not saying it is the
'correct' or 'incorrect' way of fixing this mips-ld stuff, but it does
fix it for the way dmalloc's buildsystem is constructed (using ld
directly).

Best regards,

Jan

>
>  Regards,
>  Arnout
>
>>
>> Thomas
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

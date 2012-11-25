From: Ronny Meeus <ronny.meeus@gmail.com>
Date: Sun, 25 Nov 2012 18:23:08 +0100
Subject: [Buildroot] Passing arguments to the linker when external
 toolchain is used.
In-Reply-To: <50B15945.90300@mind.be>
References: <CAMJ=MEc1T6Uz2tLS3ybdp5hwv7zX15ufGYMVuAY7jOSA+U=sYg@mail.gmail.com>
 <50B15945.90300@mind.be>
Message-ID: <CAMJ=MEfp0Bevk141N4n8KAn2AzbRpEDfLX9513crSDLTxBKkwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 25, 2012 at 12:33 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 23/11/12 14:04, Ronny Meeus wrote:
>>
>> Hello
>>
>> I'm using buildroot to build an environment for MIPS (Cavium).
>> For this I use a 64 bit toolchain provided by Cavium as an external
>> toolchain.
>>
>> My buildroot configuration is as follows:
>> * Buildroot 2012.05
>> * Target Architecture: MIPS (big endian)
>> * Target Architecture Variant: mips 64
>> * Target ABI: n32
>> * glibc
>>
>> In my application we need to create partially linked objects that will
>> be linked together in a final link step.
>> I see that the correct options (ABI etc) are passed to the compiler
>> via the ext-toolchain-wrapper construction, but for the linker this
>> technique is not used. It is directly invoked without modifying the
>> command line. If I want to create this partially linked file, I need
>> to pass an extra option the linker to indicate that is needs to use
>> the N32 abi (-melf32btsmipn32).
>
>
>  First of all, I don't understand why ld needs any option that we normally
> pass to the compiler.  Do the -march, -mtune and -mfpu options even work
> in ld?

I think you miss-understood my mail.
The linker needs a different option (-melf32btsmipn32) while the
compiler needs -march, -mtune and -mfpu etc.
For the compiler there is no issue, it is the linker for which no
options are passed.

If you look to the changes I made to the wrapper, you can see that a
completely different set of options can be passed to the linker. The
compiler options are passed to the compiler while a different set of
options is passed to the linker.

>  That said, if you do need the CFLAGS, then perhaps you should use
> '$(CC) -nostdlib' rather than $(LD) (and of course pass ld-specific
> options using -Wl,...).
>
>>
>> To make this work, I needed to make 2 changes:
>> - make the linker a link to the ext-toolchain-wrapper
>> - change the ext-toolchain-wrapper so that it passes to options to the
>> linker (currently the option is hardcoded but this needs to be changed
>> so that the BR2_TARGET_LDFLAGS are used.
>
>
>  Since not all gcc flags are supported by ld, I think it should be a
> separate toolchain wrapper, specific for ld.  It can be generated from
> the same source code, though (using ifdefs).
>

That is also an option. In my code I look to the name of the program
that is executed, so at runtime the wrapper determines which set of
options need to be used.

>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

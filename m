From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 06 Feb 2014 18:52:07 +0100
Subject: [Buildroot] Undo [PATCH v2] Mark MIPS I, II,
	III and IV as deprecated
In-Reply-To: <52F2C536.3060305@gentoo.org>
References: <52F1B282.1040106@gentoo.org> <52F2A4A3.4080602@mind.be>
 <52F2C536.3060305@gentoo.org>
Message-ID: <52F3CBC7.4000908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/02/14 00:11, Joshua Kinard wrote:
> On 02/05/2014 3:52 PM, Arnout Vandecappelle wrote:
>> On 05/02/14 04:39, Joshua Kinard wrote:
[snip]
>>> Does deprecation imply removal at some point in the future?  I'd argue in
>>> favour of keeping them around, but either restricting them to a
>>> machine-specific build (such as creating a sub-family for SGI systems and
>>> setting them there), and keeping the new defaults for mips/mipsel at
>>> mips32/mips64 ISAs.
>>
>>  The reason that we mark it as deprecated is to indicate that we intend
>> to remove it, but to give people the chance to react on it. If you are
>> interested in keeping this architecture alive and to provide patches for
>> it, then we can un-deprecate it.
>>
>>  To continue maintaining this architecture, we need someone who:
>>
>> - can suggest a few good toolchain defconfigs to be used in the autobuilders;
>>
>> - can provide patches for autobuilder failures;
>>
>> - can occasionally do run-time testing on real hardware to check if it
>> actually works.
>>
>>  So, Joshua, are you game?
> 
> Forgive me on my lack of knowledge on the history of the MIPS-I through
> MIPS-IV issues with regards to buildroot, but technically, maintaining this
> arch (really ISA) shouldn't be all that problematic.  The MIPS-I through
> MIPS-IV ISAs are the parents of the mips32r*/mips64r* ISAs, so
> theoretically, one should be able to compile buildroot w/ MIPS-I and it
> should run, albeit w/ reduced performance, on virtually any MIPS platform
> that currently exists.

 Not so, because there are quite a few packages that use assembly with
newer ISA for things like atomics, userspace mutexes, etc.

> 
> I've primarily stuck w/ SGI's systems, so I haven't ventured out into the
> newer MIPS ISAs, 

 Don't worry about the newer ISA's, our friends at imgtec are dealing
with those.


> but selecting, say, MIPS-IV in menuconfig is basically just
> saying the minimum CPU requirement for the generated code is that of SGI's
> R8000 processor (which originally defined the MIPS-IV ISA back in the
> 1990's).  That code should run on everything from an R5000 up to the latest
> 64bit MIPS processor.

... but packages that use assembly for the latest 64bit MIPS processor
will not run or even build on the R8000.

>  So if I cooked up a netboot rootfs that boots and
> runs on my O2, anyone else on this list running a 64bit MIPS CPU should be
> able to bundle the same rootfs into a netboot kernel for their platform and
> it run as well.
> 
> What are some of the issues encountered in the past (outside of the obvious
> linker mismatches that I ran into) that triggered the original deprecation
> patch?  I admit that my knowledge is probably dated, so some pointers to
> help me better understand the problem that the deprecation patch tries to
> solve would be greatly appreciated.

 I think mainly new packages that don't support these old architectures.
So maintaining an old architecture is mainly a matter of marking packages
as not supported on it. grep for BR2_avr32 in the packages directory and
you'll get an idea.

> 
> 
> Right now, in menuconfig, the "Target Architecture Variant" for MIPS
> platforms is just a flat list of the various ISAs, and I suspect this
> creates the conflict/confusion that may have caused people build errors in
> the past.  Understanding the differences in the various MIPS ISAs can be
> challenging sometimes, and even some of SGI's own documentation on this
> topic contradicted itself in the past.  I think it really should be a
> tree-like selection, such that if mips32r2 is selected, it also implies MIPS-II:

 But that is not true: a rootfs built for mips32r2 will not run on MIPS-II.


> MIPS-I (32bit, R2000/R3000)
>   |
>   |-MIPS-II (32bit, R6000)
>       |-mips32r1
>       |   |-mips32r2
>       |
>     MIPS-III (64bit, R4x00)
>       |
>     MIPS-IV (64bit, R8000/R5000/RM7000/R1x000+)
>       |-mips64r1
>           |-mips64r2
> 
> Problem is, I don't think menuconfig has the ability to do that type of
> layout in the "select 1 from the group" choice menu it currently offers for
> this subitem.  If it can, that'd be the approach I'd use for this menu item,
> as well as providing help text so that users can be guided into selecting
> the correct ISA for their target platform.

 You could have a first choice that selects MIPS-I/II/III/IV, and a
second choice that selects the variant within the subarchitecture.
However, with only 8 options I don't see much point. Reordering so that
the mips32 options come before MIPS-III does seem like a good idea though.

 I would BTW keep the variants that you don't have an immediate use for
deprecated. So perhaps keep only MIPS-IV, if that's what you need.

> 
> 
>>  If yes, please provide a patch that removes the deprecation for MIPS III
>> and IV, and try if you actually build and run a useful system. It's
>> probably also a good idea if you can immediately run-time test some of
>> the tricky packages (libffi, libglib2, python, perl, lua).
> 
> Currently, my initial build attempts have all been cross-compiles on my
> amd64 machine.  My SGI O2 only has a 350MHz CPU in it (the fastest currently
> supported by Linux for that machine), so it'd take a few days for a full
> build I figure.  Mostly because of gcc (16+ hours for 4.8.x these days, and
> it goes up every new version).  My build also targets a headless, or at
> least, a configuration w/o X11, due to size limits on the kernel image that
> this machine can successfully netboot.

 We're obviously talking about cross-compiling, that's the only thing
that buildroot can do. And headless is not an issue either - buildroot
anyway doesn't provide a desktop environment.

> 
> As far as patches, I can probably work something up.  However, I am not
> familiar with buildroot's source tree, submission process, guidelines, code
> style, etc, so anything I submit would need many eyeballs.  I played with it
> for a few days on the 2013.05 release, before the deprecation patch was
> added, and then switched to other priorities.  I just got back around to
> trying it again last weekend, when I ran into the problem that spurred this
> thread.

 The manual is in pretty good shape, with extensive submission
guidelines. With your gentoo background I'm sure you'll get the hang of
it quickly.


 Regards,
 Arnout

> 
> Thanks!
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 880 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140206/fe4b48be/attachment.asc>

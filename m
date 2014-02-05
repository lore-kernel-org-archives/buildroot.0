From: Joshua Kinard <kumba@gentoo.org>
Date: Wed, 05 Feb 2014 18:11:50 -0500
Subject: [Buildroot] Undo [PATCH v2] Mark MIPS I, II,
	III and IV as deprecated
In-Reply-To: <52F2A4A3.4080602@mind.be>
References: <52F1B282.1040106@gentoo.org> <52F2A4A3.4080602@mind.be>
Message-ID: <52F2C536.3060305@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/05/2014 3:52 PM, Arnout Vandecappelle wrote:
> On 05/02/14 04:39, Joshua Kinard wrote:
>> Per this thread/patch here:
>> http://lists.busybox.net/pipermail/buildroot/2013-November/082976.html
>>
>> I'd like to point out that these CPU ISAs are not completely "deprecated"
>> nor rare.  Well, MIPS-I and MIPS-II might be "rare", but MIPS-III and
>> MIPS-IV are the minimum required ISAs for old SGI systems, which are most
>> plentiful on eBay.  Gentoo and Debian support Indy, Indigo2, and O2-based
>> systems, most of which need MIPS-IV (the R4x00 Indy's and I2's need MIPS-III
>> at a minimum).
>>
>> I've been looking at buildroot as a way to quickly generate a working root
>> filesystem for netboot images, but I ran into a side-effect of this patch
>> when building 'attr':
>>
>> /usr/space/buildroot/buildroot-2013.11/output/host/usr/lib/gcc/mips-buildroot-linux-uclibc/4.8.2/../../../../mips-buildroot-linux-uclibc/bin/ld:
>> /tmp/ccHuCGCg.o: linking mips:8000 module with previous mips:isa32 modules
>>
>> /usr/space/buildroot/buildroot-2013.11/output/host/usr/lib/gcc/mips-buildroot-linux-uclibc/4.8.2/../../../../mips-buildroot-linux-uclibc/bin/ld:
>> failed to merge target specific data of file /tmp/ccHuCGCg.o
>>
>> I was passing '-march=mips4' to the build, which resulted in the error.
>> After finding this patch, activating BR2_DEPRECATED, and selecting "mips
>> iv", the build completed fine.
>>
>> Does deprecation imply removal at some point in the future?  I'd argue in
>> favour of keeping them around, but either restricting them to a
>> machine-specific build (such as creating a sub-family for SGI systems and
>> setting them there), and keeping the new defaults for mips/mipsel at
>> mips32/mips64 ISAs.
> 
>  The reason that we mark it as deprecated is to indicate that we intend
> to remove it, but to give people the chance to react on it. If you are
> interested in keeping this architecture alive and to provide patches for
> it, then we can un-deprecate it.
> 
>  To continue maintaining this architecture, we need someone who:
> 
> - can suggest a few good toolchain defconfigs to be used in the autobuilders;
> 
> - can provide patches for autobuilder failures;
> 
> - can occasionally do run-time testing on real hardware to check if it
> actually works.
> 
>  So, Joshua, are you game?

Forgive me on my lack of knowledge on the history of the MIPS-I through
MIPS-IV issues with regards to buildroot, but technically, maintaining this
arch (really ISA) shouldn't be all that problematic.  The MIPS-I through
MIPS-IV ISAs are the parents of the mips32r*/mips64r* ISAs, so
theoretically, one should be able to compile buildroot w/ MIPS-I and it
should run, albeit w/ reduced performance, on virtually any MIPS platform
that currently exists.

I've primarily stuck w/ SGI's systems, so I haven't ventured out into the
newer MIPS ISAs, but selecting, say, MIPS-IV in menuconfig is basically just
saying the minimum CPU requirement for the generated code is that of SGI's
R8000 processor (which originally defined the MIPS-IV ISA back in the
1990's).  That code should run on everything from an R5000 up to the latest
64bit MIPS processor.  So if I cooked up a netboot rootfs that boots and
runs on my O2, anyone else on this list running a 64bit MIPS CPU should be
able to bundle the same rootfs into a netboot kernel for their platform and
it run as well.

What are some of the issues encountered in the past (outside of the obvious
linker mismatches that I ran into) that triggered the original deprecation
patch?  I admit that my knowledge is probably dated, so some pointers to
help me better understand the problem that the deprecation patch tries to
solve would be greatly appreciated.


Right now, in menuconfig, the "Target Architecture Variant" for MIPS
platforms is just a flat list of the various ISAs, and I suspect this
creates the conflict/confusion that may have caused people build errors in
the past.  Understanding the differences in the various MIPS ISAs can be
challenging sometimes, and even some of SGI's own documentation on this
topic contradicted itself in the past.  I think it really should be a
tree-like selection, such that if mips32r2 is selected, it also implies MIPS-II:

MIPS-I (32bit, R2000/R3000)
  |
  |-MIPS-II (32bit, R6000)
      |-mips32r1
      |   |-mips32r2
      |
    MIPS-III (64bit, R4x00)
      |
    MIPS-IV (64bit, R8000/R5000/RM7000/R1x000+)
      |-mips64r1
          |-mips64r2

Problem is, I don't think menuconfig has the ability to do that type of
layout in the "select 1 from the group" choice menu it currently offers for
this subitem.  If it can, that'd be the approach I'd use for this menu item,
as well as providing help text so that users can be guided into selecting
the correct ISA for their target platform.


>  If yes, please provide a patch that removes the deprecation for MIPS III
> and IV, and try if you actually build and run a useful system. It's
> probably also a good idea if you can immediately run-time test some of
> the tricky packages (libffi, libglib2, python, perl, lua).

Currently, my initial build attempts have all been cross-compiles on my
amd64 machine.  My SGI O2 only has a 350MHz CPU in it (the fastest currently
supported by Linux for that machine), so it'd take a few days for a full
build I figure.  Mostly because of gcc (16+ hours for 4.8.x these days, and
it goes up every new version).  My build also targets a headless, or at
least, a configuration w/o X11, due to size limits on the kernel image that
this machine can successfully netboot.

As far as patches, I can probably work something up.  However, I am not
familiar with buildroot's source tree, submission process, guidelines, code
style, etc, so anything I submit would need many eyeballs.  I played with it
for a few days on the 2013.05 release, before the deprecation patch was
added, and then switched to other priorities.  I just got back around to
trying it again last weekend, when I ran into the problem that spurred this
thread.

Thanks!

-- 
Joshua Kinard
Gentoo/MIPS
kumba at gentoo.org
4096R/D25D95E3 2011-03-28

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 834 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140205/784f977a/attachment-0001.asc>

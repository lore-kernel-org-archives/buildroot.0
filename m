From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Feb 2014 21:52:51 +0100
Subject: [Buildroot] Undo [PATCH v2] Mark MIPS I, II,
	III and IV as deprecated
In-Reply-To: <52F1B282.1040106@gentoo.org>
References: <52F1B282.1040106@gentoo.org>
Message-ID: <52F2A4A3.4080602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/14 04:39, Joshua Kinard wrote:
> Per this thread/patch here:
> http://lists.busybox.net/pipermail/buildroot/2013-November/082976.html
> 
> I'd like to point out that these CPU ISAs are not completely "deprecated"
> nor rare.  Well, MIPS-I and MIPS-II might be "rare", but MIPS-III and
> MIPS-IV are the minimum required ISAs for old SGI systems, which are most
> plentiful on eBay.  Gentoo and Debian support Indy, Indigo2, and O2-based
> systems, most of which need MIPS-IV (the R4x00 Indy's and I2's need MIPS-III
> at a minimum).
> 
> I've been looking at buildroot as a way to quickly generate a working root
> filesystem for netboot images, but I ran into a side-effect of this patch
> when building 'attr':
> 
> /usr/space/buildroot/buildroot-2013.11/output/host/usr/lib/gcc/mips-buildroot-linux-uclibc/4.8.2/../../../../mips-buildroot-linux-uclibc/bin/ld:
> /tmp/ccHuCGCg.o: linking mips:8000 module with previous mips:isa32 modules
> 
> /usr/space/buildroot/buildroot-2013.11/output/host/usr/lib/gcc/mips-buildroot-linux-uclibc/4.8.2/../../../../mips-buildroot-linux-uclibc/bin/ld:
> failed to merge target specific data of file /tmp/ccHuCGCg.o
> 
> I was passing '-march=mips4' to the build, which resulted in the error.
> After finding this patch, activating BR2_DEPRECATED, and selecting "mips
> iv", the build completed fine.
> 
> Does deprecation imply removal at some point in the future?  I'd argue in
> favour of keeping them around, but either restricting them to a
> machine-specific build (such as creating a sub-family for SGI systems and
> setting them there), and keeping the new defaults for mips/mipsel at
> mips32/mips64 ISAs.

 The reason that we mark it as deprecated is to indicate that we intend
to remove it, but to give people the chance to react on it. If you are
interested in keeping this architecture alive and to provide patches for
it, then we can un-deprecate it.

 To continue maintaining this architecture, we need someone who:

- can suggest a few good toolchain defconfigs to be used in the autobuilders;

- can provide patches for autobuilder failures;

- can occasionally do run-time testing on real hardware to check if it
actually works.

 So, Joshua, are you game?

 If yes, please provide a patch that removes the deprecation for MIPS III
and IV, and try if you actually build and run a useful system. It's
probably also a good idea if you can immediately run-time test some of
the tricky packages (libffi, libglib2, python, perl, lua).


 Regards,
 Arnout

> 
> Thanks!,
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140205/dba3efe5/attachment.asc>

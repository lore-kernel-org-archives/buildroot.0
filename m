From: Joshua Kinard <kumba@gentoo.org>
Date: Tue, 04 Feb 2014 22:39:46 -0500
Subject: [Buildroot] Undo [PATCH v2] Mark MIPS I, II,
	III and IV as deprecated
Message-ID: <52F1B282.1040106@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Per this thread/patch here:
http://lists.busybox.net/pipermail/buildroot/2013-November/082976.html

I'd like to point out that these CPU ISAs are not completely "deprecated"
nor rare.  Well, MIPS-I and MIPS-II might be "rare", but MIPS-III and
MIPS-IV are the minimum required ISAs for old SGI systems, which are most
plentiful on eBay.  Gentoo and Debian support Indy, Indigo2, and O2-based
systems, most of which need MIPS-IV (the R4x00 Indy's and I2's need MIPS-III
at a minimum).

I've been looking at buildroot as a way to quickly generate a working root
filesystem for netboot images, but I ran into a side-effect of this patch
when building 'attr':

/usr/space/buildroot/buildroot-2013.11/output/host/usr/lib/gcc/mips-buildroot-linux-uclibc/4.8.2/../../../../mips-buildroot-linux-uclibc/bin/ld:
/tmp/ccHuCGCg.o: linking mips:8000 module with previous mips:isa32 modules

/usr/space/buildroot/buildroot-2013.11/output/host/usr/lib/gcc/mips-buildroot-linux-uclibc/4.8.2/../../../../mips-buildroot-linux-uclibc/bin/ld:
failed to merge target specific data of file /tmp/ccHuCGCg.o

I was passing '-march=mips4' to the build, which resulted in the error.
After finding this patch, activating BR2_DEPRECATED, and selecting "mips
iv", the build completed fine.

Does deprecation imply removal at some point in the future?  I'd argue in
favour of keeping them around, but either restricting them to a
machine-specific build (such as creating a sub-family for SGI systems and
setting them there), and keeping the new defaults for mips/mipsel at
mips32/mips64 ISAs.

Thanks!,

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140204/786b0989/attachment.asc>

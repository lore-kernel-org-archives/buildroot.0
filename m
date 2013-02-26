From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Feb 2013 20:03:02 +0100
Subject: [Buildroot] Proposed util-linux split
In-Reply-To: <512D01CB.3040301@zacarias.com.ar>
References: <512C941A.1070207@zacarias.com.ar> <20130226193330.04f77759@skate>
 <512D01CB.3040301@zacarias.com.ar>
Message-ID: <20130226200302.31af2041@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 26 Feb 2013 15:41:15 -0300, Gustavo Zacarias wrote:

> > Of course, only the util-linux programs that actually need PAM support
> > should make this library become a dependency of util-linux.
> 
> That wouldn't be hard, howerver we'll loose the busybox login
> alternative for cases without PAM.

People wanting lightweight stuff will use Busybox, so I think it's
fine. And as said on IRC, if someone wants to use login utils from
util-linux without PAM, then that someone should go upstream and fix
this.

> > Would it be possible instead that util-linux always uses the libuuid
> > from the libuuid package?
> 
> Not without heavy patching which doesn't look so simple for 2.22+ that
> did a big rewrite in the autotools fu.

Ok, then I think I would really prefer to keep a single package.

> That's what my previous util-linux patch did, however if we upgrade to
> newer (2.22+) util-linux the old trick (make -C libxxx) doesn't work any
> longer and needs patching anyway (it uses "automodules", hence no
> regular Makefile for the subdirs, those are included from the top Makefile).
> The patch isn't too straightforward since i remove the automodules
> includes, hence not very nice for dynamic patching via sed.
> The alternative would be to remove stuff we always build since
> util-linux always installs a basic set of utilities that can't be
> disabled (and remember, no install-libuuid or anything similar as
> targets, they're all pushed into a big variable with no useful naming by
> the automodules mechanism).

After:

./configure --disable-libblkid --disable-libmount
--disable-deprecated-mount --disable-mount --disable-losetup
--disable-fsck --disable-partx --disable-uuidd --disable-mountpoint
--disable-fallocate --disable-unshare --disable-arch --disable-ddate
--disable-eject --disable-agetty --disable-cramfs --disable-switch_root
--disable-pivot_root --disable-kill --disable-last --disable-utmpdump
--disable-line --disable-mesg --disable-raw --disable-rename
--disable-reset --disable-vipw --disable-newgrp --disable-chfn-chsh
--disable-sulogin --disable-su --disable-schedutils --disable-wall

The build takes:

real    0m11.406s
user    0m35.654s
sys     0m4.528s

on my laptop. It certainly builds and installs a bunch more crap than
just libuuid, but it's not too bad.

Another solution is to apply the attached patch, and use the
--disable-allprogs option. Then, it builds and installs only libuuid.
It then takes:

real	0m3.209s
user	0m8.333s
sys	0m1.196s

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: util-linux-01-dont-build-anything.patch
Type: text/x-patch
Size: 3360 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130226/6cf0518d/attachment.bin>

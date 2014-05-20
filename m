From: Dan Moulding <dan.moulding@rackwareinc.com>
Date: Tue, 20 May 2014 15:33:42 -0600 (MDT)
Subject: [Buildroot] mdev without devtmpfs
Message-ID: <1400621622.414928366@apps.rackspace.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all, sorry for bringing up this boring old topic -- yet again.

In reading the buildroot manual and reading old messages on the mailing list, it seems the current consensus is that, from the perspective of buildroot, if you want to use mdev for automatic /dev management, then you must also use devtmpfs (which requires that the kernel support devtmpfs).

I have to be able to support ancient kernels that don't know anything about devtmpfs. In researching the actual requirements for mdev, it seems that mdev does not really require devtmpfs. Looking at the source for mdev, as far as I can tell, it only requires a working sysfs[1]. So, the imposition of the devtmpfs requirement to use mdev in buildroot is maybe a bit artificial. Also, "mdev -s" (which gets run by the S10mdev init script) does effectively the same thing that devtmpfs does: it populates the /dev directory automatically using information gleaned from the kernel's knowledge of currently attached devices. In some ways, running both devtmpfs and mdev is redundant, though mdev does permissions management and maybe a few other things that devtmpfs by itself does not do.

In one of my particular cases, I get an error during init inside an initramfs built with buildroot because the very first thing init tries to do is mount devtmpfs (which my ancient kernel doesn't and cannot support). It's not a huge problem, I know that it's a bogus error that I needn't worry about, but I also know that questions have been asked about this error message on this very mailing list before[2].

In another case that I have, I am running a newer kernel and have a different problem stemming from this. The newer kernel does support devtmpfs, so the first thing that init does is overmount the existing /dev with devtmpfs. But I have some statically defined files already in /dev (from an overlay) that then become unavailable. In this system, I really don't need devtmpfs and am happy to simply disable it and let mdev do all the work, which it is doing just fine.

Long story short, buildroot seems to really want me to use devtmpfs even though I don't need it and don't particularly want it, because using mdev by itself is just simpler for me. I was wondering if trying to force devtmpfs to be used with mdev is really the right choice. I (think I) know what I'm doing so I can work around the problems it causes me easily enough (I just modify init so that it doesn't try to mount devtmpfs anymore). But I do wonder if there are others who might struggle with this if faced with the same issues.

I am willing to accept the possibility that throwing more permutations of /dev management into the mix simply adds to the maintenance workload without providing a lot of benefit. But I wanted to see what others here think about this.

Cheers,

-- Dan

[1] http://git.buildroot.net/busybox/tree/util-linux/mdev.c
[2] http://lists.busybox.net/pipermail/buildroot/2011-December/048129.html

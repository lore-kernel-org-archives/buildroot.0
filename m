From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Dec 2015 16:51:08 +0000
Subject: [Buildroot] [Bug 7580] Invalid filesystem in Pandaboard defconfig
In-Reply-To: <bug-7580-163@https.bugs.busybox.net/>
References: <bug-7580-163@https.bugs.busybox.net/>
Message-ID: <bug-7580-163-o4G4tVqPbw@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7580

--- Comment #9 from Sergio Prado <sergio.prado@e-labworks.com> ---
I could successfully reproduce this error.

The problem is that an ext2 rootfs image is generated, and by default u-boot
passes rootfstype=ext3 to the kernel command line, so the kernel panics trying
to mount ext2 as ext3:

[    2.573730] No filesystem could mount root, tried:  ext3
[    2.578399] Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(179,2)

Changing rootfs to ext3 or removing rootfstype from the kernel command line
should fix this problem.

I've also tested with the last U-Boot mainline (2015.10) and it worked (this
version does not pass rootfstype to the kernel command line).

So I'm preparing a patch to bump U-Boot and kernel version and fix this
problem.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

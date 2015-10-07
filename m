From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 8 Oct 2015 00:03:42 +0200
Subject: [Buildroot] [PATCH v2] skeleton: Have a portable remount RW/RO
In-Reply-To: <1443965948-13945-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443965948-13945-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <561596BE.9020107@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime,

sorry for having kind of endorsed this patch in its v1, but now I
tested it and it seems flawed in its very core (unless I'm still drunk).

Maxime Hadjinlian wrote:
> With systemd, inittab is useless, but it's also where we stored a 'mount
> -o remount ...' to toggle the rootfs ro/rw at the demand of the user.
>
> Instead, doing a simple 'mount -a -o remount' should change the flag of
> every mountpoint by reading /etc/fstab.

Maybe it should, but it doesn't:

# cat /etc/fstab
# <file system>	<mount pt>	<type>	<options>	<dump>	<pass>
/dev/root	/		ext2	rw,noauto	0	1
proc		/proc		proc	defaults	0	0
devpts		/dev/pts	devpts	defaults,gid=5,mode=620	0	0
tmpfs		/dev/shm	tmpfs	mode=0777	0	0
tmpfs		/tmp		tmpfs	mode=1777	0	0
tmpfs		/run		tmpfs	mode=0755,nosuid,nodev	0	0
sysfs		/sys		sysfs	defaults	0	0
# mount
/dev/root on / type ext2 (ro,relatime,errors=remount-ro)
devtmpfs on /dev type devtmpfs 
(rw,relatime,size=62812k,nr_inodes=15703,mode=755)
proc on /proc type proc (rw,relatime)
# /bin/mount -a -o remount
# mount
/dev/root on / type ext2 (ro,relatime,errors=remount-ro)
devtmpfs on /dev type devtmpfs 
(rw,relatime,size=62812k,nr_inodes=15703,mode=755)
proc on /proc type proc (rw,relatime)
#

It's still mounted ro. Removing the noauto for /dev/root/ does not
change the result.

This is using the default mount from busybox on
qemu_arm_versatile_defconfig with an external toolchain. Wild guess: are
you using the full-featured mount command from util-linux? Or maybe
systemd ships it own mount command with this feature?


-- 
Luca

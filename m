From: Steve Kenton <skenton@ou.edu>
Date: Tue, 10 Mar 2015 00:25:47 -0500
Subject: [Buildroot] Obscure bug in Util-Linux umount?
In-Reply-To: <54FE7E8E.20306@ou.edu>
References: <54FE7E8E.20306@ou.edu>
Message-ID: <54FE805B.5000509@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I *think* this is an obscure bug in the util-linux version of umount,
but I wonder if anyone else has run into it. It drove me nuts for a while.

Here's a short description.

I am developing an x86 imbedded system using buildroot-2015.02 running
on an Ubuntu 14.10 host. I have two ssd drives formatted as ext4 and
mounted on mount point directories /ssd (/dev/sda1) and /data (/dev/sdb1)
on the Ubuntu system whose root filesystem / (/dev/sdc1) is selected through
the bios at power up as the boot device.

This allows me to boot and run the embedded system in it's 'natural' place
using /dev/sda and /dev/sdb during development and testing in an effort to
keep life simple. According to "dumpe2fs -h" the superblocks of /dev/sda1
and /dev/sdb1 contain the last mounted locations of /ssd and /data as expected
when booting the embedded system.

Here is the odd thing that occurs when running the embedded system.
If the embedded root filesystem / has a mount point directory
*with the same name* as appears in it's superblock then anything mounted
on that mount point will always be "busy" and cannot be unmounted using
the util-linux versions of umount, but unmounts just fine with the busybox
version of umount. Mounting and unmounting on any other mount point directory
causes no problems.

In my case where '/ssd' (/dev/sda1) is the root filesystem and '/data' (/dev/sdb1)
is for data, mounting /dev/sdb1 on a /data directory located on the emedded root /dev/sda1
acts as expected but mounting /dev/sdb1 on a /ssd directory located on the embedded
root /dev/sda1 results in a "busy" filesystem that cannot be unmounted using util-linux
umount but can be unmounted using busybox umount. Switching the root and data disk functions
causes the problem to move to the other disk so it's not tied to a specific mount point
directory name.

It's easy enough to work around if you know about it but I would not wish the
debugging on anyone else.

So, is this a feature, a bug, or am I just too dumb for words and missing something obvious?

Steve

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150310/d5391e39/attachment.html>

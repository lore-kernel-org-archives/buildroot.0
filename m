From: Massimo Callegari <massimocallegari@yahoo.it>
Date: Tue, 2 Oct 2012 15:59:44 +0100 (BST)
Subject: [Buildroot] read-only NFS devtmpfs mount fails
Message-ID: <1349189984.20063.YahooMailNeo@web171606.mail.ir2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I'm running buildroot 2012.05 on a MIPSel device, custom kernel 3.3.0.?I'm testing over NFS, building a .TAR target.
When devices are created statically and fs is mounted in RW, all is OK.
When I try to use devtmpfs (with or without udev) and read-only filesystem over NFS, I am not able to obtain a dynamic /dev creation.
I thought the kernel was supposed to do the mounting automagically, but since I'm mounting a NFS tree my init script is busybox, so I added?this instruction at the beginning of /etc/inittab:

::sysinit:/bin/mount -t devtmpfs devtmpfs /dev


Although I get this error:
mount: mounting devtmpfs on /dev failed: No such device


I've read a lot of forums and docs and checked everything I could.?
On my kernel folder: "grep TMPFS .config"?says:
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_TMPFS=y

I also had to create some devices manually to avoid several errors, especially for /dev/null (isn't buildroot supposed to create a minimum set of devices to avoid this ?) so I created these:

crw-rw-rw- ?1 root root ?5, ?1 2012-10-01 17:14 console
crw-rw-rw- ?1 root root ?1, ?3 2012-10-01 17:14 null

crw-rw-rw- ?1 root root ?4, ?0 2012-10-01 17:14 tty0

crw-rw-rw- ?1 root root ?4, 64 2012-10-01 17:16 ttyS0
crw-rw-rw- ?1 root root ?1, ?5 2012-10-01 17:38 zero

If I try the mount command manually I get the same error. If I strace it seems the C mount instruction itself fails:

stat64(0x7fb8beb9, 0x7fb8b658) ? ? ? ? ?= -1 ENOENT (No such file or directory)
mount("devtmpfs", "/dev", "devtmpfs", 0x8000, 0) = -1 ENODEV (No such device)
brk(0x4bd000) ? ? ? ? ? ? ? ? ? ? ? ? ? = 0x4bd000
brk(0x4be000) ? ? ? ? ? ? ? ? ? ? ? ? ? = 0x4be000
write(2, "mount: mounting devtmpfs on /dev"..., 56mount: mounting devtmpfs on /dev failed: No such device
) = 56
SYS_4246( <unfinished ... exit status 255>


So I'm wondering if the mount command of busybox (I'm using version 1.20.1) is missing the devtmpfs support for some reason.

Is there anything else I can do to understand this issue ?

Thanks in advance,
Massimo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121002/46db19ff/attachment.html>

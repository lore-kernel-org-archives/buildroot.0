From: Moot Account <mootaccount@gmail.com>
Date: Sat, 4 Nov 2006 23:42:49 +0000
Subject: [Buildroot] custom initrd using buildroot/busybox
Message-ID: <b1d3ddb90611041542r3f27835tcac5e3a4842aa196@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This is a bloated idea but it's just an exercise. The idea is to use
the rootfs from buildroot as the initrd (i.e. initrd=/boot/rootfs.gz).
This initrd should mount the _real_ rootfs using pivot_root. The real
rootfs is in the second partition (/dev/hda2) and is the _same_ rootfs
built from buildroot. In other words, rootfs.gz = rootfs in /dev/hda2.

Inside the initrd (ie rootfs.gz) is /linuxrc which will be read first
by the kernel after mounting the initrd. Instead of pointing it to
/bin/busybox, I'm going to create a custom linuxrc.

My _problem_ starts here. I CAN'T chroot to the rootfs in /dev/hda2
and execute the /linuxrc, which is still pointed /bin/busybox. I need
to chroot because /linuxrc will initialize my rootfs and put up the
login (ie getty).

Here are my arguments to the kernel:
linux /boot/bzImage console=ttyS0,9600
(since it's a serial console)

This is the custom linuxrc that does _not_ work:

#!/bin/sh
echo "linuxrc execute"
mount -t proc /proc /proc
mkdir new_root
mount -t ext2 /dev/hda2 /new_root
umount proc
cd /new_root
pivot_root . initrd
mount -t proc proc proc
mount -t devfs devfs dev
exec /usr/sbin/chroot . 'exec /linuxrc' \
         <dev/console >dev/console 2>&1

I'm stuck after the execution pivot_root. It seems that dev/console is busy.

Thanks for any help.

From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 27 Sep 2007 14:32:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20070927213251.304ACA60A7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-27 14:32:50 -0700 (Thu, 27 Sep 2007)
New Revision: 20073

Log:
- add a sample README.diskimage for i386


Added:
   trunk/buildroot/docs/README.diskimage


Changeset:
Added: trunk/buildroot/docs/README.diskimage
===================================================================
--- trunk/buildroot/docs/README.diskimage	                        (rev 0)
+++ trunk/buildroot/docs/README.diskimage	2007-09-27 21:32:50 UTC (rev 20073)
@@ -0,0 +1,37 @@
+# Sample for i386 to create a 6MB disk-image
+
+# create an image file
+dd if=/dev/zero bs=512 count=$((6*1024*1024/512)) of=img
+# create a partition (optional)
+echo -e "n\np\n1\n\nw\n" | \
+  ~/src/busybox/busybox fdisk -C 16065 -H 255 -S 63 ./img
+# as root, associate the image with a look-device:
+# The offset of 512 comes from the the layout of the image. See
+# ~/src/busybox/busybox fdisk -C 16065 -H 255 -S 63 -l ./img for the start
+# block and multiply this with the block size (==512).
+~/src/busybox/busybox losetup -o 512 /dev/loop/0 /path/to/the/img
+# create some filesystem on it, for example ext2
+mkfs.ext2 -m0 -Lslash /dev/loop/0
+# mount it and copy your stuff to it
+~/src/busybox/busybox mount -oloop,rw /dev/loop/0 /media/l0
+~/src/busybox/busybox mkdir -p /media/l0/boot/grub
+~/src/busybox/busybox cp -a project_build_i386/root/boot/grub/stage? /media/l0/boot/grub/
+~/src/busybox/busybox cp -a project_build_i386/root/boot/bzImage /media/l0/boot/
+~/src/busybox/busybox cat > /media/l0/boot/grub/menu.lst <<EOF
+title=GNU/Linux
+root (hd0,0)
+kernel /boot/bzImage
+EOF
+# finally unmount the dist and disassociate the loopdev
+~/src/busybox/busybox umount /media/l0
+~/src/busybox/busybox losetup -d /dev/loop/0
+# now install grub from the chroot
+~/src/busybox/busybox losetup /dev/loop/0 /path/to/the/img
+project_build_i386/root/usr/sbin/grub --device-map=/dev/null
+device (hd0) img
+geometry (hd0) 16065 255 63
+root (hd0,0)
+setup (hd0)
+quit
+# finally boot the thing
+/opt/qemu-trunk_ggi-2.2.2/bin/qemu -snapshot -hda img -boot c

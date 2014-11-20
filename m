From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 20 Nov 2014 16:18:40 -0300
Subject: [Buildroot] [PATCH] sysvinit/inittab: adjust shutdown
Message-ID: <1416511120-29954-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The previous shutdown sequence was basically a no-op, it did't call rcK
to stop anything and dumped users back into shell.
So do the proper thing by calling rcK for levels 0 (halt) and 6
(reboot), then swapoff, then remount ro.
After that call halt for 0 and reboot for 6.

Also make 3 the default runlevel as in normal distributions, for all
intents and purposes it changes nothing except aesthetics/convention.

And make the labels a context sequence rather than just a short form
of the actions which IMHO looks horrible.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sysvinit/inittab | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
index 9b3a119..fc0c9b5 100644
--- a/package/sysvinit/inittab
+++ b/package/sysvinit/inittab
@@ -2,21 +2,26 @@
 #
 # This inittab is a basic inittab sample for sysvinit, which mimics
 # Buildroot's default inittab for BusyBox.
-id:1:initdefault:
+id:3:initdefault:
 
-proc::sysinit:/bin/mount -t proc proc /proc
-rwmo::sysinit:/bin/mount -o remount,rw /
-dpts::sysinit:/bin/mkdir -p /dev/pts
-dshm::sysinit:/bin/mkdir -p /dev/shm
-moun::sysinit:/bin/mount -a
-host::sysinit:/bin/hostname -F /etc/hostname
-init::sysinit:/etc/init.d/rcS
+si0::sysinit:/bin/mount -t proc proc /proc
+si1::sysinit:/bin/mount -o remount,rw /
+si2::sysinit:/bin/mkdir -p /dev/pts
+si3::sysinit:/bin/mkdir -p /dev/shm
+si4::sysinit:/bin/mount -a
+si5::sysinit:/bin/hostname -F /etc/hostname
+si6::sysinit:/etc/init.d/rcS
 
 # S0:1:respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
 
 # Stuff to do for the 3-finger salute
-rebo::ctrlaltdel:/sbin/reboot
+ca::ctrlaltdel:/sbin/reboot
 
 # Stuff to do before rebooting
-umou:6:wait:/bin/umount -a -r
-swap:6:wait:/sbin/swapoff -a
+shd0:06:wait:/etc/init.d/rcK
+shd1:06:wait:/sbin/swapoff -a
+shd2:06:wait:/bin/umount -a -r
+
+# The usual halt or reboot actions
+hlt0:0:wait:/sbin/halt -dhp
+reb0:6:wait:/sbin/reboot
-- 
2.0.4

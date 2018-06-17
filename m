From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:34:57 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] busybox: add an inittab
 entry to activate swap
Message-ID: <20180617155626.EFFF6826A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27e91a6cd6d6faec4395700707ceddb1ed1eaa89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

There is a call to swapoff in the shutdown sequence, so call "swapon -a"
on startup. As stated in the swapon man page,

   All devices marked as "swap" in /etc/fstab are made available, except
   for those with the "noauto" option. Devices that are already being
   used as swap are silently skipped.

So even if the system has some init script to start/stop swap (e.g. from
a rootfs ovelay) calling swapon/swapoff would be harmless.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d524cc7d9de549228b998ba5747b0d7cd4f24251)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/inittab | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/busybox/inittab b/package/busybox/inittab
index 7cd203de0b..ff1725c775 100644
--- a/package/busybox/inittab
+++ b/package/busybox/inittab
@@ -18,6 +18,7 @@
 ::sysinit:/bin/mount -o remount,rw /
 ::sysinit:/bin/mkdir -p /dev/pts /dev/shm
 ::sysinit:/bin/mount -a
+::sysinit:/sbin/swapon -a
 null::sysinit:/bin/ln -sf /proc/self/fd /dev/fd
 null::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin
 null::sysinit:/bin/ln -sf /proc/self/fd/1 /dev/stdout

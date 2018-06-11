From: Carlos Santos <casantos@datacom.com.br>
Date: Mon, 11 Jun 2018 03:00:15 -0300
Subject: [Buildroot] [PATCH 3/4] busybox: add an inittab entry to activate
 swap
In-Reply-To: <20180611060016.20755-1-casantos@datacom.com.br>
References: <20180611060016.20755-1-casantos@datacom.com.br>
Message-ID: <20180611060016.20755-4-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is a call to swapoff in the shutdown sequence, so call "swapon -a"
on startup. As stated in the swapon man page,

   All devices marked as "swap" in /etc/fstab are made available, except
   for those with the "noauto" option. Devices that are already being
   used as swap are silently skipped.

So even if the system has some init script to start/stop swap (e.g. from
a rootfs ovelay) calling swapon/swapoff would be harmless.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
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
-- 
2.17.0

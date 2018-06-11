From: Carlos Santos <casantos@datacom.com.br>
Date: Mon, 11 Jun 2018 03:00:14 -0300
Subject: [Buildroot] [PATCH 2/4] sysvinit: add an inittab entry to activate
 swap
In-Reply-To: <20180611060016.20755-1-casantos@datacom.com.br>
References: <20180611060016.20755-1-casantos@datacom.com.br>
Message-ID: <20180611060016.20755-3-casantos@datacom.com.br>
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
 package/sysvinit/inittab | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
index 2ca253ad6c..a31471031f 100644
--- a/package/sysvinit/inittab
+++ b/package/sysvinit/inittab
@@ -7,7 +7,8 @@ id:3:initdefault:
 si0::sysinit:/bin/mount -t proc proc /proc
 si1::sysinit:/bin/mount -o remount,rw /
 si2::sysinit:/bin/mkdir -p /dev/pts /dev/shm
-si4::sysinit:/bin/mount -a
+si3::sysinit:/bin/mount -a
+si4::sysinit:/sbin/swapon -a
 si5::sysinit:/bin/ln -sf /proc/self/fd /dev/fd 2>/dev/null
 si6::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin 2>/dev/null
 si7::sysinit:/bin/ln -sf /proc/self/fd/1 /dev/stdout 2>/dev/null
-- 
2.17.0

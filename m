From: Carlos Santos <casantos@datacom.com.br>
Date: Mon, 11 Jun 2018 03:00:16 -0300
Subject: [Buildroot] [PATCH 4/4] board/synopsys: synchronize custom inittab
 with BusyBox' one
In-Reply-To: <20180611060016.20755-1-casantos@datacom.com.br>
References: <20180611060016.20755-1-casantos@datacom.com.br>
Message-ID: <20180611060016.20755-5-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Apply modifications made in recent commits:

- 456ea9871e busybox: add /dev/std{in, out, err} symlinks to inittab
- 13dbe73782 busybox: reduce number of mkdir calls in inittab
- 8a89d290d4 busybox: add an inittab entry to activate swap

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
This change was tested on a VM, only. I don't have a Synopsys board.
---
 board/synopsys/axs10x/fs-overlay/etc/inittab | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/board/synopsys/axs10x/fs-overlay/etc/inittab b/board/synopsys/axs10x/fs-overlay/etc/inittab
index 43bacc6580..7412a27366 100644
--- a/board/synopsys/axs10x/fs-overlay/etc/inittab
+++ b/board/synopsys/axs10x/fs-overlay/etc/inittab
@@ -14,12 +14,16 @@
 # process   == program to run
 
 # Startup the system
-null::sysinit:/bin/mount -t proc proc /proc
-null::sysinit:/bin/mount -o remount,rw /
-null::sysinit:/bin/mkdir -p /dev/pts
-null::sysinit:/bin/mkdir -p /dev/shm
-null::sysinit:/bin/mount -a
-null::sysinit:/bin/hostname -F /etc/hostname
+::sysinit:/bin/mount -t proc proc /proc
+::sysinit:/bin/mount -o remount,rw /
+::sysinit:/bin/mkdir -p /dev/pts /dev/shm
+::sysinit:/bin/mount -a
+::sysinit:/sbin/swapon -a
+null::sysinit:/bin/ln -sf /proc/self/fd /dev/fd
+null::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin
+null::sysinit:/bin/ln -sf /proc/self/fd/1 /dev/stdout
+null::sysinit:/bin/ln -sf /proc/self/fd/2 /dev/stderr
+::sysinit:/bin/hostname -F /etc/hostname
 # now run any rc scripts
 ::sysinit:/etc/init.d/rcS
 
-- 
2.17.0

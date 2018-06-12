From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jun 2018 14:56:17 +0200
Subject: [Buildroot] [git commit] board/synopsys: synchronize custom inittab
 with BusyBox' one
Message-ID: <20180612130228.E783A80049@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3df894e8315d2b55192abe7ddd7b07128118a79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Apply modifications made in recent commits:

- 456ea9871e busybox: add /dev/std{in, out, err} symlinks to inittab
- 13dbe73782 busybox: reduce number of mkdir calls in inittab
- 8a89d290d4 busybox: add an inittab entry to activate swap

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 

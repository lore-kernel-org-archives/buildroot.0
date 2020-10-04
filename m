From: Norbert Lange <nolange79@gmail.com>
Date: Mon,  5 Oct 2020 00:41:36 +0200
Subject: [Buildroot] [PATCH] skeleton + init: prepare /run/lock and adjust
 compat symlinks
Message-ID: <20201004224137.193808-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Linux distros changed /var/run and /var/lock to reside on an tmpfs in
/run a long time ago, and buildroot seems to agree by providing this
tmpfs on all supported init systems.

Packages on the other hand are currently free to either use /var/run
or /run, and similarly using /var/lock should be identical to the
replacement /run/lock.

This series aims to ensure that *if* /var/lock is needed, then
it will be a symlink to /run/lock. Allowing packages to continue
working and allowing them to migrate to using /run/lock.

If all relevant packages are fixed,
the compatibility symlinks in /var can be dropped.

Status before this patch:

*   Systemd

    /run will be mounted by PID1, /var/run will be recreated by
    /usr/lib/tmpfiles.d/var.conf.

    Creating /run/lock/subsys and the compatibility symlink is handled
    in /usr/lib/tmpfiles.d/legacy.conf.
    But this is *currently not installed* by Buildroot, see [1].

*   OpenRC

    Seems to check for existence of a /run directory and does all
    necessary setup.

*   SysV

    /var/lock is currently a symlink to /tmp.

*   Busybox

    Same as sysv (Buildroot uses the sysv skeleton)

Note that we create /run/lock/subsys, so sysv scrips could expect this
directory to exist. Apart from simplifying scripts, creating the dir
early as root adds some security.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/busybox/inittab                        |  1 +
 package/skeleton-init-openrc/skeleton/var/lock |  2 +-
 package/skeleton-init-sysv/skeleton/var/lock   |  2 +-
 package/sysvinit/inittab                       | 13 +++++++------
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/busybox/inittab b/package/busybox/inittab
index ff1725c775..f2b4df801b 100644
--- a/package/busybox/inittab
+++ b/package/busybox/inittab
@@ -18,6 +18,7 @@
 ::sysinit:/bin/mount -o remount,rw /
 ::sysinit:/bin/mkdir -p /dev/pts /dev/shm
 ::sysinit:/bin/mount -a
+::sysinit:/bin/mkdir -p /run/lock/subsys
 ::sysinit:/sbin/swapon -a
 null::sysinit:/bin/ln -sf /proc/self/fd /dev/fd
 null::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin
diff --git a/package/skeleton-init-openrc/skeleton/var/lock b/package/skeleton-init-openrc/skeleton/var/lock
index 1431b0e432..386c09e727 120000
--- a/package/skeleton-init-openrc/skeleton/var/lock
+++ b/package/skeleton-init-openrc/skeleton/var/lock
@@ -1 +1 @@
-../tmp
\ No newline at end of file
+../run/lock
\ No newline at end of file
diff --git a/package/skeleton-init-sysv/skeleton/var/lock b/package/skeleton-init-sysv/skeleton/var/lock
index 1431b0e432..386c09e727 120000
--- a/package/skeleton-init-sysv/skeleton/var/lock
+++ b/package/skeleton-init-sysv/skeleton/var/lock
@@ -1 +1 @@
-../tmp
\ No newline at end of file
+../run/lock
\ No newline at end of file
diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
index a31471031f..afc28e6c03 100644
--- a/package/sysvinit/inittab
+++ b/package/sysvinit/inittab
@@ -8,12 +8,13 @@ si0::sysinit:/bin/mount -t proc proc /proc
 si1::sysinit:/bin/mount -o remount,rw /
 si2::sysinit:/bin/mkdir -p /dev/pts /dev/shm
 si3::sysinit:/bin/mount -a
-si4::sysinit:/sbin/swapon -a
-si5::sysinit:/bin/ln -sf /proc/self/fd /dev/fd 2>/dev/null
-si6::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin 2>/dev/null
-si7::sysinit:/bin/ln -sf /proc/self/fd/1 /dev/stdout 2>/dev/null
-si8::sysinit:/bin/ln -sf /proc/self/fd/2 /dev/stderr 2>/dev/null
-si9::sysinit:/bin/hostname -F /etc/hostname
+si4::sysinit:/bin/mkdir -p /run/lock/subsys
+si5::sysinit:/sbin/swapon -a
+si6::sysinit:/bin/ln -sf /proc/self/fd /dev/fd 2>/dev/null
+si7::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin 2>/dev/null
+si8::sysinit:/bin/ln -sf /proc/self/fd/1 /dev/stdout 2>/dev/null
+si9::sysinit:/bin/ln -sf /proc/self/fd/2 /dev/stderr 2>/dev/null
+si10::sysinit:/bin/hostname -F /etc/hostname
 rcS:12345:wait:/etc/init.d/rcS
 
 # S0:1:respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
-- 
2.28.0

From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:34:32 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] sysvinit: add /dev/std{in, out,
 err} symlinks to inittab
Message-ID: <20180617155626.DFB79826A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e4940d5f240d38649e8062787a685a2e36ebb4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Some applications, e.g. bashs process subsitution feature, rely on the
convention of `/dev/fd` being a symbolic link to `/proc/self/fd`.

This symbolic link and his companions `/dev/std*` are created by (e)udev [1],
but not by mdev, resulting in the following error when using the following
expression:

```
bash: /dev/fd/62: No such file or directory
```

For the sake of simplicity, lets fix this by creating the symlinks in inittab.
It is only really needed if eudev isn't used, but it doesn't really hurt to
create them even if eudev will recreate them afterwards.

Note, that we do not create the symlink `/dev/core` as `/proc/kcore` is
not available on all platforms, e.g. ARM, and the feature is not much
appreciated [2].

[1] https://github.com/gentoo/eudev/blob/8943501993322c59a6eb5be456b0d716aafff21e/src/shared/dev-setup.c#L35-L40
[2] https://lwn.net/Articles/45315/

[Peter: redirect errors to /dev/null for ro rootfs]
Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 6919fc55660eafd1a55c2e8535cc9291c251faf5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysvinit/inittab | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
index 6b0b580e59..2ca253ad6c 100644
--- a/package/sysvinit/inittab
+++ b/package/sysvinit/inittab
@@ -8,7 +8,11 @@ si0::sysinit:/bin/mount -t proc proc /proc
 si1::sysinit:/bin/mount -o remount,rw /
 si2::sysinit:/bin/mkdir -p /dev/pts /dev/shm
 si4::sysinit:/bin/mount -a
-si5::sysinit:/bin/hostname -F /etc/hostname
+si5::sysinit:/bin/ln -sf /proc/self/fd /dev/fd 2>/dev/null
+si6::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin 2>/dev/null
+si7::sysinit:/bin/ln -sf /proc/self/fd/1 /dev/stdout 2>/dev/null
+si8::sysinit:/bin/ln -sf /proc/self/fd/2 /dev/stderr 2>/dev/null
+si9::sysinit:/bin/hostname -F /etc/hostname
 rcS:12345:wait:/etc/init.d/rcS
 
 # S0:1:respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL

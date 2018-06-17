From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:34:14 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] busybox: add /dev/std{in,
 out, err} symlinks to inittab
Message-ID: <20180617155626.D764B826A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66e9e291a81c7cbf343693cda5d4642aaedf7276
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

[Peter: redirect output (errors) to /dev/null for ro rootfs]
Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 456ea9871ea015fe2c5a7eb79c4762787286fa56)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/inittab | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/busybox/inittab b/package/busybox/inittab
index 368b037ee2..7cd203de0b 100644
--- a/package/busybox/inittab
+++ b/package/busybox/inittab
@@ -18,6 +18,10 @@
 ::sysinit:/bin/mount -o remount,rw /
 ::sysinit:/bin/mkdir -p /dev/pts /dev/shm
 ::sysinit:/bin/mount -a
+null::sysinit:/bin/ln -sf /proc/self/fd /dev/fd
+null::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin
+null::sysinit:/bin/ln -sf /proc/self/fd/1 /dev/stdout
+null::sysinit:/bin/ln -sf /proc/self/fd/2 /dev/stderr
 ::sysinit:/bin/hostname -F /etc/hostname
 # now run any rc scripts
 ::sysinit:/etc/init.d/rcS

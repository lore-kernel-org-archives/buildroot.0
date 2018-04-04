From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed,  4 Apr 2018 20:09:35 +0200
Subject: [Buildroot] [PATCH 2/2] sysvinit: add /dev/std{in, out,
 err} symlinks to inittab
In-Reply-To: <20180404180935.15185-1-joerg.krause@embedded.rocks>
References: <20180404180935.15185-1-joerg.krause@embedded.rocks>
Message-ID: <20180404180935.15185-3-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/sysvinit/inittab | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
index fad91eae8b..608aabce07 100644
--- a/package/sysvinit/inittab
+++ b/package/sysvinit/inittab
@@ -9,7 +9,11 @@ si1::sysinit:/bin/mount -o remount,rw /
 si2::sysinit:/bin/mkdir -p /dev/pts
 si3::sysinit:/bin/mkdir -p /dev/shm
 si4::sysinit:/bin/mount -a
-si5::sysinit:/bin/hostname -F /etc/hostname
+si5::sysinit:/bin/ln -sf /proc/self/fd /dev/fd
+si6::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin
+si7::sysinit:/bin/ln -sf /proc/self/fd/1 /dev/stdout
+si8::sysinit:/bin/ln -sf /proc/self/fd/2 /dev/stderr
+si9::sysinit:/bin/hostname -F /etc/hostname
 rcS:12345:wait:/etc/init.d/rcS
 
 # S0:1:respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
-- 
2.16.3

From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 May 2020 11:52:45 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] fs/cpio: make initramfs
 init script survive 'console=' kernel argument
Message-ID: <20200508093729.DD5C791052@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad164f529723c6ceaae252dc00ee80f4c5bb9c06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

When booting with 'console=<empty>' in the kernel command line (as e.g.
U-Boot does with silent flags in effect), opening /dev/console fails.

As per POSIX [0], when iany redirection fails, the shell running exec
shal exit in error. So, when 'console=<empty>' is specified.
/dev/console can't be opened, and the redirection fails, and /init is
killed.

That behaviour was fixed on the kernel side with commit 2bd3a997befc2
(Open /dev/console from rootfs), present since 2.6.34, released in May
2010, so any [dr]ecent kernel will have that fix.

Furthermore, busybox will fix things up anyway (in bb_sanitize_stdio()),
falling back to opening /dev/null if no console is availble. systemd
does a similar thing (in make_console_stdio()), and sysvinit again has
a similar approach (in console_init()).

The archealogy search turned up those relevant commits:

    2011-08-04 10a130f91e initramfs/init: make sure that 0, 1, 2 fds are available
        introduces the three exec redirections in initramfs

    2011-09-06 3fac21ef8d cpio: fix boot with dynamic /dev
        introduces the three exec redirections in cpio

    2011-09-06 13a3afc536 fs/initramfs: refactor with fs/cpio
        dropped the initramfs tweaks to reuse the cpio ones

    2012-11-04 e1ebae700a fs/common: Create initial console device
        introduces the /dev/console char,5,1 pseudo device creation in
        cpio

    2018-03-31 dec061adce fs/cpio: don't extend packages' permissions table
        switched from the permission-table to a manual mknod to create
        /dev/console

The redirections were added before we could guarantee there was a
/dev/console in the rootfs.

We're now guaranteed to have /dev/console in an initramfs, and any recent
kernel will automatically open /dev/console before spawning /init.

The three redirections are useless now, and cause harm under certain
conditions. Drop them.

[0] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_20_01

Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>
Cc: Peter Korsgaard <peter@korsgaard.com>
[yann.morin.1998 at free.fr:
  - extend commit log with the analysis done with Peter
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 98a6f1fc02e41ac30db24ac2b7262033faabacde)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/cpio/init | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/cpio/init b/fs/cpio/init
index dbe09ac68e..b0af18b67a 100755
--- a/fs/cpio/init
+++ b/fs/cpio/init
@@ -1,7 +1,4 @@
 #!/bin/sh
 # devtmpfs does not get automounted for initramfs
 /bin/mount -t devtmpfs devtmpfs /dev
-exec 0</dev/console
-exec 1>/dev/console
-exec 2>/dev/console
 exec /sbin/init "$@"

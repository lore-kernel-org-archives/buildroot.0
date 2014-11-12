From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 12 Nov 2014 19:01:06 +0100
Subject: [Buildroot] [RFC/PATCH 1/1] systemd: fix remount-fs
Message-ID: <1415815266-21733-1-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd runs "/bin/mount MOUNTPOINT -o remount" for remounting
the rootfs (and others like /usr, /proc, ...) [0]. This is supposed
to remount the rootfs in rw/ro mode depending on /etc/fstab.

busybox' mount -o remount command, however, complety ignores fstab
and reads the mount options from /proc/mounts only (+ cmdline "-o ...") [1],
so "mount / -o remount" is a no-op.

This commit adds a patch that causes systemd's remount-fs to pass the
options from /etc/fstab to the mount command.

References:
[0] http://cgit.freedesktop.org/systemd/systemd/tree/src/remount-fs/remount-fs.c?id=v217 (line 99)
[1] http://git.busybox.net/busybox/tree/util-linux/mount.c?h=1_22_stable (line 2133)

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---

Notes:
* selecting BR2_PACKAGE_UTIL_LINUX_MOUNT=y would also fix remounting,
  but that also requires BR2_PACKAGE_UTIL_LINUX_BINARIES=y...

* passing all options to mount rather than checking for "rw"/ro"
  (hasmntopt(...,"ro")==NULL) makes remount-fs behave identical
  regardless of whether util-linux' or busybox' mount is used
  (remount-fs also remounts /proc etc.)

* a systemd-based buildroot config ignores BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
  This is not changed by this commit, but the rootfs is now always rw unless
  /etc/fstab gets replaced by a a postbuild script / rootfs overlay.

By the way, I have a script for generating /etc/fstab, which could be useful
for dealing with remount-ro/rw and systemd-specific mounts (and maybe genimages).
Tell me if there's any interest in getting this integrated into buildroot.

You can view it here 
  https://gist.github.com/dywisor/62d41835c2dff043f794#file-mkfstab-bash-L17-L96
(not the latest revision, but sufficient for getting an overview.)
---
 ...t-fs-pass-options-from-fstab-to-bin-mount.patch | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/systemd/0005-remount-fs-pass-options-from-fstab-to-bin-mount.patch

diff --git a/package/systemd/0005-remount-fs-pass-options-from-fstab-to-bin-mount.patch b/package/systemd/0005-remount-fs-pass-options-from-fstab-to-bin-mount.patch
new file mode 100644
index 0000000..c6dc661
--- /dev/null
+++ b/package/systemd/0005-remount-fs-pass-options-from-fstab-to-bin-mount.patch
@@ -0,0 +1,63 @@
+From 7bc0901a00e78f22f97dbd3f85c7a19d9a78e7a1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
+Date: Wed, 12 Nov 2014 17:45:46 +0100
+Subject: [PATCH 1/1] remount-fs: pass options from fstab to /bin/mount
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+busybox mount -o remount reads the mount options from /proc/mounts (or mtab);
+Executing "/bin/mount / -o remount" has no effect when /bin/mount is linked
+to busybox.
+
+remount-fs already reads the options from /etc/fstab,
+so simply pass them to the mount command.
+
+Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
+---
+ src/remount-fs/remount-fs.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/remount-fs/remount-fs.c b/src/remount-fs/remount-fs.c
+index cd7cfe7..f63f009 100644
+--- a/src/remount-fs/remount-fs.c
++++ b/src/remount-fs/remount-fs.c
+@@ -20,6 +20,7 @@
+ ***/
+ 
+ #include <unistd.h>
++#include <stdlib.h>
+ #include <fcntl.h>
+ #include <errno.h>
+ #include <string.h>
+@@ -93,18 +94,26 @@ int main(int argc, char *argv[]) {
+                 }
+ 
+                 if (pid == 0) {
++                        char *opts_str;
+                         const char *arguments[5];
+                         /* Child */
+ 
++                        opts_str = strappend("remount,", me->mnt_opts);
++                        if (opts_str == NULL) {
++                                log_error("Failed to get remount opts");
++                                _exit(EXIT_FAILURE);
++                        }
++
+                         arguments[0] = "/bin/mount";
+                         arguments[1] = me->mnt_dir;
+                         arguments[2] = "-o";
+-                        arguments[3] = "remount";
++                        arguments[3] = opts_str;
+                         arguments[4] = NULL;
+ 
+                         execv("/bin/mount", (char **) arguments);
+ 
+                         log_error("Failed to execute /bin/mount: %m");
++                        free(opts_str);
+                         _exit(EXIT_FAILURE);
+                 }
+ 
+-- 
+2.1.3
+
-- 
2.1.3

From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2020 23:13:17 +0100
Subject: [Buildroot] [git commit] package/eudev: Fix monitor starting for
 kernels w/o CONFIG_SHMEM
Message-ID: <20200213220736.99E208E014@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b81eb7d04f161cdee7cd59d4443e84401ac88ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the kernel has CONFIG_SHMEM disabled, /dev is a ramfs (instead of a
tmpfs) and the name_to_handle_at system call is not supported. This
causes eudev's monitor application to exit on startup.

Upstream eudev has added this fix which is not yet part of a release.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-libudev-monitor.c-do-not-check-if-dev-is.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/eudev/0001-src-libudev-libudev-monitor.c-do-not-check-if-dev-is.patch b/package/eudev/0001-src-libudev-libudev-monitor.c-do-not-check-if-dev-is.patch
new file mode 100644
index 0000000000..3027ad7f17
--- /dev/null
+++ b/package/eudev/0001-src-libudev-libudev-monitor.c-do-not-check-if-dev-is.patch
@@ -0,0 +1,33 @@
+From 799591c57368bbe47667f5b696050247a766b117 Mon Sep 17 00:00:00 2001
+From: "Anthony G. Basile" <blueness@gentoo.org>
+Date: Mon, 6 Jan 2020 11:14:47 -0500
+Subject: [PATCH] src/libudev/libudev-monitor.c: do not check if /dev is tmpfs
+
+This check fails for buildroot systems where /dev is not mounted
+as a tmpfs filesystem.  Dropping this check should be safe even
+on regular systems.
+
+This solves issue #172.
+
+Signed-off-by: Anthony G. Basile <blueness@gentoo.org>
+Signed-off-by: Joel Stanley <joel@jms.id.au>
+---
+ src/libudev/libudev-monitor.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libudev/libudev-monitor.c b/src/libudev/libudev-monitor.c
+index 614149c6243c..060ba733f33b 100644
+--- a/src/libudev/libudev-monitor.c
++++ b/src/libudev/libudev-monitor.c
+@@ -186,7 +186,7 @@ struct udev_monitor *udev_monitor_new_from_netlink_fd(struct udev *udev, const c
+                  * We do not set a netlink multicast group here, so the socket
+                  * will not receive any messages.
+                  */
+-                if (access(UDEV_ROOT_RUN "/udev/control", F_OK) < 0 || !udev_has_devtmpfs(udev)) {
++                if (access(UDEV_ROOT_RUN "/udev/control", F_OK) < 0) {
+                         log_debug("the udev service seems not to be active, disable the monitor");
+                         group = UDEV_MONITOR_NONE;
+                 } else
+-- 
+2.25.0
+

From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 11 Jan 2012 18:09:22 +0100
Subject: [Buildroot] [PATCH 1/2] Rework of shutdown policy in inittab
In-Reply-To: <cover.1326301656.git.maxime.ripard@free-electrons.com>
References: <cover.1326301656.git.maxime.ripard@free-electrons.com>
Message-ID: <9620f2c623d3fdb946abdaa3ce694d6ee441f940.1326301656.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit follows commit ad501b66. Start up of the busybox logging
daemons were moved to an init script but the shutdown were still
performed in inittab. This commit moves the shutdown policy to an
rcK script that calls the stop function of all the init scripts in
a reversed order.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 fs/skeleton/etc/init.d/rcK |   27 +++++++++++++++++++++++++++
 fs/skeleton/etc/inittab    |    3 +--
 2 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100755 fs/skeleton/etc/init.d/rcK

diff --git a/fs/skeleton/etc/init.d/rcK b/fs/skeleton/etc/init.d/rcK
new file mode 100755
index 0000000..59e9c54
--- /dev/null
+++ b/fs/skeleton/etc/init.d/rcK
@@ -0,0 +1,27 @@
+#!/bin/sh
+
+
+# Stop all init scripts in /etc/init.d
+# executing them in reversed numerical order.
+#
+for i in $(ls -r /etc/init.d/S??*) ;do
+
+     # Ignore dangling symlinks (if any).
+     [ ! -f "$i" ] && continue
+
+     case "$i" in
+	*.sh)
+	    # Source shell script for speed.
+	    (
+		trap - INT QUIT TSTP
+		set stop
+		. $i
+	    )
+	    ;;
+	*)
+	    # No sh extension, so fork subprocess.
+	    $i stop
+	    ;;
+    esac
+done
+
diff --git a/fs/skeleton/etc/inittab b/fs/skeleton/etc/inittab
index ac410d6..85881f4 100644
--- a/fs/skeleton/etc/inittab
+++ b/fs/skeleton/etc/inittab
@@ -30,8 +30,7 @@ null::sysinit:/bin/hostname -F /etc/hostname
 ::ctrlaltdel:/sbin/reboot
 
 # Stuff to do before rebooting
-null::shutdown:/usr/bin/killall klogd
-null::shutdown:/usr/bin/killall syslogd
+null::shutdown:/etc/init.d/rcK
 null::shutdown:/bin/umount -a -r
 null::shutdown:/sbin/swapoff -a
 
-- 
1.7.4.1

From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 21 Feb 2013 21:12:43 +0200
Subject: [Buildroot] [PATCH] busybox: remove pid file after stopping daemon
	with start-stop-daemon applet
Message-ID: <1361473963-5943-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many daemons leave pid files lying around when they are stopped with
start-stop-daemon applet in BusyBox.
This patch will ensure that they are properly cleaned away.

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---

Note: I did not make this patch but found it from old thread in BusyBox
mailing list from 2006 and just fitted it against v1.19.4.
So far it has been tested to work with busybox v1.19.4.

 .../busybox-1.19.4-start-stop-daemon-rm-pid.patch  |   35 ++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100755 package/busybox/busybox-1.19.4-start-stop-daemon-rm-pid.patch

diff --git a/package/busybox/busybox-1.19.4-start-stop-daemon-rm-pid.patch b/package/busybox/busybox-1.19.4-start-stop-daemon-rm-pid.patch
new file mode 100755
index 0000000..db199a3
--- /dev/null
+++ b/package/busybox/busybox-1.19.4-start-stop-daemon-rm-pid.patch
@@ -0,0 +1,35 @@
+diff -Naur busybox-1.19.4.org/debianutils/Config.src busybox-1.19.4/debianutils/Config.src
+--- busybox-1.19.4.org/debianutils/Config.src	2013-02-21 15:56:12.056163205 +0200
++++ busybox-1.19.4/debianutils/Config.src	2013-02-21 15:59:21.369223915 +0200
+@@ -58,6 +58,15 @@
+ 	  termination of system-level processes, usually the ones
+ 	  started during the startup of the system.
+ 
++config FEATURE_START_STOP_DAEMON_REMOVE_PIDFILE
++	bool "Remove pidfile on stop"
++	default y
++	depends on START_STOP_DAEMON
++	help
++	  If a pidfile is specified when a process is scheluded
++	  to be stopped, remove the pidfile after the process
++	  is successfully stopped.
++
+ config FEATURE_START_STOP_DAEMON_FANCY
+ 	bool "Support additional arguments"
+ 	default y
+diff -Naur busybox-1.19.4.org/debianutils/start_stop_daemon.c busybox-1.19.4/debianutils/start_stop_daemon.c
+--- busybox-1.19.4.org/debianutils/start_stop_daemon.c	2013-02-21 15:56:12.056163205 +0200
++++ busybox-1.19.4/debianutils/start_stop_daemon.c	2013-02-21 16:03:38.119855595 +0200
+@@ -353,8 +353,11 @@
+ 	if (!QUIET && killed) {
+ 		printf("stopped %s (pid", what);
+ 		for (p = G.found_procs; p; p = p->next)
+-			if (p->pid)
++			if (p->pid) {
+ 				printf(" %u", (unsigned)p->pid);
++				if (ENABLE_FEATURE_START_STOP_DAEMON_REMOVE_PIDFILE)
++					unlink(pidfile);
++			}
+ 		puts(")");
+ 	}
+  ret:
-- 
1.7.7.6

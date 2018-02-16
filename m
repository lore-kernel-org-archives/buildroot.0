From: Christian Stewart <christian@paral.in>
Date: Fri, 16 Feb 2018 03:26:17 -0500
Subject: [Buildroot] [PATCH 10/10] docker-engine: don't link against
 libsystemd without systemd
In-Reply-To: <20180216082617.12039-1-christian@paral.in>
References: <20180216082617.12039-1-christian@paral.in>
Message-ID: <20180216082617.12039-11-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Docker links against libsystemd unconditionally in the latest release. This is
entirely unnecessary, and the included patch disables this behavior in the
absence of the systemd build tag, which is now set when systemd is enabled in
buildroot.

This fixes linking errors when building against sysv, and avoids adding a
hard dependency on systemd in Docker.

Docker-Engine should also use the target pkgconfig, not the host pkgconfig. This
is fixed in this patch.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 ...king-against-libsystemd-with-absence-of-s.patch | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 package/docker-engine/0001-disable-linking-against-libsystemd-with-absence-of-s.patch

diff --git a/package/docker-engine/0001-disable-linking-against-libsystemd-with-absence-of-s.patch b/package/docker-engine/0001-disable-linking-against-libsystemd-with-absence-of-s.patch
new file mode 100644
index 0000000000..32c8246259
--- /dev/null
+++ b/package/docker-engine/0001-disable-linking-against-libsystemd-with-absence-of-s.patch
@@ -0,0 +1,54 @@
+From 35d360b085733b4b00f132017a9ba850ec2a1556 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Wed, 20 Sep 2017 18:09:26 +0100
+Subject: [PATCH] disable linking against libsystemd with absence of systemd
+ build tag
+
+For some reason, as of this release, Docker now MUST link against libsystemd.
+
+This is not for a good reason. It's because of two lines in the daemon startup,
+which notify the systemd daemon that the daemon is done starting.
+
+Requiring the presence of an entire systemd library to build Docker is not
+suitable for Buildroot. This patch adds a build tag called "systemd," which
+when not set, will disable linking against libsystemd.
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ components/engine/cmd/dockerd/daemon_linux.go           |  2 ++
+ components/engine/cmd/dockerd/daemon_linux_nosystemd.go | 13 +++++++++++++
+ 2 files changed, 15 insertions(+)
+ create mode 100644 components/engine/cmd/dockerd/daemon_linux_nosystemd.go
+
+diff --git a/components/engine/cmd/dockerd/daemon_linux.go b/components/engine/cmd/dockerd/daemon_linux.go
+index b09fed9293..67c755231b 100644
+--- a/components/engine/cmd/dockerd/daemon_linux.go
++++ b/components/engine/cmd/dockerd/daemon_linux.go
+@@ -1,3 +1,5 @@
++// +build linux,systemd
++
+ package main
+ 
+ import systemdDaemon "github.com/coreos/go-systemd/daemon"
+diff --git a/components/engine/cmd/dockerd/daemon_linux_nosystemd.go b/components/engine/cmd/dockerd/daemon_linux_nosystemd.go
+new file mode 100644
+index 0000000000..4f7e92af0f
+--- /dev/null
++++ b/components/engine/cmd/dockerd/daemon_linux_nosystemd.go
+@@ -0,0 +1,13 @@
++// +build linux,!systemd
++
++package main
++
++// preNotifySystem sends a message to the host when the API is active, but before the daemon is
++func preNotifySystem() {
++	// noop without systemd
++}
++
++// notifySystem sends a message to the host when the server is ready to be used
++func notifySystem() {
++	// noop without systemd
++}
+-- 
+2.13.6
+
-- 
2.13.6

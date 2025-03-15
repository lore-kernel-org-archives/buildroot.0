Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FE6C282EC
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 15:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 406B28115D;
	Tue, 18 Mar 2025 15:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eMvtarrRXaLu; Tue, 18 Mar 2025 15:07:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE9A5810FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE9A5810FB;
	Tue, 18 Mar 2025 15:07:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 48D6416E
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F11E4097E
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Us2SRiWNR72W for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 15:02:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D8304090B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D8304090B
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6822381E08; Tue, 18 Mar 2025 15:02:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Mar 2025 22:13:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c7a817dc512d77400f7367818d9febc5d5de51e
X-Git-Newrev: 5ae4c36dfe392c2a0a729f2d5bc823759e83cf51
X-Patchwork-Hint: ignore
Message-Id: <20250318150245.6822381E08@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cgroupfs-v2-mount: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5ae4c36dfe392c2a0a729f2d5bc823759e83cf51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the cgroupfs-mount package only mounts a cgroup v1 hierarchy,
but v1 is considered legacy and obsolete, while v2 has been around for a
while now, and is required by some packages (e.g. podman whines about
v1).

cgroupfs-mount has not had a release in almost 8 years now, and only the
occasional commit since then and until more than 3 years ago. It's not
going to evolve...

Add a new package with a simple-enough sysv startup script, that mounts
the cgroup v2 hierarchy filesystem. For systemd, there's nothing to do,
as systemd handles the mount by itself.

Since both cgroup v1 and v2 use the same mountpoint, we can't have both
enabled at the same time, and thus we restrict the v2 to be hidden when
v1 is enabled (quite a few packages select the v1; changing those would
require that they be validated against v2 first...)

Note that, due to limitations in Kconfig, cgroupfs-v2-mount will appear
indented below cgroupfs-mount, because it has a (negative) dependency on
it. This spurious indentation is unfortunate and annoying, but benign;
fixing that would require breaking the dependency with a random Kconfig
symbol, which we don't have, and which we decided not to introduce just
for this one use-case (well, there's host-gnupg and host-gnupg2 that
have the exact same issue, but meh...)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                              |  1 +
 package/cgroupfs-v2-mount/Config.in            | 10 ++++++
 package/cgroupfs-v2-mount/S30cgroupfs2         | 44 ++++++++++++++++++++++++++
 package/cgroupfs-v2-mount/cgroupfs-v2-mount.mk | 20 ++++++++++++
 4 files changed, 75 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 0c9b5bb6cf..7d8540869d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2809,6 +2809,7 @@ menu "System tools"
 	source "package/balena-engine/Config.in"
 	source "package/bubblewrap/Config.in"
 	source "package/cgroupfs-mount/Config.in"
+	source "package/cgroupfs-v2-mount/Config.in"
 	source "package/circus/Config.in"
 	source "package/conmon/Config.in"
 	source "package/containerd/Config.in"
diff --git a/package/cgroupfs-v2-mount/Config.in b/package/cgroupfs-v2-mount/Config.in
new file mode 100644
index 0000000000..2dd2dbc089
--- /dev/null
+++ b/package/cgroupfs-v2-mount/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_CGROUPFS_V2_MOUNT
+	bool "cgroupfs-v2-mount"
+	depends on !BR2_INIT_SYSTEMD
+	depends on !BR2_PACKAGE_CGROUPFS_MOUNT
+	help
+	  Mount the cgroup v2 hierarchy filesystem.
+
+comment "cgroupfs-v2-mount is incompatible with cgroupfs-mount"
+	depends on !BR2_INIT_SYSTEMD
+	depends on BR2_PACKAGE_CGROUPFS_MOUNT
diff --git a/package/cgroupfs-v2-mount/S30cgroupfs2 b/package/cgroupfs-v2-mount/S30cgroupfs2
new file mode 100644
index 0000000000..42839ef921
--- /dev/null
+++ b/package/cgroupfs-v2-mount/S30cgroupfs2
@@ -0,0 +1,44 @@
+#!/bin/sh
+
+DAEMON=cgroupfs2
+
+start() {
+	printf 'Mounting %s: ' "${DAEMON}"
+	mkdir -p /sys/fs/cgroup
+	mount -t cgroup2 none /sys/fs/cgroup
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Unmounting %s: ' "${DAEMON}"
+	umount /sys/fs/cgroup
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/cgroupfs-v2-mount/cgroupfs-v2-mount.mk b/package/cgroupfs-v2-mount/cgroupfs-v2-mount.mk
new file mode 100644
index 0000000000..10e18d8d41
--- /dev/null
+++ b/package/cgroupfs-v2-mount/cgroupfs-v2-mount.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# cgroupfs-v2-mount
+#
+################################################################################
+
+CGROUPFS_V2_MOUNT_VERSION =
+CGROUPFS_V2_MOUNT_SITE =
+
+define CGROUPFS_V2_MOUNT_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
+endef
+
+define CGROUPFS_V2_MOUNT_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D \
+		$(CGROUPFS_V2_MOUNT_PKGDIR)/S30cgroupfs2 \
+		$(TARGET_DIR)/etc/init.d/S30cgroupfs2
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

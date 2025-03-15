Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33828C28B28
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 23:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7D6640D39;
	Sat, 15 Mar 2025 23:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9LuLRKHBfZXv; Sat, 15 Mar 2025 23:12:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9CB440E0C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9CB440E0C;
	Sat, 15 Mar 2025 23:12:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E1B812C
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 23:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E096821D3
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 23:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 79i1GxX9LHz5 for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 23:11:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B914982200
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B914982200
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 23:11:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A941D88002; Sat, 15 Mar 2025 23:11:51 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Mar 2025 22:11:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5c77357c580f84e5a2986a4155e0cfd194c44b70
X-Git-Newrev: 2c7a817dc512d77400f7367818d9febc5d5de51e
X-Patchwork-Hint: ignore
Message-Id: <20250315231151.A941D88002@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cgroupfs-mount: tweak
 the kernel config
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c7a817dc512d77400f7367818d9febc5d5de51e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When it was introduced in 2016 with commit 0e1547a87cfd (cgroupfs-mount:
new package), we did not yet have the infrastructure for package to set
kernel config options, which only came 4 years later with commit
0aed4c2dae76 (linux: allow packages to set kernel config options).

So at that time, the requirements for cgroupfs-mount were documented in
the help for the Kconfig symbol.

But now that we do have the infrastructure in place, actually use it to
set the required options, and drop the list from the Kconfig entry (that
would be duplication, prone to bit-rot with time, and other packages do
not document their requirements in Kconfig, they just use the infra to
set the options).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cgroupfs-mount/Config.in         | 12 +-----------
 package/cgroupfs-mount/cgroupfs-mount.mk | 11 +++++++++++
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/package/cgroupfs-mount/Config.in b/package/cgroupfs-mount/Config.in
index 0b2e4ba1e7..29a40c93d1 100644
--- a/package/cgroupfs-mount/Config.in
+++ b/package/cgroupfs-mount/Config.in
@@ -4,16 +4,6 @@ config BR2_PACKAGE_CGROUPFS_MOUNT
 	help
 	  cgroupfs mount and umount scripts.
 
-	  requires a Linux kernel >= 3.0 with the following options
-	  enabled:
-
-	  - CONFIG_BLK_CGROUP
-	  - CONFIG_CGROUPS
-	  - CONFIG_CGROUP_CPUACCT
-	  - CONFIG_CGROUP_DEVICE
-	  - CONFIG_CGROUP_FREEZER
-	  - CONFIG_CGROUP_WRITEBACK
-	  - CONFIG_CGROUP_SCHED
-	  - CONFIG_CGROUP_PIDS
+	  Requires a Linux kernel >= 3.0
 
 	  https://github.com/tianon/cgroupfs-mount
diff --git a/package/cgroupfs-mount/cgroupfs-mount.mk b/package/cgroupfs-mount/cgroupfs-mount.mk
index 5af87629ea..156d584266 100644
--- a/package/cgroupfs-mount/cgroupfs-mount.mk
+++ b/package/cgroupfs-mount/cgroupfs-mount.mk
@@ -10,6 +10,17 @@ CGROUPFS_MOUNT_LICENSE = GPL-3.0+
 CGROUPFS_MOUNT_LICENSE_FILES = debian/copyright
 CGROUPFS_MOUNT_CPE_ID_VALID = YES
 
+define CGROUPFS_MOUNT_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_CGROUP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_CPUACCT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_DEVICE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_FREEZER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_WRITEBACK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_SCHED)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_PIDS)
+endef
+
 define CGROUPFS_MOUNT_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/cgroupfs-mount $(TARGET_DIR)/usr/bin/cgroupfs-mount
 	$(INSTALL) -D -m 0755 $(@D)/cgroupfs-umount $(TARGET_DIR)/usr/bin/cgroupfs-umount
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

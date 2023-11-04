Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61448C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D267B40360;
	Sat,  4 Nov 2023 20:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D267B40360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o_HVNI0_cGQF; Sat,  4 Nov 2023 20:35:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B83C74036E;
	Sat,  4 Nov 2023 20:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B83C74036E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F8791BF584
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EB49416D6
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EB49416D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u3FwasiEcR3a for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:35:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32268416C3
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32268416C3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B30A80D9F; Sat,  4 Nov 2023 20:35:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 21:34:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 604eecf0116ff7b82f6d9cf0e867591f830f447c
X-Git-Newrev: 6122ba62f6d9ac4350b9bb2e5d935acfd077e2c9
X-Patchwork-Hint: ignore
Message-Id: <20231104203511.0B30A80D9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/containerd: add control for
 additional build tags
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6122ba62f6d9ac4350b9bb2e5d935acfd077e2c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable the AUFS snapshotter by default. AUFS support has been deprecated
since v1.5 and won't be available with containerd v2.0.

Add configuration option for the ZFS snapshotter and add the proper
runtime dependencies.

Add configuration option for Kubernetes CRI support. Note that CRI
support requires a writeable /etc or an appropriate containerd
configuration.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/containerd/Config.in     | 33 +++++++++++++++++++++++++++++++++
 package/containerd/containerd.mk | 13 +++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/package/containerd/Config.in b/package/containerd/Config.in
index e69dd6768a..12a53bc111 100644
--- a/package/containerd/Config.in
+++ b/package/containerd/Config.in
@@ -26,6 +26,39 @@ config BR2_PACKAGE_CONTAINERD_DRIVER_BTRFS
 	help
 	  Build the btrfs snapshot driver for containerd.
 
+config BR2_PACKAGE_CONTAINERD_DRIVER_DEVMAPPER
+	bool "devmapper snapshot driver"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
+	depends on BR2_USE_MMU # lvm2
+	depends on !BR2_STATIC_LIBS # lvm2
+	select BR2_PACKAGE_LVM2
+	help
+	  Build the devmapper snapshot driver for containerd.
+
+comment "devmapper snapshot driver needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_CONTAINERD_DRIVER_ZFS
+	bool "zfs snapshot driver"
+	depends on BR2_LINUX_KERNEL # zfs
+	depends on BR2_PACKAGE_HAS_UDEV # zfs
+	depends on BR2_USE_MMU  # zfs
+	depends on BR2_TOOLCHAIN_HAS_THREADS  # zfs
+	select BR2_PACKAGE_ZFS
+	help
+	  Build the zfs snapshot driver for containerd.
+
+comment "zfs snapshot driver needs a Linux kernel, udev, toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_LINUX_KERNEL || !BR2_PACKAGE_HAS_UDEV || \
+		!BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_CONTAINERD_CRI
+	bool "Kubernetes CRI support"
+	help
+	  Build containerd with Kubernetes CRI support.
+
 endif
 
 comment "containerd needs a glibc or musl toolchain w/ threads"
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index d29a796a72..7c130770c0 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -24,6 +24,7 @@ CONTAINERD_BUILD_TARGETS = \
 	cmd/ctr
 
 CONTAINERD_INSTALL_BINS = $(notdir $(CONTAINERD_BUILD_TARGETS))
+CONTAINERD_TAGS = no_aufs
 
 ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
 CONTAINERD_DEPENDENCIES += libapparmor
@@ -41,6 +42,18 @@ else
 CONTAINERD_TAGS += no_btrfs
 endif
 
+ifneq ($(BR2_PACKAGE_CONTAINERD_DRIVER_DEVMAPPER),y)
+CONTAINERD_TAGS += no_devmapper
+endif
+
+ifneq ($(BR2_PACKAGE_CONTAINERD_DRIVER_ZFS),y)
+CONTAINERD_TAGS += no_zfs
+endif
+
+ifneq ($(BR2_PACKAGE_CONTAINERD_CRI),y)
+CONTAINERD_TAGS += no_cri
+endif
+
 define CONTAINERD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/containerd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/containerd.service
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

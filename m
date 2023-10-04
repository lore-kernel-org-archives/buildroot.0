Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02C6E7C4E1
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 16:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57E1F42202;
	Wed,  4 Oct 2023 16:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57E1F42202
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sqGX6_d6rxVE; Wed,  4 Oct 2023 16:18:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23DA94220B;
	Wed,  4 Oct 2023 16:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23DA94220B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6BEFC1BF423
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 16:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5071B4220B
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 16:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5071B4220B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xSJA6YG2d-u0 for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 16:18:12 +0000 (UTC)
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 014B842202
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 16:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 014B842202
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 340F45C8A7D;
 Wed,  4 Oct 2023 18:18:08 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org
Date: Wed,  4 Oct 2023 18:17:36 +0200
Message-ID: <4642abb656bb8e63ff759d6f2ab6eafeb2e3d39d.1696436249.git.stefan@agner.ch>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1696436288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=Mem7wpP2VaM/LTmz9gSD1ZMIOqOntWKWIVgn9ulkevI=;
 b=zrKlOZMqY4LPtcmokeSnzfEyx4VlG4V+E3tMaLY1MIUS8Zn/qECW2Dr7V4lp/sZusGOO7U
 aSBBEz7jghG2m4in+UN9lgMyvs115bLiZzStEEkMrplYMlTmMGJ32GNtk42Se0s3tKzLXi
 QtsmwHOPTTn/SsyZ6uVyGZSSce4qjaU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=zrKlOZMq
Subject: [Buildroot] [PATCH] package/containerd: add control for additional
 build tags
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
Cc: Stefan Agner <stefan@agner.ch>, christian@aperture.us
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable the AUFS snapshotter by default. AUFS support has been deprecated
since v1.5 and won't be available with containerd v2.0.

Add configuration option for the ZFS snapshotter and add the proper
runtime dependencies.

Add configuration option for Kubernetes CRI support. Note that CRI
support requires a writeable /etc or an appropriate containerd
configuration.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 package/containerd/Config.in     | 22 ++++++++++++++++++++++
 package/containerd/containerd.mk | 13 +++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/package/containerd/Config.in b/package/containerd/Config.in
index e69dd6768a..ceec5752df 100644
--- a/package/containerd/Config.in
+++ b/package/containerd/Config.in
@@ -26,6 +26,28 @@ config BR2_PACKAGE_CONTAINERD_DRIVER_BTRFS
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
+config BR2_PACKAGE_CONTAINERD_DRIVER_ZFS
+	bool "zfs snapshot driver"
+	depends on BR2_LINUX_KERNEL # zfs
+	depends on BR2_PACKAGE_HAS_UDEV # zfs
+	select BR2_PACKAGE_ZFS
+	help
+	  Build the zfs snapshot driver for containerd.
+
+config BR2_PACKAGE_CONTAINERD_CRI
+	bool "Build Kubernetes CRI support"
+	help
+	  Build containerd with Kubernetes CRI support.
+
 endif
 
 comment "containerd needs a glibc or musl toolchain w/ threads"
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 0591400709..f5a93f5f91 100644
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
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

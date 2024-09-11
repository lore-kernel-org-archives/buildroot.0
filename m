Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC2EEE4998
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 12:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A6994016A;
	Wed, 11 Sep 2024 12:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbNipaI8jnxt; Wed, 11 Sep 2024 12:07:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2A5B40170
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2A5B40170;
	Wed, 11 Sep 2024 12:07:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7372B1BF35B
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 12:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DC8640170
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 12:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0WGhv5zHJii for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 12:07:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.44.123;
 helo=mail1.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5AFE04016A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AFE04016A
Received: from mail1.insia.net (mail1.insia.net [188.165.44.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AFE04016A
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 12:07:33 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail1.insia.net (Postfix) with ESMTP id 8B39C3F82F;
 Wed, 11 Sep 2024 14:07:26 +0200 (CEST)
Received: from sb-dev-build.insia.net. (gw-servers.insia.net [192.168.1.1])
 by smtp.insia.net (Postfix) with ESMTP id 309055F497;
 Wed, 11 Sep 2024 14:03:23 +0200 (CEST)
From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 14:07:19 +0200
Message-Id: <20240911120719.2920331-1-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail1; t=1726056446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=eYMKd4+Y5dz6SdF4gC0p7QoopA47MyC1yRpSpV4fBpg=;
 b=HkSSbv9MKusnUnQZd9JbpT9kBbxVSpAwyLLTorrxpOvJVdl3ZwHz/2DWgtSw50S1Kit102
 auJtxqUDrenr5/6i4cQxV1lWQn13TG8pADvZ5T7uv8YuOyOHbgrZC88u5axNRv3DqMvqDk
 L27snRHlvDqskdD1UERnfGga1/zHNvR3VyXqh6PyS1rDifKZSBhuOqvAw9LSX/VNAUrwzv
 AAerpQDxurMfmwF6JkwzYG9w5FA574fR//OUe6/3tiK3kcdNNyJNVICseIrbumy//mQI0j
 xpcO/wDNItqwjtEDoGUk0oDoVnola12Y7UnamMcbraIruhbag6TJggvqDYrnvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail1 header.b=HkSSbv9M
Subject: [Buildroot] [PATCHv2 1/1] package/systemd: add EFI support option
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>,
 Sen Hastings <sen@hastings.org>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to compile systemd with -Defi=true flag to mount automatically
efivarfs in /sys/firmware/efi/efivars

Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
---
 package/systemd/Config.in  |  4 ++++
 package/systemd/systemd.mk | 10 ++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 345f08590e..6b695c40c9 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -113,6 +113,7 @@ config BR2_PACKAGE_SYSTEMD_BOOT
 	bool "systemd-boot"
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_GNU_EFI
+	select BR2_PACKAGE_SYSTEMD_EFI
 	help
 	  systemd-boot is a simple UEFI boot manager which executes
 	  configured EFI images. The default entry is selected by a
@@ -161,6 +162,9 @@ config BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH
 	default "x64"   if BR2_x86_64
 	depends on BR2_PACKAGE_SYSTEMD_BOOT
 
+config BR2_PACKAGE_SYSTEMD_EFI
+	bool "enable EFI support"
+
 config BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE
 	bool "enable journal remote tools"
 	select BR2_PACKAGE_LIBCURL
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5dca8681bc..e2d0bba96e 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -647,7 +647,7 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_BOOT),y)
 SYSTEMD_INSTALL_IMAGES = YES
 SYSTEMD_DEPENDENCIES += gnu-efi host-python-pyelftools
-SYSTEMD_CONF_OPTS += -Defi=true -Dbootloader=enabled
+SYSTEMD_CONF_OPTS += -Dbootloader=enabled
 
 SYSTEMD_BOOT_EFI_ARCH = $(call qstrip,$(BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH))
 define SYSTEMD_INSTALL_BOOT_FILES
@@ -660,9 +660,15 @@ define SYSTEMD_INSTALL_BOOT_FILES
 endef
 
 else
-SYSTEMD_CONF_OPTS += -Defi=false -Dbootloader=disabled
+SYSTEMD_CONF_OPTS += -Dbootloader=disabled
 endif # BR2_PACKAGE_SYSTEMD_BOOT == y
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_EFI),y)
+SYSTEMD_CONF_OPTS += -Defi=true
+else
+SYSTEMD_CONF_OPTS += -Defi=false
+endif
+
 SYSTEMD_FALLBACK_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
 ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
 SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

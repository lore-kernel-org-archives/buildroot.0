Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFAEC3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 20:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2452810D5;
	Mon, 29 Jul 2024 20:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cn8hr1BDG4c5; Mon, 29 Jul 2024 20:53:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B956E810D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B956E810D6;
	Mon, 29 Jul 2024 20:53:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B64411BF427
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 20:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A42F7403EC
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 20:53:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SkM4RtxYObxE for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 20:53:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4BD6403D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4BD6403D1
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 20:53:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92A5F83577; Mon, 29 Jul 2024 20:53:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Jul 2024 22:53:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52e537c6a5dc6a046e5272e7ba7738c6e8f3865d
X-Git-Newrev: c4e845b5b805cc487fca6203caccc363e6e108e6
X-Patchwork-Hint: ignore
Message-Id: <20240729205349.92A5F83577@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/espflash: add udev dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4e845b5b805cc487fca6203caccc363e6e108e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the dependency on udev, since espflash links against libudev
(via the libudev-sys crate).

Fixes:

  http://autobuild.buildroot.net/results/c61b6ed4b6fb4d18d503ac37add200f5e6ae3706

Signed-off-by: Torben Voltmer <mail@t-voltmer.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/espflash/Config.in   | 5 +++++
 package/espflash/espflash.mk | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/espflash/Config.in b/package/espflash/Config.in
index 2a7a0f6b38..a445101269 100644
--- a/package/espflash/Config.in
+++ b/package/espflash/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ESPFLASH
 	bool "espflash"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_HOST_RUSTC
 	help
 	  Serial flasher utilities for Espressif devices, based
@@ -8,3 +9,7 @@ config BR2_PACKAGE_ESPFLASH
 	  ESP32-C2/C3/C6, ESP32-H2, ESP32-P4, and ESP32-S2/S3.
 
 	  https://github.com/esp-rs/espflash
+
+comment "espflash needs udev /dev management"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/espflash/espflash.mk b/package/espflash/espflash.mk
index 43532de58c..ad2294e1bf 100644
--- a/package/espflash/espflash.mk
+++ b/package/espflash/espflash.mk
@@ -9,5 +9,6 @@ ESPFLASH_SITE = $(call github,esp-rs,espflash,v$(ESPFLASH_VERSION))
 ESPFLASH_SUBDIR = espflash
 ESPFLASH_LICENSE = Apache-2.0 or MIT
 ESPFLASH_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+ESPFLASH_DEPENDENCIES = udev
 
 $(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

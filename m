Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83303C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 19:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3253B6078C;
	Mon, 29 Jul 2024 19:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PR7QD5HkooLC; Mon, 29 Jul 2024 19:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36749607CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36749607CB;
	Mon, 29 Jul 2024 19:44:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 943011BF399
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 19:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DD85402F2
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 19:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fbu93j-ARzIE for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 19:44:56 +0000 (UTC)
X-Greylist: delayed 589 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 29 Jul 2024 19:44:54 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D01194027C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D01194027C
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=188.68.61.103; helo=relay.yourmailgateway.de;
 envelope-from=mail@t-voltmer.net; receiver=<UNKNOWN> 
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.61.103])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D01194027C
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 19:44:54 +0000 (UTC)
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
 by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4WXpTy50FHz800s
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 21:35:02 +0200 (CEST)
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4WXpTy4bmqz7yyr
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 21:35:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
Received: from mxe217.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy01-mors.netcup.net (Postfix) with ESMTPS id 4WXpTy0Dbfz8sf8
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 21:35:02 +0200 (CEST)
Received: from cygn.lan (ipb21a3d34.dynamic.kabel-deutschland.de
 [178.26.61.52])
 by mxe217.netcup.net (Postfix) with ESMTPSA id C054183FFD;
 Mon, 29 Jul 2024 21:34:56 +0200 (CEST)
From: Torben Voltmer <mail@t-voltmer.net>
To: buildroot@buildroot.org
Date: Mon, 29 Jul 2024 21:32:43 +0200
Message-ID: <20240729193242.1409148-2-mail@t-voltmer.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729101119.22f92091@windsurf>
References: <20240729101119.22f92091@windsurf>
MIME-Version: 1.0
X-Rspamd-Queue-Id: C054183FFD
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: NUfkGL+PTKTBNfUyfqvoYJ8uxOcfYvGC+t25XCQDcKdzFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=t-voltmer.net
X-Mailman-Original-Authentication-Results: mors-relay-8403.netcup.net;
 dkim=permerror (bad
 message/signature format)
Subject: [Buildroot] [PATCH v2 1/1] package/espflash: add udev dependency
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
Cc: Torben Voltmer <mail@t-voltmer.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adding the dependency on udev, since espflash links libudev
(via the libudev-sys crate).

Fixes: http://autobuild.buildroot.net/results/c61b6ed4b6fb4d18d503ac37add200f5e6ae3706

---
Changes v1 -> v2:
  - Added missing dependency in espflash.mk
  - Added missing depends on in Config.in
  - Verified that the updated patch fixes at least one autobuild failure

Signed-off-by: Torben Voltmer <mail@t-voltmer.net>
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
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11796CD128D
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 15:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82B1D4011E;
	Mon,  1 Apr 2024 15:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mmHWup6-07NJ; Mon,  1 Apr 2024 15:23:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35D1D40096
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35D1D40096;
	Mon,  1 Apr 2024 15:23:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EFCC81BF276
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 15:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAAE84049F
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 15:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dnZMSrCjfQeS for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 15:23:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.133;
 helo=smtpdh18-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4F5C74012D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F5C74012D
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F5C74012D
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 15:23:16 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id rJVBrGhaSRh8irJVBrPRBR; Mon, 01 Apr 2024 17:23:13 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  1 Apr 2024 17:23:12 +0200
Message-Id: <20240401152312.72881-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAb3PpZ7lActLQEMGkP5GncOae669NsvgnGaJa9uVsRytHAIFnX5nUSky+ptUy62bDdooP0XV8g7pVDzSNEnR8+ot0MsSjYeXFSxT8an3X8JdzMSkY5r
 pMgrq8cc3QB/FcaeL0JSrlg5UgXIKXhUgDcXifv8OYGJRuGN1PxjVnuaWV1kiGT2QD5eBhYmP8NttNPtzHwyA6FWUVGUCZf3/Kg0tE6/CGucm12qYKuiYMWg
 cOWPgXdlndPk6JSzSR4uxpdSjUdwN8QXvoWxQ5hEZJ0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1711984993; bh=Ee10Ii0i/5vrcA3WGgvPIXO9aRZTB74fXfhGskCD76c=;
 h=From:To:Subject:Date:MIME-Version;
 b=ROdflb3GqBDm5eCM0Nr9xZuHyFafGaLqNta/dEFcVwcCXa2m0wci78JQPxU/NijPg
 6U+r1syd3Kk69rFSXATR5PVFCVmaTPOPPix0FvFM88zSoQfAk9he8AqkHHMWI4U1bP
 UcDi9pRz5HuRheT7JPnPgotQ1BXlitNp8D5m10iXUfOjvQOWdrh4G+tKt/WTOPMc2t
 MGW4JzWGBVTf0APIrXGi7ox0Yg8a507hI84O0pWYI4BSmMqs69F5ntTRbnouFOjYLy
 fc9+tMI4WkNQuteqzHe9PCRQFLFxdGJHAnIX34nquvEirnb2fE6uM4pMJkbzjWCKDj
 6EAZIgWF06uKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ROdflb3G
Subject: [Buildroot] [PATCH] package/esp-hosted: bump version to 2024-04-01
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for Linux 6.9

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ..._ng-fix-build-failure-on-Linux-6.9.0.patch | 37 +++++++++++++++++++
 package/esp-hosted/esp-hosted.hash            |  2 +-
 package/esp-hosted/esp-hosted.mk              |  2 +-
 3 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 package/esp-hosted/0001-esp_hosted_ng-fix-build-failure-on-Linux-6.9.0.patch

diff --git a/package/esp-hosted/0001-esp_hosted_ng-fix-build-failure-on-Linux-6.9.0.patch b/package/esp-hosted/0001-esp_hosted_ng-fix-build-failure-on-Linux-6.9.0.patch
new file mode 100644
index 0000000000..21e8730d37
--- /dev/null
+++ b/package/esp-hosted/0001-esp_hosted_ng-fix-build-failure-on-Linux-6.9.0.patch
@@ -0,0 +1,37 @@
+From 1cd8671eb64a1278466e7a9c90ceca1be0f8c0d5 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 1 Apr 2024 17:15:19 +0200
+Subject: [PATCH] esp_hosted_ng: fix build failure on Linux 6.9.0
+
+With Linux commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=620d269f29a569ba37419cc03cf1da2d55f6252a
+spi_master compatibility has gone, so let's redefine missing needed
+macros spi_master and spi_master_put() locally if Linux version is >=
+6.9.0.
+
+Upstream: https://github.com/espressif/esp-hosted/pull/358
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ esp_hosted_ng/host/spi/esp_spi.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/esp_hosted_ng/host/spi/esp_spi.c b/esp_hosted_ng/host/spi/esp_spi.c
+index d0bd513bd6..9817056b2d 100644
+--- a/esp_hosted_ng/host/spi/esp_spi.c
++++ b/esp_hosted_ng/host/spi/esp_spi.c
+@@ -378,6 +378,11 @@ static int __spi_controller_match(struct device *dev, const void *data)
+ 	return ctlr->bus_num == *bus_num;
+ }
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 9, 0))
++#define spi_master			spi_controller
++#define spi_master_put(_ctlr)		spi_controller_put(_ctlr)
++#endif
++
+ static struct spi_controller *spi_busnum_to_master(u16 bus_num)
+ {
+ 	struct platform_device *pdev = NULL;
+-- 
+2.34.1
+
diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
index ff0839076e..d449f5030e 100644
--- a/package/esp-hosted/esp-hosted.hash
+++ b/package/esp-hosted/esp-hosted.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1c4df08132d5204a01adc2797e8f6f6d7ff945609b288cfe2dc2ea50789e8af4  esp-hosted-6a25417fc880fd744b3b0d93c11659c3e7d86384.tar.gz
+sha256  8f25c01522fdcb2003ffbfcc0ccf4981f27bddc8080ba978e33590d56f5ae20b  esp-hosted-669fd9cd1892bb8b364701968d5f06225346eea9.tar.gz
 sha256  ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  LICENSE
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index cc61e39b36..520ad5dc8c 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ESP_HOSTED_VERSION = 6a25417fc880fd744b3b0d93c11659c3e7d86384
+ESP_HOSTED_VERSION = 669fd9cd1892bb8b364701968d5f06225346eea9
 ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,$(ESP_HOSTED_VERSION))
 ESP_HOSTED_DEPENDENCIES = linux
 ESP_HOSTED_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

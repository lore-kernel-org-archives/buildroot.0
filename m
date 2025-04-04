Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BAAC36010
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 22:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63FC08405A;
	Fri,  4 Apr 2025 22:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzKXfrTAb2Sa; Fri,  4 Apr 2025 22:47:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CF3684077
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CF3684077;
	Fri,  4 Apr 2025 22:47:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 35F305E
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 22:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BE20607EB
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 22:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugnRJc3U9nl5 for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 22:47:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.42;
 helo=smtpcmd0642.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA03460B66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA03460B66
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA03460B66
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 22:47:03 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 0poSu50QlqRlL0poTuai7m; Sat, 05 Apr 2025 00:47:01 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat,  5 Apr 2025 00:47:00 +0200
Message-Id: <20250404224700.3410215-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLIPMq/2WJrAP0UGxJG0EafaLViZd5mFvzxrBF8w6DDs9NK9LyQd7WWBntdsKC9KEBF20iAvaJxZM2uJqnpBfP4R16GKQhxxhP4iQnwyIzzTNiXIgWvw
 dU8zTzvvRQbpPeB5CeCMGFM+G0XTfgbhmic9G5PHEwQPQQB+Bhugy29D29KNrA+PewWae0uPx+Acyp1QJvH+LcfGBUDhwFUV/AuDb0E62N/TDyJS2OBKAAIv
 ESdWZ8JOyJE9iamRjtbDwIFRQ2RB8AHb6Zmv0e2jyPs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1743806821; bh=53hJD4DzAh/Iq90yEVWA8rpNLtY+i6T+GqyhbqJWqfw=;
 h=From:To:Subject:Date:MIME-Version;
 b=FBWgheOlYCo0L+ZBw92G5ZfEwQ8/ScnBPACdU8RXz7h7BxIiZN90alJicJBWJHNkY
 kYSV0XkYaR9z1zrRJQwgWeUgAZ9TTxklfUPfXRBbLs5PGV0E23Iu3N6Kx3xEsK9G6P
 OC2qzgVC0AbBopRnkYfeshvhkc8pJl9tOD+X+2yJgvvpGDI3Wv3C1DQpLcFffos951
 1KCvYzaa6fMMYxniBp+Kl8Yi0U08C0dmycht2gLYAK4yIjQQdwtujUG+Jt6TXrymBK
 vJsxw1U4b/M87Xo+BFZLxDvzA8ze01VFpt3T3mqj3uL0nJa2aopt4UxhjJDMWRNNc6
 hNOqn0NIfC+Rg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=FBWgheOl
Subject: [Buildroot] [PATCH] package/esp-hosted: fix build failure with
 Linux 6.13.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patch pending upstream to fix renaming of spi_alloc_master() into
spi_alloc_host() during Linux version 6.13.0.

Fixes:
https://autobuild.buildroot.org/results/68ce3721475d259a0db42b7ab84ef08ed7fba00c/
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/esp-hosted/0001-Fix-Linux-6.13.patch | 35 ++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/esp-hosted/0001-Fix-Linux-6.13.patch

diff --git a/package/esp-hosted/0001-Fix-Linux-6.13.patch b/package/esp-hosted/0001-Fix-Linux-6.13.patch
new file mode 100644
index 0000000000..98f86e8a8f
--- /dev/null
+++ b/package/esp-hosted/0001-Fix-Linux-6.13.patch
@@ -0,0 +1,35 @@
+From f41f4a55e7787c9517ca6ac72f83dc244b4011e4 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sat, 5 Apr 2025 00:35:23 +0200
+Subject: [PATCH] Fix Linux 6.13
+
+With Linux commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0809a9ccac4a2ffdfd1561bb551aec6099775545
+spi_alloc_master() has been renamed to spi_alloc_host() so let's rename it
+accordingly checking for Linux version 6.13.0.
+
+Upstream: https://github.com/espressif/esp-hosted/pull/589
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ esp_hosted_ng/host/spi/esp_spi.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/esp_hosted_ng/host/spi/esp_spi.c b/esp_hosted_ng/host/spi/esp_spi.c
+index 51df26d8d7..fc63487821 100644
+--- a/esp_hosted_ng/host/spi/esp_spi.c
++++ b/esp_hosted_ng/host/spi/esp_spi.c
+@@ -394,7 +394,11 @@ static struct spi_controller *spi_busnum_to_master(u16 bus_num)
+ 	pdev->num_resources = 0;
+ 	platform_device_add(pdev);
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 13, 0))
++	master = spi_alloc_host(&pdev->dev, sizeof(void *));
++#else
+ 	master = spi_alloc_master(&pdev->dev, sizeof(void *));
++#endif
+ 	if (!master) {
+ 		pr_err("Error: failed to allocate SPI master device\n");
+ 		platform_device_del(pdev);
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

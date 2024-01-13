Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C31AC4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 21:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28145606EC;
	Sat, 13 Jan 2024 21:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28145606EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QifD84W-bhyW; Sat, 13 Jan 2024 21:39:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82BB660701;
	Sat, 13 Jan 2024 21:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82BB660701
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A6B81BF3D4
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 137D68247F
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 137D68247F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mqDvT9Pn35I6 for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 21:39:03 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A93182046
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 21:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A93182046
Received: from fli4l.lan.fli4l (p5b3a01c2.dip0.t-ipconnect.de [91.58.1.194])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4F0C0A4C00C5;
 Sat, 13 Jan 2024 22:39:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55570)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rOliV-000000002mq-0q8n;
 Sat, 13 Jan 2024 22:38:59 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 22:38:59 +0100
Message-Id: <20240113213859.647391-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1705181940;
 bh=AeiKf0DLXonF0HXwOmj2pcUcLMja6eE3pbswJdR43GU=;
 h=From:To:Cc:Subject:Date:From;
 b=VHD8dz6J7W7ucZa7d64YcdMvR+lh0YDs4tFXihOlFdGRFgpJp4X7R8QYsuFoJU9El
 358Uqeq+on0stRDWEyPCzch4jtNvj30E9FgCdz8gjv46Hfs7yruNsrC/lr3SkuE5lp
 IODhjPAfDaLIw8NNAqgJHUssT0XPd5DfZaZcqRxwez4B1yUkHCrXL7kKMSmUfdE+Az
 7WbCaQPEkI1CT099cv8nyueIfvpKt1nWLhwnz98kzorLU4MIvE23scEGOJerPapfBh
 rcscicPgi6oQ9ZOz3HImMi6WJvE4EhOKBr58SIWbeLhmFvI8vwfLj4XMJmYULbNSPs
 UUyRCGv7pERdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=VHD8dz6J
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: add option for V4L
 cx23885 devices
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 5befe50122..488d96d973 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -600,6 +600,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_CX231XX
 	  Firmware files for Conexant Cx23100/101/102 USB broadcast
 	  A/V decoder needed by the Linux CX231XX driver.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_CX23885
+	bool "Conexant Cx23885/7/8 PCIe broadcast A/V decoder"
+	help
+	  Firmware files for Conexant Cx23885/7/8 PCIe broadcast
+	  A/V decoder needed by the Linux CX23885 driver.
+
 endmenu
 
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index ffb4fc2e7b..bc50d3fa39 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -811,6 +811,12 @@ LINUX_FIRMWARE_FILES += v4l-cx231xx-avcore-01.fw
 # which is installed unconditionally
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CX23885),y)
+LINUX_FIRMWARE_FILES += v4l-cx23885-avcore-01.fw
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
 
 define LINUX_FIRMWARE_BUILD_CMDS
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

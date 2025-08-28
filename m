Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD127CA0FF2
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 08:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BB0082205;
	Thu, 28 Aug 2025 08:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uKEtnVbVUnGl; Thu, 28 Aug 2025 08:08:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC388821F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC388821F1;
	Thu, 28 Aug 2025 08:08:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E3FFD1B0
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 08:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8D6060A87
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 08:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FGMio8gSCVaO for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 08:08:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E01416079B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E01416079B
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E01416079B
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 08:08:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 091DA1A0E26
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 08:08:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D841560303
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 08:08:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 21E331C229E43; 
 Thu, 28 Aug 2025 10:08:25 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Aug 2025 10:08:13 +0200
Message-ID: <20250828080814.65891-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756368506; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=H3LUDKYhta8h8T6pyhup8B9qzjrui74NXYaPeqkXUh8=;
 b=iOC0OhH1XIjK76Ku2+8/sHkWrMyESJLa1Xa9Hx0Cco+x3ignDE0asY0udeNdFNHOGWr8bj
 hfMBUdS7IpJfJJJwWIq8AlIW2GZu2CtipB//OkYp6czpWb6ZfjXf/xRmleEbPDee090mbp
 vO4ZxldOz0dhkjMGoCxqFWAvCYKV+j9qj9l0WvApJBQLWL2ZsjHzj3bSmypH8BPibEVPD1
 fXyqGOKj6GTXIbb8IvRH+96NiTGtN1ujBuCz1x2iUIKWTz/6KKyImV68VbKk83I5KRbsAp
 Er7jEsJnR3vsj3ES7kHrAZmCgNYqpf5VaxibLRjqG5Rqm90+TsOboPlO5JVrog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=iOC0OhH1
Subject: [Buildroot] [PATCH] package/b43-firmware: fix upstream URL
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Unfortunately Larry Finger passed away in June 2024 [1], and
lwfinger.com is now squatted, and no longer has the same content as
before, causing a breakage when trying to download the 5.100.138
version of b43-firmware.

Since the exact same file is available from the OpenWrt mirror, and we
already use this mirror for the other b43-firmware version, let's use
the OpenWrt mirror for both.

Fixes:

  https://autobuild.buildroot.org/results/daf0aefbb10299f150c2c6a93df759ad07974752/

[1] https://lore.kernel.org/linux-wireless/77997185-86a6-41c5-af7a-74e4e9064437@lwfinger.net/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/b43-firmware/b43-firmware.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/b43-firmware/b43-firmware.mk b/package/b43-firmware/b43-firmware.mk
index 8e9e877692..d4ab8c9b24 100644
--- a/package/b43-firmware/b43-firmware.mk
+++ b/package/b43-firmware/b43-firmware.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
+B43_FIRMWARE_SITE = http://mirror2.openwrt.org/sources
+
 ifeq ($(BR2_PACKAGE_B43_FIRMWARE_KERNEL_AFTER_3_2),y)
 B43_FIRMWARE_VERSION = 5.100.138
-B43_FIRMWARE_SITE = http://www.lwfinger.com/b43-firmware
 B43_FIRMWARE_SOURCE = broadcom-wl-$(B43_FIRMWARE_VERSION).tar.bz2
 B43_FIRMWARE_DRIVER_FILE = linux/wl_apsta.o
 else ifeq ($(BR2_PACKAGE_B43_FIRMWARE_KERNEL_BEFORE_3_2),y)
 B43_FIRMWARE_VERSION = 5.10.56.27.3
-B43_FIRMWARE_SITE = http://mirror2.openwrt.org/sources
 B43_FIRMWARE_SOURCE = broadcom-wl-$(B43_FIRMWARE_VERSION)_mipsel.tar.bz2
 B43_FIRMWARE_DRIVER_FILE = driver/wl_apsta/wl_prebuilt.o
 endif
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

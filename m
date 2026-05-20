Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9807FCD4F3D
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 17:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55E1841394;
	Wed, 20 May 2026 17:00:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5EFMfWLN7_er; Wed, 20 May 2026 17:00:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A9FE41440
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779296457;
	bh=lqAbfTcXPan/SxS37Kabo/G75g8npGGw/laLyuPEcnw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cAbfoJqemIlzTX01pSaVYxP91Sce8BAWPVLE4RIplwS2D2AtESJvUHSSidQPYZjN5
	 w4HpYzf4k0f1ZvEqFCOYspfEt6MViWCdbvBqGAi/cmeQzqlzUBuwzuy4g9ghCUeSrL
	 wmaWijf/a+J0o7VVZM5vBY4WmNwBIwC77AkLDWFB3iYpTEiF0EJM80tX9+dQTnS4Td
	 TW1d9pkbCqGvQ0qdCrbK6vqp32LOa1f8Ull51h/lYsCNsY3wMUNh04bYcwkjHVR9Fd
	 Fb6YgGkZ9xx70mI7sX2Ii6AR55qJ6cEQptvafznheaawLMDG4qdjS1JKMKpRzLOYZu
	 z7cGxHhF137bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A9FE41440;
	Wed, 20 May 2026 17:00:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C56EC265
 for <buildroot@buildroot.org>; Wed, 20 May 2026 17:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB88F83CC3
 for <buildroot@buildroot.org>; Wed, 20 May 2026 17:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUt-WwvgfzTe for <buildroot@buildroot.org>;
 Wed, 20 May 2026 17:00:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6D1BE83CBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D1BE83CBB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D1BE83CBB
 for <buildroot@buildroot.org>; Wed, 20 May 2026 17:00:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ef6.dip0.t-ipconnect.de [91.58.14.246])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 937F9A4C3509;
 Wed, 20 May 2026 19:00:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49630)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wPkHr-0000000020e-1gIg;
 Wed, 20 May 2026 17:00:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 20 May 2026 19:00:51 +0200
Message-ID: <20260520170051.1119985-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520170051.1119985-1-bernd@kuhls.net>
References: <20260520170051.1119985-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779296451;
 bh=OBCsdc4+3ba4pxLFaWi3msj8fYOersnE3Qfy2ajsh4o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=OIsnUm+Rvagm6uOOtlVPlc0EH5V57iTA8bgNP8nhYSomSnYkdoBSCwhBg7ZDs8r1x
 2L6YXMTW8g7CeV5cby91hEYuIAHIXzRGyhWVF19Fm6DjpDPy2yE1Wx1fhwar1+ET49
 KOSFWGxTK1QnQwxk/9xOMR0sugFU5Md8+RbfswFj5wQXpkcIi1rHCz5Ccmv4iTwcf4
 /QBy/742yUp6xTCrzy3uELXPjW/7kXKCQyckKusVG9DZ+UjZCz6Y/191smsQgw5LHp
 eP3DDq3sAogpKkmMzfV1l/bhW9hbNrU64rucnKpz/p5uT/sXhA0USYZDf7PnMKOwt1
 0lJaOganncgNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=OIsnUm+R
Subject: [Buildroot] [PATCH/next 2/2] package/linux-firmware: add WiFi
 firmware for MT7927
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

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=238e3a14b64bb43814cc338ced682134d6ea33d6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 58ba60e9c3..3edb3de702 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -491,6 +491,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7925
 	help
 	  MediaTek MT7925
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7927
+	bool "MediaTek MT7927"
+	help
+	  MediaTek MT7927
+
 config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7986
 	bool "MediaTek MT7986 SOC WiFi"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index c076def399..f7ed7c2d7e 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -438,6 +438,14 @@ LINUX_FIRMWARE_FILES += mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
 endif
 
+# MT7927
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7927),y)
+LINUX_FIRMWARE_FILES += \
+	mediatek/mt7927/WIFI_MT6639_PATCH_MCU_2_1_hdr.bin \
+	mediatek/mt7927/WIFI_RAM_CODE_MT6639_2_1.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+endif
+
 # Mediatek MT7986 SoC WiFi
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7986),y)
 LINUX_FIRMWARE_FILES += \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

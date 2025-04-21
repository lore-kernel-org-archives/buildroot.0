Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB19C369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 13:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6533180F71;
	Mon, 21 Apr 2025 13:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gxlIzxan6Q49; Mon, 21 Apr 2025 13:32:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E37C80F5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E37C80F5E;
	Mon, 21 Apr 2025 13:32:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1940A1A0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 13:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2B3460A76
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 13:32:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wtyllkECe1nD for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 13:32:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com;
 envelope-from=matthew.allen@fleet.space; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 653CD6085F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 653CD6085F
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 653CD6085F
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 13:32:42 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3fefbbc7dd4so2044815b6e.2
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 06:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745242361; x=1745847161;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lOAtxjX/hdxf21icyxzyNCMIiLFwEWI2HbnbMNMHDa0=;
 b=Bz/5LeX/kVlWIIeXA5fNiqAHNKPPk1i9bf/HfCXZcsfoyiIVOaGqqtzTe3SjRsf+cN
 WgxggaLgd1aLwby0xUCfF8fmJ6Xhwn1gqm04cc8S+2xEbJPi7Nwkmn4zYj3I5FDqZYaZ
 kVG4rYOwp5or0GSZLfoJGoG0QUYUZPh+KIDDlACFIQOJyfy28vt7ahvjZ3EfLZgV2s29
 L5WopV2EGZtNtWWPCyk+lRvL6Mv5GcxTHR9jxPJ3G1zZHhfO+4+QtCPyDfhrCm7fX8b5
 KZ3KJiTv4Bwi6PAGdr9T1V48p7lNo4mFSWZGxyUblDvNDOfdDigDa3axqy4JxpVsUCDu
 GNQw==
X-Gm-Message-State: AOJu0Yx4kCCOCY+zrcd32g1OFB0p6nKQBvL1hlhfLttgrC9qdVldMPwr
 wXtDJie3GROHSsW7Rw6qCOPtT6uRTY+CLXC9PrnSfQkf7E63ksPxfeKTu8hUyxg4n3Pt3RsAFJe
 oIWxhpqePHpuX9DwHA4iIrVfTRK/h88Wdh31i3hzhQaka/xh35GfX5w==
X-Gm-Gg: ASbGncsHB+r+1RpS6OEub7+V7+KXdw4o0uSuVUhF0XCWXaCXT7zTODwB0L0tvKJEmtc
 oqiFTzc0m9vY+6mFSUpgeURfBRG724WvWZaYF0oXaLDR5ONYy0X+LivshFMEjvXdzqsPuCorPnB
 q3ExhdAGsONzjzpjRC7Lt2+5IZqzyw8Q==
X-Google-Smtp-Source: AGHT+IHdg9plYOPUQ4SczCe+7/9KQ3K/jzGXJVymTcuRtxccRvximEN1gtCi/7GeaWjeVsnUP6xVIooYmi3I8ixd9IM=
X-Received: by 2002:a05:6808:8409:b0:401:bcaa:c522 with SMTP id
 5614622812f47-401c0c31297mr5439399b6e.28.1745242361173; Mon, 21 Apr 2025
 06:32:41 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 21 Apr 2025 23:02:28 +0930
X-Gm-Features: ATxdqUFIgRVi9Hb35ARq4480Vp0KC6xzqOT9uMImVdST7nqjlIl3lnfeBs6fA4w
Message-ID: <CAJ6usDqFCPOvmnxsHq+cACEs-iue4hYq9Ua+iepsqqW8f7MR-A@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fleet.space; s=google; t=1745242361; x=1745847161; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lOAtxjX/hdxf21icyxzyNCMIiLFwEWI2HbnbMNMHDa0=;
 b=RJ8fjmO09nAA2pbWOCcKvAs8+CK2wFSC3emaTxB36O3xBu/bv+k7rhsI/dmtjoCFBy
 m1KktqjnbC9rE4XPKhYz8lLWKVDBZ72cT9p3jm7jk5ye59AJPQd98iPiGX5qh6tc/oNr
 wZ4pTF+1xwxnHUBlqQRLoyw2Wrms+dEWUW20Y56Yb1h3GbHHM0WoLTcPsiqpNd4vwmO5
 TqgB/q1WcVM4nmzv3HKbSrycCRFKvTpIIxH5umm+H8OxBYspsAhHFXRT1Vq7CBrLQ1Vi
 qIgp5E25Sj892VF6guJQVVCBdEJdd02fhEAZ+C9fa/WKFCFKW97HPPJKoLvUVjpgfAXQ
 NACA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=fleet.space
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=fleet.space header.i=@fleet.space header.a=rsa-sha256
 header.s=google header.b=RJ8fjmO0
Subject: [Buildroot] [PATCH 1/1] u-boot: add an option to generate
 u-boot-nand.imx
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
From: Matthew Allen via buildroot <buildroot@buildroot.org>
Reply-To: Matthew Allen <matthew.allen@fleet.space>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some i.MX boards expect u-boot-nand.imx.

Introduce the BR2_TARGET_UBOOT_FORMAT_NAND_IMX to handle such cases.

Signed-off-by: Matthew Allen <matthew.allen@fleet.space>
---
boot/uboot/Config.in | 3 +++
boot/uboot/uboot.mk | 5 +++++
2 files changed, 8 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index a2301b7747..b3f500482c 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -364,6 +364,9 @@ config BR2_TARGET_UBOOT_FORMAT_DTB_BIN
config BR2_TARGET_UBOOT_FORMAT_NAND_BIN
bool "u-boot-nand.bin"
+config BR2_TARGET_UBOOT_FORMAT_NAND_IMX
+ bool "u-boot-nand.imx"
+
config BR2_TARGET_UBOOT_FORMAT_ELF
bool "u-boot"
help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2796b0a310..f27a1f6087 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -81,6 +81,11 @@ ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
UBOOT_BINS += u-boot-nand.bin
endif
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_IMX),y)
+UBOOT_BINS += u-boot-nand.imx
+UBOOT_MAKE_TARGET += u-boot-nand.imx
+endif
+
ifeq ($(BR2_TARGET_UBOOT_FORMAT_DTB_IMG),y)
UBOOT_BINS += u-boot-dtb.img
UBOOT_MAKE_TARGET += u-boot-dtb.img
-- 
2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

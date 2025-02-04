Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4A4C02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 18:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4317A81826;
	Tue,  4 Feb 2025 18:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvmJfav1Rvfl; Tue,  4 Feb 2025 18:38:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 520E581A39
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 520E581A39;
	Tue,  4 Feb 2025 18:38:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A33A912A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 18:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 930E240DBF
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 18:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQnRe1msBOGq for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 18:38:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 66672403A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66672403A7
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66672403A7
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 18:38:28 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 1EE1158019E
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 18:38:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF4EF204A5;
 Tue,  4 Feb 2025 18:38:13 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Bryan Brattlof <bb@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue,  4 Feb 2025 19:38:13 +0100
Message-ID: <20250204183813.2414194-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegteefudelfeejffehveelgefgtddvudfhudegueeijeevjeeivdfhudfgtedtheenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfhifrddrpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepsggssehtihdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhrpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738694294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=U2Dwmyl2pfC7+H58DJrxqgHDzS5SOtY0KUlRuGNk/GA=;
 b=emfQEUmNSgA7vdF6uW0iQ+TTIPlychWSvYyKT8R4ahSl7/KWFAtLKDSDfLSTf3KysDo61O
 DbvXSeQm6SHfwN3CULweIPxlkWqdgk6okSUny6f7sULnY6jnprnAj6F0s2PsACaLJB+GWm
 GiHYN0HuUAVct4ok7snOlvBELYv8m0n0LYhRb0hnjUbKlxLheBZbSjHh6QQY6FsfMrli9v
 fCF3WBCO4856a3bQ2z66KcFX52q2e4CrmP445DltmYqGHtffHYK+/hz1eh3KW/X6KhrXch
 IwjNUEgjlaWGFPOgWmnvYWtaLuC4gugUOtJ2mF7l05sGJMlzVDuGKkm+j5mv4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=emfQEUmN
Subject: [Buildroot] [PATCH] configs/ti_am62ax_sk_defconfig: Fix kernel
 configuration
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
From: Miquel Raynal via buildroot <buildroot@buildroot.org>
Reply-To: Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The k3-am62a7-sk.dts describes an I2C PMIC TPS659312 which features a
number of regulators. One of them, ldo1, is used as power supply for the
SD card host controller regulator. When the rootfs is on the SD
card (like with this configuration), we need support for these three
components (Regulator driver, I2C PMIC glue and PMIC MFD driver) to be
built-in in order to avoid boot failures.

Tested on an AM62A LP SK.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
--
Backport to: 2024.11.x
The issue was probably there in 2024.08.x as well but I haven't tested
and the kernel has been bumped since then.
---
 board/ti/am62ax-sk/linux.config | 3 +++
 configs/ti_am62ax_sk_defconfig  | 1 +
 2 files changed, 4 insertions(+)
 create mode 100644 board/ti/am62ax-sk/linux.config

diff --git a/board/ti/am62ax-sk/linux.config b/board/ti/am62ax-sk/linux.config
new file mode 100644
index 000000000000..b0f9d1b7377c
--- /dev/null
+++ b/board/ti/am62ax-sk/linux.config
@@ -0,0 +1,3 @@
+CONFIG_MFD_TPS6594=y
+CONFIG_MFD_TPS6594_I2C=y
+CONFIG_REGULATOR_TPS6594=y
diff --git a/configs/ti_am62ax_sk_defconfig b/configs/ti_am62ax_sk_defconfig
index 1144577942b8..68a0e0fb9db3 100644
--- a/configs/ti_am62ax_sk_defconfig
+++ b/configs/ti_am62ax_sk_defconfig
@@ -10,6 +10,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/ti/am62ax-sk/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am62a7-sk"
 BR2_TARGET_ROOTFS_EXT2=y
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

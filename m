Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4D2C25B77
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 07:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58A6981425;
	Wed, 22 May 2024 07:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6Wbu9Avmvao; Wed, 22 May 2024 07:02:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 672B38200A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 672B38200A;
	Wed, 22 May 2024 07:02:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14D801C5857
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01DEC40347
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syM8_3L4TtCX for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 07:02:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 49AC940181
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49AC940181
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49AC940181
 for <buildroot@buildroot.org>; Wed, 22 May 2024 07:02:47 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5751bcb3139so6926996a12.1
 for <buildroot@buildroot.org>; Wed, 22 May 2024 00:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716361365; x=1716966165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UvkAYVneU80i5ut71j/6Of/HRF/qbYJDIQXPcUAdskM=;
 b=SsOgjlVSCk1XIhwxVqIc7cS5vL4OSySQGYHijMAKuLdc/3Oh0ybDSz7p8KP2KgkrUX
 y0WQDGLuiIIMkSNVMw/05iiRvqvk0VsvtQUrxU37PF5AaYP68D/3OnUrlQyhF1Xm3ZtP
 JYfNq/1a+huniDTmNAO4snqqVWeQFuY4ecOTgq9aOjUd60elkjSvuWZ20mDcBmzbYZe1
 QrhgSxpWwUga0ax3SwmNRjy4afZP+vUKp40lOW1SQlSvR+hIih4yFv70W3CwDg954gy0
 qDU9q9Q0Z+ZkBkFfOwA5vnzGF+Mh279zN/qP6Gb4YaFvTL0mD8pZlpC943+bHWoyB0qj
 f4PA==
X-Gm-Message-State: AOJu0Yw9HKQSxyMH83QN0F7oX36nk9ocU/RI78NBFPH7QlZz+gmWfnE9
 bGgQcv9NiRllxEMWC9N8i4U8h683imZeqLNyna4PmSf1LJpPxvrhXrXHzOwQQuDm7akZGJlfEYY
 jwKI=
X-Google-Smtp-Source: AGHT+IFGajsNIi8FboFRHHxxD+T2VEITOvn/IzuIVuLHw9HNcnS8zzCqsmZ6hi4jyl9CdTsoZ+Xnrw==
X-Received: by 2002:a50:9fc9:0:b0:56e:24a5:587a with SMTP id
 4fb4d7f45d1cf-57832a44748mr719726a12.11.1716361365177; 
 Wed, 22 May 2024 00:02:45 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.196])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574d738c80csm12028365a12.81.2024.05.22.00.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 00:02:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 09:02:20 +0200
Message-ID: <20240522070238.3282121-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
References: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716361365; x=1716966165;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UvkAYVneU80i5ut71j/6Of/HRF/qbYJDIQXPcUAdskM=;
 b=QB95CIzTKIZ1NuOOeMpDZIl/yfQYafS7KRVPtRSZLrM09feL1/6u/kYChig6SQUUAH
 GZeg6n2TwB24uZH6RE5oYS76uwxTAKLT2A1aRd+TjROSE3nXsQxXCejf2sYZ9JDG0oBd
 yegP+btRfCBXnpsweQOgqMFCPaU7mXzbYO3EU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=QB95CIzT
Subject: [Buildroot] [PATCH v2 01/18] board/orangepi/orangepi-zero: make the
 patches to be applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit allows the Linux kernel patches to be applied with fuzz
factor 0. The fuzz factor specifies how many lines of the patch can be
inexactly matched, so the value 0 requires all lines to be exactly
matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...RM-dts-orange-pi-zero-enable-spi-nor.patch | 41 ++++++++++---------
 ...ARM-dts-orange-pi-zero-enable-spidev.patch | 23 +++++++----
 2 files changed, 36 insertions(+), 28 deletions(-)

diff --git a/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch b/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch
index ff0a1db223ea..ff350d68b4cc 100644
--- a/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch
+++ b/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch
@@ -1,4 +1,4 @@
-From 068c3baff3048a3db4ef2518ff917ce749cd8169 Mon Sep 17 00:00:00 2001
+From ddc295a04269437e5c726f63239689786354d44b Mon Sep 17 00:00:00 2001
 From: Sergey Matyukevich <geomatsi@gmail.com>
 Date: Sat, 20 May 2017 11:24:26 +0300
 Subject: [PATCH] ARM: dts: orange-pi-zero: enable SPI NOR
@@ -9,34 +9,37 @@ For more information see:
 - http://linux-sunxi.org/Orange_Pi_Zero#SPI_NOR_flash
 
 Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
- arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
+ .../boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts    | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
-index 4e1a9050c6b4..cdf19821b1f3 100644
+index 6b74cc923e16..4012f8712cd7 100644
 --- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
 +++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
-@@ -161,3 +161,19 @@
- 	/* USB VBUS is always on */
- 	status = "okay";
- };
-+
-+&spi0 {
+@@ -167,14 +167,18 @@ &ohci1 {
+ 
+ &spi0 {
+ 	/* Disable SPI NOR by default: it optional on Orange Pi Zero boards */
+-	status = "disabled";
 +	status = "okay";
-+
-+	flash@0 {
-+		#address-cells = <1>;
-+		#size-cells = <1>;
+ 
+ 	flash@0 {
+ 		#address-cells = <1>;
+ 		#size-cells = <1>;
+-		compatible = "mxicy,mx25l1606e", "jedec,spi-nor";
 +		compatible = "mxicy,mx25l1606e", "winbond,w25q128";
-+		reg = <0>;
-+		spi-max-frequency = <40000000>;
+ 		reg = <0>;
+ 		spi-max-frequency = <40000000>;
 +
 +		partition@00000000 {
 +			reg = <0x00000000 0x200000>;	/* 2Mb */
 +		};
-+	};
-+};
+ 	};
+ };
+ 
 -- 
-2.11.0
+2.43.0
 
diff --git a/board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch b/board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch
index 04d43c344f29..61dc97fd8b4f 100644
--- a/board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch
+++ b/board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch
@@ -1,4 +1,4 @@
-From 8dd1b2a696bb7e9914abd11cc6f5c0f54c33d626 Mon Sep 17 00:00:00 2001
+From 208b13119fc0f709935fc2fc13c0295b19edbbf5 Mon Sep 17 00:00:00 2001
 From: Sergey Matyukevich <geomatsi@gmail.com>
 Date: Sat, 20 May 2017 15:36:51 +0300
 Subject: [PATCH] ARM: dts: orange-pi-zero: enable spidev
@@ -7,27 +7,28 @@ On orange-pi-zero board SPI1 pins are accessible via GPIO expansion port.
 This patch enables spidev driver for SPI1.
 
 Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
- arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts | 11 +++++++++++
+ .../dts/allwinner/sun8i-h2-plus-orangepi-zero.dts     | 11 +++++++++++
  1 file changed, 11 insertions(+)
 
 diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
-index cdf19821b1f3..7242aaecb14f 100644
+index 4012f8712cd7..3552eb312747 100644
 --- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
 +++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
-@@ -59,6 +59,7 @@
- 		serial0 = &uart0;
+@@ -59,6 +59,7 @@ aliases {
  		/* ethernet0 is the H3 emac, defined in sun8i-h3.dtsi */
+ 		ethernet0 = &emac;
  		ethernet1 = &xr819;
 +		spi1 = &spi1;
  	};
  
  	chosen {
-@@ -177,3 +178,13 @@
- 		};
+@@ -182,6 +183,16 @@ partition@00000000 {
  	};
  };
-+
+ 
 +&spi1 {
 +	status = "okay";
 +
@@ -37,6 +38,10 @@ index cdf19821b1f3..7242aaecb14f 100644
 +		spi-max-frequency = <10000000>;
 +	};
 +};
++
+ &uart0 {
+ 	pinctrl-names = "default";
+ 	pinctrl-0 = <&uart0_pa_pins>;
 -- 
-2.11.0
+2.43.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

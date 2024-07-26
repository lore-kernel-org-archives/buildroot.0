Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0366C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 15:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A04F040F68;
	Fri, 26 Jul 2024 15:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3uH3Th-6msa; Fri, 26 Jul 2024 15:30:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6791E400A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6791E400A4;
	Fri, 26 Jul 2024 15:30:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 737341BF330
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 15:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C4A181DD8
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 15:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxxTXfQngP9B for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 15:30:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3833F81D24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3833F81D24
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3833F81D24
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 15:30:10 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-369c609d0c7so1602308f8f.3
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 08:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722007808; x=1722612608;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nadEhDSFcUWzuvDhg697f1zUTFaPsANV3OULxRrcujE=;
 b=sbqtuSheeSxnaP62XGFjLMac/6VDFh6jRhqYyZHOGP5Yk1LCcUo5KTCfHj5Iy/e1Wo
 QFPOh+zKcDyQNIblcewnTas3EZDcN0U7tdbAlKc4glKFDAjujwCSHa2rYaElCugRv796
 SPJo6m3JDHn1Q8/mtFCFY2n/QzbuyyUUMymRXhgY8brbwWb7oQ9xGQMpq/GimIPeBLyi
 XvDJiqaUhO0f/cXvHiqTbeLFIXsb/0238gvXlIQWDWp2jd1EbekXuQULeaioQTPHaevT
 OOEbch464nEkgxcCDqudmJEGQ3eOG8AXZYFXszZSGK/aoGq9vG4Mpw3jsepUjCg9ADXU
 7Jqg==
X-Gm-Message-State: AOJu0YyUApaVI1o8ru1RFjPkUCwijgC2Tgx+M31gHgEoW0dlUydnj8jl
 O2jNklzurJ57MhfIXCQQlyvCH6hVzXl3/xV1tML2thlrQOaqPRcG8vcLFw==
X-Google-Smtp-Source: AGHT+IEhMkRRGQvFS+57k8N8FkNkXc70R4jak/Qtj3MKwBzInTMD1zQMMQB012p0jz/iO7aX6lFmYw==
X-Received: by 2002:a05:6000:b88:b0:368:3384:e9da with SMTP id
 ffacd0b85a97d-36b5d2e806emr13435f8f.62.1722007807416; 
 Fri, 26 Jul 2024 08:30:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42805730d92sm83349165e9.3.2024.07.26.08.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:30:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 17:30:02 +0200
Message-ID: <20240726153002.18133-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722007808; x=1722612608; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nadEhDSFcUWzuvDhg697f1zUTFaPsANV3OULxRrcujE=;
 b=hPOFpx32WWqIhOL3pc+IS/aGuo6RX5vG4D/P8J0Qyo9tbg3M4Fr1ZWc0YaetnJjoW/
 nJf97L7b0KhNvLIWCDohKPrT3ZS9NJi+OJH3PitAsLy0foIr6vHpYrDNnONvF8oXLXlM
 eg7HyjSHxm8Ycui1QehQ04wc8bGqikTUijIlrw66kWNaeB4/aHOBrP8I+/234Tb4nQCZ
 n8OQRdBVaszH15Y0EiR510tzGZ5ysJTJkRQlRzoSP67dTfjSQW1bKsibJs9rYfLsy3DD
 rK0V3cC4QF/1nle63dYCrNE3l8hlfsirUkdbXs3pud7TqVao0fbjTrpbBTiW+h0ouv/F
 Xo/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hPOFpx32
Subject: [Buildroot] [PATCH 1/1] package/gtkiostream: add
 BR2_PACKAGE_GTKIOSTREAM_ARCH_SUPPORTS
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Matt Flax <flatmax@flatmax.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gtkiostream only supports little-endian since its addition in commit
fab48302865e5c0c98d91b696bc90e75e38189bb resulting in the following
build failure:

In file included from BitStream.C:23:
../include/BitStream.H:35:2: error: #error "iobitstream not tested on big endian systems"
   35 | #error "iobitstream not tested on big endian systems"
      |  ^~~~~

Fixes: fab48302865e5c0c98d91b696bc90e75e38189bb
 - http://autobuild.buildroot.org/results/aec24d92cc2196596413cf509d686f1f8d1eca95

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gtkiostream/Config.in | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/gtkiostream/Config.in b/package/gtkiostream/Config.in
index 1d1ec27346..0567ce876d 100644
--- a/package/gtkiostream/Config.in
+++ b/package/gtkiostream/Config.in
@@ -1,5 +1,20 @@
+config BR2_PACKAGE_GTKIOSTREAM_ARCH_SUPPORTS
+	bool
+	default y if BR2_arcle
+	default y if BR2_aarch64
+	default y if BR2_arm
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_microblazeel
+	default y if BR2_mipsel || BR2_mips64el
+	default y if BR2_nios2
+	default y if BR2_powerpc64le
+	default y if BR2_riscv
+	default y if BR2_sh4 || BR2_sh4a
+	default y if BR2_xtensa
+
 config BR2_PACKAGE_GTKIOSTREAM
 	bool "gtkiostream"
+	depends on BR2_PACKAGE_GTKIOSTREAM_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP # eigen
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ALSA_LIB_MIXER if BR2_PACKAGE_ALSA_LIB
@@ -14,5 +29,6 @@ config BR2_PACKAGE_GTKIOSTREAM
 	  https://github.com/flatmax/gtkiostream
 
 comment "gtkiostream needs a toolchain w/ C++, threads"
+	depends on BR2_PACKAGE_GTKIOSTREAM_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

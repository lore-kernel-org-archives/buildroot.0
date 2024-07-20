Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7786C3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 20:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 676FC81E72;
	Sat, 20 Jul 2024 20:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGVIlrdoRRkU; Sat, 20 Jul 2024 20:17:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12DA481E50
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12DA481E50;
	Sat, 20 Jul 2024 20:17:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A54C61BF2CF
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 20:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F935403A7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 20:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jB78DByJzEun for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 20:17:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 73FAD40390
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73FAD40390
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73FAD40390
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 20:17:15 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2eeb1ba0481so45668121fa.2
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 13:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721506633; x=1722111433;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iRoe/sJrxf/0mxRAEFhN+XMoEpxYxXjAWP3w64Gc1q0=;
 b=rkqrZMAikPsJeB7yOs2zym3l7umgaKUeOWHnyHIu/4N4916/vU8qxHrOm2WeWU2LUN
 cS+lsQn38k7AlAVtYN8lSvqw8cKo/BiL8OhnkJ48xGYcAt0bLZfyzIfgL7BGwQ72gGXm
 TwHTjhkPBbTso2b4vxw/PPfE+Q9COdV68z9WmuGf4NUoXgaD7w+JCHqnEbj61M8+b38I
 elxpdbTGKafS2MHVWIGaoa1LMrCPKbyPBm581Fzrz2BjMJ6XLuzxrnljBVIpmgXRWBsI
 3p/AKkx80U2exMtNQSfK3eTcQCXn+CqOfDWKaCygKTic5qyIcGTjVPu0tfwcXgnkG2qw
 1mxw==
X-Gm-Message-State: AOJu0Yx7N9S/aHcEIW3pOPKGRY1XfpLIXa5AzXSxv/jqvjqil4KEmXc6
 Jg89xY7s7aWbtYmCkuhat62r/1/CtJrH0666txDljNjZlhkBbZU56otr00RzJkfmHFPay+ewwDc
 aCe4=
X-Google-Smtp-Source: AGHT+IFD8PiAh7Mb0rU4TaqpBKEUjCnDEKwTc8F/mBBBZ7EZaIMSLUE9YxXXqjgnSscV+S5Bobx6Zg==
X-Received: by 2002:a05:6512:2309:b0:52d:b1c9:34e with SMTP id
 2adb3069b0e04-52efb798f1bmr1364978e87.21.1721506632973; 
 Sat, 20 Jul 2024 13:17:12 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-80-180-25-123.retail.telecomitalia.it. [80.180.25.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c7e7871sm204723766b.96.2024.07.20.13.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 13:17:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 22:16:58 +0200
Message-ID: <20240720201659.2253736-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240720201659.2253736-1-dario.binacchi@amarulasolutions.com>
References: <20240720201659.2253736-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1721506633; x=1722111433;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iRoe/sJrxf/0mxRAEFhN+XMoEpxYxXjAWP3w64Gc1q0=;
 b=nfDgANV5MF48S3FRGbU1JCN0NdIGt06/DK1XY8Alo/i+pZAKRkB0dqpJtql4Wy3ZLY
 dl4lNS+N4BpxZJLFyA857Ba8S+5mp3PeuE6GBt67lnnieLnn5IDNQHSnfASyRu9iiDS5
 CvEEKaAreldOJuopG6tCw8idydibRUvBiyHoE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=nfDgANV5
Subject: [Buildroot] [PATCH 4/5] configs/beaglebone_defconfig: add hashes
 for Linux/headers/U-Boot
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
 linux-amarula@amarulasolutions.com, Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch adds .hash files for Linux, Linux headers and U-Boot and then
enables BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we can now drop the
defconfig from .checkpackageignore.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                                             | 1 -
 .../beaglebone/patches/linux-headers/linux-headers.hash         | 1 +
 board/beagleboard/beaglebone/patches/linux/linux.hash           | 2 ++
 board/beagleboard/beaglebone/patches/uboot/uboot.hash           | 2 ++
 configs/beaglebone_defconfig                                    | 2 ++
 5 files changed, 7 insertions(+), 1 deletion(-)
 create mode 120000 board/beagleboard/beaglebone/patches/linux-headers/linux-headers.hash
 create mode 100644 board/beagleboard/beaglebone/patches/linux/linux.hash
 create mode 100644 board/beagleboard/beaglebone/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 2f40d1e77c6b..2aec21b90faa 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -141,7 +141,6 @@ configs/bananapi_m2_berry_defconfig lib_defconfig.ForceCheckHash
 configs/bananapi_m2_ultra_defconfig lib_defconfig.ForceCheckHash
 configs/bananapi_m2_zero_defconfig lib_defconfig.ForceCheckHash
 configs/bananapro_defconfig lib_defconfig.ForceCheckHash
-configs/beaglebone_defconfig lib_defconfig.ForceCheckHash
 configs/beelink_gs1_defconfig lib_defconfig.ForceCheckHash
 configs/broadcom_northstar_defconfig lib_defconfig.ForceCheckHash
 configs/canaan_kd233_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/beagleboard/beaglebone/patches/linux-headers/linux-headers.hash b/board/beagleboard/beaglebone/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000000..5808d92afe89
--- /dev/null
+++ b/board/beagleboard/beaglebone/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/beagleboard/beaglebone/patches/linux/linux.hash b/board/beagleboard/beaglebone/patches/linux/linux.hash
new file mode 100644
index 000000000000..ce0613ad4467
--- /dev/null
+++ b/board/beagleboard/beaglebone/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  6b73d8dca21000030acd2e37aed43f23de2fdd2850a2808722658241df48e671  linux-6.1.80-ti-r34.tar.gz
diff --git a/board/beagleboard/beaglebone/patches/uboot/uboot.hash b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
new file mode 100644
index 000000000000..bc999536af21
--- /dev/null
+++ b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index b1a0c7cda408..28f3c20c00ee 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -7,6 +7,8 @@ BR2_ARM_FPU_VFPV3=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # System
+BR2_GLOBAL_PATCH_DIR="board/beagleboard/beaglebone/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 
 # Image
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

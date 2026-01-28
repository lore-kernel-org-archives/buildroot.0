Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA749D35673
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 05:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E88CD830C1;
	Wed, 28 Jan 2026 05:41:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3_p5atRPPsV; Wed, 28 Jan 2026 05:41:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6067782F4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769578909;
	bh=dE0g5HrbxmqTiYillmPtxlvqC6kzKlUQqXwCSiQgUKU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dJWN29iXUiTA7u5Pz/HRUT6tt/bUgrKXO8WA9lv001Bid4aydTi1xaU/JCpjoMG+0
	 2n3DLsq6b+siJ5mK+k9+FVYIQvCvY1rJoVv3G7Ryv4c6D1q7DWOhjKNwrjC1nA4O9v
	 cBZOR2k05l30wzzdS7COepeP9tXEg/bxF1kFMw2IGk7s1QVV9DEtD64CNVVbvNeXmU
	 M1imKxXspqFQwfK0MS++/7I2mvj2/7gRBEPsgWrSEs9qTok37FppzaV6O8xexMIN+X
	 4a6aMrZtgbjD+K91ZDEIVkg2LWvVmCIBNvzbNTkSeGIyfng6dVTgVa7nIzYA5/7yVS
	 +UsODa3EVphBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6067782F4F;
	Wed, 28 Jan 2026 05:41:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BCE24160
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 05:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A7ED40224
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 05:41:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id koNs-aPjAlPO for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 05:41:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::34; helo=mail-oa1-x34.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BDDD74017B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDDD74017B
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDDD74017B
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 05:41:47 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-40945a682b5so422067fac.1
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 21:41:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769578906; x=1770183706;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6QbLLKeKQNYcWN9SEYUGTPkVsyU8CtmSrLct5mebJIM=;
 b=TzJTFkphrmhraKhe7E4omz+OYSLETp+rN7n2FbHuyYbBZmm++EdVamlBBmrftbyex2
 MHjkAUrXaqAUgUqUYhBkB43EI+Uu6wzsubfqqaibWyU7IVWw5Q+vt9tN+LBYVYCNFZOu
 vwp4VsmYAWoSOPArhfHTbnWr9vnEYyEv/gg8clqNZKyBgHpvq7rPsLLI283k2DSMdWtk
 OgkALtFF6RiRthL0+8Y48NqfxNVkdtzqBYK8cLyHkFElCw97AE2LDVX11Uv5D1cipnY5
 5Wzx2SSwj/hW6yqpKwRcIS/SCX57wfMppgsdGJjOs2uaB+rvrHEUXyx/LXuQscIkM/jF
 Gqog==
X-Gm-Message-State: AOJu0Yyx0pmPm+oWPJXUALHyErYJBmG5S/kvBzLaaOUkICXQTLxW2RjB
 qGku8U9ByTdYlPStm+H4PV3eG3sxKprpksjs4LzC74zcp5XfXWbzaispsAfFgQ==
X-Gm-Gg: AZuq6aLAp+t3UTchG8K0TL2IFlPjoxgnefymw+Ac0Nemx4CjQJ3+vXX0Gh9U4P36scl
 P6K6JrwvbbfD8yRWvuuXSxZZuyxQ0k6o0QvXG6hnNz8GiVQOmM5i/EpMVtXssn1WBwhVXowjTKY
 9vto4ZsWmWfYcsCjYZY1g5UetlpcocGmZk/PECOhFFG19D4Meh/6D1Q7M+IA9xIbV+93jnh8TvF
 kKt0PB+Ytr3HrIzV+B7pr56gFyIhC4nogGtGKunW3DrYeti+1rUHHnJ73ZNd8FEmJbLuOjO+Zrc
 1WvzwAJCpdtA+BRR1c9Rmt9o4ORs1TdZ4v6NdOHAoyNL0zgREL2CUWUN1YbjNyNT+CElRazxzeY
 pQDVjRko8TJSXzUCRw3wENti7l6fF+Ef74RVebbaBDZmykFqgFKDxMAoa5+yVe6azKJlkJwJQ
X-Received: by 2002:a05:6870:219b:b0:3e8:9e31:7fbb with SMTP id
 586e51a60fabf-4093ff5564cmr2459865fac.35.1769578904761; 
 Tue, 27 Jan 2026 21:41:44 -0800 (PST)
Received: from localhost.localdomain ([2607:b80:2c1:810:a00:27ff:fed0:12cc])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4095749f332sm1203015fac.11.2026.01.27.21.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 21:41:43 -0800 (PST)
From: Lance Fredrickson <lancethepants@gmail.com>
X-Google-Original-From: Lance Fredrickson
To: buildroot@buildroot.org
Cc: lancethepants <lancethepants@gmail.com>, Dick Olsson <hi@senzilla.io>,
 Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue, 27 Jan 2026 22:40:58 -0700
Message-ID: <20260128054100.3981396-1-lancethepants@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769578906; x=1770183706; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6QbLLKeKQNYcWN9SEYUGTPkVsyU8CtmSrLct5mebJIM=;
 b=MGq02Q5fEtiGKDlpvYgC50jqjOLBe3wZwfm0fYpNjIbcMx915o23vC6tDTbYEa3vdT
 9DvsMw/srMUOXL3h4ecG7eNP/KhCatqVAtuOMW1RMgoxecAa1KyHTUiJ2p67Csmt214b
 sKwFCRh26CBvzoOjivO1gIjp7ZFgwuiOAVf6C/Sfjx7NceQIGY6QRLRxVjig9OHuKDfr
 Eu9M/3YoOFMof64cMBD8IACSaG1CVAXI3b0GMJAJjQJcDElu8fQ0X6MQywT0MTEvGmUj
 ATT06na7i8P4LDQMeOF4gj4O8Sjf/w2d29NjPiWLnXUU5G5DwLgNMlBXm8AKy5GzK7BI
 n2iw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MGq02Q5f
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: add option to depend
 on host-uboot-tools for mkimage
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

From: lancethepants <lancethepants@gmail.com>

Some ATF platform builds (e.g. Mediatek) require mkimage to produce
bl2.img. Add a NEEDS_UBOOT_MKIMAGE config option similar to NEEDS_DTC.

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
---
 boot/arm-trusted-firmware/Config.in               | 7 +++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 72684e5974..f431171ab0 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -252,6 +252,13 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC
 	  Select this option if your ATF board configuration
 	  requires the Device Tree compiler to be available.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_UBOOT_MKIMAGE
+	bool "Needs mkimage"
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS
+	help
+	  Select this option if your ATF board configuration
+	  requires mkimage from u-boot-tools to be available.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
 	bool "Needs arm-none-eabi toolchain"
 	depends on BR2_aarch64
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index f5b1e5030e..df36f81575 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -36,6 +36,10 @@ ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC),y)
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-dtc
 endif
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_UBOOT_MKIMAGE),y)
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-uboot-tools
+endif
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN),y)
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-arm-gnu-toolchain
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

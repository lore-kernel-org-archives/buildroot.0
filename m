Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103E9F364A6
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 17:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3C3E40B85;
	Thu,  9 Apr 2026 17:41:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WwAjOg27zOz1; Thu,  9 Apr 2026 17:41:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDDCB40C04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775756472;
	bh=TCXLp5Al4svD1v+ITbworlArWUQshYMR8CIFJ/zk2qI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=CsSgrBWPd2TsuJ3461HhY0TJUHnXGxqfVjOzeFRR+N2cg6ETdYLKfQZZNkPqIONzI
	 UYwS3cvA+Kz3JCONZbUyNizrClJQK37uQkH81AZmfEQ86jqj4aqCfmoNa3hBy/56ii
	 tJx173COWbPLfFgpoxXGCa0Q5XJm9L8rCOtE+kVSC7HqOJBcqE2cb4gonGRVkCC+k5
	 ITVx20vd/liPT7Q1Cok7y0cCK6GecVio9Iwc+EFN0UNXjFSdsC8yw/tcYu1s9K96dE
	 ict1Q/i1fXBYBM3viq8I2XwLNMFHb+KysgWuygy84QwMlF0HzEm0h3/Olq2yP70cjb
	 1rtNmDk3SQh4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDDCB40C04;
	Thu,  9 Apr 2026 17:41:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E9A66237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 17:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFA3340C04
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 17:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_nAm-b8s7MR for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 17:41:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 05DFE40B85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05DFE40B85
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05DFE40B85
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 17:41:09 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so14224345e9.2
 for <buildroot@buildroot.org>; Thu, 09 Apr 2026 10:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775756468; x=1776361268;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K9pgVrh/OPnlktXarOAUT5BIfoNXKzFDOr6ALY7pSmk=;
 b=nvHWDZUHptnCHyynDVd9LcxwC84srJGRvYQ8ldmOrTbXvDAxVie35YeAUymmDmjoQ3
 SdbqT2SNV5wHCLDHOT0TWGQ+Oy1wrVfJxj5OcinQYB+P5DNknTFMnNhcAnFmUD1yTaWR
 WM7skHgpoqN+y2D/a+63xExzUtb3hLIdl9iPQqtRxKXkeRavnmzEpG+OSKrqwA8QA/nc
 j6fahO3O5ljMMhjPX06Hl71yHNcfL5FrT/oBwCmmqLOnfaX919/mOJN8NE0nSDDXMBBY
 Ok7Jv9hqLbp+zIyRAj0DiHvAln2ixAqxLhq/c1kr89OoryynNDD8EMr+8+hGkwM2LGWo
 kZGA==
X-Gm-Message-State: AOJu0YxA/xSbVCgkqBDg/U3ko38jRZ/qhbB9xN8qE8VRuWXiFsbvLwp9
 RUB4uIK3PX+kYWuyDpM8VdqhjRzQqZVsbAQx0SF1FeXAh4T2JNf5IR4IrNZRRXirfuLA6xOexZq
 Dgg0w
X-Gm-Gg: AeBDietaG7cumdJm7oe7Sv9ZoA/aqxQ3WkSZ46OlGP7SJxMB8kylqY2CcU8KFjHx2Mu
 X/0OI/x0wz4P2N2DtwPrOVryah1fDCy1wYCP6eOF6XF2YrJV9vSQ437p56mX3QRWHGBpkiCI5i3
 HnEnCK7jEYmB8hXTpK3NPjfDNUsPMskupQchHs+j27sczoPkBYaWXaSuByrotF7gvM/CPffN+mT
 PlymBBTBRsGY79tccjb6UiPlOcfyK/hZp+LK8MuAPMbcBDOZKEwk4jNsnVAjGihX7hDvFR/CrM+
 Zxg4ahAjEOjdxiI9zRz/bInmH0q/A5K5yzoa8zWfq6/nwltu2tFP2HO9cIZPur5z6t3uRBKcK0q
 dbTL0m/HDW1RNhd4P1wzDDnsFOfnxrEQvcEh65osw0RruRiwK6r+d+jf8k6ZOwamWqoQPdZGULI
 mduLWmjpDicR9bfCF6q2+iualc8ytdFNFAfV8Ex6L09TF6B40fpQEMxIIwwMQhI3TKPtJqQiSxH
 hENqBt0j3/RksWTX4bmbXsj/FOxAlTl3ANBQkOeTh9kQFE=
X-Received: by 2002:a05:600c:5292:b0:488:8d44:bf98 with SMTP id
 5b1f17b1804b1-488996e8254mr398952465e9.7.1775756467855; 
 Thu, 09 Apr 2026 10:41:07 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.70])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e50015sm440065f8f.27.2026.04.09.10.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 10:41:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  9 Apr 2026 19:41:04 +0200
Message-ID: <20260409174104.3949042-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1775756468; x=1776361268;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K9pgVrh/OPnlktXarOAUT5BIfoNXKzFDOr6ALY7pSmk=;
 b=WBq0iZi7ulSb7dEBMqoaRCJnrSzGBTnutJnd1xpvjZRHAGjCqm3R2z1J5dNRgEF1QL
 cym5ZQX8Tzmojw1lf5KsFQVTL476R+XTDhFtafSWPnWk6v1fKWBtYWp5vjDVjqJEXK17
 F8wy5JBUTJyBI5h9DpE+vRpuk4EJQ8HiflsHQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=WBq0iZi7
Subject: [Buildroot] [PATCH 1/1] configs/stm32f746_disco_sd: bump Linux to
 5.15.202 and U-Boot to 2026.04
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 5.15.202 and U-Boot to
version 2026.04.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f746-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f746-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f746_disco_sd_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
index 50c6664f950c..7929b2b9e344 100644
--- a/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
+sha256  0bc1bdf74957e276793691865ffb71505809706d9243a42e9704aad0f128cdd4  linux-5.15.202.tar.xz
diff --git a/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
index b6a925ea4e89..36322a6a904c 100644
--- a/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
+sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
diff --git a/configs/stm32f746_disco_sd_defconfig b/configs/stm32f746_disco_sd_defconfig
index 027ecc0f4b3f..820a7e83e3fb 100644
--- a/configs/stm32f746_disco_sd_defconfig
+++ b/configs/stm32f746_disco_sd_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f746-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.197"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.202"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32f746-disco/linux.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f746-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

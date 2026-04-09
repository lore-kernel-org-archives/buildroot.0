Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DDDF364A6
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 17:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B514081E59;
	Thu,  9 Apr 2026 17:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cbzkjqB9zqdG; Thu,  9 Apr 2026 17:42:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B7B681E4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775756534;
	bh=kHpBF5QNU/eUBsWzVHj0PWGj9GHMpgM2qvzCVzlBTpM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qOqzbrB43s2eioW7ggC1LqDqCsI/+2mpDfCB/CLqW3tRXsvMvtvu8DzBFpmOySMJ0
	 cKAzeWJhNNFUhNqtBDxn9VRd5iIxdChk+jdy3u2fbuydQqLL+u1t1eJJqIrIn4RtTQ
	 SKs7U+vhE3A1quGVx6C8s5nocPeEVd44hL+9hVCjBTavFPo/Qq2NI8ZM2c2jcsPOd3
	 6TNKugZzSbVQXu/XcgD4hkm7e+eQdJVVnt1809/ZZ4zKp4dKWmvzf58ONZAVsc795L
	 wkqpsJU/dyZVIVyJl4+Ypn2qIGs0EOaqidpH1kybrgTQL8ly5oaGcSYWB6ZNFT+isi
	 yeqQWIy8wkMeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B7B681E4E;
	Thu,  9 Apr 2026 17:42:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 68EE2237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 17:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E29B60AA1
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 17:42:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id utBYZ_XS4f0T for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 17:42:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6E9C7607E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E9C7607E5
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E9C7607E5
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 17:42:11 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488d2079582so8160705e9.2
 for <buildroot@buildroot.org>; Thu, 09 Apr 2026 10:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775756529; x=1776361329;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fYpKCZ98ATVcbLNLRLid48sRrUhUwpG3f9QrSJZIokA=;
 b=Y3QIP048MINyDwXn3rPp5Jw6RewPJwUVEsQDl3ndFgt2Qq3lrUkh3eqnuxQPQ72iae
 F6SLuUMG4TKGhT+nfgI1TZY7GGW01ZEg0eLoY0yFU1gHLJhi6UaNVj6APuHrJV2kar2f
 2b9AVdh3Di+imWXsCqw8q2bn3XF+riOMDSgrxv0zK8VhaboBoKuICWpBONFF2N+WdClC
 XHov4/62VmHJKovdzhQaVbfadxW4JqAMJwJce34s+1oYBLkpCq88uOievwNDxP8n4eFC
 MeqynaFhgBsdmMle22k/NXUkjFpEfQF4HyfAMQmRRVAcLfxv/k6grGSuIPggsfaWMBFl
 PmyQ==
X-Gm-Message-State: AOJu0YydSb6SycIvdIBnLkRw85Jnq/600NINhrbG3OcALV822p/Hilt5
 jbxtjsy5wB+zyPhPURM6bhAJsyIYLkmBnqwXLbTptND1JMTHJQtqKsn9YIgYDxeDjed6Jl+ZCFQ
 HC0mK
X-Gm-Gg: AeBDiesCubFnUe0BcylUGDrAmlDLQr25qto2yjXcijfdm3WblDfxgsQ71jCIKRnnw6d
 Xe/cdeSqhYYOQroEVYGFSF5zdpEz5dqA4ULJBuzZpvwGRCO6PA3G4l7hfrtqaL4iLBQLIXtKUp9
 OToNAz6NOsR0S6VT4soBU5AZ+Ml3eWxX8zUNtwqjNBRGlviIdwtD1YXIaXi0G3sr1nlMqKgjK2v
 tVN1KcpNzpM9AXxwjgdHx2+FWa6CYX4RvYMWVJwTk3AXSL4O6TQE7+cXeoz0yPoZfnHJ7Xwyxoh
 VBtzwrB97xqjbYWtOAkNoE15MIzo8wIqnVhMa1PLf3icTnl9HV52G5iKU3L1nODK8JBRsdYT46C
 wdmQpmheAdcQV9Oxpr/RYNIp/+pgVOINcVxX2qlcOc2gQflVlVJX452r7SXZAOZZK7rFJ9q689V
 ytD58L0LibcvlU80J7KRgCgTIuptn9sD20sPiGmNF+6Cpp7yEPMTNjhjp4Y3rIdEspu7UOvrOPX
 OHGZ8DYHQZZjiq3mpb26LPaJhWfywgzKbCUCfEea7xY/GA=
X-Received: by 2002:a05:600c:1da1:b0:488:78f2:6b0 with SMTP id
 5b1f17b1804b1-488998f488cmr365748105e9.29.1775756528811; 
 Thu, 09 Apr 2026 10:42:08 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.70])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5d78cfdsm1077445e9.4.2026.04.09.10.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 10:42:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Thu,  9 Apr 2026 19:42:04 +0200
Message-ID: <20260409174204.3949789-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1775756529; x=1776361329;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fYpKCZ98ATVcbLNLRLid48sRrUhUwpG3f9QrSJZIokA=;
 b=ZtnC/LjZY+PqKFdOWMRXf2Uy+VJKGXifmk9h9KO0Mm+da/xmjCbW2a8KZ1OrbN5TYk
 0Mrc1K/dTs2pboCJEACXUwkJOA/9PWmoHTOdEFgk6SfzhraXgtISpDOZJeDNly1Qk6lG
 Js7ZtgzyPO+s1GYgWOEb5yQWIfu1MivzfHkx4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ZtnC/LjZ
Subject: [Buildroot] [PATCH 1/1] configs/stm32f769_disco_sd: bump Linux to
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 5.15.202 and U-Boot to
version 2026.04.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f769-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f769-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f769_disco_sd_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
index 50c6664f950c..7929b2b9e344 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
+sha256  0bc1bdf74957e276793691865ffb71505809706d9243a42e9704aad0f128cdd4  linux-5.15.202.tar.xz
diff --git a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
index b6a925ea4e89..36322a6a904c 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
+sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index 3cc6354ed626..065d5b59bf6d 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f769-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.197"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.202"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xc0000000.config board/stmicroelectronics/stm32f769-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -23,7 +23,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f769-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

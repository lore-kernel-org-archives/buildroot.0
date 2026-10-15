Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37084CC6B34
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 07:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECA0160830;
	Thu, 15 Oct 2026 07:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBDgO7SpZBpz; Thu, 15 Oct 2026 07:28:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 15CF560845
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792049290;
	b=sIHdQGDIwPdfuk2xQarEVXYopvfKaxxAyAEb/C3aVBizQc5lM7oQbj2nXu9VtcWLjEhE
	 E/kUcPWc0Bd51/HtpieTy1BS2rv6xFHp4InW7lZxePpHAm29TCH2K41XcXKi1V3gHwvcT
	 WM6EiWUsXATjMde6QG6ILaqasJ79FpH81RJ523+exL5Kj/sex3Lm2lpQbJgzuiz0o8u5t
	 gJTmCgmfIIH9O7dPX+0v27fnq2M8Pqo5dxJqSSxehxkGfyy2CfAm3YyUTqt38ZwAFHxLH
	 y3PGPys4FE+xuMsBfSRDf67syvabzKnhqERr6x8wnVk8HrUhpXqctGdDwbd0Wl9Zfcw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792049290;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=J+/5O/g3HJC6TGV5i8itG1PX7BYuKZlvLP+d97cArmM=;
	b=ELFx8vsDQaB+cSfYgCm+21eGHyu60Ef1s5IlFVETj22BsNzQ7zByWnWeU4hLmvdV5eyE
	 dpLuvz64cVXDcB0fQfu804UN5dMxkSP9YJHOtBSfxm9Yo/8K3DPGdp7BUCjyv3nhSUaXd
	 hKD+0IQoKXHb9Z9FHqU3Z6+ee6ghUiNh2Kxp6Gn1qNM/lNBWtQhWOheqo/T4yMoSEO3VA
	 tTD+hGU7VjLCD6yM07rcrTWlQ2/rxvpabBweNaaXGD9ufue33ls4+IAiPi2E4CG+Adsu7
	 SWHLwMFH7dFR01CazppBByyp7AY2VaMJTvtkt4zu23kETbfBud2ziwYEnmwdd6yMLYQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=BLqfbHiH;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792049290;
	bh=J+/5O/g3HJC6TGV5i8itG1PX7BYuKZlvLP+d97cArmM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Jm2BQEdwEIvDOj211431dkfJiaptHZDshjkzwS0hKbhYW+zIA2KrjbwJQLh7h067H
	 84G0ApTNPmM4td/eEjQUOeTn+TtqgIGxV2k/rRvdb7J09YKwesqxtCYqQKdeVoOj4S
	 mOlnbTr2Udk5+SCSQQdUXPsSwWPI4UmYoGdlyKzZxpBqTkP+zK6b45t2jSq5YFJpTp
	 AOK4UHLYnSCWATWjxFS5Y/sf2QYItTiF9N3rL2NxtKENg2bWjk3jt6H3zXOyYiEgkv
	 UPjIjGl3GjvyZUOqqvcBeNG2i2VcWYesXYOKLTxT+OvQcYMv1Uwb4yJYzcZgZK7MeK
	 4Acxbtk6o+x6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15CF560845;
	Thu, 15 Oct 2026 07:28:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD9EA2E0
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 07:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B38DF60845
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 07:28:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t84kBmgbIF-r for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 07:28:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A08CC60830
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792049288;
 b=l6EKhzC6EXqQ7046Q8fuXL6gLIPKRqRdcREbL5yeRkunBV/Pb0BWildq6brolLhdzihJ
 b4o66mwyC2VWX7hIKLqhzYkqg3qB+MLL2VQmA78qrHBzg6i8prO6TxJyOoruwvTUagi8z
 bKYhPOEC23zoB8Pzg2bw2mVT/mrCH1maORMQCU09mMOJNz5+A0vLj4B6gkhEyCMlzfNoV
 2JAN3815FjAFu8D+wxV8/sCtUHodQCPBIl7ywbIZ11/4I2scY0TrwQonJBvo4sxuFJwU6
 0WI78rQ/9o+33OD/VnvKC6AvNwsw0BfTCdIAJA/ADjSHIu3HkcXymx7BbaoVlWQujow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792049288;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=bBSg/X6PDcEQTfNAnIp29t+i959ZvG5DDiG1hQk1MiU=;
 b=iPk3Lq0Zv2H/CRA18rrb+upPdM2DxquNjYQZ5J4ScAMrRA9EmrN5RnOvoD7xEFSXGaQk
 hWRJzehEe6E3hTh5jjK6GXUau2ftmgempo1T80AeDLnXsyYtLAH/1KPs69mcoYcQLPgvk
 Gu4DECWkOeMieLScxw/fbJWGH1X3LCZ2JuVITQRBOJw77KitbKx/loQIdPnQRY5tgquCy
 iO+gVXIf+v0CtjfA29uaTF3Mz4qzot0eMbHMHdsmbzv8aABBgo0MeWM04COeeKeO3aQ7w
 X6fA7UEtO2kqKGiWmi0h6Ft9C29aGx+oru9n3RKRcoLql7Qcye4foHOH/rZgZCSsP1Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=BLqfbHiH; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=BLqfbHiH
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A08CC60830
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 07:28:07 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a171b677d2so30776805e9.0
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 00:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1792049285; x=1792654085;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bBSg/X6PDcEQTfNAnIp29t+i959ZvG5DDiG1hQk1MiU=;
 b=BLqfbHiHgsF5sB/JEh3T9vpngAILOqbmwr+TRJuZTak2l6MZB79z+ACzsFA+DDLKRq
 U/arm8caPKY/aCn6sW+wm9Wub3LOqMPEhzipVPeDj0V9ZGuArJ5vh+E1dhaId+ccq5QD
 Rc9dSkDNMOsNRgOCC+U4b20NXOzU/3HSNFdVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792049285; x=1792654085;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bBSg/X6PDcEQTfNAnIp29t+i959ZvG5DDiG1hQk1MiU=;
 b=qitQvZUKfYPKVrknU2yeAOCAB0ZYbxsyHTy2Vk6SAxk+tQFMPfig+ELfrKQMVNkKa8
 snCtoOsKL47G/JNZvPuXiHYywrxEtSTPRHKcZ+5gEx4t6oMyfc5+dPFmSalsKcX/keEj
 DmriTL0gknbptjXJc/6KtHPeTrcSinZXccisGkcek5zK5UOSwUyBdKgp25DvpJ+SG0wc
 0Q5dmeXZm+7dJmKU4G0xO2iHS0EJ7BUMh00xJiwz/GYc7GNBW4lPSGq009I6Y0bRrRqE
 12tOx9/Pm9dG5+aTGWnSaImhUc47BGiHrAPShuQ4nhgpVAMmYrmPUAESqsoI8KRmaQTL
 rtww==
X-Gm-Message-State: AFq9FYLgsWSEdWRf1F/ZSDwi/+JCskruIfiwE0rKiKspLckld68h109q
 FyvB3Iqsel1UAJ//r/edkKmzkmaIrMranoV0n6scdn05REoOqoS6pNyBxNGi9CruoGtF8h8Tjky
 S+qZ0
X-Gm-Gg: AYBFou2kThFDf9lEs1K9mqP3MQJQcyKImhQfRZ4JNmoZi0EzBZzXgxZlPlf9CHiX/lw
 fVQB+DCMVICgJsHY9EjzJLAVUV8YF8b3Cu7KKehkC50y1q2EfANpbnAaKadt7cjRxdik/S91MdS
 yHO5V6ObjC6EnHRycquBhG9OJ3tcyCTjwJbKc6rpnsouqJk6sJHKPUe8371IhFpw6Pg+v4qmkVN
 Fv6sDx1280QYwAtf/MyjJfcA0iJgoU8qyBJdwkGI8h3Kxn6Le/EY2VvOkwTqvJcGY/PJS5EkX8p
 x+Z23VNMD4dzFiid9yT268uEq6UoRW0sigUID4h8SIxbKIqfKBm+JCrLTaxCeIzSDJ+5Rn52GOn
 EqDxRfMqE8vU8cyUqAg6iC0V14N3KdA0yAQ/+q/C55sf+r2zObmF06irAj6hfQD8nVaNudM5Jwf
 YtGtm5IrvHdkzobANL51v/hyPj1sPBwrnLS5xeb+Hi9y/8CtIy7gk8cJtkXnabAFkYtzSjkZoL2
 qzsKbJh/JJmMAwFHb3za9tRjBIj/XYlpQ691QuQ8ZCY/3ZkaFwyRBfXVm+/uKI9i6g=
X-Received: by 2002:a05:600c:548e:b0:49f:f9d1:e618 with SMTP id
 5b1f17b1804b1-4a18e4aa057mr368998575e9.17.1792049284445; 
 Thu, 15 Oct 2026 00:28:04 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:c903:d469:8f3f:2c53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c10fe9d3sm29947835e9.13.2026.10.15.00.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 00:28:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 15 Oct 2026 09:28:01 +0200
Message-ID: <20261015072801.1065248-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] configs/stm32h747_disco_sd: bump Linux to
 6.18.56 and U-Boot to 2026.10
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

The patch bumps the Linux kernel to version 6.18.56 and U-Boot to
version 2026.10.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32h747-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32h747-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32h747_disco_sd_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash
index 0daaa94e97fc..d89fbda1a71c 100644
--- a/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a7a7e3d2ae9d95e74197223a8d4eb5f6be7aac21b6e6de27e9685d001c1f8cb0  linux-6.18.39.tar.xz
+sha256  4633bbda2ab95eaf2a7af4041236451d6759c72e6946265531af4b3aacefbf89  linux-6.18.56.tar.xz
diff --git a/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash
index ff6e4ed2e2f6..66c72d3afd51 100644
--- a/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
diff --git a/configs/stm32h747_disco_sd_defconfig b/configs/stm32h747_disco_sd_defconfig
index cd882aa5acd1..a3b46f94e174 100644
--- a/configs/stm32h747_disco_sd_defconfig
+++ b/configs/stm32h747_disco_sd_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32h747-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.39"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.56"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xd0000000.config board/stmicroelectronics/stm32h747-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -25,7 +25,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32h747-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

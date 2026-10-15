Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A6DCC6B34
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 08:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7EAB4081C;
	Thu, 15 Oct 2026 08:42:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iba6HAaqxy11; Thu, 15 Oct 2026 08:42:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B200340811
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792053729;
	b=a2oQuRRGaxSv7Ohie3iQu0jLvAKWHhBzVz9qO4iaFgWdSN7gkd4gqlt+ERGxWmSSRmQB
	 nG9cLI31g3Pii+FRHFYWNVR4OqX7t09VT6hjrtfUXqYHACXYrPH1H+Ad4aed+2oWaNiRN
	 7V7h0yImHn9TRf5yUIOrkp3q76+ZdNtBAY3DkMFJuD1yjEXXhNuDBTnZiroHdKWvaprAR
	 /Uxxa1ntRp2pXgVcj+FWDCmMfAiMX/QJaj0YfdSXl2dWYDvA8YP9PWl5a8QPWdRq2O1NE
	 blKc9zylPhMft0vcZR8ozoNduuD6dvnySR55SbA0DmT6iYsJiNQhfRofQ7OBu/YJtJg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792053729;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7Z6do3aB5ey3Ny0hEK+GUoJZ9/JJ5s1kPbJFZf8cXCA=;
	b=HqALtN+3M8RvSl1ePc2sYl1K5GGUF8fuW8r1aduHWY5RSj7lImAtWDqhQ/a91rJfcaFc
	 EBfswDKBIhBYsNzPWsg8o3rlRf2v2w+sIzGj2D/1ZzITHOX9zzKIiy+CcuNFEomt3IlQl
	 Bg0GwJE7tEbtwN80kYcNDPEV/EGhhxv8OqCiqpX0KQXYrxUwmuvYwsTgpfxRfA72KS5Hy
	 WratZ5uiYi6miLwiQVm/9ddRaQSdb5ho/+y9put83lZ8vF3VDlp7WnmQbmLTu5GyA7XyA
	 P2AVPUl9XvXrupjwnlsxONuVGh+/9fPdybCH8huhtYhY1j5YUKBMlTmNSDZqJriNMvg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792053729;
	bh=7Z6do3aB5ey3Ny0hEK+GUoJZ9/JJ5s1kPbJFZf8cXCA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Gb3WI6qL/fj3V9YjUzjRVeWwba1GwPsj7ruseMTkTb/IJA4APPPe7yqy+7+ZSBRaC
	 HTfcsnBzVW8TcLRv7bSwI4UL5bonkFGUUFAlc8KfWZ+9Vsj4aBv6EYdryK03Z/kuVU
	 MUEbxDt+Nr1usj1Y/Ov28I0T3wO9MC7UUdCLl1UrTnywhKtnDDo3Tzky70O9/RTYZQ
	 TJ1eeq1zmi6TFyPrphDGcyzaKqP96lezretUlRxAh6kBNdDBxyUL753tH1Fs5dmedy
	 TBhd/u9vR6NKZZfKxSVKbMd2I4j1awMGNo+v2nDj1dn+Iv9krp/RhM0juOLw0cQUTC
	 zLMEXRgoaVWKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B200340811;
	Thu, 15 Oct 2026 08:42:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E400A58
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 08:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2451A81094
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 08:42:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z6ri-q1KhFXm for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 08:42:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F2F168108A
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792053727;
 b=jcDz76+hy5AUat1q3HgPdV66NkAaOBF0PqdZcRWmRRoZqlKd+5sCRp6QMmLNT+Cw6i8D
 5iHHZ42t9pVE1ag0gNclc4GxTItGYHOqdoSHdFTCYKM/iZGlS3zUxyuFx7PONQb6x6oip
 SO2h31u/DSysGeEHL8nxQnGMZUDoHZN1TiDfSQ8HQmF+8vD7pBk4kr3A713Of3Fc1ukZW
 cVF4z8Zd/R027eoxqiSjWQKvTXXCd2dUgpfjVF1c1Bh2sb0DvaO3in3cPfufVtna0rBdu
 ng7aSmkd1bR+WgbL5YUO9OER7EUspr/EN7MaFQwbMoAg+aYmidirCjx74nEpCv+QEhg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792053727;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=/qw7VBm/uAGndH6+moZ1cemgxgNTya8jjk42eUikcl8=;
 b=eO/NXLE/MvrfPuk0TBBASYK6UVRzTCRAGrjV1ILcxMmFyj3KWSFoU0yI+oq+fgq1c20c
 bTLIWim8rhMOdsgJajPw4GPz/rHbiOzqxehg6CfBhp4We5Ac5cRrn1HkXXi6u53iJk77w
 xSynD3el6hyzDRNw0MlGHHAv7cUt7bVfbQcN5BClWbpBWaWazPBV/pO5oJ1DK2DaJkBiK
 RK4zDpRO3c7S5FqG1WWGy2IMn6te/wHTl8JpQfH2uArCmYwf6811W6J1pxW1fukFAi4hK
 LuUpgyGPwbhQV9zcn2dcSmu7cBc/rdLl0EcQ9Z12Cxhhxs1Z3J2f9Zg/uOQGW6mjWkA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=M4EAVLSU; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=M4EAVLSU
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2F168108A
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 08:42:06 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48df4e9d2d4so214340f8f.3
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 01:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1792053724; x=1792658524;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/qw7VBm/uAGndH6+moZ1cemgxgNTya8jjk42eUikcl8=;
 b=M4EAVLSU8eepI9r7IFnl7NdhNjirpI4X37sWlepIUwnEd/NW9cQds18wVzEba85+l0
 IJrBw0ergNgcl8xc9+gI7YcpVRpGV70ysGReYGM1G3RFCM8fzgcQOkQO+svLJe0bwChM
 tuDxYaZNt9X4P0xbj7WR2L26lzP7FDTeAHugw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792053724; x=1792658524;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/qw7VBm/uAGndH6+moZ1cemgxgNTya8jjk42eUikcl8=;
 b=ELjRuYsYO82tqraAk48CmlRvupvJo5LnD6pDLyNIuSPrF68lfYgdS+Ayijeo74FmPT
 oCe4G/lKVw6S2G+ZGAw2/iQK3NY0YHFnPcmN0qg8pnD/w9ht+LT3Wk4cRtK8HZvrMe0L
 3J4hqrZ1EIL2K4QY5XEu5rNZhUoNR6TG1Ncetv3WgwRctjovFKBJRpXgS5sFi7bRQRUq
 MLpAv9Syf3XGCrwUiL+O5pTmYEa7qAM1Q3AeKjWYRWfi/n/OM0N1acEKza3H8WER9nTC
 hSFGJqcWknbr7FULqIPCNyWXu32zQVi/OpQB0kVlRA8ml03jMUb4/Pa0h0Q4wlz/jM5T
 RSYQ==
X-Gm-Message-State: AFq9FYLng7EqsViFnG6CTMDjMh/Gswc+X0NJiG5SvpcSZFx6h6m/9+8g
 lHMJX1rTcRgO7kpQQinWnHkF0eL2Z2SB5JvLnfb1aS0XEj5D4I+5Am5YQ++SjrFW+TGx1CwOw89
 +E51s
X-Gm-Gg: AYBFou3tWVm3zWANgcwDq9QDqr/zAVe9rbJxUFSxLAhAAoJxzxNqFfCMrbMKNWcEk5v
 DtRsWpMRlozariehEIIUu9iH+q/0AKNc4jOMRRVMi8HMeFnO84RuN8zOEMDvET8S5RiIBqO0Mt0
 8594vA9Jf+8dhQr65wFtF9yQwovhjRBvMjoi5tInyo3o737dvtU6qb3Dgo8va5ANChQ0kw14KFy
 V+f0JaIRkpr0QqvOeVIP5oRwW8OL76eeE+9aZLtn66P+fQzWEPpbixAZhQJHIUo1OX+99OQKYpZ
 XhEW7ZoPdYaFtFfJORbe8ATsbOY6DgvxEB9AEKY7bz/YWcpXthh6T1bzM4YmWuwzbVGL8oY3MlR
 87Zl8i/rRI0NGdyVhICEzbeUz8nEzv7YID0dAJaahFi+9KCD9HWbR0Za5Yh5zz2U0LtEe8XNQlq
 RzeMQ0Rugtxdtdbo7tkQKRlqWFN51c+ojOm+ooePr2fPlxaOcs+uBoKovKs3O72oyUSeQlWUvY8
 tGUKYGVrC4JSD3FXJG/8OP5fCXbjZIjKw+Tb8XOdP1jtuDTrR7QQRCwuX9hUykaF34=
X-Received: by 2002:a05:600c:4e8a:b0:4a1:78dd:dd28 with SMTP id
 5b1f17b1804b1-4a18e4d2b31mr373652725e9.27.1792053724206; 
 Thu, 15 Oct 2026 01:42:04 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:81b2:a12a:b337:b231])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd98637asm56199695e9.8.2026.10.15.01.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 01:42:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 15 Oct 2026 10:41:57 +0200
Message-ID: <20261015084157.1073663-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] configs/stm32mp1*_dk*: bump Linux to
 6.12.112 and U-Boot to 2026.10
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

The patch bumps the Linux kernel to version 6.12.112 and U-Boot to
version 2026.10 for

- stm32mp135f_dk_defconfig
- stm32mp157a_dk1_defconfig
- stm32mp157c_dk2_defconfig

The removed patches are contained in the new U-Boot version.

Tested on STM32MP157C-DK2 Discovery Board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../common/stm32mp1xx/patches/linux/linux.hash                | 2 +-
 .../common/stm32mp1xx/patches/uboot/uboot.hash                | 2 +-
 configs/stm32mp135f_dk_defconfig                              | 4 ++--
 configs/stm32mp157a_dk1_defconfig                             | 4 ++--
 configs/stm32mp157c_dk2_defconfig                             | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
index 08483293cf69..e3e6d3913390 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a9e8c51fcb1e695d1d35dde5886cba579cb6f29c9646c5889f39d63841d4b9f6  linux-6.12.95.tar.xz
+sha256  164dc9d1f6c93c61a15e1f071c48379b467f2b17c469cce7223471968208ed03  linux-6.12.112.tar.xz
diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
index ff6e4ed2e2f6..66c72d3afd51 100644
--- a/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
diff --git a/configs/stm32mp135f_dk_defconfig b/configs/stm32mp135f_dk_defconfig
index bd1c6ca00a73..cc72d397f3b8 100644
--- a/configs/stm32mp135f_dk_defconfig
+++ b/configs/stm32mp135f_dk_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp135f-dk/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.95"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.112"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp135f-dk/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -42,7 +42,7 @@ BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="135F_DK"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp13"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index 7f4143fa3285..464b34e0b0d7 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.95"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.112"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157a-dk1/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -32,7 +32,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index 10638f226043..2cac66a944a0 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.95"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.112"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -32,7 +32,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

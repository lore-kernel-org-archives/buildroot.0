Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC8DCC6B2F
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 08:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF677810B7;
	Thu, 15 Oct 2026 08:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFQiUOLmfY8K; Thu, 15 Oct 2026 08:25:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D0E67810BA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792052731;
	b=jiB7HZc00JQor9K2JRxfLcFshGhduAonZkaOxDmIMffWRyu9JA0ESa8IA1bW7BEYOoQF
	 kFKuusVvkmtyphDbiYTnG+04dHOfdJn1ca+pNCrWy8xqxyLRURtNYZgQWlWVtixaQSz1Z
	 MjU3Nm6zZ9J1bwZIJn7KqX+C9chHEzl3g+KHXR/b8IC7+yCnEAGWMSzpG0uVu7SC08FNV
	 76PGclhVD+jnURcMt02MesznfZd90WhZso9lTr19suQb26qNIghsnTgh2lkS7RAOVUrMC
	 o8n8gsFTryTed+Y0WJIUN3eE0T/e8mziSSxMZmdv3/S0CDX2ori4etrh3B19A0556mg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792052731;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=unMQV9X7CmfSPMsWQIe/xdAh38zdWjP9i5JbrAwPLew=;
	b=rw/JzPCO78RgooAJc+JSZUA7AqnJ+FE93yjmUJW8o7M66aUrKkKOB+PGckEPklcao5pe
	 fWfykprzQR3ozQjtupFObMZrnEvB5a2tXJ4CX2ynQ1/DrfgJf+HF+uC0aFDCH7ar9Q+MK
	 t90YMPitzUMe4iIWSIq1m65lFCHfY4Eg8fL97NmK3ju+NyxoQdtYGUrU/Q6a3J03StDY7
	 wSi0aqmXNPLkN9ZVVnE+s7oklaW9RjKnV3Jwl4bx6NpG+XaS05E0NeEIb9MW+LshBNUHb
	 oAl8HsHWKJdAwSf5vmKeM8wcIdWPdoFVENWJ7xm7QqUZojOaQQtSmtNKtkgnb/kFwyw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792052730;
	bh=unMQV9X7CmfSPMsWQIe/xdAh38zdWjP9i5JbrAwPLew=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=hmAg0NobX/tpCjMcWa70aJxdmsqJbXeYHwtLbkGnPr2qmw6sbMIxZbVRQT7bQ7Jbh
	 k6d9FCUa6ZWuBQC5+f5RDkmq+doCpnc+qJ/WHpaxJsSg+LycsA0vqX+fRHIaKL07x1
	 kVYH3Er4WieEtsrjoslxisRsQrNqYPFcSQeReHLE9/TBFhmRUINjC6MvquWNTI6r/5
	 i4jHRIso2u7o/peh5e9kE3WPPKZdYZmn5YwJGVyPItVa0ufCLxDfdoEaLooS19lncy
	 iIn2e0h4H4Ms1xX6Cg2LV0ZT+kHUVW2k0yQBi7qUlK5rDUc2ap3fEwADQv4mFVMw9J
	 ShH2k8KdiF0GQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0E67810BA;
	Thu, 15 Oct 2026 08:25:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B947A769
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 08:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6C23607F5
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 08:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tU3X_R2u1cdX for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 08:25:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 941D86069F
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792052728;
 b=H+ajubUwbMDu+9C64O2RJxSUk6PKpzKDUT/BEoI49YlR9ScapwITR9AetLY5sibtAGPD
 NqyMBMWTvfvu+JuZZF7FDnzfmfewRJEIPoyZP794Bs2lbFIvHBNi0QzRU1z1f1WcZPXLk
 O1T3xOBUgHXGUB5QLhaHirkcvX41cU+oFY1icNPm/297g9v98IUqCnFxahsuhnBdifFgj
 ZYbshhy2xBt0S+z+NUXIWZShIfKzAm/xBgOwIavX/rOIsTlJwtY8CO46MDHw0+10ZD+AU
 Tj7HaF+9sJwmH9G2TyjH6cPU3z5Mb625ujrdtWksapEL+YtrmSGOYE3dEO9BcQma0gg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792052728;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=LVSNu70bevCb72gASk20xsCZVuLg6ZOGMJZkSH4OCEA=;
 b=Uh4QL1LkdEfv+MUiNXpHQLSDM/iTKeZ0nbwzc1Ih8wwK39ZxxAL7409r82JY7QxRPawA
 pGF6fGNqwXlfE+AtAeOitrhOcBDNU1tXVkEJR3zda4GP4dwQCGenjuZh8vN4I8GeH+Zfw
 LKdrfYDpyds1EhsXwZKTfYrvTDgqtYMnNqFjricsJYwg1yViO1/R7wShaGUSF5peHMSQN
 9Zz70233jaf6ck7DcNpj2GhabhsJpn+pqssjKX88mXoW0UYgt+6UvmcGFn6FW1nkua6wV
 4kBU5Nv2zPgw6RL+kDcekCrvBFodBfE/YC2jy0y9rkWUbkfYVk8jIZBy7x1hbuGMrdg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=nNc99EFN; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=nNc99EFN
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 941D86069F
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 08:25:26 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48df54150dfso218347f8f.0
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 01:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1792052725; x=1792657525;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=LVSNu70bevCb72gASk20xsCZVuLg6ZOGMJZkSH4OCEA=;
 b=nNc99EFNmsbAug/rCDvhejXHNhJuOIsoTjv57V+8nPitSCXOcbADX4723EY2Y2cqPZ
 GRtx0QOnSJKWS95n9hnWOtwDmaBt/MBlqu5kbITXaoNh8ddBBVdXit/LBylB8yAWhFDk
 SCztvC7ZjQ9BEylt6wqePSrQgWxSkkETVXuqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792052725; x=1792657525;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LVSNu70bevCb72gASk20xsCZVuLg6ZOGMJZkSH4OCEA=;
 b=zWHvCVQo7XVqrGtTQSqBcWytpBkJ9UqRKnBDOChLbTj2rQXak5EOnZ0epTsuMZhHzh
 Fr5x7dW8sXjW2UrOla42SQe5rEkgMHkHCqh7W6ODakAVrRm20R5Jh4y+AKzzI9ttCQ9A
 uCLg9OmwKPhzdf5Bpd0G3fczdiej/3YSH3FVowMlNw0A14sZh72bLhCGEFJ/k79EdC8j
 ZI/86ud2AbSIsaQUfETsW+NnsJLkah1Tjwk7JStZur/ok8fCHnBnD8Lsq93O/+weD2Fg
 P888GDnalultN+V30Fb2Nu39d8gbQu7k0kAGRv35CJaV164yWjgOjq6MViIIzR2siRe7
 h8xw==
X-Gm-Message-State: AFq9FYL/MdrPUR8BJ1vqxle8/TF+2LNpIZ3HmUi59bcmx9ZyZaHhcpsj
 /cojVK3Vtmyh/LiYXNgelnclAx/5OR4jRJnICUa/J+/tt7WMSND3SSDuQwZeHH1Q1QjdbOeYVHg
 60HMt
X-Gm-Gg: AYBFou13xsAGdfODOQJZ4qPRxOIQxqXgYZK2Dznjtii+Hd5q26xxJD0ti48mM1EeKqY
 DfHrQNQ76cYkuvEPofkb0FgnuUZv2/Zk8kZg4o85FEnIvJGblvG+1U+W9XDFquC/X1/4h0sV+/6
 M99WzMobAdD3dvRncveOvfo3elrtQHZbRvRMko6WU4vlQvUZPSd2OT+PqUYUoafBuaJ3j12P+5x
 Bfxl4Uq7ods7hIjtXtyBttgLAs5Cg1Wye7+C4gkBjZOIcvqkgYQLVurEIKqKI6p8Z8JlN+XTKmu
 4xR+AHi5//TbdJPQVrE2SJ/uUlBNv0YM1DzGtGxxcT0rAP2jmOiANQoqSIcRZ0IXp8fOraAT6RP
 1VORCiTZa7DQgOaGy++l7VmYrJUonBKXHxDyU5wq4q0kV+dHra0gCZ/xYirrBJX1Oinn0m9Xc9/
 kzuY4xg6yjoMwHOpt1xZPaIxVqBzEmXQEbjKgkoY06cLv9L+gT1x9XCh5nA95I6NE5c6fYjYImm
 PaMxII5Mg+iVDJlXO/ekb4ORb272vPIMJWIqcCxHtrN+jyOQIbP9zIfg6DXXL/TIbU=
X-Received: by 2002:a5d:44cd:0:b0:488:89e4:c3af with SMTP id
 ffacd0b85a97d-48dbaae4869mr27849583f8f.45.1792052724671; 
 Thu, 15 Oct 2026 01:25:24 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:81b2:a12a:b337:b231])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de72c7e36sm11301914f8f.37.2026.10.15.01.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 01:25:24 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 10:25:20 +0200
Message-ID: <20261015082520.1070915-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] configs/stm32f746_disco_sd: bump Linux to
 5.15.222 and U-Boot to 2026.10
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 5.15.222 and U-Boot to
version 2026.10.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f746-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f746-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f746_disco_sd_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
index b4a6bbd3f783..20f03bc1d4df 100644
--- a/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  beb954e53617928b751944a89b6670bf9a9c7177c641b24c5dba504e46f1d961  linux-5.15.211.tar.xz
+sha256  4d6ec07679bd008524391cb67597106018646c6378b3953c23ec69b9259cdf84  linux-5.15.222.tar.xz
diff --git a/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
index ff6e4ed2e2f6..66c72d3afd51 100644
--- a/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
diff --git a/configs/stm32f746_disco_sd_defconfig b/configs/stm32f746_disco_sd_defconfig
index e0c257787a6c..75c309a34c68 100644
--- a/configs/stm32f746_disco_sd_defconfig
+++ b/configs/stm32f746_disco_sd_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f746-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.211"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.222"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32f746-disco/linux.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f746-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37862CD4F21
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 19:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8485982505;
	Tue, 12 May 2026 19:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yXKjlHy4UrEh; Tue, 12 May 2026 19:34:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F33C3824CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778614467;
	bh=z3p7pVo3pIeFOE43Bz9kbv/d7LP4dvGi8UEulOsEV/E=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UyfVcD4BXsXUfODYl+O0htDpSK/Ot9x+dQ+UFAv/PXKAGF/Kpaaaa2yZSkrp7KqUC
	 a9K0jQuvSonI+FkPccy80wzU+H3L7sySHBo2DmY0l2C+y0VNMaVzku4c21J4fKmvg6
	 xIm50Rg0KqYCIQ/6reTz4gXigBIKeUg5kvof3Evq2GbYREvPErA9ntuWoCdYaSqkR7
	 CcCZh9SLw6tiUMbddOxweNpeOIy2EyxuhRKzjBoHaHul6LXCTkJYUgTjN2FAldVrsM
	 t4QXBXH/0UGpAlfCNv8g/+sq8OYwFKpFdU42PjwmvkR2Y9OmAPBYcBZEIPdqF16oLr
	 KAyjcLjTJDl1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F33C3824CB;
	Tue, 12 May 2026 19:34:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 883E2219
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79ED4824CB
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ce6YL1BGXV-a for <buildroot@buildroot.org>;
 Tue, 12 May 2026 19:34:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 575CF824C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 575CF824C1
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 575CF824C1
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:34:25 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-3680540a6efso2008514a91.2
 for <buildroot@buildroot.org>; Tue, 12 May 2026 12:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778614464; x=1779219264;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kWuoVROMvu4mpOIbIhKEjaj5/xDTbLyHCVRuOyS/TZg=;
 b=qTc2/cWPlM4eeEfsz8oaOoipXut1HyFzZRBQoPXEbHZW4hJYPyqH9r4fQZqn45uhsY
 1Nl+HB9x1bc2Y3jPjis0/5UOys150hRZIaFZsGXixZCh12JRQRLT3gl7ATXtWRSDl7fP
 udDV16NoB5iyGrufIzmYWcMgDvVzfA6oujJhhO5oCCPB0eJp+kfeOv6kLWUwREZDj2KW
 nlMWse/kl3s+UMi4gNL4KoTz5gfNBF+FINd9DJXqqyBDyqCD6ENP452ZK8zlhxqge77B
 n1YTPf76/yuAsXrrvTwq/enuxPa3u3mMiEqAYeYjCBeH29Yxt8wqtePpuqr9O4IO7Nzg
 LkpQ==
X-Gm-Message-State: AOJu0YwOxV0E8FXRNh2lOtVFzIxxtgbnPBRur2sZG2JM0jwJfJShIyXn
 3X/p6A9GERAxTSAG8BEa4dm59jGQCTmw0+79T0RUsgUY6qbH4SbfOA4pfBGFrINbMKbAa0BOHeR
 JaBDC
X-Gm-Gg: Acq92OGaz2uTVw+FcX4ArkXFu2+pCpF8XeMiVjcxTeFf39Gh1K7suWnKvGv1/65GMV4
 +nK9tk3NzN7lhxgVnAB1uvgVPlBLEx4A1qcn/c3iJQeFEc+0DLG6mxowvvtab5IvH7MD5aVBT3b
 UI7QoxXuc8qBKUeMxUHsgr0xBOZS9FPALKT5khe3ibjLwo/GePt+oxfPll/JWnMZ0ddEb0azXnb
 dRoR5HboPs4ac5TXvcA0nyv35sVK2UyniuD3FKl4e1BB+gjl/Japf07PaW1LxmwbeMuYx/2dwKl
 uBxVKoM+lhE1QCeH49aNm6TzZg7hspJ86diAf0yuME6W6ql5HczF4WS9afBry+Rs3EO+HvBBn7X
 57uXz+uB/k498k2w+soXItRmnDJ1CZNasta5HGqB1QTnkPmn5SxMsEwPWztwBFwu+fOUnYBXGDC
 ecgnyJvWZHidbvz2XY/D0=
X-Received: by 2002:a17:90b:4f41:b0:368:ea0c:1b6f with SMTP id
 98e67ed59e1d1-368f3c03dd6mr441308a91.5.1778614464438; 
 Tue, 12 May 2026 12:34:24 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-368ede49dfcsm594873a91.7.2026.05.12.12.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 12:34:24 -0700 (PDT)
From: Joseph Kogut <joseph@anodize.com>
Date: Tue, 12 May 2026 12:34:13 -0700
MIME-Version: 1.0
Message-Id: <20260512-qemu-v11-0-0-v1-1-776ebffbb3af@anodize.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1XMvQ7CIBQF4Fdp7iym0F+dHOzqoKNxAHqxmAAKb
 WNs+u4WHYy507k555sgoNcYYJtM4HHUQTu7BLpKQHbcXpHodsnAUlamBWXkgWYgI6UkjVeXTKh
 MVExKWCZ3j0o/P9wZjs2pOezh8v2HQdxQ9tGKTeWdIX3nkf/4nOX//EgJJaLgRbXJ6lK1uOPWt
 fqFa+lMVAQPSITnVnZRMTz06GGe3xGsUBfXAAAA
X-Change-ID: 20260512-qemu-v11-0-0-0862bf3b72cc
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>, Joseph Kogut <joseph@anodize.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778614463; l=2091;
 i=joseph@anodize.com; s=20251022; h=from:subject:message-id;
 bh=6qChikCRQfEj6xzYTx1Qo0nmxEFM5FqpYsxHIvf8lZs=;
 b=CRUzVSVCMRtwr8cXQNhVwQ1+JHPPMB2dpsLsuOuVGU9ACnXaLGnBTPzsH++RRymVd3D3HS4gC
 grbBlE3KxsRAzjMXV5krixxmMHoMm/UMTR3aeGR81tOd7JvqsQQoAon
X-Developer-Key: i=joseph@anodize.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1778614464; x=1779219264; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kWuoVROMvu4mpOIbIhKEjaj5/xDTbLyHCVRuOyS/TZg=;
 b=e/1MkExLu0bcfIRSzliOvnb1MrT8MKFq5Gfux2EXLprDyFxvthF3Et3ifROJwa4qMm
 EgkWSsbjvpbpaGA6vmsTzwQ/38DlcUEog9JkFiuJ/QU9pH/yInLGbsQtfwLBNVGCNKC+
 1JzNKbucqvz3um5IEmdLoTPpd0H8DYEQIXhlYaA0K1YDD4scG6EQIYt1mISL2S8K11bz
 Q4f7Mllo4Fd+jf/2A7/nVum1937Vvox6Dbii0r3Elwdvv6L+oCMxLvZKSyK0JkeEJf3T
 9O/OqSuuWZXi/bxo9tpw2Blq2t9PLrncZmuxgHpcCEXYSZlBwYXL/82EZIY8D3E/rwgy
 mc1w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=anodize.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=anodize.com header.i=@anodize.com header.a=rsa-sha256
 header.s=google header.b=e/1MkExL
Subject: [Buildroot] [PATCH RESEND] package/qemu: bump to version 11.0.0
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

Changelog:
https://wiki.qemu.org/ChangeLog/11.0

Note:
  Support for all 32-bit host systems has been removed.

Signed-off-by: Joseph Kogut <joseph@anodize.com>
---
 package/qemu/Config.in | 5 +----
 package/qemu/qemu.hash | 2 +-
 package/qemu/qemu.mk   | 2 +-
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 0b16c8c284..c735381b4b 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -1,11 +1,8 @@
 config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
 	bool
 	# Only tested on these architectures
+	default n if !BR2_ARCH_IS_64
 	default y if BR2_aarch64
-	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
-	default y if BR2_i386
-	default y if BR2_mips
-	default y if BR2_mipsel
 	default y if BR2_powerpc64
 	default y if BR2_powerpc64le
 	default y if BR2_riscv
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index f8e750225f..7c7325a6ce 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  9e30ad1b8b9f7b4463001582d1ab297f39cfccea5d08540c0ca6d6672785883a  qemu-10.2.0.tar.xz
+sha256  c04ca36012653f32d11c674d370cf52a710e7d3f18c2d8b63e4932052a4854d6  qemu-11.0.0.tar.xz
 sha256  dd3ce02338c3a48abb6ba59b48809f7108a8bd242cb0cc8be90daafa30707c28  COPYING
 sha256  31c90ce76b6f5aab90a205851e71d5c27e31c0aa3d7017a4383b98a6fe3f1faa  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index b7007e3b98..61e44f069a 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 10.2.0
+QEMU_VERSION = 11.0.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_SELINUX_MODULES = qemu virt

---
base-commit: 9684cb9b4406e01683a9b5136100d81040d56aa0
change-id: 20260512-qemu-v11-0-0-0862bf3b72cc

Best regards,
--  
Joseph Kogut <joseph@anodize.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

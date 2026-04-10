Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AD8F459F7
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 16:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EA38610A6;
	Fri, 10 Apr 2026 16:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0lJU1hVfSH6; Fri, 10 Apr 2026 16:27:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9780610A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775838473;
	bh=8yG7cAGndX5tcB1D/Vypl3uNL3j0kf9hAPdg6PJZiUw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ke8WSPRis1hpBubQIIGGye6CV6EOtlQXT/YGo0sic5YENCLyJfFfiJwkISV7y45Iu
	 QY+lIYnDyOKcoku8KCUoNNFKlHf1h6a6Yj+Sjmvw7MYntAEQSNJIEq5hrdn/E3enhJ
	 ZGp9rNO2I8CzbY8zzWsFAPoYH1/iyA6VEHII3DcCyYHtCkEEcqxe6cLh7GYKNP3hv7
	 vYOXHE3d61zvqAuqXFM4tNXW7R0I5KPsBawD/tQ85n0YJHUEvpJFStdplLsdZaP09b
	 e3YslgXx4vsPsC2rzXl2vLZlKVlY0VmOdfQQMc3ke0JQbHqTVy3jYc/AX5u2ZdDzFE
	 LOxILSLLFVDDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9780610A7;
	Fri, 10 Apr 2026 16:27:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B84B9237
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 16:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA077408B4
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 16:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DtYf-vEnO268 for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 16:27:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8FB7D4015F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FB7D4015F
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FB7D4015F
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 16:27:51 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso33206325e9.3
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 09:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775838469; x=1776443269;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q6+iegWD/vkAWWG0QHjoZNj4MYwM3gPlR+p31n2v0Bs=;
 b=BSf6aBk/ROPNZnyTZmkhZT7rx23xYAdQRyR9zQ7FzP9h0f2IoRpwhJcjwL35N4+Dpt
 w7vEaew9pxSBi26rI8IoyGc12+QAJ7eUVbqLfJniufHNyvK74T7kWmSZsu1O9sKJfcva
 Ogp23MQhzlwlweuzWApND7/gYrpdQ/ORF0V+Q3P1G24ZpyppBx8Rm3T/0kZLKyyPm6gk
 ZGbEd6NP/sMSwZAfXyVTIi1rtIKzf8xUaOQbzwGGIgzZzCKMoKGnY1WXPCCOj9H4uPK5
 uOf0R7php0O4NVYtzR6fsmnHqBy/WBmD0eTp/v9vCttK8SIy1cf/pUXtjJs6A1dqSIVS
 sRhg==
X-Gm-Message-State: AOJu0YySEqN2VgWh2R+ka6OkiscLYG9nrSxSOq7A2MH4RkuyP3FGl+bj
 zrYfAkvcBGKVT2eSKj0CD2HNSK1tBJsFajzLjQhgl7IlMVTemWMMyAF0XVdXxYA4bEQkkuxaVNb
 ZRI6p
X-Gm-Gg: AeBDiet7KRB3NRGZfQkyvJACOsCuJwKOrUA2oEFlsWzUWifmVLB+qt8wJB+0oMNUt/8
 umbVIZgdlvGBvH6ghLrSa7CCXWR20f11K63ut1+mAekMg14u6zYGfI1bnih7hP6CQTXd4i0vzrV
 fJ4t8dkBxie3j3NPpQR0r2+BRcZHiean1KkkjXO/zZN24lVSpFI9F9/C4Uw9eWfhpHOvQlCDNMC
 9uGdexikxe/H0at+JEbzHFg5Rbw1jxqW4s1+XcrQ+HAxysvac3G8dqo3Q59ZNxK8sPYmbYYH4nl
 ANr4qHIYsTH0FKQ3uk4snc8CL/OBTHpxZsf2SFCBtVZYKtsa2UKFz/yWGhwBjZ0jJM75B/kRRYd
 i8oEs+oiFrBSv1+vOCB0hZ52wajq/2n9J4zZDkTu9P2agaZEBLnx1nj1iZlnc6MOe8uZms0W4hv
 zWuRsi+i93zqSy2DJXMmzmTuPiFRfoiLJwT0vVNWrbFsL7MhYRbXhkhrIsbYlkF6pUPMT1NepaS
 7Xtw4L5CSgOLesRtk+CWNV06St+MaZ+hzeQyZ+8KfRWjg9BR7URKQ9HSc56ZVT7vB4hiztIRqeA
 NkaH2p69hmqLmysWmsabemJiqNWYTQ==
X-Received: by 2002:a05:600c:3150:b0:486:fcc7:d6a with SMTP id
 5b1f17b1804b1-488d67f4c4dmr54354505e9.13.1775838469080; 
 Fri, 10 Apr 2026 09:27:49 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-87-9-100-184.retail.telecomitalia.it. [87.9.100.184])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5344e28sm89634175e9.7.2026.04.10.09.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 09:27:48 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Fri, 10 Apr 2026 18:27:45 +0200
Message-ID: <20260410162745.1448746-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1775838469; x=1776443269;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q6+iegWD/vkAWWG0QHjoZNj4MYwM3gPlR+p31n2v0Bs=;
 b=nPjKBMJmqDV6Gp3FgPWsc4ctXzN7lPP2ceA8+L9mVLuEMpNzBTKYkRLgsrDW7BVu+4
 79kLPhsAruWfCv+cO+oofAcht1Nc3Dklq5q7lsqt8SF2mbmi90z+scsHvk5EvCbwrJC3
 j5NaDXzvBvXzhugjG8OGs5yu/7YOKxT+vGEOo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=nPjKBMJm
Subject: [Buildroot] [PATCH 1/1] configs/imx6ulz_bsh_smm_m2: bump Linux to
 6.12.80 and U-Boot to 2026.04
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

The patch bumps the Linux kernel to version 6.12.80 and U-Boot to
version 2026.04.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash | 2 +-
 board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash | 2 +-
 configs/imx6ulz_bsh_smm_m2_defconfig                  | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
index cec51f675f3c..e2073c2796cc 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  d1ad94a33681148efe884f4028970d69e332f2b003f0e8be53a1d25de38e49a2  linux-6.12.64.tar.xz
+sha256  c92591d896e79ecddbc3319136f0c2f855e832b397de7593f013ad7590a43e53  linux-6.12.80.tar.xz
diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
index b6a925ea4e89..36322a6a904c 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
+sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
diff --git a/configs/imx6ulz_bsh_smm_m2_defconfig b/configs/imx6ulz_bsh_smm_m2_defconfig
index 0bcea4acad84..a3d0259a36d2 100644
--- a/configs/imx6ulz_bsh_smm_m2_defconfig
+++ b/configs/imx6ulz_bsh_smm_m2_defconfig
@@ -9,7 +9,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx6ulz-bsh-smm-m2/post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.64"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.80"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/bsh/imx6ulz-bsh-smm-m2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6ulz_smm_m2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25794C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 13:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C57BA40B78;
	Tue, 22 Apr 2025 13:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNw3-2ywxKYm; Tue, 22 Apr 2025 13:11:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF04240B70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF04240B70;
	Tue, 22 Apr 2025 13:11:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BB291BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 13:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D06840A64
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 13:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z1fYCy5MPI1H for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 13:11:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1AAD840AB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AAD840AB6
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AAD840AB6
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 13:11:04 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2240b4de12bso74730265ad.2
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 06:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745327463; x=1745932263;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8AkdqHzdJ44pyJtwS6EMcxEAQW6g4Gr+oMIAS3CTAvk=;
 b=v5hlvLgd7zsEjagLuOIxFTljWbs8YCcTBK7XIjO6Kep3N4nsnI+DdDj90kEXA9iT0i
 bWOcYN6SKjDM9YdAGcVgGN0gadkoQ8RriBccMt7dC1eUeAHGXP9HYC1If/ZAC5SxWPq3
 ugYwerKabhT/aMHXiwR8REmmxpOvDuaUp9okq/p0ioRHkJkn3vdPQFngKSslaGYAGjT/
 +e8n0fKHIUArfjgOdtz0pvUW55Rq5MCOsWpbSQ2rvjKzUFzbtVi/ctTrKq7osCvUIRZK
 5qW5gnkisj3kjv1uRWDWSqxcIW3SuynWQvhw5g49Z0iBdeVPIjiFsOXrolcIl+ivU6te
 LAqA==
X-Gm-Message-State: AOJu0YwVRJNnLFP2cPkOOPxOkiTGxO606JBSfwk3hTb6u0pxpxtb+G/t
 JRejT/8KLgOESXYpNtccFwlkt9r4K9aElRxI5FSTYeajSYwfZH0vqQWxdw==
X-Gm-Gg: ASbGncttZPBLI2KiHUoT4pAgcQRMomxruPZ14NNcLLk6GPuTUS5fwrz1yZSWMWZnCvG
 qwjnyWJLLoxC9NXt7/NgSLEvjxUOpTcqYLMJWOYCzeclVmRmqEAi3tJ9hGTSZIy7WfyWM0OAh3u
 TbQBwg7oA04uehQ0npa7B1YpO7iDE5X757PTxpOUxQ5bfhIZkUG24I8Kv0ctCz3DZR/Y1zxL9sB
 53TM0r+QNz3hxlenZyLoq9HwoO0ZIpkuzZgQa5TWKl9r4bYNLdq967U65A9MIK2fjgd6Tq/W60s
 4Zbxcbs2VfRSuE7HOxtJHs3xNU27weYIYmZfq/eRcxP8GPo8u/dQrQ==
X-Google-Smtp-Source: AGHT+IHI6ccUR9R2fe3eWGXQlvAntRMyhKbQGUaVOqWej4RK3N14oykZlvX6/aSI/bCLbTWa40zY9w==
X-Received: by 2002:a17:902:e847:b0:22c:36d1:7a49 with SMTP id
 d9443c01a7336-22c53620609mr243963285ad.53.1745327463229; 
 Tue, 22 Apr 2025 06:11:03 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b78:b23c:5a7f:772d])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50bdda51sm84940345ad.30.2025.04.22.06.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 06:11:02 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>
Date: Tue, 22 Apr 2025 10:10:53 -0300
Message-Id: <20250422131054.1115455-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745327463; x=1745932263; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8AkdqHzdJ44pyJtwS6EMcxEAQW6g4Gr+oMIAS3CTAvk=;
 b=Pa3ZkvcJ7MadpTezHP6AOIY0qXFjWMcppxi2Mk9i0lIS/xO603dsVNaRcqzIJ0h36y
 bCmP/SOJC+SY0ddyZw8243Hq5uuSnIAu9dZNifxijTL2zqSCyFOh47BMzx6dwLBERW4Z
 KucJDQIjs6j+hxqHGGfwvWVp3aXHcQGY0iJOLeeqm8q6eKy9t65WneJj1t1GjlZqCAuC
 SaAHBPbNFiYHkygXGJoBKk36obXpm/3vKvWUJhIOtOG5GfSRK1qyoSVWPCaux7B0qlhH
 mm/7G4OyAKHYK/ITQfTHcqV4XNqdqapFV/Ix7c39rxmpyjUjZjBzBXqlVL3vP57omN7S
 jFWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Pa3ZkvcJ
Subject: [Buildroot] [PATCH 1/2] configs/warp7: Bump U-Boot and kernel
 versions
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

Bump U-Boot to 2025.04 and kernel to version 6.12.24.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/warp7_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 9b0e01d38a..68a87789f9 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -1,14 +1,14 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_OVERLAY="board/warp7/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.24"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx7s-warp"
@@ -23,7 +23,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="warp7"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

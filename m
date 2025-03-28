Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9ACC36010
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2AAF42F10;
	Fri, 28 Mar 2025 18:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zWsXO1jifjER; Fri, 28 Mar 2025 18:04:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42E654F2F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42E654F2F5;
	Fri, 28 Mar 2025 18:04:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D4F81B7
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8404F40A9B
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPH-6j3eI6Gb for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:04:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B790D408D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B790D408D1
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B790D408D1
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:04:38 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cf861f936so3994795e9.3
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 11:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743185076; x=1743789876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u9p7CfVfq+sU1gshGDon+Y+PdkyZwKXi5aztAx1X25Y=;
 b=O30koIQlmvIxuNCcr4MZioO39c8NcCuBIHP28xCObOFkefI1WjVj+NZ01pUTB5dxjt
 GlpY6AejWh0DpA3PS03qv4NLek/9xnYPgVq/sCcD/QsUtJG8sUkVobzAkB+hAW2hz/NO
 N5IpSSqd4UOqNB8U+hFhpwsmis9u0fbPykyoa1pVeX8t1sfmBBQuJ8Xzsq+2aWTisyrT
 zToJndZkx/t7jVDL6wtAqNjLSI0WnSh3lMHbPks3xOIMcrirOoL+ZXI0RMcmfDwFHOH7
 /6/NtHXu16FvWOVga3wGjxSwHNYoqGwceoHkDr8pRPL9o+I0ZIPUeXUB+2WvxKmbprll
 dF5w==
X-Gm-Message-State: AOJu0YzDyRU0LqRPs2ws2aE3IzwAems6sWfDyUZTeSYQqgMqID3/Mm3K
 kQTwybheQ5w9JzDRIASEn9xGREtVcSu5bUvk0pS+7Z+lfEIDQEGYd7FFS2kz
X-Gm-Gg: ASbGncv/cCaCCs10tG1A5Nx+HVxCWghgo7acJ0fbNNHiYsOo1ymwkkHJBulyDExBU/y
 DYZD+KOJiObPtwXgSlLDMFhPxjf2/pln1YCegXshrG/hyqwQKUE47TdcT/tTqCWRVle9OpYjqm4
 Dk68hDjdWfkq8DcXgujPHVUqcuimunjARNxAVe25iBquzKIOu9B60JWlibcc6KzTa4/mTKcWGzI
 V+1VYxVxBS+1pumv7COJi81tGiW+XuK2cn0N+iYjiR449VeXuVpcb5hteKrzz4/5jXlPe6erH3x
 BHoS6Lue9+/A6dgxotdsgUYp+Yoss27MDE1MYA==
X-Google-Smtp-Source: AGHT+IHy9hQ4t8VdXUEX95RolhTR3fkHFnxK8jJ5/IpSvG0yIEgXXwr/C5DPKpXPLR1o0dgv/BtuSA==
X-Received: by 2002:a05:600c:4449:b0:43b:c0fa:f9c4 with SMTP id
 5b1f17b1804b1-43db62bbce0mr1311645e9.4.1743185075769; 
 Fri, 28 Mar 2025 11:04:35 -0700 (PDT)
Received: from skbuf.lan ([188.25.110.61]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d90000f48sm34692995e9.37.2025.03.28.11.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 11:04:35 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Mar 2025 20:04:10 +0200
Message-ID: <20250328180427.3434693-3-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328180427.3434693-1-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743185076; x=1743789876; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u9p7CfVfq+sU1gshGDon+Y+PdkyZwKXi5aztAx1X25Y=;
 b=QqDDx5WQdTfBC9qrpQ2ANp/YjtNCrGybhbMgc8eHX6KR3FSsMMGAwDWlzFqFSUGIlE
 Vmhtk7ZqjE8c3nbsaINalWyhA9xYoZh5x4NDMSiEe7jXBamNqfaA2fp/ZPqucU3RmOkn
 ka2tK/1nGYf7vQxzVP7s47pVnRHaPcELAU1ZF+qMleGfIFBta9twLXFs2poEPksUsTIW
 UMdO8Q0bVanLsi7oG7Cm+LQbjMhUJRa1Un7qMkTK9G5ycBB2Mjsr1PbYScNVCMZ2J87W
 +8lsfbeLzMEG628y/4EovfB8qaLiA19anb3S8n9CmUWJOSba7+xtozKC7urosZ8IZBoQ
 r3Jw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QqDDx5WQ
Subject: [Buildroot] [PATCH v2 02/18] configs/ls1046a-rdb: enable the fmc
 package and dependencies
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
Cc: Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since LS1046A-RDB uses the Linux Factory-supplied lsdk.config, it
disables the upstream DPAA1 kernel networking drivers and enables their
SDK counterparts. These SDK kernel drivers are configured using the fmc
tool to do basic things such as apply a default PCD, so it seems a
reasonable idea to enable this package by default.

Since fmc uses C++, we need to add the standard library for that, which
also seems to increase the rootfs size.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2: increase rootfs size

 configs/ls1046a-rdb_defconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/configs/ls1046a-rdb_defconfig b/configs/ls1046a-rdb_defconfig
index 441d461298d7..dd03d59993ef 100644
--- a/configs/ls1046a-rdb_defconfig
+++ b/configs/ls1046a-rdb_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_PACKAGE_QORIQ_FM_UCODE=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
@@ -41,3 +41,7 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_QORIQ_RCW=y
 BR2_PACKAGE_HOST_QORIQ_RCW_INTREE="ls1046ardb/RR_FFSSPPPH_1133_5559/rcw_1800_sdboot.rcw"
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_FMLIB_QORIQ_FAMILY_ARM=y
+BR2_PACKAGE_FMLIB=y
+BR2_PACKAGE_FMC=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

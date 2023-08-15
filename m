Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457BAC001DB
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 13:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA7474019E;
	Tue, 15 Aug 2023 13:16:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA7474019E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oHNpek_Sg_Tl; Tue, 15 Aug 2023 13:16:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DE5E40120;
	Tue, 15 Aug 2023 13:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DE5E40120
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 518D31BF3D8
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 13:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A5D040120
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 13:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A5D040120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ru23eZnrl98e for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 13:16:10 +0000 (UTC)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6037C400A4
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 13:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6037C400A4
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-68843478de1so966683b3a.2
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 06:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692105369; x=1692710169;
 h=content-transfer-encoding:signed-off-by:mime-version:message-id
 :date:subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jIHC8qkgmV5W+0oykMF6GZzhCVA/NSgl4aRNTmoyHOI=;
 b=G5JTFISyB+aHUFYSxtUKbceoBl7+SmLvxVDKLE+oKpOIfqsfOy9ssgxIzii+WwRoZ4
 EexIcYRRbcO32ouMK5YI3ayPSiZaP3lXiYTXpQ6InoC5eLeRddBMskodUXFnocIeJDVn
 n8+QyKTo1AuxjjESnxiJb+dKL77sZBrAJntzO4TEe7h5x90K7CvOD3FxHFpLH+twskfW
 Haz79se7qZyjzhyqWqDOBDQNkj48gxXkVvF+atOwvFAzThjLV1PsHHHELuSaakck2L0S
 36C8PYYfRS+9+4IUUbLptMMZ3mF2HDeIQEDGwqlIJfmGrZuR3ORi3m5TEv/a+DEqtytV
 aD+w==
X-Gm-Message-State: AOJu0YxOTUrGkuO4X2LKagAVcLV4UpL5zGOWcdnJ3XXJkTjzHSn2sPIx
 i0mAPeu5S6qAP0fmZyrYsiQgQKSqyM6RbVSEatE=
X-Google-Smtp-Source: AGHT+IE63YnzghbKqmmBNvTV9UcUelisXQ60Mf6kNQOBXKLXJxzp5oab/3ZMm7xe0BNptAKXIRqppw==
X-Received: by 2002:a05:6a00:ccd:b0:687:536a:2e5b with SMTP id
 b13-20020a056a000ccd00b00687536a2e5bmr13672684pfv.26.1692105369088; 
 Tue, 15 Aug 2023 06:16:09 -0700 (PDT)
Received: from localhost.localdomain ([45.133.6.75])
 by smtp.gmail.com with ESMTPSA id
 i11-20020aa7908b000000b0066f37665a6asm9335551pfa.117.2023.08.15.06.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 06:16:08 -0700 (PDT)
From: Javad Rahimi <javad321javad@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Aug 2023 16:45:39 +0330
Message-Id: <20230815131542.1402848-1-javad321javad@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Signed-off-by: Javad Rahimi <javad321javad@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692105369; x=1692710169;
 h=content-transfer-encoding:signed-off-by:mime-version:message-id
 :date:subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jIHC8qkgmV5W+0oykMF6GZzhCVA/NSgl4aRNTmoyHOI=;
 b=U+xTEP691DfL8s4TQE58bj8h1CADHiHv8j3V7/eSnX+QMp1TcqeSJfM0UjvshwxIMC
 0XhaoO70q5MnBoyAy63cfv7m9rRw/zjDXD7izVtHe7xcipK4xmWdI+2wvZAmi1sRvwhM
 gNR5hMaReGtyKT/rEC6O7Gr3kayM0L94HsOi+Krg70v7QGDBnpIVaj0t1O+NJE9oEHyT
 sbJfLWu28pPtGiM6YaxPDkgcQZ6d2RLSlLmSan0Lhx/lo2Jarg+/L6WcrNQdyrXRGIDy
 gelE+//EI8j1nFudE4kf0IzMXL9JwaSL7BuFX4ChVE2pn3qQvc4inU26pvqCb0S6DQHK
 pDDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=U+xTEP69
Subject: [Buildroot] [PATCH 1/4] configs/orangepi_pc2: bump Linux version to
 6.1.45
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Javad Rahimi <javad321javad@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
index 3de067ae54..7536704947 100644
--- a/configs/orangepi_pc2_defconfig
+++ b/configs/orangepi_pc2_defconfig
@@ -1,13 +1,13 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi PC2"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.45"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-pc2"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

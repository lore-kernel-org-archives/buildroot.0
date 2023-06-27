Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A49EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 27 Jun 2023 14:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ECD481DE2;
	Tue, 27 Jun 2023 14:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ECD481DE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lsSwTc2Oux_q; Tue, 27 Jun 2023 14:34:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6F3881A73;
	Tue, 27 Jun 2023 14:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6F3881A73
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A3141BF35E
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 14:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E237D60E07
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 14:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E237D60E07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gyk1e5fa5NRd for <buildroot@lists.busybox.net>;
 Tue, 27 Jun 2023 14:34:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF7A76080A
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF7A76080A
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 14:34:11 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fa99f6a4a1so22404985e9.3
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 07:34:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687876450; x=1690468450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2UDsgqyRgwj8RRVgNnzRCCMmegzqHhKOohWkjFbkdGE=;
 b=XE1J/3j+nSUMHiZs7hHqaGnyq1ucMrDuZk5xt7h8VuAE5Yk2yzaiEtUw+m3vO8tW8Q
 7gTVICtwp/PSz5DyAfKzu2tuYZf4mC+Y5o4VtxPwD6/hxEmqIOZlpNbrtTPp5+n+AUOE
 +Xl+doZr93UGotTNu6xrQkWJRY589loipKBZ1YAhA3iN3lcnc6u06nLapDUcQH6qFFKN
 B3L1iheGJOJ9affRMYaA3gSI6MnDz565EzgX7EAEvCTirBUPCNDDaUqNQqOWAVl8sV4w
 PopF/yY3M+fY/h0VoLi3Q/bsPgQBG42RwjpLUcFCAq3QMwJc53DhOg9ZWOTrsDZRsWEl
 UkNQ==
X-Gm-Message-State: AC+VfDz+GH4YfiOFjKo25ZbbUk5SmkFGvz/aDs2urukekODMC+HvGht+
 MoHeH+8kU90Qc2odEJPrZN2//o3R4LQ=
X-Google-Smtp-Source: ACHHUZ60ePH7JyoMXaF3mohg3PQbk2qa+JcSnBaJQJJ+CywDv/EbxzRMue2p+PkubjZ603sNA6QWpQ==
X-Received: by 2002:a7b:c3d0:0:b0:3fb:1b78:38d2 with SMTP id
 t16-20020a7bc3d0000000b003fb1b7838d2mr3706373wmj.4.1687876449591; 
 Tue, 27 Jun 2023 07:34:09 -0700 (PDT)
Received: from p1g2.home (aputeaux-652-1-54-113.w83-204.abo.wanadoo.fr.
 [83.204.213.113]) by smtp.gmail.com with ESMTPSA id
 h2-20020a1ccc02000000b003fa74bff02asm10874540wmb.26.2023.06.27.07.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 07:34:08 -0700 (PDT)
From: Gary Bisson <bisson.gary@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jun 2023 16:34:00 +0200
Message-Id: <20230627143401.594223-2-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627143401.594223-1-bisson.gary@gmail.com>
References: <20230627143401.594223-1-bisson.gary@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687876450; x=1690468450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2UDsgqyRgwj8RRVgNnzRCCMmegzqHhKOohWkjFbkdGE=;
 b=SMtP37xLi5xJk9FO4YufJtrTk0bP5FVdbZG4jYMEZdGarD7F3wO9UN2dPUYtoe46na
 jA18m0Zz2UxTy9LUuRf4+PpCyC9siEVNaqtPVGuL1Hj9YuNV5j8YD85GqX19D1YCfOHr
 VW269FHuC5QcXr46BL3nIREbUeyg+GjqVN2iC0QtzwfX3m1BXf0HtKr9fX0xf4Wg5hLO
 HQJAq5JyKte2p0d6GrzNGeQYkYs4+qVKFOwb47hs5czAzFj4BkhA8phJUgfvol6gnQOi
 PiQlrL/p54dGFlBNtGISKV99zqoAGAofRczriazK+LZvDdKF24jP5uyWWgwwhlR44Kr7
 g7sQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=SMtP37xL
Subject: [Buildroot] [PATCH 1/2] configs/nitrogen*: add missing openssl
 u-boot dependency
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
Cc: Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271709
https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271710
https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271712

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 configs/nitrogen6sx_defconfig | 1 +
 configs/nitrogen6x_defconfig  | 1 +
 configs/nitrogen7_defconfig   | 1 +
 3 files changed, 3 insertions(+)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index 4e19a5c3d2..b4ea1b9112 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -28,6 +28,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/c2042594.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen6sx"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/boot.cmd"
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 5e360e27b4..ed9e13e6eb 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -27,6 +27,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/c2042594.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen6q"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/boot.cmd"
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index 0994c61884..c4520aeb89 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -27,6 +27,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/c2042594.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen7"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/boot.cmd"
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

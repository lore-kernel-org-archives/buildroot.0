Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8E9CCD18D
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 14:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D20D411B3;
	Mon, 13 Oct 2025 14:57:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UWz_1JWDCpjM; Mon, 13 Oct 2025 14:57:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 916084113D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 916084113D;
	Mon, 13 Oct 2025 14:57:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A40B212B
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 14:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95D2F40763
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 14:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X1sFzKC7iIuM for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 14:57:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b136; helo=mail-yx1-xb136.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5C14440059
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C14440059
Received: from mail-yx1-xb136.google.com (mail-yx1-xb136.google.com
 [IPv6:2607:f8b0:4864:20::b136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C14440059
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 14:57:36 +0000 (UTC)
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-63497c2a27dso4470533d50.1
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 07:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760367455; x=1760972255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v0LzsP/5170m9/WhNQD3I0ZBd3CtPh7I0TIilrH5exs=;
 b=oH1ZGOiTBxaIa5N33E+kwEtUYuFBgeaCSh4XxDZ/3Dw8JkobbOT2mNRb13u0TbVzsz
 xngG/Zew8V1A8851vowUdeF/SP8pklpzTFrAB6qskS5DBCVRooxWhMjWw9tpx8r8Rz9a
 rGLrfKfgX8tqkA8qxtU+zsa8rPYxyIoVU8KxWhljAT5y2mJ0Vg7S7j09lHdwD+92Ocik
 YULHeJdIjERHzpexn1ypzNyMah7Z6VRNQfGxWrLSGLkRWvrOm6WEjpCbg/EL6/wQ6dXe
 p4jt0rPcMg9FKhvJnK1C84mwzEt/3+16DgHQUDTqLkjE3Y4JBwzfcF+wZM3YO2q7r7bG
 tAXQ==
X-Gm-Message-State: AOJu0YybpDYDHRWwyifQ32AaafoVX3C9dnvO/wgpYMFcfR+wvmzhLPqC
 Hnd5IgKa2vvQyq9Gyo/KIuh5odYUiWPdC9n34eWGm9BcuZx6Az2GUvSlX9pFyQ==
X-Gm-Gg: ASbGncuYmm91SCsI3w5FxVLhZ/lbvkJt1b/x4ugGdLJ0HaKoPOhDs4pBmEMekyVY4wo
 zQR986YBEz6Dhib2UOfI2fZx8HG6yPzdTqWjLe9g3Wve1xbIkEGSeY3Ugtd34C3MQOAppzjFWLI
 72VuR9LFq+e51BTeHK03J+YHEO1fkyj9zuFKyy0lUhR8CBcueU+4ARGgCNQ2G7ICdjiOP2PXhkJ
 KpdgeGLt3p/fwo1z3trOngHPlcVicqSYRaFkfpFwaJfHClvrw1I7xQvSsEkS+w3eu+/lP6WK9LR
 UZTi3aHma48rHmSggEmf2DcgK5UQkEcmvxxT9OOqYLsnNxpn2NPnnhneYkiQ4qJBF7XMJQlyIC6
 5tbgBAVJ0tdfs2OVTRntbjyxgTgPU2HAwtOoyyIlx/91LeGDH
X-Google-Smtp-Source: AGHT+IFXCrlqKeDE6xzzPogXMK3qiWWgpcXW8t0VfU6ipNLdXlkIEsV6ytbogKZWuy09yE0uxSWWoA==
X-Received: by 2002:a05:690c:260a:b0:72f:d215:60a2 with SMTP id
 00721157ae682-780e1520605mr349145677b3.7.1760367454621; 
 Mon, 13 Oct 2025 07:57:34 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-78112f6021fsm22283647b3.0.2025.10.13.07.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 07:57:34 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Gero Schwaericke <gero.schwaericke@posteo.de>
Date: Mon, 13 Oct 2025 22:57:19 +0800
Message-ID: <20251013145721.1236674-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760367455; x=1760972255; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v0LzsP/5170m9/WhNQD3I0ZBd3CtPh7I0TIilrH5exs=;
 b=eWmjnW2uzcIAo0R6jdBLaVrJNxakd1ofY6IAr+R/d/QV5ICQLR/su7/dtgHk1km2ox
 +xMmE3OK+1/UVNkAg3pCU+CT3IMPuC4xYgj1SnBQoRTcBEKLoyb6KMZ7ryiurfTXzKCY
 MLql1Lnyr/C3Tr4fms0UXe8Z9fCpWYsiDf9GVaF0eQhsYrRA9iw7N6Kjf653HVpRGu71
 6uMGW5MPEpz2gYPbLBrkqh0TUAquXm7JF0hLlKCnAeZfhzSThmB24Ewlvo2Cq4IbDrmR
 rdwTXgOx9wAu0mwh/QOw9lTb1wsRBPWvNThT04Ih6rmL/CeG4YT+CvfPaCL9F2yGTdav
 1eDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eWmjnW2u
Subject: [Buildroot] [PATCH 1/2] configs/cubieboard1: bump Linux to 6.12.52
 and U-Boot to 2025.10
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

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 board/cubietech/cubieboard1/patches/linux/linux.hash | 2 +-
 board/cubietech/cubieboard1/patches/uboot/uboot.hash | 2 +-
 configs/cubieboard1_defconfig                        | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/cubietech/cubieboard1/patches/linux/linux.hash b/board/cubietech/cubieboard1/patches/linux/linux.hash
index 823f6a55a3..9ef8b4af9c 100644
--- a/board/cubietech/cubieboard1/patches/linux/linux.hash
+++ b/board/cubietech/cubieboard1/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  4804528a29cd20309a0b41c30e5aeffc35fa21ee3358f4a706d4586d003bc1fb  linux-6.12.42.tar.xz
+sha256  b4850cf670a032c70f38b713a27d62046c5f747caf028c5f50b18f98606a9eb1  linux-6.12.52.tar.xz
diff --git a/board/cubietech/cubieboard1/patches/uboot/uboot.hash b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
index 440526977b..98a5c53aaf 100644
--- a/board/cubietech/cubieboard1/patches/uboot/uboot.hash
+++ b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
+sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
diff --git a/configs/cubieboard1_defconfig b/configs/cubieboard1_defconfig
index 8a25129311..7948ab3b19 100644
--- a/configs/cubieboard1_defconfig
+++ b/configs/cubieboard1_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard1/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.42"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.52"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-cubieboard"
@@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

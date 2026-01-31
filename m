Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49F9E7C6F1
	for <buildroot@archiver.kernel.org>; Sat, 31 Jan 2026 22:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14DB040851;
	Sat, 31 Jan 2026 22:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KylTSW-iS6Dg; Sat, 31 Jan 2026 22:15:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2E4540969
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769897754;
	bh=bqBy514pMLmCAppmj730zoq8xAceih7dKTnpKZWDxjk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qGkX9B1LOdMlrSSJju2Kwc9Ud61Ap+GuKartoZMv3q1Qrywjbws3WMIaadJ90VMQT
	 Lci1pItC8B1gDLZ10QgDxVkg5mu9DVt67gBlBTRGueSXVhez8X7qmuA7JprxCvbRkx
	 1r6YdwRA9vwv8YrWfiArRwYWaYB1dEL3stXe1orM0Eq4xX4OrKFN1HVkbePeAjCJ1N
	 wq5hqUfYaCs3YXV1geKCj0a7iMpZKg5+jtrMFFUWpGMTdeaJ5cIEEtk4tQSEG3ggxi
	 Q6VPI86WYxjDdNoLvmRYrSA0keEzx4b2jBTvifVbU51fp0DokJhIeRpnZo13glw70N
	 /3e9DtLW2cnCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2E4540969;
	Sat, 31 Jan 2026 22:15:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F3B51428
 for <buildroot@buildroot.org>; Sat, 31 Jan 2026 22:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D621D40378
 for <buildroot@buildroot.org>; Sat, 31 Jan 2026 22:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IstTBLGJ_J5A for <buildroot@buildroot.org>;
 Sat, 31 Jan 2026 22:15:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=johan.patrik.olsson@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B4C7A40376
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4C7A40376
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4C7A40376
 for <buildroot@buildroot.org>; Sat, 31 Jan 2026 22:15:50 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-382fd45a1feso32041921fa.0
 for <buildroot@buildroot.org>; Sat, 31 Jan 2026 14:15:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769897748; x=1770502548;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LWM5quvjs24LZ/klnx6kwILLCgf2r/Xrx0yZr7uPRQE=;
 b=fgp/fPEVyv56JhSWOxacbZValtlr30JQ88TEeTJ68O9dhygyikagf8oiEm9tN2NleJ
 YEwdKYGKmi94cnb3gVcSKcbcXZpXnEWgMjf6Qsj+GZvBM/ONjfLtu2KsR0YHdBrqE0xP
 Pp1ueODdDoKV249UWqH+wxHFZ/bHi65miNn8OGTVL+X+DJkUanhMWAR+WXz6Bh1wD/OZ
 /0TVokXSZYyvEaRBfo4S/6i0em/2U3OBTA7nBP/KielzCYwgyuVq4Um3/c2QP1W+PIpR
 +PcivMyzjszZ2e1GrKptUkVS1D6keWNqtHU764IVKU8zyvlTtqaXjyAtfyaUurvtJ3w5
 rcYQ==
X-Gm-Message-State: AOJu0YyMfAtDJIiHSrKwu2a8WBFW9+vpV3Yxi2iN1kINp/XyrFVtiM2q
 8wf3F9bjb3ZVY4VDUWpCxyAaZcZZGqoBSdZjEeMD79YW/PktL3TqvnC2PcioGQ==
X-Gm-Gg: AZuq6aJShUzNjNAthyxRVetXADVuM+2Kt+jUkWHZFPr9Irp8wLKMyL2B9vyGdXuqoAt
 PAIkeoyFWgCFyEnmutTHhu3tGZJxA4G3t12ZZlFVE/azDkwIeEqEm8RfVuLSqrP+oqKPbek3a1J
 XYeEIqRezClYKZOfFFoxEV/EnpKbGHvreNvyIc6h70CV4nzV3VR+hS7UvWSToiaBlbqSRTmRrXA
 XNFwoMwiaWTN6yMi4DK/M1ET6FUdvxCUc370Vopt0exLW18PsNpoqZcMclx0NFOxxD95LPBqYlM
 bXOZhOSaG+n7lW4XYN3WmdQJB/P7RajBaN44fxVDSN5kQ5fVjhtCaJHFAHPk0bDg2Bu9/eR9Rt0
 WM/ni+rnLaKbA8EdgEkkrc7PWovu3TVyAQrVLvtkw9DpcjFd1vGfoKFcJEK81bUBdNRk+jvjNdD
 KY13TPnywuc8xX8Mq7kz/WV+N689XKgnVou53RgpU40g0WiZVn9INdgV9kRpOmzJNlcOoaOA==
X-Received: by 2002:a05:651c:3608:b0:385:c42a:1d53 with SMTP id
 38308e7fff4ca-386465e6eecmr22993131fa.14.1769897747954; 
 Sat, 31 Jan 2026 14:15:47 -0800 (PST)
Received: from DESKTOP.localdomain (94-255-240-210.cust.bredband2.com.
 [94.255.240.210]) by smtp.googlemail.com with ESMTPSA id
 38308e7fff4ca-38625f8a5f2sm24108231fa.33.2026.01.31.14.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jan 2026 14:15:47 -0800 (PST)
From: Patrik Olsson <johan.patrik.olsson@gmail.com>
To: buildroot@buildroot.org
Cc: Patrik Olsson <johan.patrik.olsson@gmail.com>
Date: Sat, 31 Jan 2026 23:15:36 +0100
Message-ID: <20260131221536.385918-1-johan.patrik.olsson@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769897748; x=1770502548; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LWM5quvjs24LZ/klnx6kwILLCgf2r/Xrx0yZr7uPRQE=;
 b=NzBZSExiEVIbFE7CJMCuR8Xwl3Bo0VXf62cRNJM4wYM8+y7BDNj9UG/f/+qDdV+CAg
 cpgE7R98CtbWnZRq/fkAPLShVsnwpM4c5G+KcA3grq1XN3xQVrtPgunoB3Tq/nRgPYv3
 Ij/yu1H79ZLYf6QPCrAgvzFQ+pwBMrD4sa4KCTUBYAbRbeZcD2khtAy86mc8q9C+hpAY
 5MKNhp2pL/qhLBwamQpF+UmKKs4CaCVptgnhH6ULFHXg7hUtN3PseLzKi+yz/ocfOdAu
 3YpZQUQLU0qNKC6/PIxoJpeDav6M99nFIfSx0LYEvnhEtwrdfnNw9hjToHe4qZHNDK/S
 /z0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NzBZSExi
Subject: [Buildroot] [PATCH 1/1] configs/friendlyarm_nanopi_r3s: bump Linux
 to 6.18.8 and U-Boot to 2026.01
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

This patch bumps the Linux kernel to version 6.18.8 and U-Boot to version 2026.01.

Tested on FriendlyElec NanoPi R3S.

Signed-off-by: Patrik Olsson <johan.patrik.olsson@gmail.com>
---
 board/friendlyarm/nanopi-r3s/patches/linux/linux.hash | 2 +-
 board/friendlyarm/nanopi-r3s/patches/uboot/uboot.hash | 2 +-
 configs/friendlyarm_nanopi_r3s_defconfig              | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/friendlyarm/nanopi-r3s/patches/linux/linux.hash b/board/friendlyarm/nanopi-r3s/patches/linux/linux.hash
index 451159a6dc..f83883b936 100644
--- a/board/friendlyarm/nanopi-r3s/patches/linux/linux.hash
+++ b/board/friendlyarm/nanopi-r3s/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  21817f1998e2230f81f7e4f605fa6fdcb040e14fa27d99c27ddb16ce749797a9  linux-6.14.6.tar.xz
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/board/friendlyarm/nanopi-r3s/patches/uboot/uboot.hash b/board/friendlyarm/nanopi-r3s/patches/uboot/uboot.hash
index b550824126..74d80a0daa 100644
--- a/board/friendlyarm/nanopi-r3s/patches/uboot/uboot.hash
+++ b/board/friendlyarm/nanopi-r3s/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/friendlyarm_nanopi_r3s_defconfig b/configs/friendlyarm_nanopi_r3s_defconfig
index beeab11c5e..971a0ae851 100644
--- a/configs/friendlyarm_nanopi_r3s_defconfig
+++ b/configs/friendlyarm_nanopi_r3s_defconfig
@@ -13,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.14.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/friendlyarm/nanopi-r3s/kernel.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -35,7 +35,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="bl31/bl31.elf"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi-r3s-rk3566"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

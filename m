Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16B2CE9D46
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 15:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 548FC401F8;
	Tue,  6 Jan 2026 15:11:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ojHGVFRWmtDT; Tue,  6 Jan 2026 15:11:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72AF140279
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767712284;
	bh=YegMAIDMrYEOtVkDBpf1PyxebGdjvi3JTKhANUqE28Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GdMtVlFPUXdeBwbbXtIEIFPT2m1bs35FybBM3YaM3QGDHp7wzZK7BDOn4XfvlFz0V
	 OslfYzdwty+4WfQGCymDOQBSzWrFXFgxAT4P3A79t/eOa8TyI8gruU75EaUE7DpArK
	 fuE1ppfdlEy8NxPSgIOcy1CwY89IuymyImnoNO61OM6iq0Alm3i8wv//K6OpvWg6wh
	 diQVUWZYeJ9OMXl47pvJEcFiojSE69ENiUBE6O07Vw9lQrc+lw/kPnrrI66+P0TPld
	 rrBUj2v7Kr+9PUh5huN0mxYX3Owq9OdHP7k27homFs6SiLWzi94ueQn3TG6DLUrlBy
	 vhtPSTItC2PjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72AF140279;
	Tue,  6 Jan 2026 15:11:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D7B34249
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9E4780B53
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 15:11:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOARnndBlHAz for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 15:11:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E5E4980B48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5E4980B48
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5E4980B48
 for <buildroot@busybox.net>; Tue,  6 Jan 2026 15:11:21 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477bf34f5f5so9857635e9.0
 for <buildroot@busybox.net>; Tue, 06 Jan 2026 07:11:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767712280; x=1768317080;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xz4u4YdwgPCsuqaty7MPIRaqcx/RKZHqY0qD6QJdwrw=;
 b=vBfa4n9FcaKpIIBV+MPe8r8/sR2utUc0u1JJCxQvbVlHG0J4MoVwHm2BF3zFVD6G8N
 RdmwthJAvC4RUqqOcWM+38WWfK+3KyrAZTO6q+I/J8e3xJ0b0YNph1PdULUpQcVU8+h4
 5d/O+gzX5NAuKYCgtMtXBCsDkqWqoX66LmFVu0ZqyX853D803BO122uPTx0ck/zAVHrk
 MpOR2i3bAIwzkdQjukRvyfzMIGD78al3k4pUyXkbEY0ptR9AfyYcyCY3Zij43/B1teqk
 XcGI8Bt2SngFFAO85mzszuwiryBvvILkekAZ5hLLDPsEYXIs+AOqsXMyS19pDULoOpSs
 qa6w==
X-Gm-Message-State: AOJu0Yx/6TdCuc2mpNStqo6GM8XEGtRVDueVGvZk1ATUhG4KKuAqLXwW
 GDaXNCSJX9db1Vcwai4P53GMpV0CD8h/AZ+acAsgqicWUSv0WUApGFlHPjDvSYyfFKcNqMQ5YKV
 9bbzxAQ==
X-Gm-Gg: AY/fxX7BTX6OvooV5Td82X1Vb5ZU1BtxTp7Lg9Q4F+o+Pe7A/mQfmNuLD/F/TB9eb+1
 IL3Eic6PNPDLFNMxOqvOekk0QFaeYbZAWNXuITJr4hvCH7VE6AbEAzb2H6XKROb/d94QkJly7/9
 zGwaMhKftIQ+FGNZS+pwF0Gcmmms4iJsQls/5SpsXunBuFkViEY3hMhTQdLc5DNgIYowr0JRNXh
 /mRw2Y2KO6dpSJPzppUxFd33u4PIA6PQ9PGEt/Wy2jDDFaZHu4oI/PBmINfM5NcCqcGrUXd2Myl
 3dyqirwmXW9hTBc8eyNa8zJiVAhkXtEhij/AB5dM7EmXF98US8EfzVGYlaoxxGydNe4GiZ1Sw12
 AGebT44sxij6X0QeO5ztHWsV+ZzQZQ/1To7uU/nlQ0E/8RKhS8FQ2kQU+IyNson6OZYWQhpPUqH
 M71iDmeCjYtbNjVIwkUq5liZ5ftKbKoH5vg/k=
X-Google-Smtp-Source: AGHT+IE2/m7cz8N9dkkDC9u3ASm64ezgwX5TVJpCnxJax114O9CVwg4xVDS1s7gr8IaTMB/VixDO7Q==
X-Received: by 2002:a05:600c:4705:b0:47d:403e:9cd5 with SMTP id
 5b1f17b1804b1-47d7f06feaemr33276515e9.11.1767712279545; 
 Tue, 06 Jan 2026 07:11:19 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e17aasm4901630f8f.15.2026.01.06.07.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jan 2026 07:11:18 -0800 (PST)
To: buildroot@busybox.net
Date: Tue,  6 Jan 2026 16:11:11 +0100
Message-ID: <20260106151112.335270-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1767712280; x=1768317080; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xz4u4YdwgPCsuqaty7MPIRaqcx/RKZHqY0qD6QJdwrw=;
 b=TWXl4ZXg0HWNYwCAVAbN6N2rEETfiFKZZHI1BVIPhFTWPLzTXLufT4gbQkJeNy93Aa
 RLTX3wP6ZztG1UWk4+jnsj4QCFq8XAKjjYUGFEUPIUbBX8RZkWDiHLGzQxMFMgwcmZlF
 f057Dl6zLt+1F/4IK7Y5c/bSxHdnMARHt2+pfgkcRhxogXWwx3hgCsEHa1lDn+1mA1EZ
 ZPRc49cz4Sgq+yQVV51a49nOMnUUeSEf7wyM0FdI07MOusM9SBKxBj87OWGplO8pjehk
 CRp4gtIi0B6tF0N7pz2t0XucffYeZNzPFPnGqNCItkVQ4PHwf/aoNDNz6qTsWoCToUUO
 cz5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=TWXl4ZXg
Subject: [Buildroot] [PATCH] configs/olimex_a20_olinuxino_lime*: bump Linux
 and U-Boot
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 board/olimex/a20_olinuxino/patches/linux/linux.hash | 2 +-
 board/olimex/a20_olinuxino/patches/uboot/uboot.hash | 2 +-
 configs/olimex_a20_olinuxino_lime2_defconfig        | 4 ++--
 configs/olimex_a20_olinuxino_lime_defconfig         | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/olimex/a20_olinuxino/patches/linux/linux.hash b/board/olimex/a20_olinuxino/patches/linux/linux.hash
index 52688f83e..9dd49776b 100644
--- a/board/olimex/a20_olinuxino/patches/linux/linux.hash
+++ b/board/olimex/a20_olinuxino/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  c435bd74d1c21fc5a950781a50d78bae2b93944144694843359948ad3afc72a5  linux-6.12.50.tar.xz
+sha256  7a8879167b89c4bae077d6f39c4f2130769f05dbdad2aad914adab9afb7d7f9a  linux-6.18.3.tar.xz
diff --git a/board/olimex/a20_olinuxino/patches/uboot/uboot.hash b/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
index a2725383c..60971ee74 100644
--- a/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
+++ b/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index ff6eca176..671aa1968 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -14,7 +14,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.50"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 7d95bd4d4..2df63b9ab 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -14,7 +14,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.50"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

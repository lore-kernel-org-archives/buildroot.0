Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1EA104891E
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 21:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D85F417BF;
	Fri, 27 Feb 2026 21:57:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jAWTsSvmyevt; Fri, 27 Feb 2026 21:57:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6523F417BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772229447;
	bh=b+cI6Wqq8IIM2NnXCAUW1YUfx0yTstehRARB3Ls8Otg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=DSQ3KTDE8CyKgwlrOj+2DDCBCxxBgFOsMT7y3d3gysRc+OeS4SL3GeS2u9fucx5oS
	 Zb6DB2odBzYWIeDolPA5LRVN8TJ7tX+dgFDOMg9VIv1s66L9TCmLXV6mj2TGeim0/n
	 Q2MSpF/TGOdL+Vkw4Rbxl1B/HwZFpLG1c8hQg9YhnoTG+H+Y5Yj0SGavfA02glP4pU
	 A7pJZEwFqFn9ZcA+8IHk7KGR6j2uTiixBuqHk9JH5VyBoTDJEgCoElgNaL8noNrxh/
	 NEs7koV+vAutc3HQ044xT7sCT9T+3IvLRvntTXqB09wMY/OsI6HWIL7w8lvoaneMmf
	 SOTkXYfF7qazg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6523F417BB;
	Fri, 27 Feb 2026 21:57:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 86A3B1F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 21:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 785D1417BB
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 21:57:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTh7B72V3rXZ for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 21:57:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 52AF7417B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52AF7417B6
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52AF7417B6
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 21:57:25 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1F31119F57E;
 Fri, 27 Feb 2026 22:57:21 +0100 (CET)
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
	Julien Olivain <ju.o@free.fr>
Date: Fri, 27 Feb 2026 22:57:09 +0100
Message-ID: <20260227215711.1232099-1-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772229443;
 bh=N23Gp0O+alU4tvtzWyN7DgUfVg48SuxwEsUZ/jPdfqY=;
 h=From:To:Cc:Subject:Date:From;
 b=ioFsNouhtqOCeeB2Dj5V9ucQFy3O4vDjifZh0nAAjN03TLnBJeBHOgrOnwfb8dWLx
 +oXI//q9kIIMVJDzZfVk6N0mqfcunNyJxDgFlcVwnYHNWGFEdwBjjxRj2gZTfkVd2+
 QRM3WIrGE4jGfZcIiImIDCBif/7TsmtzUKKJ3LpfaeU9qa7iPGvTBGsBzL5MCpt1rU
 ZRMv5ELuDCEUYEzOQsD6wMtl3kSNXg8D7ewRr5vNJbntoz+ZFagA1fMmhdATuCXbw1
 fWUodGIlXsreDTdi5b39qfnlU7tV990MNMo1MGjAqxfsi/++pwZ5mLlOmOerZsmJO1
 Y2qIaRfJpHm7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ioFsNouh
Subject: [Buildroot] [PATCH next 1/3] configs/aarch64_efi: switch to
 external toolchain
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit switches the aarch64_efi_defconfig to an external glibc
stable Bootlin toolchain, to follow recommendation from [1].

Since an external toolchain is used, the linux-headers.hash custom
hash file is no longer needed and is removed.

[1] https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/aarch64-efi/patches/linux-headers/linux-headers.hash | 1 -
 configs/aarch64_efi_defconfig                              | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)
 delete mode 120000 board/aarch64-efi/patches/linux-headers/linux-headers.hash

diff --git a/board/aarch64-efi/patches/linux-headers/linux-headers.hash b/board/aarch64-efi/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/aarch64-efi/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
index 3aa649cf9c..2bc6740eaf 100644
--- a/configs/aarch64_efi_defconfig
+++ b/configs/aarch64_efi_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/aarch64-efi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

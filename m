Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1B8CF6499
	for <buildroot@archiver.kernel.org>; Sun, 29 Sep 2024 14:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14EEA605D7;
	Sun, 29 Sep 2024 14:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RWm-nfkaWUim; Sun, 29 Sep 2024 14:29:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A89B605D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A89B605D8;
	Sun, 29 Sep 2024 14:29:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB8931BF2C5
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 14:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6E7A400F2
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 14:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3r42Novh7z6Y for <buildroot@lists.busybox.net>;
 Sun, 29 Sep 2024 14:29:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 47BD840018
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47BD840018
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47BD840018
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 14:29:14 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C3C36B0051B;
 Sun, 29 Sep 2024 16:29:08 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Sep 2024 16:29:00 +0200
Message-ID: <20240929142900.1201830-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727620151;
 bh=6bnemQyDlMCsoF0zOwp8ZF7MvFK3RMxefXOIjPAtvRE=;
 h=From:To:Cc:Subject:Date:From;
 b=ffo8DaRXONYY91tYcFpNY7VhhV0yVXe0cuXoBm+uvSE5mSPQQe7yqOcNZVLv2Ltey
 9nojbkgVR1UaqHhqmZzNq1mVR4YmRdMUlH23WpUJrDlPe7wl+QlwspReIZoa57Kz4h
 FrHCIlaDCRoauX21gmq7/ukUIxFWtQVeLQ2654dZkInkSSl9MyPrId6omzf3ZlvPgo
 BnCN+RCp2NLfPv9ZIkHIY6XU6Qd0RfmdZdsphIZXQ+lRKQGeF+3bPVbnHgvakjDYBK
 PFP/dqosuFtKWuw0fMWP46erSpa1q27GEgcP9VfRYYbi4u+L2n0pMLrh2aoFLT7wea
 X08HptoNZKAYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ffo8DaRX
Subject: [Buildroot] [PATCH 1/1] package/fwts: enable on RISC-V 64-bit
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

fwts RISC-V 64bit support was introduced in version 20.07.00, see [1].

This commit adds this architecture in _ARCH_SUPPORTS.

[1] https://wiki.ubuntu.com/FirmwareTestSuite/ReleaseNotes/20.07.00

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch runtime tested with commands:

    make qemu_riscv64_virt_efi_defconfig
    utils/config -e BR2_PACKAGE_FWTS -e BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
    make olddefconfig
    make
    output/images/start-qemu.sh

    # login as root, then run:
    fwts --uefitests

---
 package/fwts/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fwts/Config.in b/package/fwts/Config.in
index 08608d1dd7..2eebd111b0 100644
--- a/package/fwts/Config.in
+++ b/package/fwts/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_FWTS_ARCH_SUPPORTS
 	default y if BR2_aarch64
 	default y if BR2_arm
 	default y if BR2_i386
+	default y if BR2_RISCV_64
 	default y if BR2_x86_64
 
 config BR2_PACKAGE_FWTS
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

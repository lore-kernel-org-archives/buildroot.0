Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD18BFF885E
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 11:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A95645790;
	Mon, 27 Apr 2026 11:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A4Pq1aKncGXT; Mon, 27 Apr 2026 11:38:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D51D455DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777289939;
	bh=C9B8IzFQ3rhiVS1NTicprxLqCyXalNLoE/PoRrtTQLM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EnuRnp79pzk9Y7lMCXa5Y/AGGdDRSelh75PiCfwZJkRGkoPZqU5+Xk+rifFyl15CU
	 SHBoE2hSKq1ssEFtYVBvMohwmGyIckdo5LVGCXi6lpTDc77hJ0q7GHiGQmUkfi2u3K
	 N603BIxnnisnUarJYzsndulIJ4i1kFLJfxqhmZhZtw8p8GUKN5I5kVJpCDLlOKSGsn
	 BmA+bniMpW24E2LMJ6JQwXpNWo4hcKIhnFfsqyc+buzBXd8Rea2yfA0PU2XHe12VwE
	 KFqHLAiS8FaTr9s0bNLR7cMqr9vfSqzxmBYfDdcS5xbdkmzTI8vl5JKiYfTxdKkMZl
	 +VZOirzvQzc0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D51D455DD;
	Mon, 27 Apr 2026 11:38:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E51081B8
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 11:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2B3A85633
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 11:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5TLNgiYbzgWE for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 11:38:57 +0000 (UTC)
X-Greylist: delayed 601 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 27 Apr 2026 11:38:55 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4423C84A12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4423C84A12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=114.111.35.160;
 helo=cvsmtppost19.nm.naver.com; envelope-from=dungeonlords789@naver.com;
 receiver=<UNKNOWN> 
Received: from cvsmtppost19.nm.naver.com (cvsmtppost19.nm.naver.com
 [114.111.35.160])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4423C84A12
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 11:38:55 +0000 (UTC)
X-Originating-IP: 125.132.232.68
Received: from cvsendbo022.nm ([10.112.20.47])
 by cvsmtppost19.nm.naver.com with ESMTP id TP547FLeT2mL0i99ev5pbw
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 11:28:52 -0000
X-Session-ID: NKzOJKddTP2rGRwbHHq6Xg
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: p/Y/jAJYjHmlKxu/FoJYKxgXKBwkx0eFjAJYKg==
X-Works-Smtp-Source: eqY9KobXFqJZ+HmwKqvr+6E=
Received: from Linux ([125.132.232.68])
 by cvnsmtp008.nm.naver.com with ESMTP id NKzOJKddTP2rGRwbHHq6Xg
 for <multiple recipients>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 27 Apr 2026 11:28:51 -0000
From: Andrei Cherniaev <dungeonlords789@naver.com>
To: buildroot@buildroot.org
Cc: hi@senzilla.io, romain.naour@gmail.com, kory.maincent@bootlin.com,
 vincent.stehle@arm.com, ju.o@free.fr, jiaxun.yang@flygoat.com,
 fancp2007@gmail.com, Andrei Cherniaev <dungeonlords789@naver.com>
Date: Mon, 27 Apr 2026 20:28:20 +0900
Message-ID: <20260427112820.3753844-1-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=naver.com; s=s20171208; 
 t=1777289332; bh=IJKDqZ7qEiGath2a0USZMRs2xSuCX4yzwv2aWiVZLJ8=;
 h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
 X-Works-Security;
 b=URjV+BPQFh/mbffxBx2+WLdMQ93ezH0DbWxlL5jYKV/Ir6Qfs+yp/HaFLGe/jwKS3
 jQ+0MD8sr2165u6RTTF30xnGP7CddFauWJ63sHoNYFDXvJHOCG21lNkk3IBbC6F4Yv
 md+xfh7GeXE93Cd4vfiR3Br2g2mO4+j/HrimUEv6Q1Tbo5EGoCprLu1VZ8rGruPPSU
 +7dvj6qi/BwvRxLYIMlTz92F00m1w6bJe1daur7coS/E69eo2DpBqev0NL5fG6ZZ9k
 H0xAA+fCMI5fhqqIGnmKpNGTFeu5C2Phq4ldlLqE5ubx0zL8ybx9yv0l+tEXolOhen
 FMPXHSNs6IMXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=naver.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256
 header.s=s20171208 header.b=URjV+BPQ
Subject: [Buildroot] [PATCH 1/1] boot/edk2: fix description
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

1) usually user should not try to find OVMF.fd somewhere manually
2) board/qemu/x86_64-efi/readme.txt is trying to be duplicate of board/pc/readme.txt. We should not duplicate info

Signed-off-by: Andrei Cherniaev <dungeonlords789@naver.com>
---
 board/pc/readme.txt              | 10 +++++-----
 board/qemu/x86_64-efi/readme.txt | 17 +++--------------
 boot/edk2/Config.in              |  6 ++----
 3 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/board/pc/readme.txt b/board/pc/readme.txt
index 18b1e3dcf0..31ca5357e9 100644
--- a/board/pc/readme.txt
+++ b/board/pc/readme.txt
@@ -63,12 +63,12 @@ Run the emulation with:
 
 qemu-system-x86_64 \
 	-M pc \
-	-bios </path/to/OVMF_CODE.fd> \
+	-bios output/images/OVMF.fd \
 	-drive file=output/images/disk.img,if=virtio,format=raw \
 	-net nic,model=virtio \
 	-net user
 
-Note that </path/to/OVMF.fd> needs to point to a valid x86_64 UEFI
-firmware image for qemu. It may be provided by your distribution as a
-edk2 or OVMF package, in path such as
-/usr/share/edk2/ovmf/OVMF_CODE.fd .
+Note that OVMF.fd needs to be a valid x86_64 UEFI firmware image for qemu. The 
+easiest way is to generate it during the Buildroot build by set 
+BR2_TARGET_EDK2. Alternatively it may be provided by your distribution as a 
+edk2 or OVMF package, in path such as /usr/share/edk2/ovmf/OVMF_CODE.fd .
diff --git a/board/qemu/x86_64-efi/readme.txt b/board/qemu/x86_64-efi/readme.txt
index 7f69be065f..036239819a 100644
--- a/board/qemu/x86_64-efi/readme.txt
+++ b/board/qemu/x86_64-efi/readme.txt
@@ -12,17 +12,6 @@ Build
 Emulation
 =========
 
-Run the emulation with:
-
-    qemu-system-x86_64 \
-        -M pc \
-        -m 1024 \
-        -serial stdio \
-        -bios output/images/OVMF.fd \
-        -drive file=output/images/disk.img,format=raw \
-        -netdev user,id=net0 \
-        -device virtio-net-pci,netdev=net0 # qemu_x86_64_efi_defconfig
-
-Optionally add -smp N to emulate a SMP system with N CPUs.
-
-The login prompt will appear in the graphical window.
+    output/images/start-qemu.sh
+or
+    output/images/start-qemu.sh --serial-only --use-system-qemu
diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
index 2620c79076..a2ea1180f0 100644
--- a/boot/edk2/Config.in
+++ b/boot/edk2/Config.in
@@ -12,10 +12,8 @@ config BR2_TARGET_EDK2
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	select BR2_PACKAGE_EDK2_PLATFORMS
 	help
-	  EDK II is a modern, feature-rich, cross-platform firmware
-	  development environment for the UEFI and PI specifications.
-
-	  https://github.com/tianocore/tianocore.github.io/wiki/EDK-II
+	  build EDK II (and OVMF) to have capability to boot Buildroot
+	  in QEMU (UEFI mode)
 
 if BR2_TARGET_EDK2
 
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

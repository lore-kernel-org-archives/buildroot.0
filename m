Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907A7CA0FFF
	for <buildroot@archiver.kernel.org>; Sat, 30 Aug 2025 16:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C9D46062C;
	Sat, 30 Aug 2025 16:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MvAUlbVkCjTu; Sat, 30 Aug 2025 16:40:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 427C7606EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 427C7606EB;
	Sat, 30 Aug 2025 16:40:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A0E2FA
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 16:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3C7780A61
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 16:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id paCCFn0Wnm-V for <buildroot@buildroot.org>;
 Sat, 30 Aug 2025 16:39:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E2F3E80A5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2F3E80A5F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2F3E80A5F
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 16:39:57 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 195776015D;
 Sat, 30 Aug 2025 18:39:50 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Romain Naour <romain.naour@gmail.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sat, 30 Aug 2025 18:39:44 +0200
Message-ID: <20250830163944.1444066-1-ju.o@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756571994;
 bh=BUTnky9R4HwY/ZmWG2RVLYSTv+kIXksO4RSo3RF7T7o=;
 h=From:To:Cc:Subject:Date:From;
 b=eOQDPa7AydUtVdR1LN2fqKklgt3EbntjXog/1LSTgBiybcdLNg5nb3TjyCEaQJOn1
 Gl03fx6q8sCXvxyqVipaANH00OREEnQKK0SCPSmqh7BcgOC+ArqJoaHmzTWEyfqSxu
 5NrDowkx88yH7qHAaxn9EGUIr/xynrJ0g1poZZMX5jRlC1nbZLOYB2IB7JV5HSHpRF
 zfXHFiCTkbcOWYdiJ5FRMOC0e8I6tGjB7t2W/pRcTr9mAEx19w8EbVNyfrE2t/+xx+
 Bhr8cK7p627XAVG9a3qDxUwM/k8cg3Zp/NAG88vS1PPrnyaDyv2Y+2eZTKetzpu4Yv
 KlWUAf01SVsaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=eOQDPa7A
Subject: [Buildroot] [PATCH 1/1] configs/qemu_aarch64_sbsa: switch to
 neoverse-n2 (armv9.0a)
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

The SBSA Reference Platform was updated to neoverse-n2 (armv9.0a)
in Qemu v9.1 [1].

The Armv9-A and Neoverse N2 core support was added in Buildroot
commit [2].

This commit switches qemu_aarch64_sbsa_defconfig from using
Neoverse N1 (armv8.2a) to the Neoverse N2 CPU (armv9.0a).

For reference:

BR2_neoverse_n1:
    # cat /proc/cpuinfo
    processor       : 0
    BogoMIPS        : 2000.00
    Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp ssbs
    CPU implementer : 0x41
    CPU architecture: 8
    CPU variant     : 0x4
    CPU part        : 0xd0c
    CPU revision    : 1
    [...]

BR2_neoverse_n2:
    # cat /proc/cpuinfo
    processor       : 0
    BogoMIPS        : 2000.00
    Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 sm3 sm4 asimddp sha512 sve asimdfhm dit uscat ilrcpc flagm sb paca pacg dcpodp sve2 sveaes svepmull svebitperm svesha3 svesm4 flagm2 frint svei8mm svebf16 i8mm bf16 dgh rng bti
    CPU implementer : 0x41
    CPU architecture: 8
    CPU variant     : 0x0
    CPU part        : 0xd49
    CPU revision    : 3
    [...]

[1] https://gitlab.com/qemu-project/qemu/-/commit/b1d592e7b0a7301eae8e3baa99744ac35db3cd2a
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/9845bd4541cb03e97e577281f3c64f00c6ead881

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/qemu/aarch64-sbsa/readme.txt  | 2 +-
 configs/qemu_aarch64_sbsa_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/qemu/aarch64-sbsa/readme.txt b/board/qemu/aarch64-sbsa/readme.txt
index 7d97d7f6ab..acba9808a0 100644
--- a/board/qemu/aarch64-sbsa/readme.txt
+++ b/board/qemu/aarch64-sbsa/readme.txt
@@ -17,7 +17,7 @@ Run the emulation with:
 
   qemu-system-aarch64 \
     -M sbsa-ref \
-    -cpu neoverse-n1 \
+    -cpu neoverse-n2 \
     -smp 4 \
     -m 1024 \
     -nographic \
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index 92e27573f2..2560aacdb2 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -1,5 +1,5 @@
 BR2_aarch64=y
-BR2_neoverse_n1=y
+BR2_neoverse_n2=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

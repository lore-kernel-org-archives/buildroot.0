Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828C4E67487
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 21:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D449408E6;
	Thu, 31 Oct 2024 21:34:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDdeOKEuSTFQ; Thu, 31 Oct 2024 21:34:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FF3C408E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FF3C408E0;
	Thu, 31 Oct 2024 21:34:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47CC85E46
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 450098169E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrvGwdSd1Jl3 for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 21:34:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B89C80EAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B89C80EAB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B89C80EAB
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:34:52 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EB024B0051B;
 Thu, 31 Oct 2024 22:34:44 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@gmail.com>,
 Romain Naour <romain.naour@smile.fr>
Date: Thu, 31 Oct 2024 22:33:44 +0100
Message-ID: <20241031213348.2057705-5-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031213348.2057705-1-ju.o@free.fr>
References: <20241031213348.2057705-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730410490;
 bh=f3La1RU//KF3dNdZySGf6HUZ8oK1HVxRCbLPnBXf/iU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iGcXhDrw26+ZZIoV7LFhjX1HoDz1BpXNnzCET2zxOiHkMZBrBw+jJcAoGGc/wuLwb
 Ck/Bo64JvxX1sUWK8CKaUSHsetxp/c2QygKGuPeMoNl/sOgfAvRlbCdHxHbi7VnO+c
 KLByzmthRcSbONt7bJ2IiPXB2HhwrrcSHHVDSkZDWU9gK4cQQxzIOqLHP5UBhFgfbn
 scNnTDt5EYWkp9FhVeqHl/v226YTpW+H/wUS7Dc7JxR6zuiOjTbPCHSA0TTn+SG4Zx
 WoHoAGBcgI4rP2H0Cdbzlkb4g05nMxHvPRTxRhHMdTzZilZO+L6e/VF5uOtoknItOl
 MvmTg8UNlKSbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iGcXhDrw
Subject: [Buildroot] [PATCH v3 4/8] configs/qemu_aarch64_sbsa_defconfig:
 switch to neoverse-n1 (armv8.2a)
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

From: Romain Naour <romain.naour@smile.fr>

The SBSA Reference Platform was updated to neoverse-n1 (armv8.2a) in
Qemu v8.1 [1].

BR2_cortex_a57:
  # cat /proc/cpuinfo
  processor       : 0
  BogoMIPS        : 2000.00
  Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
  CPU implementer : 0x41
  CPU architecture: 8
  CPU variant     : 0x1
  CPU part        : 0xd07
  CPU revision    : 0
[...]

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

Tests test_fwts.py test_edk2.py using
BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA=y are not updated to neoverse-n1 by
this commit. Those tests were disabled in a previous commit. Those
tests will be updated and fixed in followup commits.

Note: SBSA Reference Platform was recently updated again to neoverse-n2
(armv9.0a) in Qemu v9.1 [2]. But there is no armv9.0a support yet in
Buildroot.

[1] https://gitlab.com/qemu-project/qemu/-/commit/1877272bad7b08b67312503ee66184279876c7bd
[2] https://gitlab.com/qemu-project/qemu/-/commit/b1d592e7b0a7301eae8e3baa99744ac35db3cd2a

Signed-off-by: Romain Naour <romain.naour@smile.fr>
[Julien: add a small comment in commit log about tests]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/qemu/aarch64-sbsa/readme.txt  | 2 +-
 configs/qemu_aarch64_sbsa_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/qemu/aarch64-sbsa/readme.txt b/board/qemu/aarch64-sbsa/readme.txt
index cf5f66d4d6..7d97d7f6ab 100644
--- a/board/qemu/aarch64-sbsa/readme.txt
+++ b/board/qemu/aarch64-sbsa/readme.txt
@@ -17,7 +17,7 @@ Run the emulation with:
 
   qemu-system-aarch64 \
     -M sbsa-ref \
-    -cpu cortex-a57 \
+    -cpu neoverse-n1 \
     -smp 4 \
     -m 1024 \
     -nographic \
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index 23d274b529..6df2b2e273 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -1,5 +1,5 @@
 BR2_aarch64=y
-BR2_cortex_a57=y
+BR2_neoverse_n1=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

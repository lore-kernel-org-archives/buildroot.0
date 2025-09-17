Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6323CAC598
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 21:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32A988476A;
	Wed, 17 Sep 2025 21:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oL9r8F-8KzRO; Wed, 17 Sep 2025 21:06:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BAAD8475D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BAAD8475D;
	Wed, 17 Sep 2025 21:06:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64B95199
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 21:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BD7D4273C
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 21:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7JovARocxQo for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 21:06:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2D6B407E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2D6B407E4
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 21:06:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E123985C33; Wed, 17 Sep 2025 21:06:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Sep 2025 23:03:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21ea33c764b212f84adb01289998c788fbfac04c
X-Git-Newrev: 64f6d524c56171d27afe11a36b76565f117d1cf6
X-Patchwork-Hint: ignore
Message-Id: <20250917210613.E123985C33@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_aarch64_sbsa: switch to
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=64f6d524c56171d27afe11a36b76565f117d1cf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

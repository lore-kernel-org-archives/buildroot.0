Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D38DC433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:48:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B41461151
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B41461151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4802605F8;
	Tue,  9 Nov 2021 10:48:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HanvHbSqTSVj; Tue,  9 Nov 2021 10:48:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4987060638;
	Tue,  9 Nov 2021 10:48:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 053551BF9A4
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E325D403B7
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:48:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q2RGuOG_oijH for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:48:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 167774021C
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:48:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8B6FE8B7E1; Tue,  9 Nov 2021 10:44:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Nov 2021 11:46:30 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: bedcafa633894aee5c665dc7da3f89d27c9b6727
X-Git-Newrev: b6d9a84b2ffcc443a600b42d06253ed244a002aa
X-Patchwork-Hint: ignore
Message-Id: <20211109104440.8B6FE8B7E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x]
 configs/qemu_aarch64_sbsa_defconfig: use ARM cortex a57
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b6d9a84b2ffcc443a600b42d06253ed244a002aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Cortex-a53 is not a vaild CPU supported by the SBSA reference machine
[0], so qemu fails to boot in our current defconfig:

  qemu-system-aarch64: sbsa-ref: CPU type other than the built-in cortex-a57 not supported

Use ARM cortex-a57 which is the CPU that SBSA was meant to emulate [1]

[0] https://git.qemu.org/?p=qemu.git;a=commitdiff;h=4f335a6381f83beb5d6ac0d3993514379454a99d
[1] https://git.qemu.org/?p=qemu.git;a=commitdiff;h=64580903c2b3aee08d74d64e6248a313b246cb69

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Dick Olsson <hi@senzilla.io>
Reviewed-by: Dick Olsson <hi@senzilla.io>
[yann.morin.1998@free.fr: update the commit log with info from Dick]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 17c516d67afd041093964824dcb0dfa8fc618fe6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/aarch64-sbsa/readme.txt  | 2 +-
 configs/qemu_aarch64_sbsa_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/qemu/aarch64-sbsa/readme.txt b/board/qemu/aarch64-sbsa/readme.txt
index 7935108ef1..b62947f55f 100644
--- a/board/qemu/aarch64-sbsa/readme.txt
+++ b/board/qemu/aarch64-sbsa/readme.txt
@@ -17,7 +17,7 @@ Run the emulation with:
 
   qemu-system-aarch64 \
     -M sbsa-ref \
-    -cpu cortex-a53 \
+    -cpu cortex-a57 \
     -smp 4 \
     -m 1024 \
     -nographic \
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index d014140bf5..9285ad7586 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -1,6 +1,6 @@
 # Architecture
 BR2_aarch64=y
-BR2_cortex_a53=y
+BR2_cortex_a57=y
 
 # Toolchain
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49ECEC04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 16:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BC4260D61;
	Wed,  8 May 2024 16:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y46JDdmrCtyd; Wed,  8 May 2024 16:34:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A626E60DF1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A626E60DF1;
	Wed,  8 May 2024 16:34:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C2E581BF2B0
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4466E401F9
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dB3tq2JTTi2S for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 16:34:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D0DF4028B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D0DF4028B
 for <buildroot@buildroot.org>; Wed,  8 May 2024 16:34:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B49386ADB; Wed,  8 May 2024 16:34:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 May 2024 18:34:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b1b43802419fabf19ac780f6106cccfb255718c
X-Git-Newrev: 48badeaa44d68d41f8723b010d905cdfd10f14b8
X-Patchwork-Hint: ignore
Message-Id: <20240508163429.4B49386ADB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: enable riscv32
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=48badeaa44d68d41f8723b010d905cdfd10f14b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested with qemu_riscv32_virt_defconfig.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uclibc/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 2555487f06..9fd07400de 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -15,6 +15,8 @@ config BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS
 	default y if BR2_mips64el
 	default y if BR2_or1k
 	default y if BR2_powerpc
+	# see libc/sysdeps/linux/riscv32/sys/asm.h
+	default y if BR2_RISCV_32 && (BR2_RISCV_ABI_ILP32 || BR2_RISCV_ABI_ILP32D)
 	# see libc/sysdeps/linux/riscv64/sys/asm.h
 	default y if BR2_RISCV_64 && (BR2_RISCV_ABI_LP64 || BR2_RISCV_ABI_LP64D)
 	default y if BR2_sh4
@@ -138,6 +140,7 @@ config BR2_UCLIBC_TARGET_ARCH
 	default "i386"	   if BR2_i386
 	default "x86_64"   if BR2_x86_64
 	default "riscv64"  if BR2_RISCV_64
+	default "riscv32"  if BR2_RISCV_32
 
 config BR2_UCLIBC_MIPS_ABI
 	string
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

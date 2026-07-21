Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0F5C4452D
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 20:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E32A608AE;
	Tue, 21 Jul 2026 20:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lHraR81ceIsw; Tue, 21 Jul 2026 20:39:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEF126089E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784666364;
	bh=eRNbGhRojRtpw9XmXLssLM2kKpKdAFPWxRS8BlXHGYc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KxV/n3P15iMBSIWbxKPIx7VxbY4dPMou9/jk7WzdHFu5sw+fiJ7wlZIiZzpNDrJpi
	 EM8vpL3tXqBrnkJMYEVIgPxQmqhHtk6nHaVY/Jaer+MDt80t3Ghnky3mHn2uajN9y5
	 F1UFbgAgIEY0udsl6PFbtQRUBqek48ZJEx+vAanpfRBOD/X8tIuQ//Hyeqe/C1YWKt
	 VDA5lS+VycuBCxYdtSG8ABQQTl5eh4k0itJpfO3ViUa0nCBh8t8xNq9Uc+rPak345F
	 u9JvXDr0Pky49g8XFv8tKGGNSkbOhxzIR2AIrVnJximBXHwcrMkurftqjwZtqLryLY
	 hwvdddwmYY4WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEF126089E;
	Tue, 21 Jul 2026 20:39:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 398A89E5
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CE4240942
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:39:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id keuqROQ3hbAo for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 20:39:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C99140568
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C99140568
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:39:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF77189140; Tue, 21 Jul 2026 20:38:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Jul 2026 22:32:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72f7aa47e73e9a93dbfa3e4128c0d8e7932edb50
X-Git-Newrev: 832ff692ab26e7ab10d86625f13ac9beda7461a2
X-Patchwork-Hint: ignore
Message-Id: <20260721203843.EF77189140@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32f469_disco_{sd,
 xip}: fix boot failure after uClibc bump
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/832ff692ab26e7ab10d86625f13ac9beda7461a2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since uClibc was bumped to 1.0.58 (c7fef3704c70, "package/uclibc:
bump to 1.0.58"), the board fails to boot:

    sh: out of memory
    Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000100
    ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000100 ]---

The STM32F469 has no MMU, and uClibc's standard malloc() implementation
returns NULL for allocations performed during early init on this target,
causing init to abort immediately.

Fix this by switching to MALLOC_SIMPLE, a plain mmap-based allocator
meant for small/noMMU systems, via the uClibc config fragment already
introduced for the STM32F429 in board/stmicroelectronics/common/stm32f4xx/,
which addresses the same issue on this Cortex-M4/noMMU board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/stm32f469_disco_sd_defconfig  | 1 +
 configs/stm32f469_disco_xip_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index c58523217e..c0dacd5b0c 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_m4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_UCLIBC_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config"
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh board/stmicroelectronics/stm32f469-disco/post-build.sh"
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index 9124177193..e642d8d489 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_m4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_UCLIBC_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config"
 # BR2_UCLIBC_INSTALL_UTILS is not set
 BR2_ENABLE_LTO=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

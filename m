Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05686C4452B
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 20:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3303608BF;
	Tue, 21 Jul 2026 20:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AaNYAW6LkrQN; Tue, 21 Jul 2026 20:39:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 161D26089F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784666367;
	bh=Xcjx2yxeCw+e2umu2O8Pqj5JajsbdCXgaub0DNK6QJA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VcjpPxe6L4aFlmCEomFFY/201rScg+Sv7hOqQKP8r6Ql42BHa/szB+tEJ+XPTXRqp
	 pQSLg5xKi2WGobvVobF8i+9JPgc9THuk8MQ+PyFVCqvMqj/s+s22X5dB8foO/bNnLX
	 Hp+a+/DjTIijx6AGO1kVcHsDVh7cekauEhdsmuKrkVOrHIHrtwfD4frlxX7BL+wRms
	 wsqXoiKEOZ6nBBrJcfmvGY4NdichZWHsUJQvGfsNbwtlrUqtWxqAMqN5+1nUJGSc0K
	 5r3q2pUrQDxg+28kO2amEwEvX2JKQ1kM3GR/CT7tbFG03A1GHBcTh6efK313Pa27sR
	 ZElpGWftlAEnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 161D26089F;
	Tue, 21 Jul 2026 20:39:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44C461338
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 342D180EA0
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:39:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ysVs9EDer6fT for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 20:39:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5963880A75
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5963880A75
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:39:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07AE689141; Tue, 21 Jul 2026 20:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Jul 2026 22:32:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 832ff692ab26e7ab10d86625f13ac9beda7461a2
X-Git-Newrev: dd67de1bd3374a75ab1845ef29e3ad3c3bed2aac
X-Patchwork-Hint: ignore
Message-Id: <20260721203844.07AE689141@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32f769_disco_sd: fix boot
 failure after uClibc bump
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dd67de1bd3374a75ab1845ef29e3ad3c3bed2aac
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since uClibc was bumped to 1.0.58 (c7fef3704c70, "package/uclibc:
bump to 1.0.58"), the board hangs after starting init:

    [    1.231624] Run /sbin/init as init process
    [    1.235599]   with arguments:
    [    1.238549]     /sbin/init
    [    1.241331]     earlyprintk
    [    1.244018]   with environment:
    [    1.247143]     HOME=/
    [    1.249554]     TERM=linux
    [    1.252177]     consoleblank=0

No error message is printed and the boot simply stalls at this
point.

The STM32F769 has no MMU, and uClibc's standard malloc()
implementation returns NULL for allocations performed during early
init on this target, causing init to fail.

Fix this by switching to MALLOC_SIMPLE, a plain mmap-based allocator
meant for small/noMMU systems, via a uClibc config fragment. Unlike
the STM32F429/STM32F469 fix, the fragment is kept board-specific
since the STM32F769 is a Cortex-M7 board and does not belong to the
stm32f4xx family.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config | 2 ++
 configs/stm32f769_disco_sd_defconfig                            | 1 +
 2 files changed, 3 insertions(+)

diff --git a/board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config b/board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config
new file mode 100644
index 0000000000..fb8fa9ee01
--- /dev/null
+++ b/board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config
@@ -0,0 +1,2 @@
+# MALLOC is not set
+MALLOC_SIMPLE=y
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index 065d5b59bf..d09b81b19b 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_m7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_UCLIBC_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32f769-disco/uclibc-fragment.config"
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f769-disco/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32f769-disco/post-build.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

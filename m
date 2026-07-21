Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7750AC4452D
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 20:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE57C608C4;
	Tue, 21 Jul 2026 20:39:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQl-wnOloUZM; Tue, 21 Jul 2026 20:39:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC14D6089E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784666365;
	bh=FAbBsRJ1VKetAvgBSoGr9tVCBAWo4phOPUuCN38Xh48=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J/8XLMUzR7HH/oirmrySn+Q6BOkmvvEaks0Gq+yQUD1Fq2gTdtuwyjYJYIihVmsPg
	 GoGyNVkj36EdVop1W0iNOzKZAS4nP5YiCkkpQ93SJETrUAQGMxHi0c4NrNW7grFr5m
	 onpgS9d0iiq6aAKwp4M8SDvfCR5D6pB6htsOmbGLTqStTutedv0ssL/DM7WBo5khHN
	 JRZGrsCDCrYo101sRVc0fbmgr5roDG/f9EIOloacxR1ZoLggNeP5NSIunGqG+RTyZa
	 I4bA/9KTSsjfWdKW7tM+MTNy7+vFW9uXZbLSz9AyAH2cwPi58AWBl7ELKJcgcF5Svc
	 9z6z8SwcUeoPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC14D6089E;
	Tue, 21 Jul 2026 20:39:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EABD1331
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E6C14036A
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:39:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d8wD_p2CLPl8 for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 20:39:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 365D040349
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 365D040349
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:39:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E37DD8913F; Tue, 21 Jul 2026 20:38:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Jul 2026 22:32:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2547ad8dfeb9f6c19ab6113efe92a6d17a97ab9c
X-Git-Newrev: 72f7aa47e73e9a93dbfa3e4128c0d8e7932edb50
X-Patchwork-Hint: ignore
Message-Id: <20260721203843.E37DD8913F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32f429_disco_xip: fix boot
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/72f7aa47e73e9a93dbfa3e4128c0d8e7932edb50
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since uClibc was bumped to 1.0.58 (c7fef3704c70, "package/uclibc:
bump to 1.0.58"), the board fails to boot:

    sh: out of memory
    Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000100
    CPU: 0 PID: 1 Comm: init Not tainted 6.1.167 #2
    Hardware name: STM32 (Device Tree Support)
    Function entered at [<0800ea1e>] from [<0800de7b>]
    Function entered at [<0800de7b>] from [<080e4991>]
    Function entered at [<080e4991>] from [<080e2d19>]
    Function entered at [<080e2d19>] from [<080125eb>]
    Function entered at [<080125eb>] from [<08012b09>]
    Function entered at [<08012b09>] from [<08012b69>]
    ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000100 ]---

The STM32F429 has no MMU, and uClibc's standard malloc() implementation
returns NULL for allocations performed during early init on this target,
causing init to abort immediately.

Fix this by switching to MALLOC_SIMPLE, a plain mmap-based allocator
meant for small/noMMU systems, via a uClibc config fragment. The
fragment is placed under board/stmicroelectronics/common/stm32f4xx/,
rather than under the board-specific directory, so that it can be
shared with the STM32F469, another Cortex-M4/noMMU board affected by
the same issue, which will be fixed in a subsequent patch.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config | 2 ++
 configs/stm32f429_disco_xip_defconfig                            | 1 +
 2 files changed, 3 insertions(+)

diff --git a/board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config b/board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config
new file mode 100644
index 0000000000..fb8fa9ee01
--- /dev/null
+++ b/board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config
@@ -0,0 +1,2 @@
+# MALLOC is not set
+MALLOC_SIMPLE=y
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 489303b93e..e6edfa9061 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_m4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_UCLIBC_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/common/stm32f4xx/uclibc-fragment.config"
 # BR2_UCLIBC_INSTALL_UTILS is not set
 BR2_ENABLE_LTO=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

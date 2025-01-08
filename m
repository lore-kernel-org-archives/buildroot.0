Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23E4E7719B
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 22:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A261081747;
	Wed,  8 Jan 2025 22:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AU6hkI-m0D9f; Wed,  8 Jan 2025 22:05:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95A6F818CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95A6F818CA;
	Wed,  8 Jan 2025 22:05:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 51A037AA
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD9EA40970
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pgii2ziFIDTs for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 22:04:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D381340983
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D381340983
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D044583F27; Wed,  8 Jan 2025 22:04:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Jan 2025 22:41:30 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: a05dfee7798683c34b4edc876b7eea7a75d0ac8a
X-Git-Newrev: c8f214fb5ccec937a4c7cfdffd5ed76635365479
X-Patchwork-Hint: ignore
Message-Id: <20250108220444.D044583F27@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/igt-gpu-tools:
 needs NPTL threads
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c8f214fb5ccec937a4c7cfdffd5ed76635365479
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

With classic thread library, the build fails with:

../lib/igt_kmod.c:1090:21: error: implicit declaration of function 'pthread_mutexattr_setrobust'; did you mean 'pthread_mutexattr_settype'? [-Werror=implicit-function-declaration]

igt-gpu-tools needs NPTL threads.

Fixes:

  http://autobuild.buildroot.net/results/85311ce68ae1fff771ca00b434be1c4f8453d357/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 80e0f643e88afeccb69b679fe55677d8065445d8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/igt-gpu-tools/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/igt-gpu-tools/Config.in b/package/igt-gpu-tools/Config.in
index 08fc34e917..de87bf8e99 100644
--- a/package/igt-gpu-tools/Config.in
+++ b/package/igt-gpu-tools/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_IGT_GPU_TOOLS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_ENABLE_LOCALE
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_USE_WCHAR # elfutils, procps-ng
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 # linux/dma-buf.h
@@ -24,9 +24,9 @@ config BR2_PACKAGE_IGT_GPU_TOOLS
 
 	  https://gitlab.freedesktop.org/drm/igt-gpu-tools
 
-comment "igt-gpu-tools needs udev /dev management and toolchain w/ threads, wchar, dynamic library, locale, headers >= 4.11"
+comment "igt-gpu-tools needs udev /dev management and toolchain w/ NPTL, wchar, dynamic library, locale, headers >= 4.11"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR || \
 		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

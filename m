Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74B4E77188
	for <buildroot@archiver.kernel.org>; Fri,  3 Jan 2025 22:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 577E381140;
	Fri,  3 Jan 2025 22:48:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9kx3XZMCy79w; Fri,  3 Jan 2025 22:48:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0663811F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0663811F6;
	Fri,  3 Jan 2025 22:48:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 888B0E0F
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 22:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61A71402E5
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 22:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wbCeHb9EFaeN for <buildroot@buildroot.org>;
 Fri,  3 Jan 2025 22:48:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 622CF4012F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 622CF4012F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 622CF4012F
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 22:48:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 4C64B20002;
 Fri,  3 Jan 2025 22:48:30 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Fri,  3 Jan 2025 23:48:25 +0100
Message-ID: <20250103224827.4074447-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735944510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=STmbrnkw8X1CcVsRedy70xw+KLXJ7kqxbLSlMJVJ+Po=;
 b=DxLMMjTqYNit/SoQ4ySKE66Vj6kVWv2A0sLj9gFiQUG189TlHnXFze4OqWsAFOGsyRNDe2
 cCoJ2ytjtkByxTt+zGzyXYTfnVY3ByGWvGzEPEqYhkJytGZcRhsgfYq8i8bIAaRo/u+3SH
 iY5AllJI95IkhOLULKSqXdJhjTOr8dkV45m/Vb6F3TcBCEBQ8q1o07aaINrKSTgLXbS//k
 wP7Ac3eqzFysftvEUxkyrOaREnsfN4E36QxaK3/waeJ8pCuJO1EJFIhKbHRkCC2p/FapUe
 QH1xYgwRWDpPUxYoG5XG3WXGrTZJI/N7i33VwJQAgYnmprI9pYNYbPD0DYVsqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DxLMMjTq
Subject: [Buildroot] [PATCH 1/2] package/igt-gpu-tools: needs NPTL threads
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With classic thread library, the build fails with:

../lib/igt_kmod.c:1090:21: error: implicit declaration of function 'pthread_mutexattr_setrobust'; did you mean 'pthread_mutexattr_settype'? [-Werror=implicit-function-declaration]

igt-gpu-tools needs NPTL threads.

Fixes:

  http://autobuild.buildroot.net/results/85311ce68ae1fff771ca00b434be1c4f8453d357/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

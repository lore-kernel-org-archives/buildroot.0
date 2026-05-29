Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F10CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07B88615FF;
	Fri, 29 May 2026 18:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_hfa03lphUF; Fri, 29 May 2026 18:10:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2954561606
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780078234;
	bh=+VB8C89o9MQfvOHiP0yuMKxYYmKmW2nkee6qIC2tHDA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jrJBCJSMCY+VVQ+D1eA+wT+G4YtO9BZeWMyfjje7k8xc2dPZ1GNBeg3o0RUjvbTC1
	 7Tzbqw5zb9bA2/kVcjkTFAQLRtIh5ZipIunZK1Wa+SkBRoQ03rcbzZiK+dWqyaW5Ug
	 sQHug9azTQxEhjd9iQnsSLDh3ZTcpJMZgQS+I8RubqLXP8QDfliFFXr6p1fa/yVx3R
	 fveszZ5YHiWBdMYebmes+ZIR60UGjFU2D8HYtqIDAjMrS2AAyTorvqLy6YchqtmHwq
	 Vlg7uZtxH4YT2Quthu7yDODheQYLR/FmtMGO4f1TEHJnEukBjC7vcxWt0pB7bkLvWl
	 JntUaZEB2+I/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2954561606;
	Fri, 29 May 2026 18:10:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BE893288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A994D423E6
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wwqgzchv5XNR for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:10:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5028E423E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5028E423E4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:10:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0FA88740F; Fri, 29 May 2026 18:10:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 19:58:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88882b21f2f57f7955190f0d4999a0221af70180
X-Git-Newrev: 8b79a9fec56ca450f385494879e838b301ad2a38
X-Patchwork-Hint: ignore
Message-Id: <20260529181018.A0FA88740F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vorbis-tools: Fix build with gcc
 14.x
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8b79a9fec56ca450f385494879e838b301ad2a38
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit ce5d1735710d11b135fc6cb235e976b306833e7d removed
0001-fix-build-with-gcc-14.patch which the version bump to 1.4.3.

The patch originally not only fixed share/utf8.c but also
ogginfo/codec_skeleton.c. Upstream only applied the fix for
ogginfo/codec_skeleton.c:
https://github.com/xiph/vorbis-tools/commit/68c5a33685f5b86e7f18f239ceb8861484fee552
so the build still fails:

utf8.c: In function 'convert_buffer':
utf8.c:271:9: error: implicit declaration of function 'charset_convert'
 [-Wimplicit-function-declaration]
  271 |   ret = charset_convert(fromcode, tocode, from, fromlen, to, tolen);

Added upstream commit to fix the problem.

Fixes:
https://autobuild.buildroot.net/results/135/13520e3cbf6b6d169985f4d1378c2a1baab852e0/

The build error can be reproduced by this minimal defconfig:
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_PACKAGE_VORBIS_TOOLS=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 ...de-for-charset.h-to-find-charset_convert-.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/vorbis-tools/0001-Added-include-for-charset.h-to-find-charset_convert-.patch b/package/vorbis-tools/0001-Added-include-for-charset.h-to-find-charset_convert-.patch
new file mode 100644
index 0000000000..3e97976fd8
--- /dev/null
+++ b/package/vorbis-tools/0001-Added-include-for-charset.h-to-find-charset_convert-.patch
@@ -0,0 +1,32 @@
+From 5155bf98a5b10fdf950dfa8f6edad624c0db7030 Mon Sep 17 00:00:00 2001
+From: Petter Reinholdtsen <pere@debian.org>
+Date: Sun, 22 Feb 2026 23:33:59 +0100
+Subject: [PATCH] Added include for "charset.h" to find charset_convert()
+ prototype with gcc >= 14.
+
+Patch from Bernd Kuhls.
+
+Fixes #2334.
+
+Upstream: https://github.com/xiph/vorbis-tools/commit/5155bf98a5b10fdf950dfa8f6edad624c0db7030
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ share/utf8.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/share/utf8.c b/share/utf8.c
+index e1199bc..1e6965f 100644
+--- a/share/utf8.c
++++ b/share/utf8.c
+@@ -28,6 +28,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ 
++#include "charset.h"
+ #include "utf8.h"
+ 
+ 
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

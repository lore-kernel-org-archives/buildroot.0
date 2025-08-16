Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78003CA0EE6
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 21:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24813615A1;
	Sat, 16 Aug 2025 21:34:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9tG-aWXhIho; Sat, 16 Aug 2025 21:34:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 480E9615AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 480E9615AD;
	Sat, 16 Aug 2025 21:34:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D065B197
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 21:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C28BA615A1
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 21:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30R624gZwd7A for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 21:34:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B8AB0615A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8AB0615A7
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8AB0615A7
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 21:34:50 +0000 (UTC)
Received: from argo.fritz.box (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 56B0EE00108;
 Sat, 16 Aug 2025 23:34:47 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Justin Maggard <jmaggard@netgear.com>,
	Florian Larysch <fl@n621.de>
Date: Sat, 16 Aug 2025 23:34:45 +0200
Message-ID: <20250816213446.22359-1-fl@n621.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1755380087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=jktZQunZKeUK6rAsngpQ0K4rH2C+qOaIeLKmaNjcNXE=;
 b=C9BWC+X8FfpaIamkZlK9dmxYDIpxPYJ9vtiMJZurl3MamGIf56woLETvxtymSCEiSZkk6N
 0lOzUUHkdoNASre3UVIOYoJ1AnsSxWHYW74Kx5/8tDFzFp8argNQh+Kx3SDhSzLAxsXgtz
 k6myqIZO+1blsKLHXw4y6R1YspJof/E=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=C9BWC+X8
Subject: [Buildroot] [PATCH 1/1] package/dtach: fix GCC 15 build
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

GCC 15 making C23 the default causes the dtach build to fail. Import the
upstream patch that fixes it.

Fixes: https://autobuild.buildroot.org/results/1ab/1ab2eead8309c138ad7a5190e2489e086c3d676d
Signed-off-by: Florian Larysch <fl@n621.de>
---
 package/dtach/0001-fix-gcc-15-build.patch | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/dtach/0001-fix-gcc-15-build.patch

diff --git a/package/dtach/0001-fix-gcc-15-build.patch b/package/dtach/0001-fix-gcc-15-build.patch
new file mode 100644
index 0000000000..4da6abb44e
--- /dev/null
+++ b/package/dtach/0001-fix-gcc-15-build.patch
@@ -0,0 +1,27 @@
+From 6d80909a8c0fd19717010a3c76fec560f988ca48 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Mon, 9 Dec 2024 12:35:09 +0000
+Subject: [PATCH] fix gcc-15 build
+
+Upstream: https://github.com/crigler/dtach/commit/6d80909a8c0fd19717010a3c76fec560f988ca48
+Signed-off-by: Florian Larysch <fl@n621.de>
+---
+ attach.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/attach.c b/attach.c
+index 41a696c..e4a46bd 100644
+--- a/attach.c
++++ b/attach.c
+@@ -96,7 +96,7 @@ die(int sig)
+ 
+ /* Window size change. */
+ static RETSIGTYPE
+-win_change()
++win_change(int sig)
+ {
+ 	signal(SIGWINCH, win_change);
+ 	win_changed = 1;
+-- 
+2.50.1
+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

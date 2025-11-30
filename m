Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29803D111A8
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 08:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E371660666;
	Sun, 30 Nov 2025 08:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NA98sSadm0DP; Sun, 30 Nov 2025 08:18:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01B536066E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01B536066E;
	Sun, 30 Nov 2025 08:18:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A3491A9
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 08:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CB4140AB9
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 08:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DEL8kOp8MPUz for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 08:18:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 098C040AAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 098C040AAA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 098C040AAA
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 08:18:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b593.dip0.t-ipconnect.de [84.161.181.147])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A2405A4C779A;
 Sun, 30 Nov 2025 09:18:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48102)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vPcdS-000000000Am-1Jph;
 Sun, 30 Nov 2025 08:18:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Sun, 30 Nov 2025 09:18:22 +0100
Message-ID: <20251130081822.578947-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764490702;
 bh=DuE1I6GupxM7rro82DCTH7myTjPA83Zg4vQrILv/LJg=;
 h=From:To:Cc:Subject:Date:From;
 b=CGn/6qiGx3YcugcDePqzfwgDG+8BujYh5gte+aoxmmDWeByVIVxfYLo5UmxcdpQcF
 X19yDd0vSmHcctAoAQVQWjhRBI8JLBYlCVYgHAy7q88b1yJIg1e86BXDr8zmkL3YPI
 kyqOPbTcoW4QXPxhI3gUkRMxe4Eq6rradcSLtUm7wCQNOQF89iLRc7X+bMG6ruVGZ5
 Xpx+J6D5ZhQX1WBnperLip+puxnYuYx402QoT/xSEyg2Ov2bAiW514tjzFh/NzG4rx
 plwvJVXmsQ9nHz00DwCfPlXMq7vzxAIRRf049DA9SATL1pzq+mDrV4nly9xG/O0/vy
 9iOzGaVYx03Ng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=CGn/6qiG
Subject: [Buildroot] [PATCH 1/1] package/libteam: add upstream patch to fix
 build with newer gcc
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

Fixes:
https://autobuild.buildroot.net/results/a4c/a4c4c4135cffe607269cc0fdb36e4b2c86e7fe33/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...correct-parameter-type-to-accept-API.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/libteam/0001-teamd-Pass-correct-parameter-type-to-accept-API.patch

diff --git a/package/libteam/0001-teamd-Pass-correct-parameter-type-to-accept-API.patch b/package/libteam/0001-teamd-Pass-correct-parameter-type-to-accept-API.patch
new file mode 100644
index 0000000000..0d9cf9b8a0
--- /dev/null
+++ b/package/libteam/0001-teamd-Pass-correct-parameter-type-to-accept-API.patch
@@ -0,0 +1,40 @@
+From 4eb54a811bef43da2be9cc84009567e5d6ca9741 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 11 May 2024 23:15:59 -0700
+Subject: [PATCH] teamd: Pass correct parameter type to accept API
+
+accept() expects sockaddr as second parameter
+
+int accept (int, struct sockaddr *__restrict, socklen_t *__restrict);
+
+Fixes build with gcc-16 on musl systems
+| ../../git/teamd/teamd_usock.c: In function 'callback_usock':
+| ../../git/teamd/teamd_usock.c:280:40: error: passing argument 2 of 'accept' from incompatible pointer type [-Wincompatible-pointer-types]
+|   280 |         sock = accept(ctx->usock.sock, &addr, &alen);
+|       |                                        ^~~~~
+|       |                                        |
+|       |                                        struct sockaddr_un *
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Jiri Pirko <jiri@nvidia.com>
+
+Upstream: https://github.com/jpirko/libteam/commit/4eb54a811bef43da2be9cc84009567e5d6ca9741
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ teamd/teamd_usock.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/teamd/teamd_usock.c b/teamd/teamd_usock.c
+index 1adfdf8..5895124 100644
+--- a/teamd/teamd_usock.c
++++ b/teamd/teamd_usock.c
+@@ -277,7 +277,7 @@ static int callback_usock(struct teamd_context *ctx, int events, void *priv)
+ 	int err;
+ 
+ 	alen = sizeof(addr);
+-	sock = accept(ctx->usock.sock, &addr, &alen);
++	sock = accept(ctx->usock.sock, (struct sockaddr *)&addr, &alen);
+ 	if (sock == -1) {
+ 		teamd_log_err("usock: Failed to accept connection.");
+ 		return -errno;
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

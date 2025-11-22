Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBDCCFC533
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 12:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AE9240C15;
	Sat, 22 Nov 2025 12:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FwjJPp9gs6iv; Sat, 22 Nov 2025 12:54:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CD7140BC8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CD7140BC8;
	Sat, 22 Nov 2025 12:54:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9942F158
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 12:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F8D44031C
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 12:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UWsU0dB8mfHn for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 12:54:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8BFC34024E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BFC34024E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BFC34024E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 12:54:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b63c.dip0.t-ipconnect.de [84.161.182.60])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AF9B8A4C748D;
 Sat, 22 Nov 2025 13:54:42 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43340)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vMn8U-000000008Sg-0olm;
 Sat, 22 Nov 2025 12:54:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Will Newton <will.newton@gmail.com>
Date: Sat, 22 Nov 2025 13:54:42 +0100
Message-ID: <20251122125442.2235928-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763816082;
 bh=Wy1ZjiVX9R4jXAC5wz1iXdnJOJbDr4MuwIxDI6I5LlY=;
 h=From:To:Cc:Subject:Date:From;
 b=kCiyjrWKAnO54hJizJ5EVzjRHQBKQewEp4TrjfOVkJnt1XJfno+HKwmrWh9FaPEtq
 83V4WHc9m7vwhBpl7QGAHYOz/HXcL8/hPgUSf+lVjzLp4kpVcHavydkJSn04vs8BRf
 GglhGPFf6YwHgTRcMVyRwuHHkfVuho9rb6wREX4Iz1DbVSJojwtM1jt1HdIuqiDwM7
 HgAUsKu5n9DpXn5accMHEtQDwtQQlZ2A/p5souKzaO0KzUdDOMbzVvEbaPIKcSXm5K
 MGZN6oGsORHr/DqGeKesIRHjzWZBrnxnMoKIDiD50jauJT22xcDjXQVjhPzLHAwCyI
 fno+iryN1/W5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=kCiyjrWK
Subject: [Buildroot] [PATCH 1/1] package/time: fix build with newer gcc
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
https://autobuild.buildroot.net/results/2d4/2d440a31fc49366d77289f1d21080e1861c6ee21/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ime-fix-sighandler-prototype-for-C23.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/time/0001-time-fix-sighandler-prototype-for-C23.patch

diff --git a/package/time/0001-time-fix-sighandler-prototype-for-C23.patch b/package/time/0001-time-fix-sighandler-prototype-for-C23.patch
new file mode 100644
index 0000000000..8d4e1d7033
--- /dev/null
+++ b/package/time/0001-time-fix-sighandler-prototype-for-C23.patch
@@ -0,0 +1,35 @@
+From 218cd7ce34b6dbc86c80f1c781639ea7661d1252 Mon Sep 17 00:00:00 2001
+From: Marcin Serwin <marcin@serwin.dev>
+Date: Thu, 2 Oct 2025 19:30:12 +0200
+Subject: [PATCH] time: fix sighandler prototype for C23
+
+In C23 functions with empty argument list in the prototype are treated
+as taking no arguments. This means that the `int` argument of the
+sighandler must be specified explicitly or the code will fail to
+compile due to mismatched function type.
+
+Signed-off-by: Marcin Serwin <marcin@serwin.dev>
+
+Upstream: https://lists.gnu.org/archive/html/bug-time/2025-10/msg00000.html
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/time.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/time.c b/src/time.c
+index 7b401bc..88287dd 100644
+--- a/src/time.c
++++ b/src/time.c
+@@ -77,7 +77,7 @@ enum
+ 
+ 
+ /* A Pointer to a signal handler.  */
+-typedef RETSIGTYPE (*sighandler) ();
++typedef RETSIGTYPE (*sighandler) (int);
+ 
+ /* msec = milliseconds = 1/1,000 (1*10e-3) second.
+    usec = microseconds = 1/1,000,000 (1*10e-6) second.  */
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

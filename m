Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C176D116F1
	for <buildroot@archiver.kernel.org>; Mon,  1 Dec 2025 19:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48DD261113;
	Mon,  1 Dec 2025 19:28:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cdk1L5na1TQv; Mon,  1 Dec 2025 19:28:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A9E7610F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A9E7610F4;
	Mon,  1 Dec 2025 19:28:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AC701D3
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 19:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92A0540D7C
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 19:28:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGw3epWaT34m for <buildroot@buildroot.org>;
 Mon,  1 Dec 2025 19:28:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8EE9440D75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EE9440D75
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8EE9440D75
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 19:28:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 76F4DA4C0937
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 20:28:49 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57674)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQ9Zo-000000006Dd-38bE
 for buildroot@buildroot.org; Mon, 01 Dec 2025 19:28:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  1 Dec 2025 20:28:49 +0100
Message-ID: <20251201192849.3195425-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764617329;
 bh=TYXyjQQwewOMw8cW1gmXZ688duVQsCFkAtT1e6mqrt4=;
 h=From:To:Subject:Date:From;
 b=ZfwkfE58AQsmjrUMzvewQhQLMNtItWNbshmXgMzQIWn73oZzgxDuPc7mkA0Qh0Owm
 Jhcr4fW+4yIJIHv8lRPC7QYJRsuK/2+Tr1DaSvocxbFxOp5nUWrONucibpITWSdMg0
 Mahr5E58n2J6ldVfiOzx2uXXRhT6/TecH0CI3xKjrH9zRBUlllh4D/w50tv+ZybMnU
 ZMCdJruUFm61AnO00KBDN3KxIJw6fQtg6lL/3cS3nm1DUPmyWj3MS5Q4hhJB7+8cw4
 5VvrYgxjjEv4iVmthXP6H27+PLDlEbpaFlE+gGwvtE8c9qC1K0m5hy/zSVGbk+wuwH
 1cUpaVXEFedhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=ZfwkfE58
Subject: [Buildroot] [PATCH 1/1] package/parprouted: fix build with gcc 15.x
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
https://autobuild.buildroot.net/results/572/572669fe1f9a77083a361fee7c8acdf38d7375ae/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/parprouted/0001-gcc-15.patch | 38 ++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/parprouted/0001-gcc-15.patch

diff --git a/package/parprouted/0001-gcc-15.patch b/package/parprouted/0001-gcc-15.patch
new file mode 100644
index 0000000000..2090506491
--- /dev/null
+++ b/package/parprouted/0001-gcc-15.patch
@@ -0,0 +1,38 @@
+Description: Fix FTBFS with GCC 15
+Author: Adrian Bunk <bunk@debian.org>
+Bug-Debian: https://bugs.debian.org/1097548
+
+Downloaded from
+https://sources.debian.org/src/parprouted/0.70-6/debian/patches/gcc-15.patch
+
+Upstream: dead (last update 2008)
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- parprouted-0.70.orig/parprouted.c
++++ parprouted-0.70/parprouted.c
+@@ -330,7 +330,7 @@ void parseproc()
+     }
+ }
+ 
+-void cleanup() 
++void cleanup(void *arg)
+ {
+     /* FIXME: I think this is a wrong way to do it ... */
+     
+@@ -346,13 +346,13 @@ void cleanup()
+     exit(1);
+ }
+ 
+-void sighandler()
++void sighandler(int sig)
+ {
+     /* FIXME: I think this is a wrong way to do it ... */
+     perform_shutdown=1;
+ }
+ 
+-void *main_thread()
++void *main_thread(void *arg)
+ {
+     time_t last_refresh;
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

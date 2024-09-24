Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C59CF9C6B
	for <buildroot@archiver.kernel.org>; Tue, 24 Sep 2024 05:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BA2A4031C;
	Tue, 24 Sep 2024 05:24:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKapTdYUA651; Tue, 24 Sep 2024 05:24:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB95B4011B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB95B4011B;
	Tue, 24 Sep 2024 05:24:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB5721BF378
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 05:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6EDB4031C
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 05:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emRCqRAQsrZa for <buildroot@lists.busybox.net>;
 Tue, 24 Sep 2024 05:24:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B1CE84011B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1CE84011B
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1CE84011B
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 05:24:19 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id EBE74440F96;
 Tue, 24 Sep 2024 08:21:47 +0300 (IDT)
To: buildroot@buildroot.org
Date: Tue, 24 Sep 2024 08:24:11 +0300
Message-ID: <ac44157e8218a87e38494d4dfc5cf0fb8ebde35b.1727155451.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1727155308;
 bh=v6XueHQHDGcEC4EQzrjOZ2/HWuRsiI2bwq2vpMXYZkQ=;
 h=From:To:Cc:Subject:Date:From;
 b=K6lVqu3dmCRRIM+mDRYQ2u0iDq5AEakJJbX9mh1KE/jrOrBCzCmL5UAqh9Fd0lEms
 SFD4PVFyRfl8QIqYismBLpGWnfFwxXboI6exT5kKDA07eo7dm+b+UAXgePiEk+6OGN
 E/boitLSWKLOl0TUQwNtsolnWKJBKu0NRSSw4OIXzDwJIDsS7QV1rdP2L/Ot8DtEvc
 E5JE4UFVNbgmxoFAryjyzyRWqQth6TEzNEr7mTRD9ygoor29f5qIyUt0e3y70m8Fp8
 6W2AhqPUtXSp7VIU8R0+C36kE1MvPVFqt/IOVI5WlIMF+qPL06o3aYFtpZJdLmT16i
 fE+N2PUii6qzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=K6lVqu3d
Subject: [Buildroot] [PATCH] package/libcurl: fix build failure with verbose
 disabled
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add patch to fix build failure introduced in bump to version 8.10.0.

Fixes:
https://autobuild.buildroot.org/results/2d553687a32651f81813c82d7bbf9bb11fd3eca5/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...build-with-verbose-messages-disabled.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/libcurl/0001-curl_trc-fix-build-with-verbose-messages-disabled.patch

diff --git a/package/libcurl/0001-curl_trc-fix-build-with-verbose-messages-disabled.patch b/package/libcurl/0001-curl_trc-fix-build-with-verbose-messages-disabled.patch
new file mode 100644
index 000000000000..ffa44b87b646
--- /dev/null
+++ b/package/libcurl/0001-curl_trc-fix-build-with-verbose-messages-disabled.patch
@@ -0,0 +1,44 @@
+From 58d490091d097ba2ad108cc66c97e242e5aacb9c Mon Sep 17 00:00:00 2001
+Message-ID: <58d490091d097ba2ad108cc66c97e242e5aacb9c.1727153835.git.baruch@tkos.co.il>
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 24 Sep 2024 07:52:13 +0300
+Subject: [PATCH] curl_trc: fix build with verbose messages disabled
+
+Add empty definition of Curl_trc_ws() to fix this following build error:
+
+In file included from sendf.h:29,
+                 from ws.c:35:
+ws.c: In function 'Curl_ws_accept':
+curl_trc.h:100:10: error: implicit declaration of function 'Curl_trc_ws'; did you mean 'Curl_trc_ftp'? [-Wimplicit-function-declaration]
+  100 |          Curl_trc_ws(data, __VA_ARGS__); } while(0)
+      |          ^~~~~~~~~~~
+ws.c:779:5: note: in expansion of macro 'CURL_TRC_WS'
+  779 |     CURL_TRC_WS(data, "WS, using chunk size %zu", chunk_size);
+      |     ^~~~~~~~~~~
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+Upstream: https://github.com/curl/curl/pull/15026
+---
+ lib/curl_trc.h | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/lib/curl_trc.h b/lib/curl_trc.h
+index 5f675b453fd3..1801d33cea7c 100644
+--- a/lib/curl_trc.h
++++ b/lib/curl_trc.h
+@@ -226,6 +226,12 @@ static void Curl_trc_smtp(struct Curl_easy *data, const char *fmt, ...)
+   (void)data; (void)fmt;
+ }
+ #endif
++#if defined(USE_WEBSOCKETS) && !defined(CURL_DISABLE_HTTP)
++static void Curl_trc_ws(struct Curl_easy *data, const char *fmt, ...)
++{
++  (void)data; (void)fmt;
++}
++#endif
+ 
+ #endif /* !defined(CURL_DISABLE_VERBOSE_STRINGS) */
+ 
+-- 
+2.45.2
+
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

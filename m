Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F071D3C92D
	for <buildroot@archiver.kernel.org>; Sun, 20 Oct 2024 12:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B070940322;
	Sun, 20 Oct 2024 12:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dnVWxaiTaVsz; Sun, 20 Oct 2024 12:13:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45D5F40335
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45D5F40335;
	Sun, 20 Oct 2024 12:13:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B7B81183
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 12:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C5354013F
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 12:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0yOa9YLR4IeH for <buildroot@buildroot.org>;
 Sun, 20 Oct 2024 12:13:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DCEB40096
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DCEB40096
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 12:13:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 083DA85FC3; Sun, 20 Oct 2024 12:13:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Oct 2024 14:12:39 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: ee31fb1242fe22fb71013cfd5371557ddc25e84b
X-Git-Newrev: bff622d02e1e41ad19b8a630cf9499e1794bf493
X-Patchwork-Hint: ignore
Message-Id: <20241020121301.083DA85FC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libcurl: fix
 build failure with verbose disabled
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

commit: https://git.buildroot.net/buildroot/commit/?id=bff622d02e1e41ad19b8a630cf9499e1794bf493
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Add patch to fix build failure introduced in bump to version 8.10.0.

Fixes:
https://autobuild.buildroot.org/results/2d553687a32651f81813c82d7bbf9bb11fd3eca5/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 16ce77ad7d3a05addc1962b455242199a93f3811)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-fix-build-with-verbose-messages-disabled.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/libcurl/0001-curl_trc-fix-build-with-verbose-messages-disabled.patch b/package/libcurl/0001-curl_trc-fix-build-with-verbose-messages-disabled.patch
new file mode 100644
index 0000000000..ffa44b87b6
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

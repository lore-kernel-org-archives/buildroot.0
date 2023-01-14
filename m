Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E89C3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 20:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBC494059C;
	Sat, 14 Jan 2023 20:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBC494059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dIcpAXwu7OIp; Sat, 14 Jan 2023 20:07:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 111FE4048A;
	Sat, 14 Jan 2023 20:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 111FE4048A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5077D1BF863
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BFFE80C60
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BFFE80C60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LKasx_U944Dn for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 20:07:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A03880A8D
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 20:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A03880A8D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2764F87B1B; Sat, 14 Jan 2023 20:07:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 21:07:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60cf07079b78d4c4bb495fd18cb2a145a4cb3635
X-Git-Newrev: 664897295a3667db2ff95c5c1b458b16c1192a47
X-Patchwork-Hint: ignore
Message-Id: <20230114200728.2764F87B1B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/janus-gateway: fix libcurl build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=664897295a3667db2ff95c5c1b458b16c1192a47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following libcurl build failure raised since bump to version
1.1.1 in commit 01518e5660366be41e6a8e0a0f2b487d7cdf48a2:

In file included from /home/autobuild/autobuild/instance-11/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/curl/curl.h:3195,
                 from turnrest.c:21:
turnrest.c: In function 'janus_turnrest_request':
turnrest.c:168:2: error: void value not ignored as it ought to be
  168 |  curl_easy_setopt(curl, api_http_get ? CURLOPT_HTTPGET : CURLOPT_POST, 1);
      |  ^

Fixes:
 - http://autobuild.buildroot.org/results/11bb0079f5a7d06d3494a61b411f0af2e8c4d342

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...003-Use-parentheses-to-ensure-compilation.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/janus-gateway/0003-Use-parentheses-to-ensure-compilation.patch b/package/janus-gateway/0003-Use-parentheses-to-ensure-compilation.patch
new file mode 100644
index 0000000000..f91c13d1f6
--- /dev/null
+++ b/package/janus-gateway/0003-Use-parentheses-to-ensure-compilation.patch
@@ -0,0 +1,27 @@
+From 51431c36cd5f2997c0f7723909195b9883ae0486 Mon Sep 17 00:00:00 2001
+From: Benson Muite <bkmgit@users.noreply.github.com>
+Date: Wed, 4 Jan 2023 13:33:36 +0300
+Subject: [PATCH] Use parentheses to ensure compilation (#3138)
+
+Compiler fails with latest Curl release. Use parenthesis to ensure compiler evaluates expression correctly.
+
+[Retrieved from:
+https://github.com/meetecho/janus-gateway/commit/51431c36cd5f2997c0f7723909195b9883ae0486]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/turnrest.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/turnrest.c b/src/turnrest.c
+index b8560d22f2..42e6114de8 100644
+--- a/src/turnrest.c
++++ b/src/turnrest.c
+@@ -165,7 +165,7 @@ janus_turnrest_response *janus_turnrest_request(const char *user) {
+ 	JANUS_LOG(LOG_VERB, "Sending request: %s\n", request_uri);
+ 	janus_mutex_unlock(&api_mutex);
+ 	curl_easy_setopt(curl, CURLOPT_URL, request_uri);
+-	curl_easy_setopt(curl, api_http_get ? CURLOPT_HTTPGET : CURLOPT_POST, 1);
++	curl_easy_setopt(curl, (api_http_get ? CURLOPT_HTTPGET : CURLOPT_POST), 1);
+ 	if(!api_http_get) {
+ 		/* FIXME Some servers don't like a POST with no data */
+ 		curl_easy_setopt(curl, CURLOPT_POSTFIELDS, query_string);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A49C46CD3
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 10:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 878B360D58;
	Sat, 23 Dec 2023 10:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 878B360D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IjGNijPjZkYD; Sat, 23 Dec 2023 10:29:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5DF860E72;
	Sat, 23 Dec 2023 10:29:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5DF860E72
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E4E41BF408
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 10:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F02E83A62
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 10:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F02E83A62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qGhXoBxYjUYx for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 10:29:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EDD483A08
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 10:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EDD483A08
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 541DE87BE8; Sat, 23 Dec 2023 10:29:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 11:28:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: adaae82c5872aa611b18a4c81bf60be268696442
X-Git-Newrev: 088ac834b7deac1f96d0c769aca015bd8dc99075
X-Patchwork-Hint: ignore
Message-Id: <20231223102907.541DE87BE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: fix build with GnuTLS and
 no verbose
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=088ac834b7deac1f96d0c769aca015bd8dc99075
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A change of data logging introduced in version 8.5.0 broke the build.
Add a patch to fix that.

Fixes:
http://autobuild.buildroot.net/results/c5b996696333c4ff1392dbb8e6b0edc9c5322ee4/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...001-gnutls-fix-build-with-disable-verbose.patch | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/package/libcurl/0001-gnutls-fix-build-with-disable-verbose.patch b/package/libcurl/0001-gnutls-fix-build-with-disable-verbose.patch
new file mode 100644
index 0000000000..25e389c972
--- /dev/null
+++ b/package/libcurl/0001-gnutls-fix-build-with-disable-verbose.patch
@@ -0,0 +1,60 @@
+From 0d9f9c5ea8c15c70eb420242b60179d9083c70b7 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Mon, 11 Dec 2023 20:45:01 +0200
+Subject: [PATCH] gnutls: fix build with --disable-verbose
+
+infof() parameters must be defined event with --disable-verbose since
+commit dac293cfb702 ("lib: apache style infof and trace
+macros/functions").
+
+Move also 'ptr' definition under !CURL_DISABLE_VERBOSE_STRINGS.
+
+Fixes the following build failure:
+
+In file included from ../lib/sendf.h:29,
+                 from vtls/gtls.c:44:
+vtls/gtls.c: In function 'Curl_gtls_verifyserver':
+vtls/gtls.c:841:34: error: 'version' undeclared (first use in this function); did you mean 'session'?
+  841 |         gnutls_protocol_get_name(version), ptr);
+      |                                  ^~~~~~~
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+Upstream: https://github.com/curl/curl/commit/af520ac9fec7d88e942f05fdcd90704adb9fa566
+---
+ lib/vtls/gtls.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
+index f42b6d6691de..b95c5be3c5e5 100644
+--- a/lib/vtls/gtls.c
++++ b/lib/vtls/gtls.c
+@@ -818,16 +818,17 @@ Curl_gtls_verifyserver(struct Curl_easy *data,
+   char certname[65] = ""; /* limited to 64 chars by ASN.1 */
+   size_t size;
+   time_t certclock;
+-  const char *ptr;
+   int rc;
+   CURLcode result = CURLE_OK;
+ #ifndef CURL_DISABLE_VERBOSE_STRINGS
++  const char *ptr;
+   unsigned int algo;
+   unsigned int bits;
+   gnutls_protocol_t version = gnutls_protocol_get_version(session);
+ #endif
+   long * const certverifyresult = &ssl_config->certverifyresult;
+ 
++#ifndef CURL_DISABLE_VERBOSE_STRINGS
+   /* the name of the cipher suite used, e.g. ECDHE_RSA_AES_256_GCM_SHA384. */
+   ptr = gnutls_cipher_suite_get_name(gnutls_kx_get(session),
+                                      gnutls_cipher_get(session),
+@@ -835,6 +836,7 @@ Curl_gtls_verifyserver(struct Curl_easy *data,
+ 
+   infof(data, "SSL connection using %s / %s",
+         gnutls_protocol_get_name(version), ptr);
++#endif
+ 
+   /* This function will return the peer's raw certificate (chain) as sent by
+      the peer. These certificates are in raw format (DER encoded for
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

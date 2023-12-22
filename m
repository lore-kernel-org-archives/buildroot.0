Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A22C41535
	for <buildroot@archiver.kernel.org>; Fri, 22 Dec 2023 05:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1661E83CF7;
	Fri, 22 Dec 2023 05:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1661E83CF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X6ypzZTatNHX; Fri, 22 Dec 2023 05:47:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 604F383CF8;
	Fri, 22 Dec 2023 05:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 604F383CF8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A149A1BF2BA
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 05:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7399F83CF8
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 05:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7399F83CF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HzjW5agA2LHA for <buildroot@lists.busybox.net>;
 Fri, 22 Dec 2023 05:47:52 +0000 (UTC)
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64D5183CF7
 for <buildroot@busybox.net>; Fri, 22 Dec 2023 05:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64D5183CF7
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id A83EC440CD1;
 Fri, 22 Dec 2023 07:45:57 +0200 (IST)
To: buildroot@busybox.net
Date: Fri, 22 Dec 2023 07:46:00 +0200
Message-ID: <bbe9d77a3248044af15eb27f127466e0e672723d.1703223960.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1703223957;
 bh=2uiWVZ39138ySie0OQR2d5B+JGHE0Hkgc6AuSR97cto=;
 h=From:To:Cc:Subject:Date:From;
 b=iGm8lzcUhLT1Xy+VuQ1CbotVv0UhLH1d6BMOjXctBXpIeDt3jAgLli8/VJcGExo73
 FlO5mFNMEg+7mAeNJarrGw9PTD8xKhjPx7KBtObnnxney+5Kzuvej2Kb+u4/OGLS9g
 kzviJRPnINK2MC6oaLu1PBUG6WzWrruSfa65T/5K1/XQbD4WOiip6cIZDizNeuRMF2
 mmX7kXQ+xR+3X/JCX3gcofpSLv9RjCowL5nxsIVbwkd/522jLtL86p88jPHLDQD9x8
 uMeVuGkitziRbZCAP+H8blCJltSbIZRfBETggQUBZJHJtWToHsvxmo/9dd+jbhg/Kk
 adoE7+SlkklqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=iGm8lzcU
Subject: [Buildroot] [PATCH v2] package/libcurl: fix build with GnuTLS and
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A change of data logging introduced in version 8.5.0 broke the build.
Add a patch to fix that.

Fixes:
http://autobuild.buildroot.net/results/c5b996696333c4ff1392dbb8e6b0edc9c5322ee4/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: Take upstream patch
---
 ...nutls-fix-build-with-disable-verbose.patch | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 package/libcurl/0001-gnutls-fix-build-with-disable-verbose.patch

diff --git a/package/libcurl/0001-gnutls-fix-build-with-disable-verbose.patch b/package/libcurl/0001-gnutls-fix-build-with-disable-verbose.patch
new file mode 100644
index 000000000000..25e389c9724e
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB21CA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 11:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59BE4405E0;
	Mon, 28 Sep 2026 11:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7CbwnCWb_gTt; Mon, 28 Sep 2026 11:24:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6CB94405F3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790594659;
	b=auKGJiuMHtJyYUZaPIlX37tPr+ju2IGjuQ7BSNIxQQq63jyxainJWHtFxgWICghPWf5n
	 3k5W/o6PGw894Bnb45264ugnDJBblxg0DdhcjWpC1RNZh6jzHUZrpYeeDYEz57zqp/xHw
	 r5xcvSf9RT+++EGpKW58Ewiivp3jtYYi/pM7SeYLBR8fWJYfejdUwPPPXlom+wi/3dJji
	 oNSSHjzokhBF8k93Ux+LbHxLjZFybwKYHOEzcyhxkvW0fGIR5+d9eKujGQ5u1fZ1pg3Fr
	 61xVsvN8vpX/n5lXDzsRjBRVlkr/9l8gyyDH6+qBJaOBRT8jAvcXXTwJqOTC6wczPhg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790594659;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=S8we0Pt087i2b0+f8Ih1543b220yHgc5MsmPzBik/oA=;
	b=U+XjEShkpKqj9A7z70py2D1e7Mls9fAx6JifLJ5yc+9W/uWU1KRuGVLGU0wIRlTFBke1
	 ctvgaLCaCwhUoQTE1zHSZGDimwmP1xpW5S0wZfSqCmbxkI7SbfSl+g74FwVwIlTgzf30D
	 EzWZUO9utFXgdBc2tV2wPngkSdpAIcQal9pXxKuK71bFdQmJZYF6gl9Hdb4pAbeIs7lF6
	 c10cvySVhkPY5OTM+hNuMIjg5W+0NDXbW43ZZUpNMTFIYlseXDnUl52se8a7KemViXOJD
	 r9J/GFp8hrm6pNkcIuEKgPE41w6bCnqsU7gp769sSkruOf9jNWEcaXPkiduhhzyq8ow==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790594659;
	bh=S8we0Pt087i2b0+f8Ih1543b220yHgc5MsmPzBik/oA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eZKL71hjyfzhg0CqxNrtuO3OkY7LGAaLczZh2mrDQESWgHLZry2NNPoQAdq5AhGmr
	 yB7c1t9lwZ2ZJyKxJRgF7U7y4WKYsHH8k4DCrzXJzKroC5oRu++T+Y+AdNGneYBCHe
	 jWCFqyHPkkp1gmQOLjgtGi2RQ7O+dc31Tylns/MTyq6Qb3XcR6hp0P1pSxJlJGJ584
	 WybUUoO5RrNM/WaBcWtsBJnUtzhdjP9Hv4gsaHpEOpiePI+wGHf2OPBXzWdvJ3KjAJ
	 ePo5zTW6G4QU4/11FpVZ4xWbUrskrVCee1oVVXH4rTqk8cK1NmlRsswJIOMc4MLXDY
	 tUwGdPNsss2vA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CB94405F3;
	Mon, 28 Sep 2026 11:24:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BE3F32F
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F21C2405F3
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fk9rRTdE3rXi for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 11:24:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5AAE2405E0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790594656;
 b=XtC5BKuPCRL703pR1nzlWUoJZTUg57q2FsltUouKAAd0poG0dXdSi6XBMRWUtnTCHejA
 lXavQLZzdMQ6WW3AAaoSfTee1D5L6PLXUdBrbUGZqIpDGRSWJts7xf0fayi5A3MiXrl+8
 jZrfKGL4n/hEF7Hp898qkE8i3pO7sQNEvNo8ndmvK16uzPdubpofMEHmfN+R3oQVaD0l2
 owlsE7cXWjfjko50V/8TDj2uGeZYWKALI9p20qgZRaND9CBqjlHPnmbitO3BQPBGoYFIa
 79A0YFwG2DakV0dW8bSU0xeC8pi6tq7av3fB0aW9fD6oxcWySXBx7TtcpsM+GcvWl0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790594656;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=y+mJagk+0yrXStNSI6OhsWULC189501stY8EQpjzpFk=;
 b=ldMlFBTR6KKDS8aA7BYuKd44K9RtAuxcFiQepwGs/LV/XHylxBSscSzRsjq/Pq1lQb2a
 1uOPOctH7F5l0PhZobhnkJT6os8smMip80j9e1SzKaohXG52yDsnVxKYqbe1UtbX11la2
 TkOJ6gk4DSCa9XmggfX1OrvSTgYGZKZWDIgyJthV/k5Z1YlMSiSUnG2yW0zlmlKMFTDGA
 s1dz0Gj48YLqjDUAV3fJ1ipd8I2UteCsA68WEZG7x/WodMFZzoc7/+59H/E2U2jpK8bpC
 /B6BFVlpDcBtHK+dam45AtAn87XcMRKr1JVra+X/1QS4OVGGmOFNNmab+AXOvkeBTUg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AAE2405E0
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:24:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21E8795C83; Mon, 28 Sep 2026 11:23:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 13:24:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 441ccd8dab358a725bbf3b70e8e698314f71edb4
X-Git-Newrev: 0b1caae22baf5c89e5650c1264002af71f88c3ea
X-Patchwork-Hint: ignore
Message-Id: <20260928112304.21E8795C83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mtd: fix build with OpenSSL 4.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0b1caae22baf5c89e5650c1264002af71f88c3ea
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-Don-t-compile-engine-support-if-not-avai.patch | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/package/mtd/0001-ubifs-utils-Don-t-compile-engine-support-if-not-avai.patch b/package/mtd/0001-ubifs-utils-Don-t-compile-engine-support-if-not-avai.patch
new file mode 100644
index 0000000000..21fc2ca2fd
--- /dev/null
+++ b/package/mtd/0001-ubifs-utils-Don-t-compile-engine-support-if-not-avai.patch
@@ -0,0 +1,62 @@
+From 50136f0ec6d8c9763889d49b31ca6965189afba5 Mon Sep 17 00:00:00 2001
+From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+Date: Sat, 29 Aug 2026 19:25:02 +0200
+Subject: [PATCH] ubifs-utils: Don't compile engine support if not available
+
+OpenSSL 4.0 dropped engine support which was deprecated since 3.0. The
+replacement is the "providers" API.
+
+Add an ifndef OPENSSL_NO_ENGINE around the engine code so it can be left
+out where it is not supported.
+
+Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+
+Upstream: https://lists.infradead.org/pipermail/linux-mtd/2026-August/114868.html
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ubifs-utils/common/sign.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/ubifs-utils/common/sign.c b/ubifs-utils/common/sign.c
+index 032a6ac..5f94c0a 100644
+--- a/ubifs-utils/common/sign.c
++++ b/ubifs-utils/common/sign.c
+@@ -23,11 +23,14 @@
+ #include <openssl/bio.h>
+ #include <openssl/pem.h>
+ #include <openssl/err.h>
+-#include <openssl/engine.h>
+ #include <openssl/cms.h>
+ #include <openssl/conf.h>
+ #include <err.h>
+ 
++#ifndef OPENSSL_NO_ENGINE
++#include <openssl/engine.h>
++#endif
++
+ #include "linux_types.h"
+ #include "sign.h"
+ #include "ubifs.h"
+@@ -139,6 +142,7 @@ static EVP_PKEY *read_private_key(const char *private_key_name, X509 **cert)
+ 	*cert = NULL;
+ 
+ 	if (!strncmp(private_key_name, "pkcs11:", 7)) {
++#ifndef OPENSSL_NO_ENGINE
+ 		ENGINE *e;
+ 		struct {
+ 			const char *url;
+@@ -177,6 +181,10 @@ static EVP_PKEY *read_private_key(const char *private_key_name, X509 **cert)
+ 		}
+ 		*cert = parms.cert;
+ 		fprintf(stderr, "Using cert %p\n", *cert);
++#else
++		ssl_err_msg("PKCS#11 ENGINE support not available.");
++		return NULL;
++#endif
+ 	} else {
+ 		BIO *b;
+ 
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

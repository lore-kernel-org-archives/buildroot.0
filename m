Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8539DC7EE30
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 12:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EF5160674;
	Wed, 25 Jun 2025 12:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uY6xkcEA1fSq; Wed, 25 Jun 2025 12:52:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7811C60699
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7811C60699;
	Wed, 25 Jun 2025 12:52:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8F39154
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 12:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB498417BE
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 12:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ys1Qxly7AP_6 for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 12:52:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 689F240073
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 689F240073
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 689F240073
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 12:52:27 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 85336203;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 25 Jun 2025 12:52:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uUPby-000RBB-1a;
 Wed, 25 Jun 2025 14:52:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 25 Jun 2025 14:52:19 +0200
Message-Id: <20250625125220.104466-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ka2xK6NNAqrZE/V1MrECvR5OEN5+VMONC/v5MntR8PMMVGsBXw5g/JEX6tCTeWxGDpkop+f/0uUHgFHOTwuRYL/1PX9DQQkzQTa35ZwjTYy6c19KHCSLBYS4DJ4D+KLcGoSuUN6McSNCHSWzuHMaIxOXCMOBD5aWSgVbHx/fdbbsB5Au6AAVc1AEWhmPiAi2LPua5hMLiDXVmdIzNJLZOwTK0B5pPfc43vSV3o7wFpxJcHIC5QPIDmfiPmrPbK07mJ1f/e12qxEM4hXBzWW7bOdZLtsc+p8Zc4w/aC46SrHXoyB33+F/4RWYEinkdzR+BbXqOW4CyAmucydEPKvSrw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=HKL8DAbVvSPjSUzptwTbz6Iu1NwlAdtw3Esj67Ks2gM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=ka2xK6NN
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/libcurl: unbreak threads + c-ares
 conditional
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

Commit 0fce7a9623 ("package/libcurl: fix build w/ threads + c-ares") added a
conditional for threads + c-ares, but ended up with a end-parenthesis too
many - so the condition is never true.  Fix that.

Reported-by: Tibault Damman <tibault.damman@basalte.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 5a3a668f06..e390c9d1bf 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -38,7 +38,7 @@ LIBCURL_IGNORE_CVES += CVE-2024-32928
 
 # threaded resolver cannot be used with c-ares
 # https://github.com/curl/curl/commit/d364f1347f05c53eea5d25a15b4ad8a62ecc85b8
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)x$(BR2_PACKAGE_C_ARES)),yx)
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)x$(BR2_PACKAGE_C_ARES),yx)
 LIBCURL_CONF_OPTS += --enable-threaded-resolver
 else
 LIBCURL_CONF_OPTS += --disable-threaded-resolver
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

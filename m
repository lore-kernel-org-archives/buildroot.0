Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378FFCA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 20:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D81BD4087E;
	Wed, 10 Sep 2025 20:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hSta4dmnLPm0; Wed, 10 Sep 2025 20:06:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA0FB40889
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA0FB40889;
	Wed, 10 Sep 2025 20:06:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D0D62BB3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 138984134D
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qDoBqvZY4cCT for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 20:06:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4B491407CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B491407CE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B491407CE
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:06:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b0bb.dip0.t-ipconnect.de [84.161.176.187])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3B48BA4C2D06;
 Wed, 10 Sep 2025 22:06:09 +0200 (CEST)
Received: from [192.168.1.144] (port=47702 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uwR4y-000000008AP-2d90;
 Wed, 10 Sep 2025 20:06:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 10 Sep 2025 22:06:07 +0200
Message-ID: <20250910200608.2114508-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1757534769;
 bh=JvcZhft/yo1t1H0HvnwrZcsYekTYlpcvXaM5ylf7vAY=;
 h=From:To:Cc:Subject:Date:From;
 b=XDhZDq9AMIajatypwZ+Es4jSOBpdVWUYloCaNNmSjETwwA0wSQ4EhgB6B30fnESA3
 cJEOwVbywWpuCw6scZGSxMcm4pHZ7mR1+RuFsvaVKXow5mdJxCsrD4g2mm/Npybn6f
 d3OeaKb1BkkBfK+Ke2hs2NaMLUXyqthRXmOmjxfFRX30ngevEUFxGFOfPhS9uYtvii
 1BJcRNGbnD+SMhrlqPexLO7XB4YFa8cmMcas9jSO4sqAJBF5Q97ThBSku3y0LjhUnp
 cxKPhnPjJkVuVXoP9QgebDN95/IFkYi3v0vPipWUtOZGCOa1jIsBfBfhs+L9lIupBT
 NTnL4+wCsbXow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=XDhZDq9A
Subject: [Buildroot] [PATCH 1/2] package/libcurl: security bump version to
 8.16.0
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

Changelog: https://curl.se/ch/8.16.0.html

Fixes CVEs:
CVE-2025-9086: https://curl.se/docs/CVE-2025-9086.html
CVE-2025-10148: https://curl.se/docs/CVE-2025-10148.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 2e36917382..4cc4da4f26 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.15.0.tar.xz.asc
+# https://curl.se/download/curl-8.16.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  6cd0a8a5b126ddfda61c94dc2c3fc53481ba7a35461cf7c5ab66aa9d6775b609  curl-8.15.0.tar.xz
+sha256  40c8cddbcb6cc6251c03dea423a472a6cea4037be654ba5cf5dec6eb2d22ff1d  curl-8.16.0.tar.xz
 sha256  e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 1cfdda27d2..0aa88044bd 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.15.0
+LIBCURL_VERSION = 8.16.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

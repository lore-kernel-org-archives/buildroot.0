Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4A5CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 17:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91570423C3;
	Thu, 11 Sep 2025 17:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OHmX3ld8vIOI; Thu, 11 Sep 2025 17:14:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACEDE423F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACEDE423F4;
	Thu, 11 Sep 2025 17:14:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FF04443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 17:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EABD841E87
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 17:14:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LqqmUqDw56V6 for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 17:14:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A4C0B41E54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4C0B41E54
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4C0B41E54
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 17:14:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b21f.dip0.t-ipconnect.de [84.161.178.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A6556A4C3B3E;
 Thu, 11 Sep 2025 19:13:34 +0200 (CEST)
Received: from [192.168.1.144] (port=53530 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uwkrW-000000006p8-2jrc;
 Thu, 11 Sep 2025 17:13:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 19:13:33 +0200
Message-ID: <20250911171334.593571-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250911171334.593571-1-bernd@kuhls.net>
References: <20250911171334.593571-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1757610814;
 bh=aZxCS1Yq4rh2mxi+RhK1CCzbEomGjBTn//iTx6+LO9E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=U8TULepDhCpRa0xA2IvayGQyjqf3AwM+DiStLV54eqUfTMJHKZzTTY5mePc9JRftF
 AlRwD7LTvWf4PgLj9Bz2U5HxsyLfnBVRJzQE3ewUxTlHzRi28v4en6LFcXVUZXiHEH
 YFYPAXQY563F/IUwRsRFIhuLt9ZJrVEAoG3A/gDy5vlJnd7SFRmafYoxA2z5nbxQ+K
 iji+xBG6hjWMWgYY1Bo4/uByaw5K5OBdch+lJedJuSICHhlMeFqO3dF97weWmlOoZ7
 iCHce5x9qRhlAraRMtRtFmLFiBAtt3ncfod4KEvNq/xdcGoKZYHqTE86j1syKO2ZNJ
 5n+N9y7VTd7nA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=U8TULepD
Subject: [Buildroot] [PATCH 3/3] package/libcurl: security bump version to
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://curl.se/ch/8.16.0.html

Fixed CVEs:
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

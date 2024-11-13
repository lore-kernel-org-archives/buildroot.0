Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58344D637B7
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 20:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E925E8409B;
	Wed, 13 Nov 2024 20:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HMGX_fWxq7at; Wed, 13 Nov 2024 20:38:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40551840BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40551840BA;
	Wed, 13 Nov 2024 20:38:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C48723F1
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 20:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 862D54058B
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 20:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hcBKlX9LylyY for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 20:38:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A10E54017A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A10E54017A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A10E54017A
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 20:38:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a50.dip0.t-ipconnect.de [91.58.10.80])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 08C31A4C3434;
 Wed, 13 Nov 2024 21:37:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58848)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tBK7h-000000005Kv-0Q9t;
 Wed, 13 Nov 2024 20:37:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 13 Nov 2024 21:37:57 +0100
Message-Id: <20241113203757.1334905-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1731530278;
 bh=XotflWcx2gjC3L8vsPqhwJT6blkj8dSIetl+LK7jdcw=;
 h=From:To:Cc:Subject:Date:From;
 b=P9tXhS5oGpTJJ2sJhmRwtXfMrDdZfJYZuSEp5q1MADGMw5DnbulQpYmKJlhDzndkM
 ZCvo4JyxJy/SSZengyhraxAHlAbdXtUs47/1vbX72t+4Y+bVkZLS6m6epdeHdinpTD
 1ubjP7Y3PE0Puwa1e59QLzVMFsXFFwjSELigt4NrlCHsOLgH0tCD+NaxPQzp9C6W91
 u2ZtnC/gubgMk5Ga02H2R4OgUmf63U0bn3QCFrXogGocUZH6sDRvivurubVVreB0EA
 2koRcgir30PoDQUIZuMr/eL2A0bMHDAnVtSenMbcnRHoGQfKlDF/zLwGK1KpmEPpsm
 3MM0vOdozo8Kg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=P9tXhS5o
Subject: [Buildroot] [PATCH 1/1] package/libcurl: security bump version to
 8.11.0
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

Changelog: https://curl.se/ch/8.11.0.html

Fixes CVE-2024-9681: https://curl.se/docs/CVE-2024-9681.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 4817ec11d6..93a0f85dee 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.10.1.tar.xz.asc
+# https://curl.se/download/curl-8.11.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  73a4b0e99596a09fa5924a4fb7e4b995a85fda0d18a2c02ab9cf134bebce04ee  curl-8.10.1.tar.xz
+sha256  db59cf0d671ca6e7f5c2c5ec177084a33a79e04c97e71cf183a5cdea235054eb  curl-8.11.0.tar.xz
 sha256  adb1fc06547fd136244179809f7b7c2d2ae6c4534f160aa513af9b6a12866a32  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 71fb6152c7..1022abac85 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.10.1
+LIBCURL_VERSION = 8.11.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

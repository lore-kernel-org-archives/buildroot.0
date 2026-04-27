Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E904BFF8850
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 06:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89C1942E9C;
	Mon, 27 Apr 2026 06:13:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OHecui7ncdQG; Mon, 27 Apr 2026 06:13:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B73B42E29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777270420;
	bh=3T/8j3dy6L+1AUfCCUlwbhThfcXaevyu6DFRCQQH4a8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kgHxa96TN4LiRxa64JnHi0QAWhB1UJBl/dOYlu4i2WZohuFW7/cs6C+V8IfKdFVDG
	 0gU2obKl4VH+5u4D91HfP/g8hdO/ndXwRLlkxTT5sNmpvFrmrjZUf6BQMNdy6Usi45
	 EZfg+h7GTwZkNZ/Yx5bZzsMVgKICAmmut3kkEZlNZSQuDljGlJRjbQndjKRa9U2Um6
	 FfRv1qIcc7xvPD5Xu/Y4YjL/AXrCh6Rd9d34nTqaa0Um8Av5NnmTdzQ63vvnvx67lB
	 FB4TRw/PnKPtSlOH4fYBk8EXaQRU8Aup8CX7xWE8Zty8w1QkGZ+fQ7S7e5+Lxx7p6F
	 B0QjUjs2FBvjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B73B42E29;
	Mon, 27 Apr 2026 06:13:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D0BC231
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 06:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AC328538E
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 06:13:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EE3xD8MTZJCv for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 06:13:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 833038538D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 833038538D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 833038538D
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 06:13:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3C9AEA4C084C
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 08:13:35 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59494)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wHFDq-000000000ZV-2992
 for buildroot@buildroot.org; Mon, 27 Apr 2026 06:13:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 27 Apr 2026 08:13:34 +0200
Message-ID: <20260427061334.338941-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777270415;
 bh=5CE7alaClHfeErVT5fYPrSCfx9akfz7+QhrI5gf75F4=;
 h=From:To:Subject:Date:From;
 b=n9Ue5QUtGkIuwtpMgnEXP0ZXSikQYw42jkLPGTWaEluw67r7Nej8MsVqo8zI4Wso7
 vybf6pAcU/vBxhv3ZyNd9ZiBA03Al/YCvpY2GbP8DMoZe8cUojYzY3sa+WVZaR5HHd
 Tw3XbuN3w7LEAUMphJB7CxrJexm48PyjDK/hI1wlDbLhG+dCbY7BTjhO5yCUchyEel
 KVjXBarXmBwKcW48v9pr0FW//zfrME62FiE1DClyjc/JHEqfHNYjKFicI27RNZkVyK
 s1pJDA3U+dTiCi8qiSdUWo+WtrcZVfkssIoynDZ1/Q1D902Xhj7I7Q4MADWyVIe6GL
 kYfQZXhrA0DLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=n9Ue5QUt
Subject: [Buildroot] [PATCH 1/1] package/mpg123: bump version to 1.33.5
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

https://www.mpg123.org/cgi-bin/news.cgi

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mpg123/mpg123.hash | 6 +++---
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index eed62fa538..8ab8040396 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/mpg123/files/mpg123/1.33.4/
-sha1  30cf7f77bd1704448db89af6a6d75904572c4dcb  mpg123-1.33.4.tar.bz2
+# From https://sourceforge.net/projects/mpg123/files/mpg123/1.33.5/
+sha1  f3538d36c360bc34a83f2fcd69ddb67ee04d332f  mpg123-1.33.5.tar.bz2
 # Locally calculated
-sha256  3ae8c9ff80a97bfc0e22e89fbcd74687eca4fc1db315b12607f27f01cb5a47d9  mpg123-1.33.4.tar.bz2
+sha256  0d7ebc8da0aff3ca383c8c6b5a6adbe402ee5bb256685b8c5499f3a739f9d6dd  mpg123-1.33.5.tar.bz2
 # License file
 sha256  c22482728a634a8dfdb4ff72a96d4c1ed64cd8f3e79335c401751ac591609366  COPYING
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 23e061614d..0b8f0e1a83 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.33.4
+MPG123_VERSION = 1.33.5
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = https://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

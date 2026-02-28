Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E8BFD0040
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 21:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 136C840020;
	Sat, 28 Feb 2026 21:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9OAxLSI8R6x; Sat, 28 Feb 2026 21:56:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2019141B43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772315803;
	bh=TaJDKb5FNAaC+oWGE3Q0GwryyEab6KComadAmg7RMEA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=D0Zh6WmWcaJx0spWifsXbb6pUnHz7hS3DgoEWlp6v1Cdk+X+4/en1HqZxeJ88TSPQ
	 dg734P8QmMd9Zrc2hvp8jSaV3bSy9A6j04wIi6eTy1IrUkiNReL4eMK436yQRobB07
	 xYyvAd+p9rqrOe/dBdc+W2lPyLATUxOCV3rbG1UcXkeVUzWG3OQKA21d6b8eFpnJpM
	 Rd2aSBhTPWKflYTdEz1YTrsbc944kjOLzjh5HtxBe/Chu313nygau7Rzkmckeg9Cyp
	 ktS07g+3hBw3lObr6OV2IJkey1OJU43pn0GbvBcDxJ51oX4O/EFq/hOP7T2AwgjsWr
	 g4fEC5gznbahg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2019141B43;
	Sat, 28 Feb 2026 21:56:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF72818D
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 21:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1203416FF
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 21:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FpY3D7P9Ocoy for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 21:56:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3551740E51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3551740E51
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3551740E51
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 21:56:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B5B1BA4C09B5;
 Sat, 28 Feb 2026 22:56:36 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44692)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vwSIe-000000001Ya-2nkz;
 Sat, 28 Feb 2026 21:56:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 22:56:36 +0100
Message-ID: <20260228215636.3939665-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772315796;
 bh=t8GfPw0ZFCWQmM6pt3qAMCufXZddV7Y+J7k0gJiUOYY=;
 h=From:To:Cc:Subject:Date:From;
 b=gWRf0ksNQp2JHhYw/tduIpsmQcgTGS1yqEgsTppcu22/mU/17Jpps8ixrwa7FYf0d
 EqogTlA54unJWu6yNxhmxS6ucDWft0ZkjCOjMnVo/0RNyh463qa5mC2LXsIM7GG75x
 La4A0hd4zR4OHSX/9Ad7IAU474FuFpgLdyP92JG67j+IsDYuOY+F/F6ZhgH2a6ttLu
 68OyUw0cXIBwOHQ1rXiRM9SbNARKuuJ/Q+8VQgdrRonKuDtS3ciuZ8hGsn89SZXsoj
 /E/2wLvkQeGLsiOa0XUXZhURtNd6Co1nCeZpeFwsLPM6G/7magGM0n2e0uPcwPC27G
 avvMbJwsP+HiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=gWRf0ksN
Subject: [Buildroot] [PATCH 1/1] package/poco: enable parallel build
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

Buildroot commit 126162b9159a185ac1897db1a9956f0379fc1428 disabled
parallel builds in Jan 2017 due to a bug which was fixed upstream in
Nov 2017:
https://github.com/pocoproject/poco/commit/1724e8ba53d05ce688dcdb5176b128f116af2682#diff-76ed074a9305c04054cdebb9e9aad2d818052b07091de1f20cad0bbac34ffb52
https://github.com/pocoproject/poco/commit/076dd9679bf2e77f1df219287f0eb42ea36b7371

Building with -j100 worked.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/poco/poco.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index a471a24adf..fe1dd29855 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -77,9 +77,8 @@ define POCO_CONFIGURE_CMDS
 		--no-samples)
 endef
 
-# Use $(MAKE1) to avoid failures on heavilly parallel machines (e.g. -j25)
 define POCO_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
+	$(TARGET_MAKE_ENV) $(MAKE) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
 		POCO_MYSQL_INCLUDE=$(STAGING_DIR)/usr/include/mysql \
 		POCO_MYSQL_LIB=$(STAGING_DIR)/usr/lib/mysql \
 		POCO_PGSQL_INCLUDE=$(STAGING_DIR)/usr/include/postgresql \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

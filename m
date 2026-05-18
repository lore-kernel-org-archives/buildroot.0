Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB5ACD4F4A
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 17:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2864D6066F;
	Mon, 18 May 2026 17:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UEU9lnFrByYk; Mon, 18 May 2026 17:36:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F7166064D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779125819;
	bh=3pDNfwTd5sQaBJQuqysstu7KrkfnbPoD66o2Zu7W/Y0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=sZNFOlNE90m8jq8GO3qoNCB/3/ERtU5+b9CLZuN9BXrB/RussKymCswGqjCFHsJ+U
	 XFll+urfJwYpAgQCnAccToglKbbiqgouhDOuhuazcWqG2QDXrw0zBHQHm51kO7UFOM
	 HzqFdN4LecKgq20OkU6EAYwbf47tyN90BBCQtIvpcColtHGyiTVBJZZcb8YZkWDlPt
	 s5fXuaA9ceh5pBv3cOZaNU0PDeXNNkbdb8SP/kNUUxbGKMOD4EoAyAlhSEnOPr6sbn
	 hPQuX1ZdABSOCR61Vj0wgKiUka+Hn6yfbZuctrNAKcTgZOyol1bX5zpDWmhf97qTuK
	 FFzfQ9uvkIdhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F7166064D;
	Mon, 18 May 2026 17:36:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E72B282
 for <buildroot@buildroot.org>; Mon, 18 May 2026 17:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FEBB40882
 for <buildroot@buildroot.org>; Mon, 18 May 2026 17:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-FTluLO0B2S for <buildroot@buildroot.org>;
 Mon, 18 May 2026 17:36:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DA1524087E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA1524087E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA1524087E
 for <buildroot@buildroot.org>; Mon, 18 May 2026 17:36:55 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4EAFA5FFA3;
 Mon, 18 May 2026 19:36:49 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 18 May 2026 19:36:43 +0200
Message-ID: <20260518173643.52118-1-ju.o@free.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779125813;
 bh=ti3uCxFfOPVAOFF/hcTE4mAYUp0ew/rN3ktz4S3hxyI=;
 h=From:To:Cc:Subject:Date:From;
 b=mBvOfHmnn9h/YuZC+ZKQx3H+hUQJ7LlJrqv4CJDNLtx7n+T/4DBl1Byt6uyI3QF41
 5RQVAXUPhhQO4qq1IDUCg1s7ihN2O1pQxSV50YzZMw+hSFeuw1WoKVU1tefd8pTvJP
 V8Q2nXBKtjQCoxHq3gPc7neMbsNN6maH0s8BNvXXBwqT28zoUgYTeX/ws4Bhfgnbr5
 6lT6dlJinjjMbTc5InC177ZICdsf8kzJOYU0Md7muPITGDP2zkRLVOpA3v6Rb3HMZQ
 5a3+qqnrwV9RkZ4G/9vXAFcZhN+YdhHTboSI4NxyJ9KJjRcDFOIktGDh6W+NkVMd1i
 2WqilhQVwQrxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mBvOfHmn
Subject: [Buildroot] [PATCH 1/1] package/python-google-api-core: propagate
 python-google-auth dependencies
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_GOOGLE_AUTH
  Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_GOOGLE_API_CORE [=y] && BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS [=y]

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-google-api-core/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-google-api-core/Config.in b/package/python-google-api-core/Config.in
index 5ddc8b3b22..88bc8326b5 100644
--- a/package/python-google-api-core/Config.in
+++ b/package/python-google-api-core/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_GOOGLE_API_CORE
 	bool "python-google-api-core"
 	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # python-proto-plus
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-google-auth -> python-cryptography
 	select BR2_PACKAGE_PYTHON_GOOGLE_AUTH # runtime
 	select BR2_PACKAGE_PYTHON_GOOGLEAPIS_COMMON_PROTOS # runtime
 	select BR2_PACKAGE_PYTHON_PROTO_PLUS # runtime
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

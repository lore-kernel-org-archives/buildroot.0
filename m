Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D95C2A060
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 22:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0B4180E81;
	Sat,  3 Jan 2026 22:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rlWpA0uYkU0u; Sat,  3 Jan 2026 22:43:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8582580DDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767480235;
	bh=HuKJGKvGy1gFchRlhvCaLbRPaTYihIFIsUEFxsemrX0=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=dee/aUCLsIPCldbLFXe7+A+7NFxyBdAKtv2TfE4e172EMrL2QXLqYWcZj1+ZcbXg2
	 fOgCjU8xobDDnU39LQTmP3Q5ikkMOJ9Dt2rN3kQTZnbSvenFYtHiWakRVLmURnlxdN
	 1l01JsPvoaLDHNCrI4Lxf8UnmpZziizc/s2g3nG16bl/zj1uoskuR7lfY6tvaDxvzm
	 1gICpD0GOzE1ArY9ehg5odaFs25KBOlcZvbtVnFNp7xdUsBsycwhNxlY6EcIKlWL43
	 haUxcJFnpJTjz6g4UOURWjOzTW5Qq25QQiV3xT4hF0qcBvRcsJSVzWILnHHn3FiOCy
	 K010GetrSnyzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8582580DDD;
	Sat,  3 Jan 2026 22:43:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A22B25B
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4058360A94
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TVHfi4NrHm1d for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 22:43:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 30A5F60A68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30A5F60A68
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30A5F60A68
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2FBE04E41F38
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0611C6072B;
 Sat,  3 Jan 2026 22:43:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D43AF113B06D3; Sat,  3 Jan 2026 23:43:48 +0100 (CET)
To: buildroot@buildroot.org
Date: Sat,  3 Jan 2026 23:43:22 +0100
Message-ID: <20260103224330.2933161-9-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
References: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767480229; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=SstZzhb0Z9UabF3jrffltNpENMBh+3W2B5MnRVUfI6s=;
 b=fCevM8SCNC6Po6inU2YlFxkJzspmGfNO7MYzEXcF2QV7wTxnsjnpxloFbZhW7L5lz6gCxs
 n7QjcQqtlJXoGL4QFOifER83MJKXSuYHycOxYzMRB+UVCdCv1rN4Mo4/QblcQ5zJPU8nxY
 ymqX6zszq9XZ0XhagWuuEc8PNaK8dkvlHeerZFhxiajOX+3ZcCaHAXODe0Qk3OQHpTdB9G
 +L07zDGnC2oW/K+jGJmST6X4DgQcpO/bdj45zf3/0sASf8lwUI+F09emfCG9rt/7IyjCfy
 JPq5mq+9izc/MSBYMGt33XuGyRHQdITWPU2JYF+3xmH9UrEXTRTcTSmAB8OAZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=fCevM8SC
Subject: [Buildroot] [PATCH 09/11] package/perl-dbd-mysql: update dependency
 comments
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
Cc: Christopher McCrory <chrismcc@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit 8708f3a23a7e28fdb04fc57406e13e6b7ff4a337 ("package/mysql:
drop virtual package"), we no longer have mysql as a virtual package,
and therefore perl-dbd-mysql directly selects mariadb. As part of
that, the comments related to the dependencies have not been updated
accordingly. Fix that up.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-dbd-mysql/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-dbd-mysql/Config.in b/package/perl-dbd-mysql/Config.in
index eff76f5b61..b430e44027 100644
--- a/package/perl-dbd-mysql/Config.in
+++ b/package/perl-dbd-mysql/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_PERL_DBD_MYSQL
 	bool "perl-dbd-mysql"
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_INSTALL_LIBSTDCPP # mysql
-	depends on BR2_USE_MMU # mysql
-	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
+	depends on BR2_INSTALL_LIBSTDCPP # mariadb
+	depends on BR2_USE_MMU # mariadb
+	depends on BR2_TOOLCHAIN_HAS_THREADS # mariadb
 	select BR2_PACKAGE_MARIADB
 	select BR2_PACKAGE_PERL_DBI # runtime
 	help
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

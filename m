Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608B2C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 18:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E15182072;
	Tue,  8 Aug 2023 18:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E15182072
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F8SBz0wd9OFI; Tue,  8 Aug 2023 18:51:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A5F5820EE;
	Tue,  8 Aug 2023 18:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A5F5820EE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00ADB1BF330
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF00C8204E
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF00C8204E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qURCuZyLW4HE for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 18:51:38 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 141768204C
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 141768204C
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0AF59A4C0F6B;
 Tue,  8 Aug 2023 20:51:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48850)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTRnQ-0005AS-1N;
 Tue, 08 Aug 2023 20:51:08 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 20:50:53 +0200
Message-Id: <20230808185108.3787835-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808185108.3787835-1-bernd@kuhls.net>
References: <20230808185108.3787835-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691520669;
 bh=YpeMm5kTNYhqcWV8Tcy8qhROaw/96PfnsSRBkf5cHR0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h4OjJpjkK8loOgXPR4LV3X3v4DxMDBKXnHCoeOMy1vOFbM9aQnUNITysvAUu51Rgz
 Ij51+DEdQgRnW71djNKZT74v77ji3q3ibpTcStkiLTq5A7UlcMYtttfkln4urrOLYk
 1UzrhPaKMV8ioxJMx5DQnmCyBj6nLhaoff3Gf7xYA6U8zSD9m/GwgbmYZirx91SELq
 8NI+Enxun5DdkDq4ISxj5BCnAFjTeUeObTNjaVbrnI9SeDuY5PBXBuNSbAWjqCq6x6
 kzg7/fIKxj0jD3PVyg/8EX2w9rIYU4z/1uuf2uAmjOoYFDLyMjoV5j7LWHLYeJlQOt
 9clXdr/OHfVqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=h4OjJpjk
Subject: [Buildroot] [PATCH/next 01/16] package/berkeleydb: add option for
 historic dbm interface
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Berkeley DB support in python depends on dbm, when missing python fails
to detect libdb:
https://github.com/python/cpython/blob/d2340ef25721b6a72d45d4508c672c4be38c67d3/configure.ac#L4002

quoting python configure log:
checking for libdb... no

quoting python config.log:
conftest.c:(.text.startup+0x8): undefined reference to `__db_ndbm_open'

This patch provides a configure option for the historic dbm interface
to be used by the python package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/berkeleydb/Config.in     | 5 +++++
 package/berkeleydb/berkeleydb.mk | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/berkeleydb/Config.in b/package/berkeleydb/Config.in
index f32d13ab17..f8fbb5cc09 100644
--- a/package/berkeleydb/Config.in
+++ b/package/berkeleydb/Config.in
@@ -13,6 +13,11 @@ config BR2_PACKAGE_BERKELEYDB_COMPAT185
 	help
 	  Build and install DB 1.85 compatibility API.
 
+config BR2_PACKAGE_BERKELEYDB_DBM
+	bool "historic dbm interface"
+	help
+	  Enable the historic dbm interface.
+
 config BR2_PACKAGE_BERKELEYDB_TOOLS
 	bool "install tools"
 	help
diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index 36b1894f34..1c121370db 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -39,6 +39,7 @@ define BERKELEYDB_CONFIGURE_CMDS
 		--disable-java \
 		--disable-tcl \
 		$(if $(BR2_PACKAGE_BERKELEYDB_COMPAT185),--enable-compat185,--disable-compat185) \
+		$(if $(BR2_PACKAGE_BERKELEYDB_DBM),--enable-dbm,--disable-dbm) \
 		$(SHARED_STATIC_LIBS_OPTS) \
 		--with-pic \
 		--enable-o_direct \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

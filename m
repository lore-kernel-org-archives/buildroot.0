Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE1BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 20:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C49B940491;
	Sat, 12 Mar 2022 20:17:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EkNaK3xCqxdn; Sat, 12 Mar 2022 20:17:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECB2240486;
	Sat, 12 Mar 2022 20:17:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 68A8F1BF3DD
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 567A440486
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:17:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eJOFMraKJdkE for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 20:17:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E8EC4048C
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 20:17:03 +0000 (UTC)
Received: from b52572-12.ea.freescale.net (unknown
 [IPv6:2a01:e0a:43e:e970:8763:f5a3:4adf:bb86])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CE68FB0037C;
 Sat, 12 Mar 2022 21:16:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647116221;
 bh=cwjJhg5MG5xQHKQILJ0oaU/jFrwLthvNmphC43m6LF0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f5sa1nCB0xwpN01TbrXYm1N2U0Wk30Oam2pDGGxnkjnP/Oq3jGLKnOFog8TFln2I0
 AfP57bfPYrxYB0g/YjMV7E+pcyoTgxm4r3V8nN0nXY1FHthAJUe8kDD1YZ0kmeSjXm
 iuhl132VRB8Kd35rTfCX1is4Xz/0g3fLehjaE7K9TZWwd4Tmz4kY+gAntr932zoQVF
 ExxKj85ChB7IPaKUvwmHIri6K5LPtG0ejw66z/qnzRb0ZZbBMRxoKzEO9s8mYFHvLa
 Bk0bYNEH8ekXpg2QJWquuuZSsqpUc/ibWFXFZW9mWmF81SEzFB5zj8HVgRxEON4cz1
 0aXer8vJd/zGA==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Mar 2022 21:16:26 +0100
Message-Id: <20220312201627.690544-3-ju.o@free.fr>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220312201627.690544-1-ju.o@free.fr>
References: <20220312201627.690544-1-ju.o@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] package/poco: add Data/PostgreSQL support
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PostgreSQL support was introduced in poco v1.10.0, in commit:
https://github.com/pocoproject/poco/commit/8cec8f6451b9a0ead80f655eee986040863e3526

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/poco/Config.in | 6 ++++++
 package/poco/poco.mk   | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index 79ffac741d..714e40f447 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -45,6 +45,12 @@ config BR2_PACKAGE_POCO_DATA_MYSQL
 	select BR2_PACKAGE_MYSQL
 	select BR2_PACKAGE_POCO_DATA
 
+config BR2_PACKAGE_POCO_DATA_PGSQL
+	bool "Data/PostgreSQL"
+	depends on BR2_USE_MMU # postgresql
+	select BR2_PACKAGE_POCO_DATA
+	select BR2_PACKAGE_POSTGRESQL
+
 config BR2_PACKAGE_POCO_DATA_SQLITE
 	bool "Data/SQLite"
 	select BR2_PACKAGE_POCO_DATA
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 81409ffec4..119711f3fd 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -15,6 +15,7 @@ POCO_DEPENDENCIES = pcre zlib \
 	$(if $(BR2_PACKAGE_POCO_CRYPTO),openssl) \
 	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),mysql) \
 	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),sqlite) \
+	$(if $(BR2_PACKAGE_POCO_DATA_PGSQL),postgresql) \
 	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_POCO_XML),expat)
 
@@ -24,6 +25,7 @@ POCO_OMIT = Data/ODBC PageCompiler \
 	$(if $(BR2_PACKAGE_POCO_DATA),,Data) \
 	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),,Data/MySQL) \
 	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),,Data/SQLite) \
+	$(if $(BR2_PACKAGE_POCO_DATA_PGSQL),,Data/PostgreSQL) \
 	$(if $(BR2_PACKAGE_POCO_JSON),,JSON) \
 	$(if $(BR2_PACKAGE_POCO_JWT),,JWT) \
 	$(if $(BR2_PACKAGE_POCO_MONGODB),,MongoDB) \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

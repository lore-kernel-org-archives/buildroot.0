Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B602C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 20:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 403A5613FE;
	Wed, 23 Mar 2022 20:29:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ftkeqf5q_hgi; Wed, 23 Mar 2022 20:29:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DA6D60B68;
	Wed, 23 Mar 2022 20:29:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C97DB1BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66FEC40FD7
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:27:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3j_wnHEnsyIK for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 20:27:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1813D40CB2
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:27:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4D2F7854E8; Wed, 23 Mar 2022 20:18:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 21:09:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 386b0d6c5e9c6c9ece230ad63b25f126e249a37f
X-Git-Newrev: 0fd31f073981a2cf586264bcde00ccd17ef9deb3
X-Patchwork-Hint: ignore
Message-Id: <20220323201808.4D2F7854E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poco: add Data/PostgreSQL support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0fd31f073981a2cf586264bcde00ccd17ef9deb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PostgreSQL support was introduced in poco v1.10.0, in commit:
https://github.com/pocoproject/poco/commit/8cec8f6451b9a0ead80f655eee986040863e3526

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

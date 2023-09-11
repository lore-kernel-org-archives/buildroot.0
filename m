Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FE7CA0EC1
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 20:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C50B0418C3;
	Mon, 11 Sep 2023 20:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C50B0418C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HnN3IngCmiog; Mon, 11 Sep 2023 20:59:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF4D9418BD;
	Mon, 11 Sep 2023 20:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF4D9418BD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B5321BF955
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32E9F81EFC
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32E9F81EFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ev6NhYIGnxgq for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 20:58:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72A1B81E84
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 20:58:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72A1B81E84
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62CA586D43; Mon, 11 Sep 2023 20:58:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 22:48:24 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 8d9f6075cac0d7e9e43c022e23b67b38fca58942
X-Git-Newrev: 5c6c6d9634fe47a6b356a37389d59e6ab37ae78f
X-Patchwork-Hint: ignore
Message-Id: <20230911205823.62CA586D43@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/berkeleydb: add
 option for historic dbm interface
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

commit: https://git.buildroot.net/buildroot/commit/?id=5c6c6d9634fe47a6b356a37389d59e6ab37ae78f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 244a8c52ef25bafdee6577d08e47c091b2093cc8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F78AC001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 18:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A589C4191C;
	Wed,  9 Aug 2023 18:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A589C4191C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ppU74mbUqqZ2; Wed,  9 Aug 2023 18:27:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DDDA41918;
	Wed,  9 Aug 2023 18:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DDDA41918
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68C221BF97F
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 18:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FE99418C5
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 18:26:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FE99418C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IcQlHy0YT5BN for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 18:26:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38A0B404CB
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 18:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38A0B404CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22893851A5; Wed,  9 Aug 2023 18:26:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 20:16:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 084cc7df3f0e3f90cef55f5df82ae8320c3609d9
X-Git-Newrev: 244a8c52ef25bafdee6577d08e47c091b2093cc8
X-Patchwork-Hint: ignore
Message-Id: <20230809182655.22893851A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/berkeleydb: add option for
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=244a8c52ef25bafdee6577d08e47c091b2093cc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E9DC001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 17:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C451F417A7;
	Wed,  9 Aug 2023 17:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C451F417A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nnox5H1-RIz0; Wed,  9 Aug 2023 17:33:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83DDE418DF;
	Wed,  9 Aug 2023 17:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83DDE418DF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77B861BF3B9
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DFE18164A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DFE18164A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fbfeGgHPRHGj for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 17:33:50 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CE978146F
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 17:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CE978146F
Received: from fli4l.lan.fli4l (p54a1be35.dip0.t-ipconnect.de [84.161.190.53])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 22A57A4C1063;
 Wed,  9 Aug 2023 19:33:35 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34482)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTn3u-0001yu-1Z;
 Wed, 09 Aug 2023 19:33:34 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 19:33:19 +0200
Message-Id: <20230809173334.2514813-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809173334.2514813-1-bernd@kuhls.net>
References: <20230809173334.2514813-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691602415;
 bh=YpeMm5kTNYhqcWV8Tcy8qhROaw/96PfnsSRBkf5cHR0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pHIVfy+VacSrACR2qV1oXicvomfAnzDGiHmqZBWLydbqB7u25EmSo4JZOCNNuYGVs
 DGCGaMuvG4uMx9aVipi7UpTGVjpU9GRH2CygjmfZFO4pO8Hzy2pKIgl/qKWTwaNX+f
 ZLICxbVaanezWpPW+yxwgvlVdYtjKoQ5otdmIMNx4bPK+idQIJA1WPVneV2j5tsPCI
 zBOmV/WRo05umo0JQLwt2VuYxpCR3qYeydBVb041qPk9HjqkyxLWrI9YQ6vmRb1q1N
 fN+rmbnTQ0/LhsPeHHwHejk0yTxlHJzISSNJ564Ork8e8z/J95x066GQZaJmqw8wja
 mARtiywLfBgmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=pHIVfy+V
Subject: [Buildroot] [PATCH/next v2 01/16] package/berkeleydb: add option
 for historic dbm interface
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

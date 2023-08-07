Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D28C001DE
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 17:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97AC66104F;
	Mon,  7 Aug 2023 17:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97AC66104F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1tI9QgWUgCyW; Mon,  7 Aug 2023 17:46:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B922B610A5;
	Mon,  7 Aug 2023 17:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B922B610A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2BFFA1BF36D
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 17:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 499C240A85
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 17:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 499C240A85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OfWzKB3V_UaW for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 17:45:32 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73334404F7
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 17:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73334404F7
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B0EEFA4C102A;
 Mon,  7 Aug 2023 19:45:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34072)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qT4I7-0007Xl-33;
 Mon, 07 Aug 2023 19:45:16 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  7 Aug 2023 19:45:14 +0200
Message-Id: <20230807174515.3261136-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691430316;
 bh=YpeMm5kTNYhqcWV8Tcy8qhROaw/96PfnsSRBkf5cHR0=;
 h=From:To:Cc:Subject:Date:From;
 b=n9S3NEKIuqbIhW8U0FwvZD/M35dXidvk20yuS1KpwoXsdGSOE92fd2C6m4eLHuYZ9
 HA3nB9Xx+uf2tOuSsLhMFc2ebvKpnKxU7FP8lJ+vgcYalaGGfcpZyiNptre4mhbhe1
 jqGNmqc2JcuCGI5mT36qw4jNlnPhsPvw0NVXVO4DH5xn3GV1UvtxMpz6QmXjRHoKIZ
 gANFdNvxDkE1Iwf3HJ72oaR5A/f8Sapsy6kzmUHtl9ZsDHWmIxqlzewkHmQFaoJNYe
 Od5sEoJiV3UInXil6aEyMAUuipf419JMLTtPw2sdTizBIXfOYuFsYSRuaCBKxwcs4a
 s3lRU5GsRVFGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=n9S3NEKI
Subject: [Buildroot] [PATCH 1/2] package/berkeleydb: add option for historic
 dbm interface
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

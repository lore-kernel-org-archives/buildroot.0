Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782A5C021B0
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 23:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 349F482EA4;
	Wed, 19 Feb 2025 23:15:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 48oNtHdXx5QN; Wed, 19 Feb 2025 23:15:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 368B482EB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 368B482EB4;
	Wed, 19 Feb 2025 23:15:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 28296CF
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 23:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C99C82EB4
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 23:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMdonBvu_1q7 for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 23:15:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D48E382EA4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D48E382EA4
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 23:15:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFE6F878ED; Wed, 19 Feb 2025 23:15:12 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 20 Feb 2025 00:10:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 386cd2ebafd3de3d29c50f3d9526a69f1ad7993a
X-Git-Newrev: 274c36578fa3242e7ba35ce364d6856e0d0b95f5
X-Patchwork-Hint: ignore
Message-Id: <20250219231512.BFE6F878ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/sqlite: fix build issue if
 C++ is not enabled since bump to 3.49.0"
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=274c36578fa3242e7ba35ce364d6856e0d0b95f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 8a1ae9e0b151063528e67b8b34a1229dc729df3c.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Scott Fan <fancp2007@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sqlite/sqlite.mk | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 8016ff1c4c..255ddc937b 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -65,9 +65,7 @@ endif
 SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)" LDFLAGS="$(SQLITE_LDFLAGS)"
 
 define SQLITE_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_CONFIGURE_OPTS) \
-		$(if $(BR2_INSTALL_LIBSTDCPP),,CXX=false) \
-		$(SQLITE_CONF_ENV) ./configure \
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) $(SQLITE_CONF_ENV) ./configure \
 		--prefix=/usr \
 		--host="$(GNU_TARGET_NAME)" \
 		--build="$(GNU_HOST_NAME)" \
@@ -89,8 +87,7 @@ define SQLITE_INSTALL_TARGET_CMDS
 endef
 
 define HOST_SQLITE_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_CONFIGURE_OPTS) \
-		$(SQLITE_CONF_ENV) ./configure \
+	(cd $(@D); $(HOST_CONFIGURE_OPTS) $(SQLITE_CONF_ENV) ./configure \
 		--prefix=/usr \
 		--host="$(GNU_HOST_NAME)" \
 		--build="$(GNU_HOST_NAME)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

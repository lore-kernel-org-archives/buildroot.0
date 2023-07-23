Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3967C001B0
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 15:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FEA2410C5;
	Sun, 23 Jul 2023 15:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FEA2410C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PFpajpWLPaIy; Sun, 23 Jul 2023 15:40:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0C3B410E4;
	Sun, 23 Jul 2023 15:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0C3B410E4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A4BC41BF28A
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 15:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B78A81F03
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 15:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B78A81F03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U92HiphodGNj for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 15:40:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C62781EE0
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 15:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C62781EE0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B3B68278A; Sun, 23 Jul 2023 15:40:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 17:36:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 821f9dee8112dc02fe58d60273d0dfdabbc46d1f
X-Git-Newrev: 15cc8d1e453d8c9e20389c8908c024f03f826388
X-Patchwork-Hint: ignore
Message-Id: <20230723154021.3B3B68278A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mariadb: needs pcre2
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

commit: https://git.buildroot.net/buildroot/commit/?id=15cc8d1e453d8c9e20389c8908c024f03f826388
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream added the possibility to build with system-provided pcre2 back
in 2014:
    https://github.com/MariaDB/server/commit/016bd4fc5fff311dc4091b3b7329cd980dbaa14b

The policy in Buildroot is to use system-provided libraries rather than
bundled ones, but we missed that opportunity when we introduced mariadb
back in 2016, with commit 2cd86cdbfcde (mariadb: new package).

Fix that now.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mariadb/mariadb.mk | 4 +++-
 package/mysql/Config.in    | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index a9cd9c9516..a2701643e1 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -21,12 +21,14 @@ MARIADB_DEPENDENCIES = \
 	fmt \
 	ncurses \
 	openssl \
+	pcre2 \
 	zlib \
 	libaio \
 	libxml2
 
 MARIADB_CONF_OPTS += \
-	-DWITH_FMT=system
+	-DWITH_FMT=system \
+	-DWITH_PCRE=system
 
 # use bundled GPL-2.0+ licensed readline as package/readline is GPL-3.0+
 MARIADB_CONF_OPTS += -DWITH_READLINE=ON
diff --git a/package/mysql/Config.in b/package/mysql/Config.in
index 8212d0fd3f..8942e55a45 100644
--- a/package/mysql/Config.in
+++ b/package/mysql/Config.in
@@ -25,6 +25,7 @@ config BR2_PACKAGE_MARIADB
 	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_HAS_MYSQL
 	help
 	  MariaDB is one of the most popular database servers in the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

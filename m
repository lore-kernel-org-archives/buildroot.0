Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32087C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 22:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D54B8409BD;
	Sun,  3 Dec 2023 22:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D54B8409BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ukw46nqb9Nau; Sun,  3 Dec 2023 22:24:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9CA5409DB;
	Sun,  3 Dec 2023 22:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9CA5409DB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 166081BF3DA
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 22:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38B3E60B22
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 22:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38B3E60B22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QbK4Sg3ul4VW for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 22:23:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7560760A62
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 22:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7560760A62
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 654FA878FD; Sun,  3 Dec 2023 22:23:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 23:21:23 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: c60ef116855b2d78f604048a80660601c0e09621
X-Git-Newrev: 1586407ab7ca30ed033fdd9bedbb288a1177522d
X-Patchwork-Hint: ignore
Message-Id: <20231203222319.654FA878FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/mariadb: needs
 pcre2
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

commit: https://git.buildroot.net/buildroot/commit/?id=1586407ab7ca30ed033fdd9bedbb288a1177522d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Upstream added the possibility to build with system-provided pcre2 back
in 2014:
    https://github.com/MariaDB/server/commit/016bd4fc5fff311dc4091b3b7329cd980dbaa14b

The policy in Buildroot is to use system-provided libraries rather than
bundled ones, but we missed that opportunity when we introduced mariadb
back in 2016, with commit 2cd86cdbfcde (mariadb: new package).

Fix that now.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 15cc8d1e453d8c9e20389c8908c024f03f826388)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

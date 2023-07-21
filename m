Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF726C0015E
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E18E4017B;
	Fri, 21 Jul 2023 21:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E18E4017B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DTDXx_lrGdbx; Fri, 21 Jul 2023 21:25:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 965AE4013C;
	Fri, 21 Jul 2023 21:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 965AE4013C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9999B1BF82F
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72D2560B27
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72D2560B27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yqIF6Bo_drr7 for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:25:50 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3119E60706
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 21:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3119E60706
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8B708A4C04DB
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 23:25:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50768)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qMxdB-0005X2-2r
 for buildroot@buildroot.org; Fri, 21 Jul 2023 23:25:45 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 21 Jul 2023 23:25:45 +0200
Message-Id: <20230721212545.2371188-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230721212545.2371188-1-bernd@kuhls.net>
References: <20230721212545.2371188-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689974746;
 bh=sgJClhAqwaTCvVQUYgATPrn+kc+syShZGkyX/VT0CEk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=V1BbjGvnfQHsLJA0eeO9myXG4vh/Y9cVr8oXEuqKkGwM//KHQ1MDWVvrajXWBAB48
 DI4ZbMsdJY6Vqf8dqZgCjP4U5JgHf26GIhiQCXLJlUg8cbPYlsK3IMSVYVTw8IUonh
 lrT1iZxUztB4iQgEFudDCLfgYAM9QEKQ9zy1umXzL+QnyfrarFu7Bi+P4tluj/W7xL
 v+arSkbsQ5qLIhzWFbv1LtyJ+/DKBxVwfO8o5i/HpQHVkpU2X+xqroWXTrQIhFi80O
 eLk57DtzwrtImvNbxl6J3HXVKOlSBCoU3mWivVpifYRQ0A57qxDc3ZPMN1Hfw84obt
 Vb/RcYxdJ+foQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=V1BbjGvn
Subject: [Buildroot] [PATCH v2 2/2] package/mariadb: needs pcre2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream added the possibility to build with system-provided pcre2
https://github.com/MariaDB/server/commit/016bd4fc5fff311dc4091b3b7329cd980dbaa14b

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

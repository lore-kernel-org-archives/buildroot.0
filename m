Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E35EC0015E
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 10:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCFFB40ACB;
	Fri, 28 Jul 2023 10:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCFFB40ACB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hwmVyn_59pkT; Fri, 28 Jul 2023 10:11:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2130340569;
	Fri, 28 Jul 2023 10:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2130340569
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61AA91BF36B
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 10:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32D8342063
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 10:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32D8342063
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xtLEjpAQmIUq for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 10:11:47 +0000 (UTC)
X-Greylist: delayed 63573 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 28 Jul 2023 10:11:46 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F20A842062
Received: from server1.sm-technologies.co.uk (unknown
 [IPv6:2a01:7e00::f03c:91ff:fe96:c024])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F20A842062
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 10:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by server1.sm-technologies.co.uk (Postfix) with ESMTP id 05BCA9A2F2
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 11:11:45 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at server1.sm-technologies.co.uk
Received: from server1.sm-technologies.co.uk ([127.0.0.1])
 by localhost (server1.sm-technologies.co.uk [127.0.0.1]) (amavisd-new,
 port 10026)
 with LMTP id DbBCySz2pDZM; Fri, 28 Jul 2023 11:11:43 +0100 (BST)
From: Danny Wood <danny@rotronics.co.uk>
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 11:11:40 +0100
Message-ID: <20230728101140.10998-1-danny@rotronics.co.uk>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=rotronics.co.uk; s=mail; t=1690539105;
 bh=gnQNg/9IybgK72mpIxZ21lS8rzRkhT1QD6QF+uyxdyk=;
 h=From:To:Cc:Subject:Date:From;
 b=AIz8QS9DdLRHPR+Fj8tUUuAr+aYbpRSU0vF7zJ9r14cqPfvspkCHRqsuO8zc4Sf98
 Tq09yMj5n+Yt8hIA1HO6KTkFHUystgGp34VxBwcLXMb71ZRh8+wuVWvkfGg27x8AtW
 ammD1R+KJwDKU8dgGTWB3Lq4/9wjUxLYRIhuj8XU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=rotronics.co.uk header.i=@rotronics.co.uk
 header.a=rsa-sha256 header.s=mail header.b=AIz8QS9D
Subject: [Buildroot] [PATCH 1/1] package/mariadb: add optional systemd
 dependency
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
Cc: Danny Wood <danny@rotronics.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If systemd is used we should enable support in mariadb and enable
"Type=notify" in the mysqld.service unit file

"Type=notify" stops systemd from starting services which depend on mariadb
until it has notified systemd that it has finished starting up, this helps
avoid startup race conditions

Signed-off-by: Danny Wood <danny@rotronics.co.uk>
---
 package/mariadb/mariadb.mk     | 4 ++++
 package/mariadb/mysqld.service | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index a2701643e1..947cb7c0de 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -72,6 +72,10 @@ MARIADB_CONF_OPTS += \
 	-DLIBRESSL_RESULT__TRYRUN_OUTPUT="LibreSSL $(LIBRESSL_VERSION)"
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+MARIADB_DEPENDENCIES += systemd
+endif
+
 ifeq ($(BR2_PACKAGE_MARIADB_SERVER),y)
 ifeq ($(BR2_PACKAGE_MARIADB_SERVER_EMBEDDED),y)
 MARIADB_CONF_OPTS += -DWITH_EMBEDDED_SERVER=ON
diff --git a/package/mariadb/mysqld.service b/package/mariadb/mysqld.service
index 537430e9a2..9433e14630 100644
--- a/package/mariadb/mysqld.service
+++ b/package/mariadb/mysqld.service
@@ -9,6 +9,8 @@ Restart=always
 User=mysql
 RuntimeDirectory=mysql
 RuntimeDirectoryMode=0755
+Type=notify
+NotifyAccess=all
 
 [Install]
 WantedBy=multi-user.target
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

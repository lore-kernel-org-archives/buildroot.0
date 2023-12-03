Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433C8C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 22:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB2C840972;
	Sun,  3 Dec 2023 22:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB2C840972
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bh4nxuIS3KZ2; Sun,  3 Dec 2023 22:24:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00FD440A1E;
	Sun,  3 Dec 2023 22:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00FD440A1E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0A531BF3DA
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 22:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AA998175B
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 22:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AA998175B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7XdIQKoCFo1w for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 22:23:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81DDE8175C
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 22:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81DDE8175C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 722EC878FE; Sun,  3 Dec 2023 22:23:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 23:21:40 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 1586407ab7ca30ed033fdd9bedbb288a1177522d
X-Git-Newrev: 11c1a1c5bc78f3cbf2f1cbc06e8dba19449d7c77
X-Patchwork-Hint: ignore
Message-Id: <20231203222319.722EC878FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/mariadb: add
 optional systemd dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=11c1a1c5bc78f3cbf2f1cbc06e8dba19449d7c77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

If systemd is used we should enable support in mariadb and enable
"Type=notify" in the mysqld.service unit file

"Type=notify" stops systemd from starting services which depend on mariadb
until it has notified systemd that it has finished starting up, this helps
avoid startup race conditions

Signed-off-by: Danny Wood <danny@rotronics.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1a9ad16ed8e5048a11d19dc411995137b154870a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/mariadb.mk     | 7 +++++++
 package/mariadb/mysqld.service | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index a2701643e1..78e4703eee 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -72,6 +72,13 @@ MARIADB_CONF_OPTS += \
 	-DLIBRESSL_RESULT__TRYRUN_OUTPUT="LibreSSL $(LIBRESSL_VERSION)"
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+MARIADB_DEPENDENCIES += systemd
+MARIADB_CONF_OPTS += -DWITH_SYSTEMD=yes
+else
+MARIADB_CONF_OPTS += -DWITH_SYSTEMD=no
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

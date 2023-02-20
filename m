Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C06C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C382270306;
	Tue, 21 Feb 2023 02:13:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C382270306
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YWpg9z8FR0u7; Tue, 21 Feb 2023 02:13:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E15BB700D8;
	Tue, 21 Feb 2023 02:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E15BB700D8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D2891BF310
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 22:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 174F340363
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 22:31:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 174F340363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MSqA_Qu5eqGi for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 22:31:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5198C40199
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 22:31:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5198C40199
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39624864C0; Mon, 20 Feb 2023 22:31:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 23:31:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c36f6938858d3246ca493dacc925717586e2ea0f
X-Git-Newrev: 9cd2e6e090449f9d2f371d24152580c038892f3d
X-Patchwork-Hint: ignore
Message-Id: <20230220223154.39624864C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgresql: add lz4 and zstd
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=9cd2e6e090449f9d2f371d24152580c038892f3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PostgreSQL has optional compression support (LZ4 and Zstandard).
So enable it if libraries are available.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/postgresql/postgresql.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index e90aa794b0..5e3601cb46 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -91,6 +91,20 @@ else
 POSTGRESQL_CONF_OPTS += --without-libxml
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+POSTGRESQL_DEPENDENCIES += zstd
+POSTGRESQL_CONF_OPTS += --with-zstd
+else
+POSTGRESQL_CONF_OPTS += --without-zstd
+endif
+
+ifeq ($(BR2_PACKAGE_LZ4),y)
+POSTGRESQL_DEPENDENCIES += lz4
+POSTGRESQL_CONF_OPTS += --with-lz4
+else
+POSTGRESQL_CONF_OPTS += --without-lz4
+endif
+
 # required for postgresql.service Type=notify
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 POSTGRESQL_DEPENDENCIES += systemd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

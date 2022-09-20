Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DDFC54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 06:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A121D818A7;
	Tue, 20 Sep 2022 06:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A121D818A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LI4L0JAmx_72; Tue, 20 Sep 2022 06:20:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D394A81772;
	Tue, 20 Sep 2022 06:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D394A81772
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C5C41BF33A
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 06:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3828440101
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 06:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3828440101
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0PU0NcfDlkKR for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 06:20:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75325404DA
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 06:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75325404DA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6006E85BBF; Tue, 20 Sep 2022 06:20:25 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Sep 2022 08:09:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d8afc7a06abdb54a92768433dd69da5a44a5e7c
X-Git-Newrev: c84f8742be47141639c32436927a624c1690f6b2
X-Patchwork-Hint: ignore
Message-Id: <20220920062025.6006E85BBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: add support for sql
 module w/ sqlite
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

commit: https://git.buildroot.net/buildroot/commit/?id=c84f8742be47141639c32436927a624c1690f6b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though Qt6 support using a bundled sqlite, in Buildroot, we
always prefer to use non-bundled libraries when possible.

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/Config.in  | 7 +++++++
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 7d1233752c..e8357a675c 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -72,6 +72,13 @@ comment "PostgreSQL plugin can't be built with optimize for fast"
 	depends on BR2_USE_MMU
 	depends on BR2_OPTIMIZE_FAST
 
+config BR2_PACKAGE_QT6BASE_SQLITE
+	bool "SQLite plugin"
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA
+	help
+	  Build SQLite plugin
+
 endif
 
 config BR2_PACKAGE_QT6BASE_SYSLOG
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index f29a52f543..b7ee6037f3 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -172,6 +172,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_sql_psql=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_SQLITE),y)
+QT6BASE_CONF_OPTS += -DFEATURE_sql_sqlite=ON -DFEATURE_system_sqlite=ON
+QT6BASE_DEPENDENCIES += sqlite
+else
+QT6BASE_CONF_OPTS += -DFEATURE_sql_sqlite=OFF
+endif
+
 else
 QT6BASE_CONF_OPTS += -DFEATURE_sql=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

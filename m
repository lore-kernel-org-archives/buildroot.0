Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B1FC54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 06:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68C2D60BFC;
	Tue, 20 Sep 2022 06:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68C2D60BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4tEUQzPgK2lf; Tue, 20 Sep 2022 06:21:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EA0460BF3;
	Tue, 20 Sep 2022 06:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EA0460BF3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 64A2B1BF33A
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 06:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40FAE40101
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 06:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40FAE40101
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0HSowpEE6UWk for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 06:20:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63397404CF
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 06:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63397404CF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F7DD85BBE; Tue, 20 Sep 2022 06:20:25 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Sep 2022 08:09:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f446cfc5cd748e2081986f1fdd08e3e5268e331f
X-Git-Newrev: 8d8afc7a06abdb54a92768433dd69da5a44a5e7c
X-Patchwork-Hint: ignore
Message-Id: <20220920062025.4F7DD85BBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: add support for sql
 module w/ postgresql
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d8afc7a06abdb54a92768433dd69da5a44a5e7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/Config.in  | 18 ++++++++++++++++++
 package/qt6/qt6base/qt6base.mk |  7 +++++++
 2 files changed, 25 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index c2a08a3b5b..7d1233752c 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -54,6 +54,24 @@ comment "MySQL plugin needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
+config BR2_PACKAGE_QT6BASE_PSQL
+	bool "PostgreSQL Plugin"
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR
+	depends on !BR2_OPTIMIZE_FAST
+	select BR2_PACKAGE_POSTGRESQL
+	help
+	  Build PostgreSQL plugin
+
+comment "PostgreSQL plugin needs a toolchain w/ wchar, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
+
+comment "PostgreSQL plugin can't be built with optimize for fast"
+	depends on BR2_USE_MMU
+	depends on BR2_OPTIMIZE_FAST
+
 endif
 
 config BR2_PACKAGE_QT6BASE_SYSLOG
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 3d07cefe92..f29a52f543 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -165,6 +165,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_sql_mysql=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_PSQL),y)
+QT6BASE_CONF_OPTS += -DFEATURE_sql_psql=ON
+QT6BASE_DEPENDENCIES += postgresql
+else
+QT6BASE_CONF_OPTS += -DFEATURE_sql_psql=OFF
+endif
+
 else
 QT6BASE_CONF_OPTS += -DFEATURE_sql=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

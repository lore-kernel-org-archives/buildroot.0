Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8BDC54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 06:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1788081772;
	Tue, 20 Sep 2022 06:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1788081772
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZTPgTjZYx-1H; Tue, 20 Sep 2022 06:20:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2207981934;
	Tue, 20 Sep 2022 06:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2207981934
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5EA891BF9CB
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 06:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4813460BEC
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 06:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4813460BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PfBbXpYmmRcs for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 06:20:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5208A60B19
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 06:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5208A60B19
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B79185BA3; Tue, 20 Sep 2022 06:20:25 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Sep 2022 08:09:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce4b87be82d13d3a042b4e78fe5835f3c8ddc29d
X-Git-Newrev: f446cfc5cd748e2081986f1fdd08e3e5268e331f
X-Patchwork-Hint: ignore
Message-Id: <20220920062025.3B79185BA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: add support for sql
 module w/ mysql
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

commit: https://git.buildroot.net/buildroot/commit/?id=f446cfc5cd748e2081986f1fdd08e3e5268e331f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/Config.in  | 21 +++++++++++++++++++++
 package/qt6/qt6base/qt6base.mk | 16 ++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index f3e56aefa4..c2a08a3b5b 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -35,6 +35,27 @@ config BR2_PACKAGE_QT6BASE_NETWORK
 	help
 	  This options enables the Qt6Network library.
 
+config BR2_PACKAGE_QT6BASE_SQL
+	bool "sql module"
+	help
+	  This options enables the Qt6Sql library.
+
+if BR2_PACKAGE_QT6BASE_SQL
+config BR2_PACKAGE_QT6BASE_MYSQL
+	bool "MySQL Plugin"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_MYSQL
+	help
+	  Build MySQL plugin
+
+comment "MySQL plugin needs a toolchain w/ C++, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+endif
+
 config BR2_PACKAGE_QT6BASE_SYSLOG
 	bool "syslog support"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 084020f935..3d07cefe92 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -153,6 +153,22 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
 endif
 
+# Qt6 SQL Plugins
+ifeq ($(BR2_PACKAGE_QT6BASE_SQL),y)
+QT6BASE_CONF_OPTS += -DFEATURE_sql=ON
+QT6BASE_CONF_OPTS += -DFEATURE_sql_db2=OFF -DFEATURE_sql_ibase=OFF -DFEATURE_sql_oci=OFF -DFEATURE_sql_odbc=OFF
+
+ifeq ($(BR2_PACKAGE_QT6BASE_MYSQL),y)
+QT6BASE_CONF_OPTS += -DFEATURE_sql_mysql=ON
+QT6BASE_DEPENDENCIES += mysql
+else
+QT6BASE_CONF_OPTS += -DFEATURE_sql_mysql=OFF
+endif
+
+else
+QT6BASE_CONF_OPTS += -DFEATURE_sql=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_SYSLOG),y)
 QT6BASE_CONF_OPTS += -DFEATURE_syslog=ON
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

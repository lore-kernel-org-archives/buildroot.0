Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE1EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0950B60A9C;
	Sun, 13 Feb 2022 15:28:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uxN4kuVyTuPc; Sun, 13 Feb 2022 15:28:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EDC260706;
	Sun, 13 Feb 2022 15:28:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE08B1BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65AC160AC0
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6vurca5koUQO for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:26:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC39960B5D
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:26:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 420A08295E; Sun, 13 Feb 2022 15:18:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 16:21:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f67a6e9b7a7be9adbc405b3126000056120a01af
X-Git-Newrev: 1cd93b69ccc90346f5cb0f3460d48625a41eaec9
X-Patchwork-Hint: ignore
Message-Id: <20220213151835.420A08295E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: add mysql support
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

commit: https://git.buildroot.net/buildroot/commit/?id=1cd93b69ccc90346f5cb0f3460d48625a41eaec9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lighttpd only supports mariadb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lighttpd/Config.in   | 9 +++++++++
 package/lighttpd/lighttpd.mk | 8 +++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 4406a685ba..6f0c927319 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -61,6 +61,15 @@ config BR2_PACKAGE_LIGHTTPD_MAXMINDDB
 	help
 	  Enable MaxMind GeoIP2 support. Needed to support mod_maxminddb
 
+config BR2_PACKAGE_LIGHTTPD_MYSQL
+	bool "mysql support"
+	depends on BR2_PACKAGE_MARIADB
+	help
+	  Enable mysql support for lighttpd mod_vhostdb_mysql.
+
+comment "mysql support needs mariadb"
+	depends on !BR2_PACKAGE_MARIADB
+
 config BR2_PACKAGE_LIGHTTPD_OPENSSL
 	bool "openssl support"
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 49ab8587f7..595c59cb37 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -19,7 +19,6 @@ LIGHTTPD_CONF_OPTS = \
 	-Dwith_libev=false \
 	-Dwith_libunwind=false \
 	-Dwith_mbedtls=false \
-	-Dwith_mysql=false \
 	-Dwith_nettle=false \
 	-Dwith_nss=false \
 	-Dwith_pcre=false \
@@ -73,6 +72,13 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_maxminddb=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_MYSQL),y)
+LIGHTTPD_DEPENDENCIES += mysql
+LIGHTTPD_CONF_OPTS += -Dwith_mysql=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_mysql=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_OPENSSL),y)
 LIGHTTPD_DEPENDENCIES += openssl
 LIGHTTPD_CONF_OPTS += -Dwith_openssl=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

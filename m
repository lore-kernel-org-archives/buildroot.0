Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80327C433F5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D2EF409F2;
	Wed, 26 Jan 2022 21:05:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4H8nQDgcRmok; Wed, 26 Jan 2022 21:05:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A56C409D7;
	Wed, 26 Jan 2022 21:05:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B174A1BF48B
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99D7A830C2
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dGMW1Fl2bFzH for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:04:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E67B181768
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:04:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8C0E282386; Wed, 26 Jan 2022 20:57:32 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 22:03:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e6ea33ded6354b6f6e6122b124707db89a2ef2f
X-Git-Newrev: c97efff6aa1acdf78acdc6d3783a37d7cdabc260
X-Patchwork-Hint: ignore
Message-Id: <20220126205732.8C0E282386@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: add maxminddb support
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

commit: https://git.buildroot.net/buildroot/commit/?id=c97efff6aa1acdf78acdc6d3783a37d7cdabc260
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lighttpd/Config.in   | 6 ++++++
 package/lighttpd/lighttpd.mk | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index f3e252d850..9a262dbe93 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -39,6 +39,12 @@ config BR2_PACKAGE_LIGHTTPD_LUA
 	help
 	  Enable Lua support. Needed to support mod_magnet
 
+config BR2_PACKAGE_LIGHTTPD_MAXMINDDB
+	bool "maxminddb support"
+	select BR2_PACKAGE_LIBMAXMINDDB
+	help
+	  Enable MaxMind GeoIP2 support. Needed to support mod_maxminddb
+
 config BR2_PACKAGE_LIGHTTPD_OPENSSL
 	bool "openssl support"
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 22db1a7348..b2e06c77a1 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -20,7 +20,6 @@ LIGHTTPD_CONF_OPTS = \
 	-Dwith_ldap=false \
 	-Dwith_libev=false \
 	-Dwith_libunwind=false \
-	-Dwith_maxminddb=false \
 	-Dwith_mbedtls=false \
 	-Dwith_mysql=false \
 	-Dwith_nettle=false \
@@ -56,6 +55,13 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_lua=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_MAXMINDDB),y)
+LIGHTTPD_DEPENDENCIES += libmaxminddb
+LIGHTTPD_CONF_OPTS += -Dwith_maxminddb=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_maxminddb=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_OPENSSL),y)
 LIGHTTPD_DEPENDENCIES += openssl
 LIGHTTPD_CONF_OPTS += -Dwith_openssl=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

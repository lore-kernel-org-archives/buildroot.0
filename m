Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE514C433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 748BB83104;
	Wed, 26 Jan 2022 21:04:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sP4AVjhlj1g1; Wed, 26 Jan 2022 21:04:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C8BD84BD8;
	Wed, 26 Jan 2022 21:04:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D8CDC1BF48B
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C57A6409D7
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1rtrFEccrmJA for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:04:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D672D403A4
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:04:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 796177FB5B; Wed, 26 Jan 2022 20:57:32 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 21:58:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2b90b94894366fa81eac0767a0f4ad42289cd6a
X-Git-Newrev: 17ed9108a65ba78b108cb4d4b936cf0940948faf
X-Patchwork-Hint: ignore
Message-Id: <20220126205732.796177FB5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: add zstd support
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

commit: https://git.buildroot.net/buildroot/commit/?id=17ed9108a65ba78b108cb4d4b936cf0940948faf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lighttpd/Config.in   | 6 ++++++
 package/lighttpd/lighttpd.mk | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 59c1e0b2a6..05a7c84961 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -65,4 +65,10 @@ config BR2_PACKAGE_LIGHTTPD_ZLIB
 	help
 	  Enable zlib support for lighttpd mod_deflate.
 
+config BR2_PACKAGE_LIGHTTPD_ZSTD
+	bool "zstd support"
+	select BR2_PACKAGE_ZSTD
+	help
+	  Enable zstd support for lighttpd mod_deflate.
+
 endif
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index bdbf75191c..4f05db4e29 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -32,7 +32,6 @@ LIGHTTPD_CONF_OPTS = \
 	-Dwith_wolfssl=false \
 	-Dwith_xattr=false \
 	-Dwith_xxhash=true \
-	-Dwith_zstd=false \
 	-Dbuild_extra_warnings=false \
 	-Dbuild_static=false \
 	-Dmoduledir=lib/lighttpd
@@ -92,6 +91,13 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_zlib=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_ZSTD),y)
+LIGHTTPD_DEPENDENCIES += zstd
+LIGHTTPD_CONF_OPTS += -Dwith_zstd=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_zstd=false
+endif
+
 define LIGHTTPD_INSTALL_CONFIG
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/lighttpd/conf.d
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/www
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

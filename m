Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A814C433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 08:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56C7C404A1;
	Sun, 23 Jan 2022 08:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xVzzMpDWhQhm; Sun, 23 Jan 2022 08:37:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38B3C401CC;
	Sun, 23 Jan 2022 08:37:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25BB41BF33D
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 08:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08A3A605EE
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 08:37:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R3LjYWwhHwRD for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 08:37:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32B31605C9
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 08:37:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8E74E82946; Sun, 23 Jan 2022 08:30:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 09:32:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bbb3e4615851cbd3c3c0ce4a72731347f006dc1f
X-Git-Newrev: 694189ffa3cddd811620f77e19de9a73a24cd09e
X-Patchwork-Hint: ignore
Message-Id: <20220123083029.8E74E82946@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: switch to pcre2
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

commit: https://git.buildroot.net/buildroot/commit/?id=694189ffa3cddd811620f77e19de9a73a24cd09e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to pcre2 which is supported since version 1.4.62 and
https://github.com/lighttpd/lighttpd1.4/commit/7512d82ca49f1b579819c2974c61de4e3137c70b
and enabled by default since version 1.4.64 and
https://github.com/lighttpd/lighttpd1.4/commit/750414d3bb6f13c119220e56d0c8123e665dffc5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lighttpd/Config.in   | 2 +-
 package/lighttpd/lighttpd.mk | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 9f593a9228..ed674a9227 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -48,7 +48,7 @@ config BR2_PACKAGE_LIGHTTPD_BZIP2
 
 config BR2_PACKAGE_LIGHTTPD_PCRE
 	bool "pcre support"
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	help
 	  Enable PCRE support. Needed to support mod_rewrite
 
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index f0974dd5b2..2a05071209 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -26,6 +26,7 @@ LIGHTTPD_CONF_OPTS = \
 	-Dwith_mysql=false \
 	-Dwith_nettle=false \
 	-Dwith_nss=false \
+	-Dwith_pcre=false \
 	-Dwith_pgsql=false \
 	-Dwith_sasl=false \
 	-Dwith_wolfssl=false \
@@ -65,10 +66,10 @@ LIGHTTPD_CONF_OPTS += -Dwith_bzip=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_PCRE),y)
-LIGHTTPD_DEPENDENCIES += pcre
-LIGHTTPD_CONF_OPTS += -Dwith_pcre=true
+LIGHTTPD_DEPENDENCIES += pcre2
+LIGHTTPD_CONF_OPTS += -Dwith_pcre2=true
 else
-LIGHTTPD_CONF_OPTS += -Dwith_pcre=false
+LIGHTTPD_CONF_OPTS += -Dwith_pcre2=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_WEBDAV),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

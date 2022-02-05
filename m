Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42DDC433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 22:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B291408C0;
	Sat,  5 Feb 2022 22:57:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ny6fL9mSb8Pd; Sat,  5 Feb 2022 22:57:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D82E940895;
	Sat,  5 Feb 2022 22:57:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 676591BF95F
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A93281801
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:55:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ztlpX2Drfaq for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 22:55:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED1608186B
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 22:55:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DF05782AE5; Sat,  5 Feb 2022 22:47:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 5 Feb 2022 23:46:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1acae45658989922d799f0b668444217ef01e7a
X-Git-Newrev: b429dce6f8e2ee162b79fe2a3ebb1bd179f462e3
X-Patchwork-Hint: ignore
Message-Id: <20220205224746.DF05782AE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: add pgsql support
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

commit: https://git.buildroot.net/buildroot/commit/?id=b429dce6f8e2ee162b79fe2a3ebb1bd179f462e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lighttpd/Config.in   | 10 ++++++++++
 package/lighttpd/lighttpd.mk |  8 +++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index f46e1a9a66..b9f64a3bc3 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -80,6 +80,16 @@ config BR2_PACKAGE_LIGHTTPD_PCRE
 	help
 	  Enable PCRE support. Needed to support mod_rewrite
 
+config BR2_PACKAGE_LIGHTTPD_PGSQL
+	bool "pgsql support"
+	depends on BR2_USE_MMU # postgresql
+	select BR2_PACKAGE_POSTGRESQL
+	help
+	  Enable postgres support for lighttpd mod_vhostdb_pgsql.
+
+comment "pgsql support needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_LIGHTTPD_WEBDAV
 	bool "webdav support"
 	select BR2_PACKAGE_LIBXML2
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index f8ed7c6f7c..49ab8587f7 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -23,7 +23,6 @@ LIGHTTPD_CONF_OPTS = \
 	-Dwith_nettle=false \
 	-Dwith_nss=false \
 	-Dwith_pcre=false \
-	-Dwith_pgsql=false \
 	-Dwith_sasl=false \
 	-Dwith_wolfssl=false \
 	-Dwith_xattr=false \
@@ -95,6 +94,13 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_pcre2=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_PGSQL),y)
+LIGHTTPD_DEPENDENCIES += postgresql
+LIGHTTPD_CONF_OPTS += -Dwith_pgsql=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_pgsql=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_WEBDAV),y)
 LIGHTTPD_DEPENDENCIES += libxml2 sqlite
 LIGHTTPD_CONF_OPTS += -Dwith_webdav_props=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

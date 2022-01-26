Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39486C433F5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFE88415D1;
	Wed, 26 Jan 2022 21:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FYWbxC_N3_ja; Wed, 26 Jan 2022 21:05:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F16834159E;
	Wed, 26 Jan 2022 21:05:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 529081BF48B
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DE5F403A4
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:04:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 33egeDxCE_hm for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:04:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0040940A1C
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:04:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 954317FB5B; Wed, 26 Jan 2022 20:57:32 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 22:04:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c97efff6aa1acdf78acdc6d3783a37d7cdabc260
X-Git-Newrev: ef9a628c595695b875f7ca018e7e4a27564a1317
X-Patchwork-Hint: ignore
Message-Id: <20220126205732.954317FB5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: add krb5 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef9a628c595695b875f7ca018e7e4a27564a1317
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lighttpd/Config.in   | 6 ++++++
 package/lighttpd/lighttpd.mk | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 9a262dbe93..595c50c978 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -33,6 +33,12 @@ config BR2_PACKAGE_LIGHTTPD_BZIP2
 	help
 	  Enable bzip2 support for lighttpd mod_deflate.
 
+config BR2_PACKAGE_LIGHTTPD_KRB5
+	bool "krb5 support"
+	select BR2_PACKAGE_LIBKRB5
+	help
+	  Enable Kerberos5 support for lighttpd mod_auth.
+
 config BR2_PACKAGE_LIGHTTPD_LUA
 	bool "lua support"
 	depends on BR2_PACKAGE_LUA
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index b2e06c77a1..a25bb0bfcb 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -16,7 +16,6 @@ LIGHTTPD_CONF_OPTS = \
 	-Dwith_dbi=false \
 	-Dwith_fam=false \
 	-Dwith_gnutls=false \
-	-Dwith_krb5=false \
 	-Dwith_ldap=false \
 	-Dwith_libev=false \
 	-Dwith_libunwind=false \
@@ -48,6 +47,13 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_bzip=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_KRB5),y)
+LIGHTTPD_DEPENDENCIES += libkrb5
+LIGHTTPD_CONF_OPTS += -Dwith_krb5=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_krb5=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_LUA),y)
 LIGHTTPD_DEPENDENCIES += lua
 LIGHTTPD_CONF_OPTS += -Dwith_lua=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

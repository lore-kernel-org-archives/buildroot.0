Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98660C433F5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 558C083123;
	Wed, 26 Jan 2022 21:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Zx2SkGZllmQ; Wed, 26 Jan 2022 21:04:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80B96830C2;
	Wed, 26 Jan 2022 21:04:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E8031BF48B
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88B2783104
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hyfpPfE9mxVN for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:04:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8883830C2
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:04:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9DB7E82883; Wed, 26 Jan 2022 20:57:32 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 22:04:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef9a628c595695b875f7ca018e7e4a27564a1317
X-Git-Newrev: dd35a0578eeadaedf9b634086c9c979193aaa21f
X-Patchwork-Hint: ignore
Message-Id: <20220126205732.9DB7E82883@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: add ldap support
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd35a0578eeadaedf9b634086c9c979193aaa21f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lighttpd/Config.in   | 10 ++++++++++
 package/lighttpd/lighttpd.mk |  8 +++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 595c50c978..f46e1a9a66 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -39,6 +39,16 @@ config BR2_PACKAGE_LIGHTTPD_KRB5
 	help
 	  Enable Kerberos5 support for lighttpd mod_auth.
 
+config BR2_PACKAGE_LIGHTTPD_LDAP
+	bool "ldap support"
+	depends on BR2_USE_WCHAR # openldap
+	select BR2_PACKAGE_OPENLDAP
+	help
+	  Enable LDAP support for lighttpd mod_auth mod_vhostdb_ldap.
+
+comment "ldap support needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_LIGHTTPD_LUA
 	bool "lua support"
 	depends on BR2_PACKAGE_LUA
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index a25bb0bfcb..f8ed7c6f7c 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -16,7 +16,6 @@ LIGHTTPD_CONF_OPTS = \
 	-Dwith_dbi=false \
 	-Dwith_fam=false \
 	-Dwith_gnutls=false \
-	-Dwith_ldap=false \
 	-Dwith_libev=false \
 	-Dwith_libunwind=false \
 	-Dwith_mbedtls=false \
@@ -54,6 +53,13 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_krb5=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_LDAP),y)
+LIGHTTPD_DEPENDENCIES += openldap
+LIGHTTPD_CONF_OPTS += -Dwith_ldap=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_ldap=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_LUA),y)
 LIGHTTPD_DEPENDENCIES += lua
 LIGHTTPD_CONF_OPTS += -Dwith_lua=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

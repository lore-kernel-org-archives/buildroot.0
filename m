Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6C0C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60BC340135;
	Mon,  5 Feb 2024 17:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60BC340135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6pP-Vo2ja0sj; Mon,  5 Feb 2024 17:42:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5560C4018B;
	Mon,  5 Feb 2024 17:42:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5560C4018B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 947871BF3D6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A59660AE6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:42:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A59660AE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NZNBSNa0qUmD for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:42:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C700F606AA
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C700F606AA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B291286D93; Mon,  5 Feb 2024 17:42:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 18:26:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31b488337921d57c14893c34766ac22c53e5382b
X-Git-Newrev: 0a860f330a4ecd2fa442ea2a35e16c0f87611306
X-Patchwork-Hint: ignore
Message-Id: <20240205174221.B291286D93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libjwt: add gnutls support
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a860f330a4ecd2fa442ea2a35e16c0f87611306
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gnutls can be used if openssl is not available since the addition of the
package in commit 7251775773011e7da38e3a33c6817eceab6a9dfa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libjwt/Config.in |  2 +-
 package/libjwt/libjwt.mk | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/libjwt/Config.in b/package/libjwt/Config.in
index fa042d67ef..39d1665e0e 100644
--- a/package/libjwt/Config.in
+++ b/package/libjwt/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBJWT
 	bool "libjwt"
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_JANSSON
 	help
 	  JSON Web Tokens are an open, industry standard RFC 7519
diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
index 6ae1717b7d..7e2ea03b09 100644
--- a/package/libjwt/libjwt.mk
+++ b/package/libjwt/libjwt.mk
@@ -6,10 +6,18 @@
 
 LIBJWT_VERSION = 1.15.3
 LIBJWT_SITE = $(call github,benmcollins,libjwt,v$(LIBJWT_VERSION))
-LIBJWT_DEPENDENCIES = host-pkgconf jansson openssl
+LIBJWT_DEPENDENCIES = host-pkgconf jansson
 LIBJWT_AUTORECONF = YES
 LIBJWT_INSTALL_STAGING = YES
 LIBJWT_LICENSE = MPL-2.0
 LIBJWT_LICENSE_FILES = LICENSE
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBJWT_CONF_OPTS += --with-openssl
+LIBJWT_DEPENDENCIES += openssl
+else
+LIBJWT_CONF_OPTS += --without-openssl
+LIBJWT_DEPENDENCIES += gnutls
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

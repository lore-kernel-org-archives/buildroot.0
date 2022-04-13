Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63985C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 12:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D1EF60A9F;
	Wed, 13 Apr 2022 12:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XfXBCqjkNE0Q; Wed, 13 Apr 2022 12:18:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DA37600D4;
	Wed, 13 Apr 2022 12:18:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB15E1BF426
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 12:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9727600D4
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 12:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mCtcJD8VA2LI for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 12:18:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 272D4600CD
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 12:18:28 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1A97210001E;
 Wed, 13 Apr 2022 12:18:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nebx1-00AGyN-Q8; Wed, 13 Apr 2022 14:18:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Apr 2022 14:18:22 +0200
Message-Id: <20220413121822.2448474-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/subversion: security bump to version
 1.14.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

- CVE-2021-28544: SVN authz protected copyfrom paths regression

  Subversion servers reveal 'copyfrom' paths that should be hidden according
  to configured path-based authorization (authz) rules.  When a node has
  been copied from a protected location, users with access to the copy can
  see the `copyfrom' path of the original.  This also reveals the fact that
  the node was copied.  Only the 'copyfrom' path is revealed; not its
  contents.  Both httpd and svnserve servers are vulnerable.

  https://subversion.apache.org/security/CVE-2021-28544-advisory.txt

- CVE-2022-24070: Subversion's mod_dav_svn is vulnerable to memory corruption

  While looking up path-based authorization rules, mod_dav_svn servers may
  attempt to use memory which has already been freed.

  https://subversion.apache.org/security/CVE-2022-24070-advisory.txt

Drop no longer needed patch and autoreconf, as this is now fixed upstream:

https://svn.apache.org/viewvc?view=revision&revision=1881534

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-workaround-ac-run-ifelse.patch       | 23 -------------------
 package/subversion/subversion.hash            |  4 ++--
 package/subversion/subversion.mk              |  3 +--
 3 files changed, 3 insertions(+), 27 deletions(-)
 delete mode 100644 package/subversion/0001-workaround-ac-run-ifelse.patch

diff --git a/package/subversion/0001-workaround-ac-run-ifelse.patch b/package/subversion/0001-workaround-ac-run-ifelse.patch
deleted file mode 100644
index 4f229dc49b..0000000000
--- a/package/subversion/0001-workaround-ac-run-ifelse.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-build/ac-macros/macosx.m4: workaround AC_RUN_IFELSE
-
-The SVN_LIB_MACHO_ITERATE macro contains an AC_RUN_IFELSE test that
-doesn't work when cross-compiling. However, this macro is related to
-testing Mac OS X APIs, so in the context of Buildroot, we don't care,
-and the test program is not even going to build. So we simply
-workaround this by turning the test into an AC_COMPILE_IFELSE.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-
-Index: b/build/ac-macros/macosx.m4
-===================================================================
---- a/build/ac-macros/macosx.m4
-+++ b/build/ac-macros/macosx.m4
-@@ -24,7 +24,7 @@
- AC_DEFUN(SVN_LIB_MACHO_ITERATE,
- [
-   AC_MSG_CHECKING([for Mach-O dynamic module iteration functions])
--  AC_RUN_IFELSE([AC_LANG_PROGRAM([[
-+  AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
-     #include <mach-o/dyld.h>
-     #include <mach-o/loader.h>
-   ]],[[
diff --git a/package/subversion/subversion.hash b/package/subversion/subversion.hash
index 534d596514..d2239b1b5b 100644
--- a/package/subversion/subversion.hash
+++ b/package/subversion/subversion.hash
@@ -1,5 +1,5 @@
-# From https://www.apache.org/dist/subversion/subversion-1.14.1.tar.bz2.sha512
-sha512  0a70c7152b77cdbcb810a029263e4b3240b6ef41d1c19714e793594088d3cca758d40dfbc05622a806b06463becb73207df249393924ce591026b749b875fcdd  subversion-1.14.1.tar.bz2
+# From https://www.apache.org/dist/subversion/subversion-1.14.2.tar.bz2.sha512
+sha512  20ada4688ca07d9fb8da4b7d53b5084568652a3b9418c65e688886bae950a16a3ff37710fcfc9c29ef14a89e75b2ceec4e9cf35d5876a7896ebc2b512cfb9ecc  subversion-1.14.2.tar.bz2
 
 # Locally calculated
 sha256  484aff0cfbb81155a10f903ed756e27e9fc65578c245a295bae295c4bb51eaad  LICENSE
diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index d4cc717536..b27058c024 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUBVERSION_VERSION = 1.14.1
+SUBVERSION_VERSION = 1.14.2
 SUBVERSION_SOURCE = subversion-$(SUBVERSION_VERSION).tar.bz2
 SUBVERSION_SITE = https://downloads.apache.org/subversion
 SUBVERSION_LICENSE = Apache-2.0
@@ -20,7 +20,6 @@ SUBVERSION_DEPENDENCIES = \
 	zlib \
 	sqlite \
 	$(TARGET_NLS_DEPENDENCIES)
-SUBVERSION_AUTORECONF = YES
 SUBVERSION_CONF_OPTS = \
 	--with-expat=$(STAGING_DIR)/usr/include:$(STAGING_DIR)/usr/lib: \
 	--with-apr=$(STAGING_DIR)/usr \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

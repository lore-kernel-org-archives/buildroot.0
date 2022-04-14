Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D080C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ED0E82CD4;
	Thu, 14 Apr 2022 20:15:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nBq7HvyFdVNK; Thu, 14 Apr 2022 20:15:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5277882C3C;
	Thu, 14 Apr 2022 20:15:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 776D71BF393
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CB7C40A90
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:14:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WI3l35ykmYHE for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:14:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32B26404D7
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:14:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D408783D04; Thu, 14 Apr 2022 20:04:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 22:14:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 832107c6dc4b42ff35b09bfa60dddb5537821161
X-Git-Newrev: 89e51bc625d94fc5430be72894bd8fa4b1201ae5
X-Patchwork-Hint: ignore
Message-Id: <20220414200445.D408783D04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/subversion: security bump to
 version 1.14.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=89e51bc625d94fc5430be72894bd8fa4b1201ae5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
 .../subversion/0001-workaround-ac-run-ifelse.patch | 23 ----------------------
 package/subversion/subversion.hash                 |  4 ++--
 package/subversion/subversion.mk                   |  3 +--
 3 files changed, 3 insertions(+), 27 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

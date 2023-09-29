Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65434E728F0
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C9A783DA4;
	Fri, 29 Sep 2023 20:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C9A783DA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E-58yek8VMmu; Fri, 29 Sep 2023 20:11:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B2EC83D26;
	Fri, 29 Sep 2023 20:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B2EC83D26
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 808961BF2C5
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBDBB60F26
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBDBB60F26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AygsiA_ZwhH8 for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:11:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8F686162F
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8F686162F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B94228367A; Fri, 29 Sep 2023 20:11:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 22:11:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c076f3f1a661e8a8c4099e11d831712c70c076fc
X-Git-Newrev: 8cedb39764f70f9d467bf0cc1acc99a8bbb963d6
X-Patchwork-Hint: ignore
Message-Id: <20230929201131.B94228367A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/monit: update to 5.33.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8cedb39764f70f9d467bf0cc1acc99a8bbb963d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit updates monit to the latest 5.33.0 version which also
requires an additional patch to configure.ac as well as enabled ipv6
support.

Signed-off-by: Jens Maus <mail@jens-maus.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nfigure.ac-fixes-missing-config-macro-dir.patch | 44 ++++++++++++++++++++++
 package/monit/monit.hash                           |  4 +-
 package/monit/monit.mk                             | 10 +++--
 3 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch b/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
new file mode 100644
index 0000000000..325dcc17e1
--- /dev/null
+++ b/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
@@ -0,0 +1,44 @@
+From 2c06ecdc02de75a9e7e1e30e9c3d7d3a64269b7c Mon Sep 17 00:00:00 2001
+From: Jens Maus <mail@jens-maus.de>
+Date: Fri, 22 Sep 2023 21:32:18 +0200
+Subject: [PATCH] configure.ac: fixes missing config macro dir
+
+This adds the config dir to the AC_CONFIG_MACRO_DIRS in configure.ac
+so that m4 macros are properly loaded upon autoreconf use.
+
+Upstream: N/A (specific to buildroot)
+Signed-off-by: Jens Maus <mail@jens-maus.de>
+---
+ configure.ac          | 2 +-
+ libmonit/configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3c3d30a2..f4c5ea07 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -8,7 +8,7 @@ AC_PREREQ([2.53])
+ # Example: 5.0_beta2
+ AC_INIT([monit], [5.34.0], [monit-general@nongnu.org])
+ AC_CONFIG_AUX_DIR(config)
+-AC_CONFIG_MACRO_DIR([m4])
++AC_CONFIG_MACRO_DIRS([m4 config])
+ AM_INIT_AUTOMAKE
+ AC_CONFIG_SRCDIR([src/monit.c])
+ AC_CONFIG_SUBDIRS([libmonit])
+diff --git a/libmonit/configure.ac b/libmonit/configure.ac
+index d4cd0789..5366444a 100644
+--- a/libmonit/configure.ac
++++ b/libmonit/configure.ac
+@@ -4,7 +4,7 @@ AC_PREREQ([2.53])
+ 
+ AC_INIT([libmonit], [1.0], [monit-dev@tildeslash.com])
+ AC_CONFIG_AUX_DIR(config)
+-AC_CONFIG_MACRO_DIR([m4])
++AC_CONFIG_MACRO_DIRS([m4 config])
+ AM_INIT_AUTOMAKE
+ AC_CONFIG_SRCDIR([src])
+ 
+-- 
+2.34.1
+
diff --git a/package/monit/monit.hash b/package/monit/monit.hash
index 26d665c083..1d9feca57b 100644
--- a/package/monit/monit.hash
+++ b/package/monit/monit.hash
@@ -1,4 +1,4 @@
-# From https://mmonit.com/monit/dist/monit-5.26.0.tar.gz.sha256:
-sha256  87fc4568a3af9a2be89040efb169e3a2e47b262f99e78d5ddde99dd89f02f3c2  monit-5.26.0.tar.gz
+# From https://mmonit.com/monit/dist/monit-5.33.0.tar.gz.sha256
+sha256  1ace889c0183473a9d70160df6533bb6e1338dc1354f5928507803e1e2a863b5  monit-5.33.0.tar.gz
 # Locally computed
 sha256  d5a4f52b1a5e1e7fe14e01a76aac8b08dc6bbea15466058f271456c97aac1ada  COPYING
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 6d5d475813..ce0f5f0e92 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -4,26 +4,28 @@
 #
 ################################################################################
 
-MONIT_VERSION = 5.26.0
+MONIT_VERSION = 5.33.0
 MONIT_SITE = http://mmonit.com/monit/dist
 MONIT_LICENSE = AGPL-3.0 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
 MONIT_CPE_ID_VENDOR = mmonit
 MONIT_SELINUX_MODULES = monit
-#
+
 # Touching Makefile.am:
+# 0001-configure.ac-fixes-missing-config-macro-dir.patch touches configure.ac
 MONIT_AUTORECONF = YES
 
 MONIT_CONF_ENV = \
 	libmonit_cv_setjmp_available=yes \
-	libmonit_cv_vsnprintf_c99_conformant=yes
+	libmonit_cv_vsnprintf_c99_conformant=yes \
+	ac_cv_ipv6=yes
 
 MONIT_CONF_OPTS += \
 	--without-pam \
 	--with-largefiles
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-MONIT_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
+MONIT_CONF_OPTS += --with-ssl --with-ssl-dir=$(STAGING_DIR)/usr
 MONIT_DEPENDENCIES += openssl
 else
 MONIT_CONF_OPTS += --without-ssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

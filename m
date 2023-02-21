Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E01EC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 17:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF0336F98A;
	Tue, 21 Feb 2023 17:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF0336F98A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y6ISfD5YwKwl; Tue, 21 Feb 2023 17:23:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFAE561B25;
	Tue, 21 Feb 2023 17:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFAE561B25
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A72171BF956
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 17:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8173361245
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 17:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8173361245
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MQUoEmhNhckV for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 17:22:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F7C161202
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F7C161202
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 17:22:20 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id D666921711;
 Tue, 21 Feb 2023 11:22:18 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 11:21:59 -0600
Message-Id: <20230221172205.2450111-9-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221172205.2450111-1-vfazio@xes-inc.com>
References: <20230221172205.2450111-1-vfazio@xes-inc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1677000138; bh=rEzsobFEhWPgF93lLzyfdYTVw2CM+d9VCynUOye6pZc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cUQ3FyvDuSGLInSg3rgI+IxkuTIcnBd00gR+lDlyDEFTTb+xpbJ5CZGXBNFLOrZsW
 PgZmLMXPmIbYNLd2Ns5e9rTJbEnf7SvwDXs+StCHlFZgQEItjovYOKXvVvJZeyGVtG
 AISU7I+j7FOUT7wwbl8Ka58x3kQHRB+VRQmaIz8A=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=cUQ3FyvD
Subject: [Buildroot] [PATCH 09/15] package/libuio: migrate to new autopoint
 flag
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vincent Fazio <vfazio@gmail.com>

Drop patch that is no longer necessary after moving to new package flag.
Add patch to fix builds due to missing required files.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 ...0001-configure-remove-po-Makefile.in.patch | 26 ----------------
 ...c-set-automake-strictness-to-foreign.patch | 31 +++++++++++++++++++
 package/libuio/libuio.mk                      |  2 +-
 3 files changed, 32 insertions(+), 27 deletions(-)
 delete mode 100644 package/libuio/0001-configure-remove-po-Makefile.in.patch
 create mode 100644 package/libuio/0001-configure.ac-set-automake-strictness-to-foreign.patch

diff --git a/package/libuio/0001-configure-remove-po-Makefile.in.patch b/package/libuio/0001-configure-remove-po-Makefile.in.patch
deleted file mode 100644
index 067465cc31..0000000000
--- a/package/libuio/0001-configure-remove-po-Makefile.in.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From c5fa0b778e1c2a7d03ff6e661bdfa2faef878f68 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Fri, 1 Jul 2016 17:56:30 +0200
-Subject: [PATCH] configure: remove po/Makefile.in
-
-The file po/Makefile.in is automatically added to AC_OUTPUT while using gettexize
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- configure.ac | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index f7fb40f..a25e463 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -55,5 +55,4 @@ dnl last but not least
- AC_OUTPUT([Makefile
- 	libuio.dox
- 	libuio-uninstalled.pc
--	libuio.pc
--	po/Makefile.in])
-+	libuio.pc])
--- 
-2.5.5
-
diff --git a/package/libuio/0001-configure.ac-set-automake-strictness-to-foreign.patch b/package/libuio/0001-configure.ac-set-automake-strictness-to-foreign.patch
new file mode 100644
index 0000000000..1ce91f01f3
--- /dev/null
+++ b/package/libuio/0001-configure.ac-set-automake-strictness-to-foreign.patch
@@ -0,0 +1,31 @@
+From 546e07b2405455c03b7eb0d392c331e189913bc4 Mon Sep 17 00:00:00 2001
+From: Vincent Fazio <vfazio@xes-inc.com>
+Date: Tue, 31 Jan 2023 19:06:29 -0600
+Subject: [PATCH] configure.ac: set automake strictness to foreign
+
+libuio does not conform to the GNU's strict layout requirements. [1]
+
+Set the strictness to foreign to account for this.
+
+[1] https://www.gnu.org/software/automake/manual/html_node/Strictness.html
+
+Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 101abd3..ef46171 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,6 +1,6 @@
+ dnl Every other copy of the package version number gets its value from here
+ AC_INIT(libuio, 0.2.8, https://github.com/linutronix/libuio/issues)
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
+ 
+ AM_CONFIG_HEADER(config.h)
+ 
+-- 
+2.25.1
+
diff --git a/package/libuio/libuio.mk b/package/libuio/libuio.mk
index a0285277ab..d5019af594 100644
--- a/package/libuio/libuio.mk
+++ b/package/libuio/libuio.mk
@@ -14,7 +14,7 @@ LIBUIO_LIBS = $(TARGET_NLS_LIBS)
 LIBUIO_INSTALL_STAGING = YES
 
 # Fetched from github, no pre-generated configure script provided
-LIBUIO_GETTEXTIZE = YES
+LIBUIO_AUTOPOINT = YES
 LIBUIO_AUTORECONF = YES
 
 # Avoid build issue when makeinfo is missing
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

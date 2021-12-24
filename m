Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CF6C433F5
	for <buildroot@archiver.kernel.org>; Fri, 24 Dec 2021 17:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D158D400DA;
	Fri, 24 Dec 2021 17:13:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hI_WZcTlO7eg; Fri, 24 Dec 2021 17:13:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 983F540125;
	Fri, 24 Dec 2021 17:13:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D4F681BF2A4
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 17:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC04A83DFD
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 17:13:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o_k_Wd6DAP_I for <buildroot@lists.busybox.net>;
 Fri, 24 Dec 2021 17:13:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EACB83DFB
 for <buildroot@buildroot.org>; Fri, 24 Dec 2021 17:13:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D795082975; Fri, 24 Dec 2021 17:07:45 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 24 Dec 2021 11:36:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c94dd92c0ff28ad72a1f9cda2d3b06d654617d40
X-Git-Newrev: 733bf73e3ff86dd80e68e22c0ccc2f43e4a3d475
X-Patchwork-Hint: ignore
Message-Id: <20211224170745.D795082975@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lttng-libust: bump to version
 2.13.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=733bf73e3ff86dd80e68e22c0ccc2f43e4a3d475
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to disable building tests, building the tests can
fail unless the package is reconfigured.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-configure.ac-add-disable-tests.patch      | 59 ++++++++++++++++++++++
 package/lttng-libust/lttng-libust.hash             |  4 +-
 package/lttng-libust/lttng-libust.mk               |  4 +-
 3 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/package/lttng-libust/0001-configure.ac-add-disable-tests.patch b/package/lttng-libust/0001-configure.ac-add-disable-tests.patch
new file mode 100644
index 0000000000..bb962000b4
--- /dev/null
+++ b/package/lttng-libust/0001-configure.ac-add-disable-tests.patch
@@ -0,0 +1,59 @@
+From a1f8509283ad29b5144bda6f6dba9f5eb7165adc Mon Sep 17 00:00:00 2001
+From: Norbert Lange <nolange79@gmail.com>
+Date: Thu, 23 Dec 2021 21:56:46 +0100
+Subject: [PATCH] configure.ac: add --disable-tests
+
+Add configure option to disable tests.
+Upstream is not likely to accept it, see lttng-tools package.
+
+Signed-off-by: Norbert Lange <nolange79@gmail.com>
+---
+ Makefile.am  | 5 ++++-
+ configure.ac | 6 ++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 9ab93ccd..8a1c1dca 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -7,9 +7,12 @@ SUBDIRS = \
+ 	src \
+ 	tools \
+ 	doc \
+-	tests \
+ 	extras
+ 
++if ENABLE_TESTS
++SUBDIRS += tests
++endif
++
+ dist_doc_DATA = \
+ 	ChangeLog \
+ 	LICENSE \
+diff --git a/configure.ac b/configure.ac
+index b6254228..fe5f2700 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -360,6 +360,11 @@ AE_FEATURE([python-agent],[build the LTTng UST Python agent])
+ AE_FEATURE_DEFAULT_ENABLE
+ AE_FEATURE([examples],[Do not build and install examples])
+ 
++# Build the tests
++# Enabled by default
++AE_FEATURE_DEFAULT_ENABLE
++AE_FEATURE([tests],[Do not build tests])
++
+ # Man pages
+ # Enabled by default
+ AE_FEATURE_DEFAULT_ENABLE
+@@ -525,6 +530,7 @@ AC_DEFINE([LTTNG_UST_CTL_LIB_SONAME_MAJOR], [ust_ctl_lib_version_current], [Majo
+ ##                                                                          ##
+ 
+ AM_CONDITIONAL([ENABLE_EXAMPLES], AE_IS_FEATURE_ENABLED([examples]))
++AM_CONDITIONAL([ENABLE_TESTS], AE_IS_FEATURE_ENABLED([tests]))
+ AM_CONDITIONAL([ENABLE_GEN_TP_EXAMPLES], [test "x$PYTHON" != "x"])
+ AM_CONDITIONAL([ENABLE_JAVA_AGENT], AE_IS_FEATURE_ENABLED([java-agent-jul]) || AE_IS_FEATURE_ENABLED([java-agent-log4j]))
+ AM_CONDITIONAL([ENABLE_JAVA_AGENT_WITH_JUL], AE_IS_FEATURE_ENABLED([java-agent-jul]))
+-- 
+2.34.1
+
diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
index 40bd870e86..23839e42cc 100644
--- a/package/lttng-libust/lttng-libust.hash
+++ b/package/lttng-libust/lttng-libust.hash
@@ -1,5 +1,5 @@
-# From https://lttng.org/files/lttng-ust/lttng-ust-2.12.1.tar.bz2.sha256
-sha256  48a3948b168195123a749d22818809bd25127bb5f1a66458c3c012b210d2a051  lttng-ust-2.12.1.tar.bz2
+# From https://lttng.org/files/lttng-ust/lttng-ust-2.13.2.tar.bz2.sha256
+sha256  5667bf0269e1e62e2d9cb974c456ff86e0401bd7aa3bfc8d5fdb97233249eddc  lttng-ust-2.13.1.tar.bz2
 
 # Hash for license file
 sha256  74125a84c2166300776980166e29de40d5f98d1a75e487f0bbc0c03b4cd2342e  COPYING
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 608e8781b1..e3e1cdebf2 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
-LTTNG_LIBUST_VERSION = 2.12.1
+LTTNG_LIBUST_VERSION = 2.13.1
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPL-2.1, MIT (system headers), GPL-2.0 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
@@ -14,7 +14,9 @@ LTTNG_LIBUST_DEPENDENCIES = liburcu util-linux
 LTTNG_LIBUST_CONF_OPTS = \
 	--disable-man-pages \
 	--disable-examples \
+	--disable-tests \
 	--with-lttng-system-rundir=/run/lttng
+LTTNG_LIBUST_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 LTTNG_LIBUST_DEPENDENCIES += python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

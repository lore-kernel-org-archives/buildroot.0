Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45771C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 20:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDB9A60A74;
	Sat,  5 Nov 2022 20:39:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDB9A60A74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iDemIRnzPwTE; Sat,  5 Nov 2022 20:39:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55EF7607F6;
	Sat,  5 Nov 2022 20:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55EF7607F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 807161BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 691218183D
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 691218183D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id piehhc13Gxol for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 20:38:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F84781819
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 20:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F84781819
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0900987E38; Sat,  5 Nov 2022 20:38:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 21:38:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: adf4d6f7295b08b177a01d177a3f0a54e1f20f4c
X-Git-Newrev: c153a318ae203913cb2211964ca35c6880a68552
X-Patchwork-Hint: ignore
Message-Id: <20221105203853.0900987E38@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libqb: disable tests
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c153a318ae203913cb2211964ca35c6880a68552
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable tests to avoid the following build failure when check is
enabled:

libstat_wrapper.c:11:10: fatal error: gnu/lib-names.h: No such file or directory
   11 | #include <gnu/lib-names.h>
      |          ^~~~~~~~~~~~~~~~~

This build failure is raised since bump to version 2.0.6 in commit
2ee1bd7bb2e8d01f4ddca3fb1127ec729be1c9bf and
https://github.com/ClusterLabs/libqb/commit/78df90b180740712d0c90b6d982b78241cc99d72

Fixes:
 - http://autobuild.buildroot.org/results/450cfc36d4fd6dc71c138bec45f05b5a2d92a08d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libqb/0001-Add-disable-tests-option.patch | 62 +++++++++++++++++++++++
 package/libqb/libqb.mk                            |  3 ++
 2 files changed, 65 insertions(+)

diff --git a/package/libqb/0001-Add-disable-tests-option.patch b/package/libqb/0001-Add-disable-tests-option.patch
new file mode 100644
index 0000000000..1afb05520d
--- /dev/null
+++ b/package/libqb/0001-Add-disable-tests-option.patch
@@ -0,0 +1,62 @@
+From 051d9cfe8f365e30affc6476ed79b9e04a6b15ad Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 4 Nov 2022 00:27:50 +0100
+Subject: [PATCH] Add --disable-tests option
+
+Add --disable-tests to allow the user to disable tests. As a
+side-effect, this will avoid the following build failure when check is
+found:
+
+libstat_wrapper.c:11:10: fatal error: gnu/lib-names.h: No such file or directory
+   11 | #include <gnu/lib-names.h>
+      |          ^~~~~~~~~~~~~~~~~
+
+This build failure is raised since version 2.0.5 and
+https://github.com/ClusterLabs/libqb/commit/78df90b180740712d0c90b6d982b78241cc99d72
+
+Fixes:
+ - http://autobuild.buildroot.org/results/450cfc36d4fd6dc71c138bec45f05b5a2d92a08d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/ClusterLabs/libqb/pull/475]
+---
+ Makefile.am  | 6 +++++-
+ configure.ac | 5 +++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index a08b1d2..6a710a0 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -39,7 +39,11 @@ ACLOCAL_AMFLAGS		= -I m4
+ 
+ dist_doc_DATA		= COPYING INSTALL README.markdown
+ 
+-SUBDIRS			= include lib doxygen2man docs tools tests examples
++SUBDIRS			= include lib doxygen2man docs tools examples
++
++if ENABLE_TESTS
++SUBDIRS			+= tests
++endif
+ 
+ dist-clean-local:
+ 	rm -f .snapshot-version autoconf automake autoheader
+diff --git a/configure.ac b/configure.ac
+index ac44b7e..4946008 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -562,6 +562,11 @@ AC_ARG_WITH([force-sockets-config-file],
+ 	[ FORCESOCKETSFILE="$withval" ],
+ 	[ FORCESOCKETSFILE="$sysconfdir/libqb/force-filesystem-sockets" ])
+ 
++AC_ARG_ENABLE([tests],
++  [AS_HELP_STRING([--disable-tests],[disable tests])],,
++  [ enable_tests="yes" ])
++AM_CONDITIONAL([ENABLE_TESTS], [test x$enable_tests = xyes])
++
+ AC_ARG_ENABLE([install-tests],
+   [AS_HELP_STRING([--enable-install-tests],[install tests])],,
+   [ enable_install_tests="no" ])
+-- 
+2.35.1
+
diff --git a/package/libqb/libqb.mk b/package/libqb/libqb.mk
index 0f409fd646..65d68181ee 100644
--- a/package/libqb/libqb.mk
+++ b/package/libqb/libqb.mk
@@ -12,6 +12,9 @@ LIBQB_LICENSE = LGPL-2.1+
 LIBQB_LICENSE_FILES = COPYING
 LIBQB_CPE_ID_VENDOR = clusterlabs
 LIBQB_INSTALL_STAGING = YES
+# We're patching configure.ac
+LIBQB_AUTORECONF = YES
+LIBQB_CONF_OPTS = --disable-tests
 LIBQB_DEPENDENCIES = libxml2
 
 # ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14B0C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 19:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84D876110F;
	Tue, 25 Jul 2023 19:14:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84D876110F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AVKYG-Mj58Cu; Tue, 25 Jul 2023 19:14:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85FE161123;
	Tue, 25 Jul 2023 19:14:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85FE161123
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 360EE1BF83B
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 19:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1075D818C9
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 19:14:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1075D818C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qM1UIbNRe3xn for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 19:14:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D55381815
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 19:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D55381815
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE71D82965; Tue, 25 Jul 2023 19:14:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 21:14:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd59fde23489d6afae5d16934eb243729bde07c3
X-Git-Newrev: e83a15172591fee73f1dff10d145ea56cbc4dc60
X-Patchwork-Hint: ignore
Message-Id: <20230725191449.EE71D82965@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opensc: disable tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=e83a15172591fee73f1dff10d145ea56cbc4dc60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/50b/50b6962ccd884a91391d13ee75852dd0e9ea1a84/

This error only occurs when building with BR2_SHARED_STATIC_LIBS=y, it
fails for src/tests/fuzzing/fuzz_pkcs15init which is only available when
static linking is enabled:
https://github.com/OpenSC/OpenSC/blob/master/src/tests/fuzzing/Makefile.am#L14

The upstream build system has no support to extract the correct ldflags
for libatomic.so provided by libcrypto.pc. Because we do not need the
tests anyway we just disable them to "fix" the build error for us.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...003-configure-add-option-to-disable-tests.patch | 67 ++++++++++++++++++++++
 package/opensc/opensc.mk                           |  4 +-
 2 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/package/opensc/0003-configure-add-option-to-disable-tests.patch b/package/opensc/0003-configure-add-option-to-disable-tests.patch
new file mode 100644
index 0000000000..29342026c1
--- /dev/null
+++ b/package/opensc/0003-configure-add-option-to-disable-tests.patch
@@ -0,0 +1,67 @@
+From 3c3ed2ecbf31d41b6e5406da55971b9d9eaa3388 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Mon, 24 Jul 2023 22:28:11 +0200
+Subject: [PATCH] configure: add option to disable tests
+
+Upstream: https://github.com/OpenSC/OpenSC/pull/2822
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.ac    | 9 +++++++++
+ src/Makefile.am | 6 +++++-
+ 2 files changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0a90445b..9b7543da 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -272,6 +272,13 @@ AC_ARG_ENABLE(
+ 	[enable_doc="no"]
+ )
+ 
++AC_ARG_ENABLE(
++	[tests],
++	[AS_HELP_STRING([--enable-tests],[enable tests @<:@enabled@:>@])],
++	,
++	[enable_tests="yes"]
++)
++
+ AC_ARG_ENABLE(
+ 	[dnie-ui],
+ 	[AS_HELP_STRING([--enable-dnie-ui],[enable use of external user interface program to request DNIe pin@<:@disabled@:>@])],
+@@ -1119,6 +1126,7 @@ AM_CONDITIONAL([ENABLE_NOTIFY], [test "${enable_notify}" = "yes"])
+ AM_CONDITIONAL([ENABLE_CRYPTOTOKENKIT], [test "${enable_cryptotokenkit}" = "yes"])
+ AM_CONDITIONAL([ENABLE_OPENCT], [test "${enable_openct}" = "yes"])
+ AM_CONDITIONAL([ENABLE_DOC], [test "${enable_doc}" = "yes"])
++AM_CONDITIONAL([ENABLE_TESTS], [test "${enable_tests}" = "yes"])
+ AM_CONDITIONAL([WIN32], [test "${WIN32}" = "yes"])
+ AM_CONDITIONAL([CYGWIN], [test "${CYGWIN}" = "yes"])
+ AM_CONDITIONAL([ENABLE_MINIDRIVER], [test "${enable_minidriver}" = "yes"])
+@@ -1213,6 +1221,7 @@ XSL stylesheets:         ${xslstylesheetsdir}
+ 
+ man support:             ${enable_man}
+ doc support:             ${enable_doc}
++tests:                   ${enable_tests}
+ thread locking support:  ${enable_thread_locking}
+ zlib support:            ${enable_zlib}
+ readline support:        ${enable_readline}
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 3ce465bf..bf71b61f 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -3,7 +3,11 @@ EXTRA_DIST = Makefile.mak
+ 
+ # Order IS important
+ SUBDIRS = common scconf ui pkcs15init sm \
+-		  libopensc pkcs11 tools minidriver tests
++		  libopensc pkcs11 tools minidriver
++
++if ENABLE_TESTS
++SUBDIRS += tests
++endif
+ 
+ if ENABLE_SM
+ SUBDIRS += smm
+-- 
+2.39.2
+
diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
index 253b6b26f8..32f0fdaa8b 100644
--- a/package/opensc/opensc.mk
+++ b/package/opensc/opensc.mk
@@ -9,8 +9,10 @@ OPENSC_SITE = https://github.com/OpenSC/OpenSC/releases/download/$(OPENSC_VERSIO
 OPENSC_LICENSE = LGPL-2.1+
 OPENSC_LICENSE_FILES = COPYING
 OPENSC_CPE_ID_VENDOR = opensc_project
+# 0003-configure-add-option-to-disable-tests.patch
+OPENSC_AUTORECONF = YES
 OPENSC_DEPENDENCIES = openssl pcsc-lite
 OPENSC_INSTALL_STAGING = YES
-OPENSC_CONF_OPTS = --disable-cmocka --disable-strict
+OPENSC_CONF_OPTS = --disable-cmocka --disable-strict --disable-tests
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

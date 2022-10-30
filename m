Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05C2ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 19:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98327812A4;
	Sun, 30 Oct 2022 19:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98327812A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vhYwR0HlLVDp; Sun, 30 Oct 2022 19:44:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA5518128D;
	Sun, 30 Oct 2022 19:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA5518128D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BE541BF2A1
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2D4760594
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2D4760594
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rkdOU-JTaW3n for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 19:43:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFCAE60596
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 19:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFCAE60596
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB43F87604; Sun, 30 Oct 2022 19:43:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 20:39:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7935e427bce601f16ee194978583e533213f78c6
X-Git-Newrev: 28497102e1788df3628bd3324a3304a03c7942d0
X-Patchwork-Hint: ignore
Message-Id: <20221030194324.BB43F87604@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-lib: topology modules need
 dynamic library support
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

commit: https://git.buildroot.net/buildroot/commit/?id=28497102e1788df3628bd3324a3304a03c7942d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With this new option we can remove a patch from alsa-utils which fixed
its static build. A static build of topology modules is not supported
by upstream however:

"Note that it does not make sense to build static topology modules.
 They are not usable."
https://github.com/alsa-project/alsa-utils/issues/152#issuecomment-1144485929

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/alsa-lib/Config.in                         |  5 +++
 package/alsa-lib/alsa-lib.mk                       |  3 ++
 ...03-configure.ac-fix-build-without-dlfcn.h.patch | 48 ----------------------
 package/alsa-utils/alsa-utils.mk                   |  3 --
 4 files changed, 8 insertions(+), 51 deletions(-)

diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index af3de984d9..447916a29f 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -80,4 +80,9 @@ config BR2_PACKAGE_ALSA_LIB_OLD_SYMBOLS
 	bool "old-symbols"
 	default y
 
+config BR2_PACKAGE_ALSA_LIB_TOPOLOGY
+	bool "topology"
+	default y
+	depends on !BR2_STATIC_LIBS
+
 endif
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index f3ed195a5c..659ec26ba3 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -58,6 +58,9 @@ endif
 ifneq ($(BR2_PACKAGE_ALSA_LIB_OLD_SYMBOLS),y)
 ALSA_LIB_CONF_OPTS += --disable-old-symbols
 endif
+ifneq ($(BR2_PACKAGE_ALSA_LIB_TOPOLOGY),y)
+ALSA_LIB_CONF_OPTS += --disable-topology
+endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PYTHON),y)
 ALSA_LIB_CONF_OPTS += \
diff --git a/package/alsa-utils/0003-configure.ac-fix-build-without-dlfcn.h.patch b/package/alsa-utils/0003-configure.ac-fix-build-without-dlfcn.h.patch
deleted file mode 100644
index 69dae5102c..0000000000
--- a/package/alsa-utils/0003-configure.ac-fix-build-without-dlfcn.h.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 0e74339bf0751932abf6aa49bf07aa1c035f9ec6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 14 Aug 2022 20:31:30 +0200
-Subject: [PATCH] configure.ac: fix build without dlfcn.h
-
-Fix the following static build failure (i.e. without dlfcn.h) raised
-since version 1.2.7 and
-https://github.com/alsa-project/alsa-utils/commit/44d3e8aa44fc12f95bfeef0e3a1051e8f77047b5:
-
-pre-processor.c:28:10: fatal error: dlfcn.h: No such file or directory
-   28 | #include <dlfcn.h>
-      |          ^~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/1173a1ee28a58ce565a3274f35e868c35bb2e04e
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/alsa-project/alsa-utils/pull/165]
----
- configure.ac | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 20cbb68..6833800 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -27,6 +27,9 @@ AC_CHECK_FUNC([snd_ctl_elem_add_enumerated],
- 	      , [AC_ERROR([No user enum control support in alsa-lib])])
- fi
- 
-+
-+AC_CHECK_HEADERS([dlfcn.h])
-+
- dnl Check components
- AC_CHECK_HEADERS([alsa/pcm.h], [have_pcm="yes"], [have_pcm="no"],
-   [#include <alsa/asoundlib.h>])
-@@ -74,7 +77,7 @@ AM_CONDITIONAL(HAVE_MIXER, test "$have_mixer" = "yes")
- AM_CONDITIONAL(HAVE_RAWMIDI, test "$have_rawmidi" = "yes")
- AM_CONDITIONAL(HAVE_SEQ, test "$have_seq" = "yes")
- AM_CONDITIONAL(HAVE_UCM, test "$have_ucm" = "yes")
--AM_CONDITIONAL(HAVE_TOPOLOGY, test "$have_topology" = "yes")
-+AM_CONDITIONAL(HAVE_TOPOLOGY, test "$have_topology" = "yes" -a "$ac_cv_header_dlfcn_h" = "yes")
- AM_CONDITIONAL(HAVE_SAMPLERATE, test "$have_samplerate" = "yes")
- AM_CONDITIONAL(HAVE_FFADO, test "$have_ffado" = "yes")
- 
--- 
-2.35.1
-
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 1b16a2457a..65a7853c79 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -15,9 +15,6 @@ ALSA_UTILS_DEPENDENCIES = host-pkgconf alsa-lib \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
 	$(TARGET_NLS_DEPENDENCIES)
 
-# We're patching configure.ac
-ALSA_UTILS_AUTORECONF = YES
-
 ifeq ($(BR2_PACKAGE_ALSA_UTILS_ALSACTL),y)
 ALSA_UTILS_SELINUX_MODULES += alsa
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862A4C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 19:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 161B360AE0;
	Sun, 30 Oct 2022 19:33:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 161B360AE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2pQsA0IfqXul; Sun, 30 Oct 2022 19:33:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25B2960888;
	Sun, 30 Oct 2022 19:33:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25B2960888
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CEB91BF2A1
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D736460ADC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D736460ADC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O3eOl9PmmXXu for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 19:33:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CB1260888
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CB1260888
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 19:33:12 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout01.t-online.de (Postfix) with SMTP id 6275D7953;
 Sun, 30 Oct 2022 20:33:10 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.145]) by fwd85.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1opE3P-13W2SX0; Sun, 30 Oct 2022 20:33:07 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:48156)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1opE3P-00052M-0n;
 Sun, 30 Oct 2022 20:33:07 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 20:33:04 +0100
Message-Id: <20221030193307.1190297-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667158387-2D8B7EA1-14D9C4B0/0/0 CLEAN NORMAL
X-TOI-MSGID: e0ab74fa-2adb-4dad-8b0f-e71755583dfe
Subject: [Buildroot] [PATCH v2 1/4] package/alsa-lib: topology modules need
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
Cc: Charles Hardin <ckhardin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With this new option we can remove a patch from alsa-utils which fixed
its static build. A static build of topology modules is not supported
by upstream however:

"Note that it does not make sense to build static topology modules.
 They are not usable."
https://github.com/alsa-project/alsa-utils/issues/152#issuecomment-1144485929

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added new Config.in option (Thomas)

 package/alsa-lib/Config.in                    |  5 ++
 package/alsa-lib/alsa-lib.mk                  |  3 ++
 ...nfigure.ac-fix-build-without-dlfcn.h.patch | 48 -------------------
 package/alsa-utils/alsa-utils.mk              |  3 --
 4 files changed, 8 insertions(+), 51 deletions(-)
 delete mode 100644 package/alsa-utils/0003-configure.ac-fix-build-without-dlfcn.h.patch

diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index af3de984d9..c6fb501d07 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -80,4 +80,9 @@ config BR2_PACKAGE_ALSA_LIB_OLD_SYMBOLS
 	bool "old-symbols"
 	default y
 
+config BR2_PACKAGE_ALSA_LIB_TOPOLOGY
+	bool "topology"
+	depends on !BR2_STATIC_LIBS
+	default y
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

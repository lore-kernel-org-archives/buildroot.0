Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859FEC38A02
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 19:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E94A60B97;
	Fri, 28 Oct 2022 19:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E94A60B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nyhikoaJq9Ea; Fri, 28 Oct 2022 19:16:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FFD7606FF;
	Fri, 28 Oct 2022 19:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FFD7606FF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E01A71BF859
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 19:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C83A241499
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 19:16:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C83A241499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZjG8ZaUPPmhh for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 19:16:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2968B41296
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2968B41296
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 19:16:00 +0000 (UTC)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout02.t-online.de (Postfix) with SMTP id BC0AD21C9;
 Fri, 28 Oct 2022 21:15:29 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.199.226]) by fwd78.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1ooUpC-3c8EXB0; Fri, 28 Oct 2022 21:15:26 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:52200)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1ooUpC-0003Fh-1M;
 Fri, 28 Oct 2022 21:15:26 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 21:15:23 +0200
Message-Id: <20221028191526.122405-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1666984526-6B7FA9DD-7A9A05E0/0/0 CLEAN NORMAL
X-TOI-MSGID: 2029a703-9a53-42e5-99e1-404ba8f43b86
Subject: [Buildroot] [PATCH 1/4] package/alsa-lib: disable topology modules
 for static builds
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

With this fix to alsa-lib we can remove a patch from alsa-utils which
fixed its static build. A static build of topology modules is not
supported by upstream however:

"Note that it does not make sense to build static topology modules.
 They are not usable."
https://github.com/alsa-project/alsa-utils/issues/152#issuecomment-1144485929

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/alsa-lib/alsa-lib.mk                  |  1 +
 ...nfigure.ac-fix-build-without-dlfcn.h.patch | 48 -------------------
 package/alsa-utils/alsa-utils.mk              |  3 --
 3 files changed, 1 insertion(+), 51 deletions(-)
 delete mode 100644 package/alsa-utils/0003-configure.ac-fix-build-without-dlfcn.h.patch

diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index f3ed195a5c..6e474aa5e2 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -25,6 +25,7 @@ endif
 # Can't build with static & shared at the same time (1.0.25+)
 ifeq ($(BR2_STATIC_LIBS),y)
 ALSA_LIB_CONF_OPTS += \
+	--disable-topology \
 	--enable-shared=no \
 	--without-libdl
 else
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

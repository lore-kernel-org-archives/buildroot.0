Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04FEC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 13:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51C1F40B03;
	Mon, 15 Aug 2022 13:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51C1F40B03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m91ZsBGUjKxF; Mon, 15 Aug 2022 13:57:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B16040AF9;
	Mon, 15 Aug 2022 13:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B16040AF9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66CE31BF31B
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 13:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4926E83F65
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 13:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4926E83F65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id icOOx-IN8KuF for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 13:57:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5FFE83EB0
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 13:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5FFE83EB0
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 509AD8764A; Mon, 15 Aug 2022 13:42:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 15:57:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a969e0f63ce7c9f500286deb5d5f5c8259bdc3f2
X-Git-Newrev: 085407351ddd46c6e2a51ded6df3a0e11e31c2c9
X-Patchwork-Hint: ignore
Message-Id: <20220815134259.509AD8764A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-utils: fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=085407351ddd46c6e2a51ded6df3a0e11e31c2c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

alsatplg needs dynamic library since bump to version 1.2.7 in commit
4dc8563363d639255217ffc59482eaccf93a1b51 and
https://github.com/alsa-project/alsa-utils/commit/44d3e8aa44fc12f95bfeef0e3a1051e8f77047b5:

pre-processor.c:28:10: fatal error: dlfcn.h: No such file or directory
   28 | #include <dlfcn.h>
      |          ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/1173a1ee28a58ce565a3274f35e868c35bb2e04e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...03-configure.ac-fix-build-without-dlfcn.h.patch | 48 ++++++++++++++++++++++
 package/alsa-utils/Config.in                       |  4 ++
 package/alsa-utils/alsa-utils.mk                   |  3 ++
 3 files changed, 55 insertions(+)

diff --git a/package/alsa-utils/0003-configure.ac-fix-build-without-dlfcn.h.patch b/package/alsa-utils/0003-configure.ac-fix-build-without-dlfcn.h.patch
new file mode 100644
index 0000000000..69dae5102c
--- /dev/null
+++ b/package/alsa-utils/0003-configure.ac-fix-build-without-dlfcn.h.patch
@@ -0,0 +1,48 @@
+From 0e74339bf0751932abf6aa49bf07aa1c035f9ec6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 14 Aug 2022 20:31:30 +0200
+Subject: [PATCH] configure.ac: fix build without dlfcn.h
+
+Fix the following static build failure (i.e. without dlfcn.h) raised
+since version 1.2.7 and
+https://github.com/alsa-project/alsa-utils/commit/44d3e8aa44fc12f95bfeef0e3a1051e8f77047b5:
+
+pre-processor.c:28:10: fatal error: dlfcn.h: No such file or directory
+   28 | #include <dlfcn.h>
+      |          ^~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1173a1ee28a58ce565a3274f35e868c35bb2e04e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/alsa-project/alsa-utils/pull/165]
+---
+ configure.ac | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 20cbb68..6833800 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -27,6 +27,9 @@ AC_CHECK_FUNC([snd_ctl_elem_add_enumerated],
+ 	      , [AC_ERROR([No user enum control support in alsa-lib])])
+ fi
+ 
++
++AC_CHECK_HEADERS([dlfcn.h])
++
+ dnl Check components
+ AC_CHECK_HEADERS([alsa/pcm.h], [have_pcm="yes"], [have_pcm="no"],
+   [#include <alsa/asoundlib.h>])
+@@ -74,7 +77,7 @@ AM_CONDITIONAL(HAVE_MIXER, test "$have_mixer" = "yes")
+ AM_CONDITIONAL(HAVE_RAWMIDI, test "$have_rawmidi" = "yes")
+ AM_CONDITIONAL(HAVE_SEQ, test "$have_seq" = "yes")
+ AM_CONDITIONAL(HAVE_UCM, test "$have_ucm" = "yes")
+-AM_CONDITIONAL(HAVE_TOPOLOGY, test "$have_topology" = "yes")
++AM_CONDITIONAL(HAVE_TOPOLOGY, test "$have_topology" = "yes" -a "$ac_cv_header_dlfcn_h" = "yes")
+ AM_CONDITIONAL(HAVE_SAMPLERATE, test "$have_samplerate" = "yes")
+ AM_CONDITIONAL(HAVE_FFADO, test "$have_ffado" = "yes")
+ 
+-- 
+2.35.1
+
diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index 2d7062b0ca..555f06fd21 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -45,6 +45,10 @@ config BR2_PACKAGE_ALSA_UTILS_ALSAUCM
 
 config BR2_PACKAGE_ALSA_UTILS_ALSATPLG
 	bool "alsatplg"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+
+comment "alsatplg needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_ALSA_UTILS_AMIDI
 	bool "amidi"
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 65a7853c79..1b16a2457a 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -15,6 +15,9 @@ ALSA_UTILS_DEPENDENCIES = host-pkgconf alsa-lib \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
 	$(TARGET_NLS_DEPENDENCIES)
 
+# We're patching configure.ac
+ALSA_UTILS_AUTORECONF = YES
+
 ifeq ($(BR2_PACKAGE_ALSA_UTILS_ALSACTL),y)
 ALSA_UTILS_SELINUX_MODULES += alsa
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

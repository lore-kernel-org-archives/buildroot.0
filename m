Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F01C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 10:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 061C860EB8;
	Mon, 15 Aug 2022 10:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 061C860EB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lj5grDmHv0gr; Mon, 15 Aug 2022 10:06:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C67C560BCA;
	Mon, 15 Aug 2022 10:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C67C560BCA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A7BF1BF3C4
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8DE240146
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:06:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8DE240146
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4RzcGpCT86hi for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 10:06:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4D544010D
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4D544010D
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 10:06:01 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id p10so8509596wru.8
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 03:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=PbbBP/x75EcS2LJEdrrpS/djsQ/ofmQCpKajRiX8WBw=;
 b=rVN3liOy6VSr/FGIPZMKk75nQm1j3ULydyNikvmA5x4nFK6uXKcR+VScXi09/iMyQG
 C67JuAimvIkDr6B7Ms/aKPy41sstr35J80Cr1UGgx8aNDs3ZBNn3Qq6vl52IH59TRqs8
 aiGc2spKqt2WgziFLGVtdR5sQzm5nAZgPXpuNqhP5KNXJDAy0Y0d7hxvlzEsBUTxV3X3
 J4yE4IaNkAR4+le+5FRnZ8x1zJRuwvHhBCZin+VFVG3wttJk86/lQEEOYr39cxLcb7T/
 xovVeqb06usWsyZvz4yvxJrUlF3C4inAR0haD2qasZa7LjOLeY5ZCABiEqqlW7jpgs7P
 i+mQ==
X-Gm-Message-State: ACgBeo1kJw7cCnKdd4nX4ETzMJjyvTA/OyzUvj03oyRua0mnMnwMFoBq
 /3RbtgF30IAaNv99QyzmF4/QGb5OxMU=
X-Google-Smtp-Source: AA6agR7yacH5QKleYmPSgDkIcy2+A35BSKPMbnWDaAXHLOGSXXc73umF5WYDvLwQmrd3pP6Y2Epl2Q==
X-Received: by 2002:a5d:47aa:0:b0:21e:e1aa:2542 with SMTP id
 10-20020a5d47aa000000b0021ee1aa2542mr8140988wrb.19.1660557959510; 
 Mon, 15 Aug 2022 03:05:59 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b00a02a978cbcfe81d2.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:a02a:978c:bcfe:81d2])
 by smtp.gmail.com with ESMTPSA id
 bp15-20020a5d5a8f000000b0021ee65426a2sm6865866wrb.65.2022.08.15.03.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 03:05:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 12:05:55 +0200
Message-Id: <20220815100555.458862-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=PbbBP/x75EcS2LJEdrrpS/djsQ/ofmQCpKajRiX8WBw=;
 b=HsC9LXr+cAB6M3UZ1aRSEntpnNOQOnDV5YNCO4QoaHfikg1GaYd8IXj5huyUL8yNBL
 B1adE8sBFyYOLnQJU5J1IEYMAqulU/LwqKsKKN94FCcO5krdM7UYFVzUfr6ypXvL4O3v
 6yXVZsGVpVtYMgaONjUQ8342OopdLjvqI3TtLXktCqBhdJV1vxiMW2q8p7mnhATupJqu
 ReeksrVVtPmRKMjV7KZ8UO0+4VycKUpPLygO7J775TcT93ZKFJ8wO4o/iNvKZ8O6iIbN
 yOsDsbzBJdPLqqD2F/PBhKe8Cf6JfPozVFsutf8TnkYGCOH1Hm/TkgdLOQMUvZvkLg50
 Zn5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HsC9LXr+
Subject: [Buildroot] [PATCH v2,1/1] package/alsa-utils: fix static build
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

alsatplg needs dynamic library since bump to version 1.2.7 in commit
4dc8563363d639255217ffc59482eaccf93a1b51 and
https://github.com/alsa-project/alsa-utils/commit/44d3e8aa44fc12f95bfeef0e3a1051e8f77047b5:

pre-processor.c:28:10: fatal error: dlfcn.h: No such file or directory
   28 | #include <dlfcn.h>
      |          ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/1173a1ee28a58ce565a3274f35e868c35bb2e04e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Only disable alsatplg without dynamic library

 ...nfigure.ac-fix-build-without-dlfcn.h.patch | 48 +++++++++++++++++++
 package/alsa-utils/Config.in                  |  4 ++
 package/alsa-utils/alsa-utils.mk              |  2 +
 3 files changed, 54 insertions(+)
 create mode 100644 package/alsa-utils/0003-configure.ac-fix-build-without-dlfcn.h.patch

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
index 65a7853c79..c1cfc74774 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -14,6 +14,8 @@ ALSA_UTILS_DEPENDENCIES = host-pkgconf alsa-lib \
 	$(if $(BR2_PACKAGE_NCURSES),ncurses) \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
 	$(TARGET_NLS_DEPENDENCIES)
+# We're patching configure.ac
+ALSA_UTILS_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_ALSA_UTILS_ALSACTL),y)
 ALSA_UTILS_SELINUX_MODULES += alsa
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

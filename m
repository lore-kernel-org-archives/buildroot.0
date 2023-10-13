Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C992CDB483
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 18:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C383041897;
	Fri, 13 Oct 2023 18:57:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C383041897
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NN4qlMV1mJsy; Fri, 13 Oct 2023 18:57:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6C4841896;
	Fri, 13 Oct 2023 18:57:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6C4841896
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D65C01BF2BA
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D691641FB4
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:46:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D691641FB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jrew9dt60KFC for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 18:46:37 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9F4042076
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 18:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9F4042076
Received: from fli4l.lan.fli4l (p54a1b15c.dip0.t-ipconnect.de [84.161.177.92])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6A261A4C02CA
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 20:45:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49950)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.1)
 (envelope-from <bernd@kuhls.net>) id 1qrNAa-0005se-0B
 for buildroot@buildroot.org; Fri, 13 Oct 2023 20:45:56 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 20:45:54 +0200
Message-Id: <20231013184554.337101-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231013184554.337101-1-bernd@kuhls.net>
References: <20231013184554.337101-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697222756;
 bh=BBkTd7w+/+q1nlNCw1hfRFSjRlLV0vci9I5372AbnKI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=F7pXZmN9+3inio1wRpvvTbgSWiExnOZ+dxXOG1Yuv12sGr7Iai2kyxig8JCOFq+ys
 aBHwrV9m4RPJHvTPcgR1YMI9uCTpiAVdXVRzA6PxsY/MRIOgQykheh4X/8wSHO4mc7
 OtVRXFGiND3Kii/AqBrwr/me2hp6QWfEqVk90WT/H+bcsOrqLilHBveGOe+nevA6jn
 NxlLHOQ9BsVwi2ckfM0brs5YKjsGtAzuZGMnoLlBumHLe/n0+rITjaGuOjfV4rLc8R
 bln12TvfJF25zRyFvHh8w6QMrLts/j0ayS1W/sADhYBARkTzLfNeW2W+FUS//lB6pt
 33LQR5uzkB/AA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=F7pXZmN9
Subject: [Buildroot] [PATCH 4/4] package/alsa-utils: fix UMP support
 detection
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/e26/e269f862ebade30cf870d783a1006aba8fedc129/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...nfigure.ac-fix-UMP-support-detection.patch | 38 +++++++++++++++++++
 package/alsa-utils/alsa-utils.mk              |  2 +
 2 files changed, 40 insertions(+)
 create mode 100644 package/alsa-utils/0011-configure.ac-fix-UMP-support-detection.patch

diff --git a/package/alsa-utils/0011-configure.ac-fix-UMP-support-detection.patch b/package/alsa-utils/0011-configure.ac-fix-UMP-support-detection.patch
new file mode 100644
index 0000000000..66cf051733
--- /dev/null
+++ b/package/alsa-utils/0011-configure.ac-fix-UMP-support-detection.patch
@@ -0,0 +1,38 @@
+From 8a0da6d4484cd2ca4f1939a6c44941e070db2147 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 13 Oct 2023 20:32:32 +0200
+Subject: [PATCH] configure.ac: fix UMP support detection
+
+https://github.com/alsa-project/alsa-utils/commit/b399fb85a919636b7da34e8bcf17f484dd9046f7
+added usage of alsa/ump_msg.h without checking whether alsa-lib was
+compiled with rawmidi support:
+https://github.com/alsa-project/alsa-lib/blob/master/include/Makefile.am#L37
+
+Fixes a build error when alsa-lib was compiled with --disable-rawmidi
+
+aplaymidi.c:34:10: fatal error: alsa/ump_msg.h: No such file or directory
+   34 | #include <alsa/ump_msg.h>
+
+Upstream: https://github.com/alsa-project/alsa-utils/pull/240
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index beb4963..4217741 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -55,7 +55,7 @@ if test "$HAVE_SEQ_CLIENT_INFO_GET_PID" = "yes" ; then
+     AC_DEFINE([HAVE_SEQ_CLIENT_INFO_GET_PID], 1, [alsa-lib supports snd_seq_client_info_get_pid])
+ fi
+ AC_CHECK_LIB([asound], [snd_seq_client_info_get_midi_version], [HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION="yes"])
+-if test "$HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION" = "yes" ; then
++if test "$HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION" = "yes" -a "$have_rawmidi" = "yes"; then
+     AC_DEFINE([HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION], 1, [alsa-lib supports snd_seq_client_info_get_midi_version])
+ fi
+ AC_CHECK_LIB([atopology], [snd_tplg_save], [have_topology="yes"], [have_topology="no"])
+-- 
+2.39.2
+
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 7487e3c2bb..6f6021400e 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -9,6 +9,8 @@ ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = https://www.alsa-project.org/files/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
 ALSA_UTILS_LICENSE_FILES = COPYING
+# 0011-configure.ac-fix-UMP-support-detection.patch
+ALSA_UTILS_AUTORECONF = YES
 ALSA_UTILS_INSTALL_STAGING = YES
 ALSA_UTILS_DEPENDENCIES = host-pkgconf alsa-lib \
 	$(if $(BR2_PACKAGE_NCURSES),ncurses) \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

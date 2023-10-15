Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6B4CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 09:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2198411A2;
	Sun, 15 Oct 2023 09:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2198411A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eT1G-Suola4R; Sun, 15 Oct 2023 09:34:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD16D40C53;
	Sun, 15 Oct 2023 09:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD16D40C53
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E10631BF30B
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 09:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C78AD81E35
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 09:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C78AD81E35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UZiZaQ34wMKZ for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 09:33:52 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75FFF81E25
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 09:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75FFF81E25
Received: from fli4l.lan.fli4l (p54a1bf4b.dip0.t-ipconnect.de [84.161.191.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E12CDA4C0D29
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 11:33:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45898)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.1)
 (envelope-from <bernd@kuhls.net>) id 1qrxUl-0004D6-1z
 for buildroot@buildroot.org; Sun, 15 Oct 2023 11:33:11 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 11:33:10 +0200
Message-Id: <20231015093310.1138805-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231015093310.1138805-1-bernd@kuhls.net>
References: <20231015093310.1138805-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697362391;
 bh=2I2qqx2ax10fvOX07SMYVDWCZcSv/iVjCVeTWs47WiY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nroQuh39MG/p39W2gj21iY6f5PbCZ7GUIPdGR0Fj5KGr56BrYUKSgCige/vqq43WB
 cXg+Pv+ZFNX/O+F0BjYMFyPHokQi+8qwS1AHLN6ysklg837iVMdW52Ul3iOgUHOvFW
 VkLGKhyDZypPDwbP4K8PuMNIdLzV7r9lfyhCDxt6KT3y6tmZ3Ec3jpOmQCyuqqKSVC
 8kmiOgJDKmK8MpkjfNHy+Z/lDngBdosLa648nBRY/xxqebm2kLb0aQ0QYrDi3Lhd9Y
 mtaG3jO+y8sr270B0PLUqHPPbbaH9tjau6UQSWXj2lQIS6i24rftu0lpERW2v9I4nJ
 2rBNnKH/F776w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=nroQuh39
Subject: [Buildroot] [PATCH v2 4/4] package/alsa-utils: fix UMP support
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
v2: no changes

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

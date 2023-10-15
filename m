Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAE6CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 20:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31496414BF;
	Sun, 15 Oct 2023 20:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31496414BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3jg-o2fSBkcX; Sun, 15 Oct 2023 20:13:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9ECC414C8;
	Sun, 15 Oct 2023 20:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9ECC414C8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 272B01BF947
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D3EC41794
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:13:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D3EC41794
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7jN9IEUaPoG5 for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 20:13:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF3FC41774
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 20:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF3FC41774
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCF4785A84; Sun, 15 Oct 2023 20:13:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 22:11:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 828bb54c6dba795db3d71c2de42870bd77a32f68
X-Git-Newrev: f86b539d564679b2d8321d5f2f904d0396cb4979
X-Patchwork-Hint: ignore
Message-Id: <20231015201321.DCF4785A84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-utils: fix UMP support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f86b539d564679b2d8321d5f2f904d0396cb4979
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/e26/e269f862ebade30cf870d783a1006aba8fedc129/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...11-configure.ac-fix-UMP-support-detection.patch | 38 ++++++++++++++++++++++
 package/alsa-utils/alsa-utils.mk                   |  2 ++
 2 files changed, 40 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

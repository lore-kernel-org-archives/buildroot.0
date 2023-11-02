Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7E2C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 17:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BE0F4F1BF;
	Thu,  2 Nov 2023 17:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BE0F4F1BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KbeabxNzFAzz; Thu,  2 Nov 2023 17:55:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40BE84F1BD;
	Thu,  2 Nov 2023 17:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40BE84F1BD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 379981BF350
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 17:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1134F4F1BB
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 17:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1134F4F1BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qwYpYxk9VPP1 for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 17:55:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 404BA41969
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 17:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 404BA41969
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24E4B8654A; Thu,  2 Nov 2023 17:55:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Nov 2023 18:53:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed89c6a6cae82845b2abf8a2a7a26cb96153e45f
X-Git-Newrev: 68dbb0082adea69b571039447fa3ad036467787d
X-Patchwork-Hint: ignore
Message-Id: <20231102175518.24E4B8654A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/motion: fix build with gettext-gnu
 >= 0.22
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

commit: https://git.buildroot.net/buildroot/commit/?id=68dbb0082adea69b571039447fa3ad036467787d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of gettext-gnu to
version 0.22 in commit f6a6e3a8363a32e5443c9eadc2ee047853640d1a:

fi.po:3435: 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: In the directive number 1, the character 'l' is not a valid conversion specifier.

Fixes:
 - http://autobuild.buildroot.org/results/e426a245075f5a8615a3129187126804bf48a34b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/motion/0001-Gettext-0-22.patch | 164 +++++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/package/motion/0001-Gettext-0-22.patch b/package/motion/0001-Gettext-0-22.patch
new file mode 100644
index 0000000000..aeacd0e2ec
--- /dev/null
+++ b/package/motion/0001-Gettext-0-22.patch
@@ -0,0 +1,164 @@
+From 2d8d68cfcc1cf4fc8861671e185fdf235dcf9740 Mon Sep 17 00:00:00 2001
+From: David Seifert <16636962+SoapGentoo@users.noreply.github.com>
+Date: Fri, 30 Jun 2023 05:37:50 +0200
+Subject: [PATCH] Gettext 0.22 (#1681)
+
+* po: fix gettext 0.22 format specifier
+
+Bug: https://bugs.gentoo.org/908965
+Bug: https://savannah.gnu.org/bugs/index.php?64334#comment1
+
+* Autotools: fix `make distcheck`
+
+* use correct `dist_` specifiers for including files in tarball
+* do not override `docdir`, since this is a user variable
+* include headers in tarball
+
+Upstream: https://github.com/Motion-Project/motion/commit/2d8d68cfcc1cf4fc8861671e185fdf235dcf9740
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile.am     | 11 +++++------
+ configure.ac    |  1 -
+ man/Makefile.am |  1 -
+ po/de.po        |  2 +-
+ po/fi.po        |  2 +-
+ src/Makefile.am | 52 ++++++++++++++++++++++++++++++++++++-------------
+ 6 files changed, 46 insertions(+), 23 deletions(-)
+ delete mode 100644 man/Makefile.am
+
+diff --git a/Makefile.am b/Makefile.am
+index 3d2f968e2..5ae03cd2c 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,19 +1,18 @@
+ ACLOCAL_AMFLAGS = -I m4
+ 
+-SUBDIRS = src po man
++SUBDIRS = src po
+ 
+-sysconfdir = @sysconfdir@/$(PACKAGE)
+-sysconf_DATA = \
++pkgsysconfdir = $(sysconfdir)/@PACKAGE@
++dist_pkgsysconf_DATA = \
+ 	data/motion-dist.conf \
+ 	data/camera1-dist.conf \
+ 	data/camera2-dist.conf \
+ 	data/camera3-dist.conf \
+ 	data/camera4-dist.conf
+ 
+-man_MANS = man/motion.1
++dist_man_MANS = man/motion.1
+ 
+-docdir = $(datadir)/doc/@PACKAGE@
+-doc_DATA = \
++dist_doc_DATA = \
+ 	doc/mask1.png \
+ 	doc/normal.jpg \
+ 	doc/outputmotion1.jpg  \
+diff --git a/configure.ac b/configure.ac
+index dfcf5eae2..ce588f65b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -496,7 +496,6 @@ AC_CONFIG_FILES([
+ 	Makefile
+ 	src/Makefile
+   po/Makefile.in
+-  man/Makefile
+   data/camera1-dist.conf
+   data/camera2-dist.conf
+   data/camera3-dist.conf
+diff --git a/man/Makefile.am b/man/Makefile.am
+deleted file mode 100644
+index 14aa069f0..000000000
+--- a/man/Makefile.am
++++ /dev/null
+@@ -1 +0,0 @@
+-man_MANS = motion.1
+\ No newline at end of file
+diff --git a/po/de.po b/po/de.po
+index 9142c9195..ccd5f09d7 100644
+--- a/po/de.po
++++ b/po/de.po
+@@ -3458,7 +3458,7 @@ msgstr "Sprache: Deutsch"
+ #: src/util.c
+ #, c-format
+ msgid "Could not allocate %llu bytes of memory!"
+-msgstr "%Llu Bytes Speicher konnten nicht zugeordnet werden!"
++msgstr "%llu Bytes Speicher konnten nicht zugeordnet werden!"
+ 
+ #: src/util.c
+ #, c-format
+diff --git a/po/fi.po b/po/fi.po
+index 1afbdb68b..d3117a922 100644
+--- a/po/fi.po
++++ b/po/fi.po
+@@ -3432,7 +3432,7 @@ msgstr "Kieli: englanti"
+ #: src/util.c
+ #, c-format
+ msgid "Could not allocate %llu bytes of memory!"
+-msgstr "%Llu-tavua muistia ei voitu varata!"
++msgstr "%llu-tavua muistia ei voitu varata!"
+ 
+ #: src/util.c
+ #, c-format
+diff --git a/src/Makefile.am b/src/Makefile.am
+index f93decf55..6f9d02e6b 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -1,17 +1,43 @@
+-AM_CPPFLAGS= -Dsysconfdir=\"$(sysconfdir)/motion\" -DLOCALEDIR=\"$(DESTDIR)$(localedir)\"
+-
+-if INC_MMAL_SRC
+-MMAL_SRC=raspicam/RaspiCamControl.c raspicam/RaspiCLI.c
+-endif
+-
+-LIBS = @LIBINTL@ @LIBS@
++AM_CPPFLAGS= -Dsysconfdir=\"$(sysconfdir)/motion\" -DLOCALEDIR=\"$(localedir)\"
++LDADD = $(LIBINTL)
+ 
+ bin_PROGRAMS = motion
+ 
+-motion_SOURCES = motion.c logger.c conf.c draw.c jpegutils.c video_loopback.c \
+-	video_v4l2.c video_common.c video_bktr.c netcam.c netcam_http.c netcam_ftp.c \
+-	netcam_jpeg.c netcam_wget.c netcam_rtsp.c track.c alg.c event.c picture.c \
+-	rotate.c translate.c ffmpeg.c util.c dbse.c webu_status.c \
+-	webu.c webu_html.c webu_stream.c webu_text.c mmalcam.c $(MMAL_SRC)
+-
++motion_SOURCES = \
++	alg.h alg.c \
++	conf.h conf.c \
++	dbse.h dbse.c \
++	draw.h draw.c \
++	event.h event.c \
++	ffmpeg.h ffmpeg.c \
++	jpegutils.h jpegutils.c \
++	logger.h logger.c \
++	mmalcam.h mmalcam.c \
++	motion.h motion.c \
++	netcam.h netcam.c \
++	netcam_ftp.h netcam_ftp.c \
++	netcam_http.h netcam_http.c \
++	netcam_jpeg.h netcam_jpeg.c \
++	netcam_rtsp.h netcam_rtsp.c \
++	netcam_wget.h netcam_wget.c \
++	picture.h picture.c \
++	rotate.h rotate.c \
++	track.h track.c \
++	translate.h translate.c \
++	util.h util.c \
++	video_bktr.h video_bktr.c \
++	video_common.h video_common.c \
++	video_loopback.h video_loopback.c \
++	video_v4l2.h video_v4l2.c \
++	webu.h webu.c \
++	webu_html.h webu_html.c \
++	webu_status.h webu_status.c \
++	webu_stream.h webu_stream.c \
++	webu_text.h webu_text.c \
++	mmx.h pwc-ioctl.h
+ 
++if INC_MMAL_SRC
++motion_SOURCES += \
++	raspicam/RaspiCamControl.h raspicam/RaspiCamControl.c \
++	raspicam/RaspiCLI.h raspicam/RaspiCLI.c
++endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D04AC433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 10:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD1AE4056D;
	Sun, 13 Nov 2022 10:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD1AE4056D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jhT_OvoP4Mm4; Sun, 13 Nov 2022 10:01:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C51F0402C3;
	Sun, 13 Nov 2022 10:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C51F0402C3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 806491BF376
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 10:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C17160AD4
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 10:01:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C17160AD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BlLAARZM3Zpt for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 10:01:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F3B460AC0
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F3B460AC0
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 10:01:03 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout04.t-online.de (Postfix) with SMTP id 6BCE9167E;
 Sun, 13 Nov 2022 11:00:59 +0100 (CET)
Received: from fli4l.lan.fli4l ([91.58.5.168]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1ou9nN-10sySP0; Sun, 13 Nov 2022 11:00:57 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:33830)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1ou9nN-0006H3-0X;
 Sun, 13 Nov 2022 11:00:57 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 11:00:57 +0100
Message-Id: <20221113100057.3893656-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1668333657-FB45E742-D07A6426/0/0 CLEAN NORMAL
X-TOI-MSGID: 3025e849-d505-4464-aeee-ba161584373e
Subject: [Buildroot] [PATCH 1/1] package/vlc: fix opengl library check
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
Cc: Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/9710753984a38b8c6f83a136b39c3bc320ba558b/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
While this upstream patch fixes the insufficient check for opengl the
reason why we saw this bug is due to the fact that the libglvnd package
installs GL/gl.h to staging dir even if the defconfig does not enable
libgl support, but fixing this is another topic.


 .../0012-opengl-missing-library-check.patch   | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/vlc/0012-opengl-missing-library-check.patch

diff --git a/package/vlc/0012-opengl-missing-library-check.patch b/package/vlc/0012-opengl-missing-library-check.patch
new file mode 100644
index 0000000000..3a28fe34e3
--- /dev/null
+++ b/package/vlc/0012-opengl-missing-library-check.patch
@@ -0,0 +1,57 @@
+From 4ab41404cb85684125d73977cadebf83bbc246f5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
+Date: Sat, 22 Jan 2022 11:34:38 +0200
+Subject: [PATCH] opengl: missing library check
+
+Traditionally the presence of the header file was not considered
+sufficient, though this was somewhat forgotten with the prevalence of
+pkg-config.
+
+However most libraries have portable headers, while the shared library
+is platform-dependent. It is common for the header to be present while
+the library is absent with "multilib" installations (i.e. Linux
+installation with multiple architectures).
+
+Downloaded from upstream commit:
+https://code.videolan.org/videolan/vlc/-/commit/4ab41404cb85684125d73977cadebf83bbc246f5
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2f50808d597..0d57fadbf8b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3169,7 +3169,6 @@ have_gl="no"
+ PKG_CHECK_MODULES([GL], [gl], [
+   have_gl="yes"
+ ], [
+-  AC_MSG_CHECKING([for OpenGL])
+   AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+ #ifdef _WIN32
+ # include <GL/glew.h>
+@@ -3179,13 +3178,17 @@ PKG_CHECK_MODULES([GL], [gl], [
+     [int t0 = GL_TEXTURE0;]])
+   ], [
+     GL_CFLAGS=""
+-    have_gl="yes"
+     AS_IF([test "${SYS}" != "mingw32"], [
+-      GL_LIBS="-lGL"
++      AC_CHECK_LIB([GL], [glTexture2D], [
++        have_gl="yes"
++        GL_LIBS="-lGL"
++      ])
+     ], [
++      have_gl="yes"
+       GL_LIBS="-lopengl32"
+     ])
+   ])
++  AC_MSG_CHECKING([for OpenGL])
+   AC_MSG_RESULT([${have_gl}])
+ ])
+ AM_CONDITIONAL([HAVE_GL], [test "${have_gl}" = "yes"])
+-- 
+GitLab
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

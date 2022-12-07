Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF45EC4708E
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 13:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6291260EA0;
	Wed,  7 Dec 2022 13:31:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6291260EA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uXqFC2TA70oO; Wed,  7 Dec 2022 13:31:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E14160DB7;
	Wed,  7 Dec 2022 13:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E14160DB7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 314651BF4D8
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DA4681F24
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:29:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DA4681F24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UZsKYUw5SYJ1 for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 13:29:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C53E181388
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 13:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C53E181388
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B367785D7A; Wed,  7 Dec 2022 13:29:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Dec 2022 13:46:20 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 75822b8b3d191e181d55e8ad2104ec6a052deb63
X-Git-Newrev: a44ff7d47a0b3a0d6e5db275a4c3e6f496658a50
X-Patchwork-Hint: ignore
Message-Id: <20221207132943.B367785D7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/vlc: fix opengl
 library check
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

commit: https://git.buildroot.net/buildroot/commit/?id=a44ff7d47a0b3a0d6e5db275a4c3e6f496658a50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes:
http://autobuild.buildroot.net/results/9710753984a38b8c6f83a136b39c3bc320ba558b/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a0aad05cbf20c8e09834e9e1d78a3376cb89910b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../vlc/0012-opengl-missing-library-check.patch    | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

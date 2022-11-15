Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D0DC43217
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 13:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B238A415E1;
	Tue, 15 Nov 2022 13:28:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B238A415E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iv_qaFhtWwGQ; Tue, 15 Nov 2022 13:28:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7513F41634;
	Tue, 15 Nov 2022 13:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7513F41634
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D5F701BF319
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91749409EF
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91749409EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uoSuy1vfWjKM for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 13:26:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DEEF40A38
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 13:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DEEF40A38
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78C8C83CA2; Tue, 15 Nov 2022 13:26:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 15 Nov 2022 14:22:54 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 868734d040ad0bacd059682649efb4469d53664e
X-Git-Newrev: 442fc84e8f32fa45477dd336fc9c9605375c5ded
X-Patchwork-Hint: ignore
Message-Id: <20221115132631.78C8C83CA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/vlc: fix opengl
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

commit: https://git.buildroot.net/buildroot/commit/?id=442fc84e8f32fa45477dd336fc9c9605375c5ded
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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

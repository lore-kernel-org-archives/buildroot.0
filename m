Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C40C433F5
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 07:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A9A841C17;
	Wed, 30 Mar 2022 07:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oB0rAFiTWh4i; Wed, 30 Mar 2022 07:14:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E80CD41BB8;
	Wed, 30 Mar 2022 07:14:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC9941BF5E0
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8EC140B3E
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NQOmvNm_v-dy for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 07:13:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3DE7409D6
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 07:13:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AA0FE85FB9; Wed, 30 Mar 2022 07:04:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Mar 2022 09:12:54 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b2992d27bd63adc3d1c6f265b57e07746f0761f5
X-Git-Newrev: 988f192a659fff3b54e5ad00ebbb5b2615a03d7a
X-Patchwork-Hint: ignore
Message-Id: <20220330070437.AA0FE85FB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/qt5base: fix
 eglconvenience compile (missing QList include)
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
Content-Type: multipart/mixed; boundary="===============3622454474287352698=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3622454474287352698==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=988f192a659fff3b54e5ad00ebbb5b2615a03d7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- add 0008-eglconvenience-add-missing-QList-include.patch to fix
  eglconvenience compile (missing QList include)

Fixes:

  qeglconvenience.cpp:418:23: error: variable ‘QList<QByteArray> extensions’ has initializer but incomplete type
    418 |     QList<QByteArray> extensions =
        |                       ^~~~~~~~~~
  qeglconvenience.cpp:420:65: error: invalid use of incomplete type ‘class QList<QByteArray>’
    420 |             (eglQueryString(display, EGL_EXTENSIONS))).split(' ');
        |                                                                 ^

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 68159373d1a1fcb542a1ad411141dc910b8e1d49)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-eglconvenience-add-missing-QList-include.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/qt5/qt5base/0008-eglconvenience-add-missing-QList-include.patch b/package/qt5/qt5base/0008-eglconvenience-add-missing-QList-include.patch
new file mode 100644
index 0000000000..c7127291e4
--- /dev/null
+++ b/package/qt5/qt5base/0008-eglconvenience-add-missing-QList-include.patch
@@ -0,0 +1,37 @@
+From f681f428477812e54484f631b0da332cc2e00eaa Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 16 Mar 2022 19:08:55 +0100
+Subject: [PATCH] eglconvenience: add missing QList include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  qeglconvenience.cpp:418:23: error: variable ‘QList<QByteArray> extensions’ has initializer but incomplete type
+    418 |     QList<QByteArray> extensions =
+        |                       ^~~~~~~~~~
+  qeglconvenience.cpp:420:65: error: invalid use of incomplete type ‘class QList<QByteArray>’
+    420 |             (eglQueryString(display, EGL_EXTENSIONS))).split(' ');
+        |                                                                 ^
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/platformsupport/eglconvenience/qeglconvenience.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/platformsupport/eglconvenience/qeglconvenience.cpp b/src/platformsupport/eglconvenience/qeglconvenience.cpp
+index 5303d37c..daceeb8b 100644
+--- a/src/platformsupport/eglconvenience/qeglconvenience.cpp
++++ b/src/platformsupport/eglconvenience/qeglconvenience.cpp
+@@ -38,6 +38,7 @@
+ ****************************************************************************/
+ 
+ #include <QByteArray>
++#include <QList>
+ #include <QOpenGLContext>
+ 
+ #ifdef Q_OS_LINUX
+-- 
+2.35.1
+

--===============3622454474287352698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3622454474287352698==--

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E38C433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 21:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3239A41C39;
	Thu, 24 Mar 2022 21:47:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3jXox9USWR-8; Thu, 24 Mar 2022 21:47:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9509441C3D;
	Thu, 24 Mar 2022 21:47:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D111C1BF313
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE93082438
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:46:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2T30xjKcJxa3 for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 21:46:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D771828AF
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 21:46:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id ED03485C99; Thu, 24 Mar 2022 21:37:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 24 Mar 2022 22:41:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3857bccca5e59dfe90fc5b5823bfe672a1847cd5
X-Git-Newrev: 68159373d1a1fcb542a1ad411141dc910b8e1d49
X-Patchwork-Hint: ignore
Message-Id: <20220324213751.ED03485C99@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5base: fix eglconvenience
 compile (missing QList include)
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
Content-Type: multipart/mixed; boundary="===============7169069388304428729=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7169069388304428729==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=68159373d1a1fcb542a1ad411141dc910b8e1d49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

--===============7169069388304428729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7169069388304428729==--

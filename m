Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59BFEB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 18:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2150B612FE;
	Wed, 12 Jul 2023 18:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2150B612FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UK-LszJmMYfn; Wed, 12 Jul 2023 18:42:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BB2A612F7;
	Wed, 12 Jul 2023 18:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BB2A612F7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D2A11BF3BA
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 18:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34A1041F03
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 18:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34A1041F03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Y1TXGO8EInX for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 18:42:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC54941EFB
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 18:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC54941EFB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7DAD86EB1; Wed, 12 Jul 2023 18:42:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 20:42:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 876ad67ac07be4b7900a4ea6464e7459e2b40604
X-Git-Newrev: d7f3b78979308d1ec8776a20ba2654da566e922d
X-Patchwork-Hint: ignore
Message-Id: <20230712184246.A7DAD86EB1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d-demos: fix glx-detection
 without glvnd
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7f3b78979308d1ec8776a20ba2654da566e922d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4621046326

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...002-meson-fix-glx-detection-without-glvnd.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/mesa3d-demos/0002-meson-fix-glx-detection-without-glvnd.patch b/package/mesa3d-demos/0002-meson-fix-glx-detection-without-glvnd.patch
new file mode 100644
index 0000000000..37a60efdd7
--- /dev/null
+++ b/package/mesa3d-demos/0002-meson-fix-glx-detection-without-glvnd.patch
@@ -0,0 +1,47 @@
+From e16117fc92688d76a042ad2c590c77d5a987a4ac Mon Sep 17 00:00:00 2001
+From: Erik Faye-Lund <erik.faye-lund@collabora.com>
+Date: Fri, 24 Mar 2023 13:31:58 +0100
+Subject: [PATCH] meson: fix glx-detection without glvnd
+
+When build without GLVND, Mesa provides GLX as a part of libGL, just
+like XQuartz does on MacOS. There's nothing really macOS specific about
+this fallback, so let's drop the condition.
+
+And just for good measure, let's add in dep_gl as a dependency for
+the header-check here, in case some one decides to install libGL outside
+of the default include directory.
+
+Fixes: 34300551 ("meson: explicitly check for glx dependency")
+Closes: https://gitlab.freedesktop.org/mesa/demos/-/issues/36
+Reviewed-by: Hoe Hao Cheng <haochengho12907@gmail.com>
+
+Upstream: https://gitlab.freedesktop.org/mesa/demos/-/commit/e16117fc92688d76a042ad2c590c77d5a987a4ac
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ meson.build | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index c1853f94..bc3278e1 100644
+--- a/meson.build
++++ b/meson.build
+@@ -99,10 +99,11 @@ if not dep_glu.found() and host_machine.system() != 'darwin'
+ endif
+ 
+ dep_glx = dependency('glx', required: false, disabler : true)
+-if not dep_glx.found() and host_machine.system() == 'darwin'
+-  # xquartz doesn't have a glx.pc, but it does have the header. And all the
+-  # symbols reside in libGL, so let's just use that.
+-  if cc.check_header('GL/glx.h', dependencies: dep_x11)
++if not dep_glx.found()
++  # Both Mesa build without GLVND and XQuartz lacks a glx.pc, but does
++  # provide the header. And all the symbols reside in libGL, so let's
++  # just use that.
++  if cc.check_header('GL/glx.h', dependencies: [dep_x11, dep_gl])
+     dep_glx = dep_gl
+   endif
+ endif
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905D5C001DC
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 17:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6784611CC;
	Wed, 12 Jul 2023 17:13:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6784611CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8lnP_srGJs0r; Wed, 12 Jul 2023 17:13:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 254F8611B1;
	Wed, 12 Jul 2023 17:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 254F8611B1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F1F51BF852
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 17:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC7698230F
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 17:13:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC7698230F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VKRl54n7XMkw for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 17:13:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FEC5822FA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FEC5822FA
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 17:13:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 27C31A4C0C81;
 Wed, 12 Jul 2023 19:13:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50114)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qJdPK-0002TC-22;
 Wed, 12 Jul 2023 19:13:42 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 19:13:42 +0200
Message-Id: <20230712171342.1204890-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689182023;
 bh=ugw6x8vWQsUGundjf1JdO9DBWzmUAFZVglEQAj88XTM=;
 h=From:To:Cc:Subject:Date:From;
 b=xqBDY8Fw/L48CsiMn8akBI22EjmiQKx0LWuyqh5tBalfqSVGvYvL6GhVKZSqVvKTe
 tb+q92K5UUaJWkyhsUi4kLbAAYVtucFGqDD28axPUgzMF5cOCOuuhCnOPdaZ3Om0FQ
 mV8qWZIA7nfsGHzuJi/+Qn+N6D0g7G8NgTjl7Hny+fPAbLgq7WcchAlNPBfiol6CuL
 lurOtkBFwSmGBxEXPCYkAr6pkv7F9wNI9KxosELs0uqqanfWscf+E6zz9Tuh+665ly
 9L21DOS1Uu6/a2kFcCp7LEHVF3GE7clO0SXz0X/+9sreG58IPXOGbYSwMX0R77BVGd
 hrRCeQ89Wcrew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=xqBDY8Fw
Subject: [Buildroot] [PATCH 1/1] package/mesa3d-demos: fix glx-detection
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
Cc: Spenser Gilliland <spenser@gillilanding.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4621046326

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...eson-fix-glx-detection-without-glvnd.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/mesa3d-demos/0002-meson-fix-glx-detection-without-glvnd.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

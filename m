Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0FDC47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 18:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB059843A5;
	Thu, 11 Jan 2024 18:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB059843A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qebR0c_KjJBv; Thu, 11 Jan 2024 18:41:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00FC28439A;
	Thu, 11 Jan 2024 18:41:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00FC28439A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F1131BF255
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 18:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CF358439A
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 18:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CF358439A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LBMMWfm2l-7S for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 18:41:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B3C184393
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 18:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B3C184393
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28D9185EAF; Thu, 11 Jan 2024 18:41:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 19:40:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3e98b9f2e8ed10ea09722dbbd0c97f52e1b9a6d
X-Git-Newrev: 15e524a10e4db3c1300464a5793edf9f2f95c7fb
X-Patchwork-Hint: ignore
Message-Id: <20240111184116.28D9185EAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-engine: Add profile
 runtime mode selection
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
Content-Type: multipart/mixed; boundary="===============1487240904350343190=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1487240904350343190==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=15e524a10e4db3c1300464a5793edf9f2f95c7fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot only offers two possible runtime modes for Flutter that are
automatically selected based on what the user has selected:
  - debug if BR2_ENABLE_RUNTIME_DEBUG is enabled.
  - release if BR2_ENABLE_RUNTIME_DEBUG is not enabled.

However, Flutter also offers the profile runtime mode option.

From https://docs.flutter.dev/testing/build-modes:

```
"Use profile mode when you want to analyze performance."

What is profile mode?
Some debugging ability is maintained in profile mode, which is enough to
profile your app's performance. Profile mode is turned off on the emulator
and simulator because their behavior does not represent actual performance.
```

As Flutter projects can be heavy and consume many resources, it is necessary
to allow users developing a Flutter application to profile their application
during development.

This patch introduces a new choice: FLUTTER_ENGINE_RUNTIME_MODE_PROFILE.
If unselected, the global option BR2_ENABLE_RUNTIME_DEBUG continues to
determine whether to build Flutter in release or debug mode. This new option
may confuse some users who wonder where the release and debug options are, so
the help menu section under the FLUTTER_ENGINE_RUNTIME_MODE_PROFILE option
explains that the global BR2_ENABLE_RUNTIME_DEBUG option controls the debug
and release modes.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/flutter-engine/Config.in         | 25 +++++++++++++++++++++++++
 package/flutter-engine/flutter-engine.mk |  4 +++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/package/flutter-engine/Config.in b/package/flutter-engine/Config.in
index 2ec5b90ffd..3c92e40f74 100644
--- a/package/flutter-engine/Config.in
+++ b/package/flutter-engine/Config.in
@@ -39,6 +39,31 @@ config BR2_PACKAGE_FLUTTER_ENGINE
 
 	  https://github.com/flutter/engine
 
+if BR2_PACKAGE_FLUTTER_ENGINE
+
+config FLUTTER_ENGINE_RUNTIME_MODE_PROFILE
+	bool "enable profiling"
+	help
+	  Some debugging ability is maintained—enough to profile your
+	  apps performance. Profile mode is disabled on the emulator
+	  and simulator, because their behavior is not representative
+	  of real performance. Profile mode is similar to release mode,
+	  with the following differences:
+
+	  - Some service extensions, such as the one that enables the
+	    performance overlay, are enabled.
+
+	  - Tracing is enabled, and tools supporting source-level
+	    debugging (such as DevTools) can connect to the process.
+
+	  If this option is left unselected, the global option
+	  BR2_ENABLE_RUNTIME_DEBUG determines whether to build Flutter
+	  in release or debug mode.
+
+	  https://docs.flutter.dev/testing/build-modes#profile
+
+endif
+
 comment "flutter-engine needs an OpenGL or OpenGLES backend"
 	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES
diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index c3ac144f2a..e972612097 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -52,7 +52,9 @@ FLUTTER_ENGINE_TARGET_ARCH = x64
 FLUTTER_ENGINE_TARGET_TRIPPLE = x86_64-unknown-linux-gnu
 endif
 
-ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
+ifeq ($(FLUTTER_ENGINE_RUNTIME_MODE_PROFILE),y)
+FLUTTER_ENGINE_RUNTIME_MODE=profile
+else ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
 FLUTTER_ENGINE_RUNTIME_MODE=debug
 else
 FLUTTER_ENGINE_RUNTIME_MODE=release

--===============1487240904350343190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1487240904350343190==--

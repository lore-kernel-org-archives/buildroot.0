Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE8FC47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 22:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE99D40AA1;
	Sat, 20 Jan 2024 22:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE99D40AA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ma89dw8Xz1D4; Sat, 20 Jan 2024 22:56:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7174040A8B;
	Sat, 20 Jan 2024 22:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7174040A8B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A1021BF471
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 22:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F41940A88
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 22:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F41940A88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9DHd7YJ_dfW6 for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 22:56:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F0A640012
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 22:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F0A640012
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BC618630C; Sat, 20 Jan 2024 22:56:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 23:45:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0805b8048fc75c8b471acb492aa55ef0690fdabd
X-Git-Newrev: f70e31be1a291f3a3bfe5bb39e032e9325d403d9
X-Patchwork-Hint: ignore
Message-Id: <20240120225628.2BC618630C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-pi: invert dependency logic
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

commit: https://git.buildroot.net/buildroot/commit/?id=f70e31be1a291f3a3bfe5bb39e032e9325d403d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Flutter-engine is by name an engine, i.e. a runtime for applications, a
super-library of sorts. As such, it makes more sense for applications to
select flutter-engine rather than to depend on it.

Change flutter-pi to select flutter-engine.

It also brings flutter-pi on par with ivi-homescreen, another embedder.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[yann.morin.1998@free.fr: reword commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/flutter-pi/Config.in | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/package/flutter-pi/Config.in b/package/flutter-pi/Config.in
index 4bbdc3cc77..bb0e3702c1 100644
--- a/package/flutter-pi/Config.in
+++ b/package/flutter-pi/Config.in
@@ -1,9 +1,20 @@
 menuconfig BR2_PACKAGE_FLUTTER_PI
 	bool "flutter-pi"
-	depends on BR2_PACKAGE_FLUTTER_ENGINE
+	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
+	depends on BR2_HOST_GCC_AT_LEAST_5 # flutter-engine
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # flutter-engine
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # flutter-engine
+	depends on BR2_TOOLCHAIN_USES_GLIBC # flutter-engine
+	depends on BR2_INSTALL_LIBSTDCPP # flutter-engine
+	depends on !BR2_STATIC_LIBS # flutter-engine, wayland
+	depends on BR2_USE_WCHAR # flutter-engine
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES # flutter-engine
 	depends on BR2_PACKAGE_HAS_LIBGBM
 	depends on BR2_PACKAGE_SYSTEMD # Event loop and dbus support
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
+	select BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
+	select BR2_PACKAGE_FLUTTER_ENGINE
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBXKBCOMMON
@@ -80,8 +91,22 @@ config BR2_PACKAGE_FLUTTER_PI_TEXT_INPUT_PLUGIN
 
 endif
 
-comment "flutter-pi needs flutter-engine"
-	depends on !BR2_PACKAGE_FLUTTER_ENGINE
+comment "flutter-pi needs a glibc toolchain w/ wchar, C++, gcc >= 5, dynamic library, host gcc >= 5"
+	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || BR2_STATIC_LIBS \
+		|| !BR2_USE_WCHAR || !BR2_HOST_GCC_AT_LEAST_5
+
+comment "flutter-pi needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
+comment "flutter-pi needs an OpenGL or OpenGLES backend"
+	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES
 
 comment "flutter-pi needs GBM, systemd, and udev"
 	depends on !BR2_PACKAGE_HAS_LIBGBM || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

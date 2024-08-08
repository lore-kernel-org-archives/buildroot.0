Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BE2C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 21:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AB5480D05;
	Thu,  8 Aug 2024 21:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srOqKxwUJGqV; Thu,  8 Aug 2024 21:31:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0108D80D10
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0108D80D10;
	Thu,  8 Aug 2024 21:31:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 524D31BF97D
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 21:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CB5860B53
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 21:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6NKcazRLptRd for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 21:31:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AD8560AD4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AD8560AD4
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 21:31:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16FC984A1A; Thu,  8 Aug 2024 21:31:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 8 Aug 2024 21:30:24 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 09766aab583750b2227bff45c5f51460b36eb7a7
X-Git-Newrev: 50bf83cb7520c5c1eee36ca55c69fef2aaef559f
X-Patchwork-Hint: ignore
Message-Id: <20240808213131.16FC984A1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/webkitgtk: bump
 to 2.44.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=50bf83cb7520c5c1eee36ca55c69fef2aaef559f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

A lot has been changed in 2.44.0, please consult the announcement [1], what's new [2],
and the security advisory [3] for more details.

Specific to this bump:

 - Libegl is now mandatory [4] and the USE_OPENGL_OR_ES flag has been dropped.
   While at it, also explicitly add the libepoxy dependency which is now selected
   by libgtk3.

 - The WPE renderer has been dropped [2], so drop the wpebackend-fdo dependency.

 - JPEG2000 has been dropped [2], so drop the OpenJPEG dependency.

 - GTK4 is now the default, so turn it off, since buildroot has no GTK4 support
   yet [2].

 - USE_LIBBACKTRACE has been added [5], so select it properly.

 - Support for ENABLE_WEB_CODECS has been added, which will now be enabled
   together with audio and video support.

 - ENABLE_WEBASSEMBLY is forbidden when ENABLE_C_LOOP [6], so disable it when
   compiling for MIPS r6, ARMv5, and ARMv6.

In the meantime, a follow-up 2.44.1 and 2.44.2 release has been announced [7][8],
which contains a bunch of patches that were accepted upstream. Including build
fixes for 32-bit devices, and disabling video.

[1]: https://webkitgtk.org/2024/03/16/webkitgtk2.44.0-released.html
[2]: https://webkitgtk.org/2024/03/27/webkigit-2.44.html
[3]: https://webkitgtk.org/security/WSA-2024-0002.html
[4]: https://commits.webkit.org/271345@main
[5]: https://commits.webkit.org/268579@main
[6]: https://commits.webkit.org/271347@main
[7]: https://webkitgtk.org/2024/04/09/webkitgtk2.44.1-released.html
[8]: https://webkitgtk.org/2024/05/16/webkitgtk2.44.2-released.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Tested-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d5ff56ef06c46bc870cc677d34cec2639852c823)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...LowLevelInterpreter.cpp-339-21-error-t6-w.patch | 39 -----------------
 package/webkitgtk/Config.in                        |  4 +-
 package/webkitgtk/webkitgtk.hash                   |  6 +--
 package/webkitgtk/webkitgtk.mk                     | 50 +++++++++-------------
 4 files changed, 26 insertions(+), 73 deletions(-)

diff --git a/package/webkitgtk/0001-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch b/package/webkitgtk/0001-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch
deleted file mode 100644
index c9667fedbd..0000000000
--- a/package/webkitgtk/0001-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 3d5373575695b293b8559155431d0079a6153aff Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@redhat.com>
-Date: Mon, 5 Feb 2024 11:00:49 -0600
-Subject: [PATCH] =?UTF-8?q?[GTK]=20[2.42.5]=20LowLevelInterpreter.cpp:339:?=
- =?UTF-8?q?21:=20error:=20=E2=80=98t6=E2=80=99=20was=20not=20declared=20in?=
- =?UTF-8?q?=20this=20scope=20https://bugs.webkit.org/show=5Fbug.cgi=3Fid?=
- =?UTF-8?q?=3D268739?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Unreviewed build fix. Seems a backport went badly, and we didn't notice
-because the code is architecture-specific.
-
-* Source/JavaScriptCore/llint/LowLevelInterpreter.cpp:
-(JSC::CLoop::execute):
-
-Upstream: https://github.com/WebKit/WebKit/commit/3d5373575695b293b8559155431d0079a6153aff
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Source/JavaScriptCore/llint/LowLevelInterpreter.cpp | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
-index 5064ead6cd2e..9a2e2653b121 100644
---- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
-+++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
-@@ -336,8 +336,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* executableAddress, VM* vm,
-     UNUSED_VARIABLE(t2);
-     UNUSED_VARIABLE(t3);
-     UNUSED_VARIABLE(t5);
--    UNUSED_VARIABLE(t6);
--    UNUSED_VARIABLE(t7);
- 
-     struct StackPointerScope {
-         StackPointerScope(CLoopStack& stack)
--- 
-2.39.2
-
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index ace1b8739f..8ee90dda1c 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -29,6 +29,7 @@ config BR2_PACKAGE_WEBKITGTK
 	bool "webkitgtk"
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on !BR2_BINFMT_FLAT # icu
+	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu, host-ruby
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup3
@@ -42,18 +43,17 @@ config BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_HARFBUZZ
 	select BR2_PACKAGE_ICU
 	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBEPOXY
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBSECRET
 	select BR2_PACKAGE_LIBSOUP3
 	select BR2_PACKAGE_LIBTASN1
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBXSLT
-	select BR2_PACKAGE_OPENJPEG
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_WEBP
 	select BR2_PACKAGE_WEBP_DEMUX
 	select BR2_PACKAGE_WOFF2
-	select BR2_PACKAGE_WPEBACKEND_FDO if BR2_PACKAGE_LIBGTK3_WAYLAND
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_LIBGTK3_X11
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index ac4799d4cf..7da0e97e5d 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.42.5.tar.xz.sums
-sha1  c3ffb2beaac56f1089029f2254482f48d9e3db37  webkitgtk-2.42.5.tar.xz
-sha256  b64278c1f20b8cfdbfb5ff573c37d871aba74a1db26d9b39f74e8953fe61e749  webkitgtk-2.42.5.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.44.2.tar.xz.sums
+sha1  e62b2c545011a2f180a914529a68950c4d34a2ee  webkitgtk-2.44.2.tar.xz
+sha256  523f42c8ff24832add17631f6eaafe8f9303afe316ef1a7e1844b952a7f7521b  webkitgtk-2.44.2.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 075a36654f..468fefab0e 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.42.5
+WEBKITGTK_VERSION = 2.44.2
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
@@ -14,8 +14,8 @@ WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-LGPL-2.1
 WEBKITGTK_CPE_ID_VENDOR = webkitgtk
 WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf host-unifdef \
-	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup3 \
-	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
+	enchant harfbuzz icu jpeg libegl libepoxy libgcrypt libgtk3 libsecret \
+	libsoup3 libtasn1 libxml2 libxslt sqlite webp woff2
 
 WEBKITGTK_CMAKE_BACKEND = ninja
 
@@ -28,8 +28,8 @@ WEBKITGTK_CONF_OPTS = \
 	-DENABLE_WEB_RTC=OFF \
 	-DPORT=GTK \
 	-DUSE_AVIF=OFF \
+	-DUSE_GTK4=OFF \
 	-DUSE_LIBHYPHEN=OFF \
-	-DUSE_OPENJPEG=ON \
 	-DUSE_WOFF2=ON
 
 ifeq ($(BR2_PACKAGE_WEBKITGTK_SANDBOX),y)
@@ -45,12 +45,14 @@ endif
 ifeq ($(BR2_PACKAGE_WEBKITGTK_MULTIMEDIA),y)
 WEBKITGTK_CONF_OPTS += \
 	-DENABLE_VIDEO=ON \
-	-DENABLE_WEB_AUDIO=ON
+	-DENABLE_WEB_AUDIO=ON \
+	-DENABLE_WEB_CODECS=ON
 WEBKITGTK_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base
 else
 WEBKITGTK_CONF_OPTS += \
 	-DENABLE_VIDEO=OFF \
-	-DENABLE_WEB_AUDIO=OFF
+	-DENABLE_WEB_AUDIO=OFF \
+	-DENABLE_WEB_CODECS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_WEBKITGTK_WEBDRIVER),y)
@@ -73,6 +75,13 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_INTROSPECTION=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBACKTRACE),y)
+WEBKITGTK_CONF_OPTS += -DUSE_LIBBACKTRACE=ON
+WEBKITGTK_DEPENDENCIES += libbacktrace
+else
+WEBKITGTK_CONF_OPTS += -DUSE_LIBBACKTRACE=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBJXL),y)
 WEBKITGTK_CONF_OPTS += -DUSE_JPEGXL=ON
 WEBKITGTK_DEPENDENCIES += libjxl
@@ -87,13 +96,6 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_GAMEPAD=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
-WEBKITGTK_CONF_OPTS += -DUSE_OPENGL_OR_ES=ON
-WEBKITGTK_DEPENDENCIES += libgles
-else
-WEBKITGTK_CONF_OPTS += -DUSE_OPENGL_OR_ES=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)
 WEBKITGTK_CONF_OPTS += -DUSE_GBM=ON
 WEBKITGTK_DEPENDENCIES += libgbm
@@ -111,23 +113,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=ON
-WEBKITGTK_DEPENDENCIES += libegl
 else
 WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=OFF
 endif
 
-# If only the GTK Broadway backend is enabled, EGL is still needed.
-ifeq ($(BR2_PACKAGE_LIBGTK3_X11):$(BR2_PACKAGE_LIBGTK3_WAYLAND):$(BR2_PACKAGE_LIBGTK3_BROADWAY),::y)
-WEBKITGTK_DEPENDENCIES += libegl
-endif
-
-ifeq ($(BR2_PACKAGE_WPEBACKEND_FDO),y)
-WEBKITGTK_CONF_OPTS += -DUSE_WPE_RENDERER=ON
-WEBKITGTK_DEPENDENCIES += wpebackend-fdo
-else
-WEBKITGTK_CONF_OPTS += -DUSE_WPE_RENDERER=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_WEBKITGTK_USE_GSTREAMER_GL),y)
 WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER_GL=ON
 else
@@ -145,14 +134,17 @@ endif
 # have a check for these processors. The same goes for ARMv5 and ARMv6.
 # Disable JIT forcibly here and use the CLoop interpreter instead.
 #
-# Also, we have to disable the sampling profiler, which does NOT work
-# with ENABLE_C_LOOP.
+# Also, we have to disable the sampling profiler and webassembly,
+# which does NOT work with ENABLE_C_LOOP.
 #
 # Upstream bugs: https://bugs.webkit.org/show_bug.cgi?id=191258
 #                https://bugs.webkit.org/show_bug.cgi?id=172765
+#                https://bugs.webkit.org/show_bug.cgi?id=265218
 #
 ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
-WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON -DENABLE_SAMPLING_PROFILER=OFF
+WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON \
+	-DENABLE_SAMPLING_PROFILER=OFF \
+	-DENABLE_WEBASSEMBLY=OFF
 endif
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC22AC4345F
	for <buildroot@archiver.kernel.org>; Tue, 16 Apr 2024 18:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0726760AE5;
	Tue, 16 Apr 2024 18:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SyyPKo0szxYx; Tue, 16 Apr 2024 18:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB5F760AED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB5F760AED;
	Tue, 16 Apr 2024 18:43:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7105E1BF969
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 18:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B43060ACE
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 18:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nl6vuVB-jL62 for <buildroot@lists.busybox.net>;
 Tue, 16 Apr 2024 18:42:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.46;
 helo=mail-ed1-f46.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B23FB60AE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B23FB60AE0
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B23FB60AE0
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 18:42:30 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-570423c4f80so1395537a12.0
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 11:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713292948; x=1713897748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4/c0Wn0D7UumHDuOMBDdkKgli7ej9f8P+UGEojmSrQU=;
 b=DCKukDUsrWpLEx5t0vA4WWH/YK2YGNwr0A564IO5JoG42JmSQgBrJ+rOSVEG8MwZgK
 lwhOC+g7PDi0mXqU89xUegxEu+KG/yixK5Wnv0ZRaNQzrz6WzsJhh1D0AtdIsj7bvjya
 4kiBXbJqESufYxjJOXDndLUIJ9T+mmYCgFNw3357RmcHlRCe9O7+IXMxWSjGozlnqN72
 k8fiLfO7VPhWf7jxdMDHZUa0I9lQYWItFS0xYEyrGZXiNlnP4MuG7RxPN7z/YQRf+Mec
 ELo9oHsBXdShzWtZugE676+FROIu1Cz3J/CD/4jzbwF+uZ1YKfrwAddBP9DXh60jH3pT
 I9ew==
X-Gm-Message-State: AOJu0YyE6enAsK6+P9UhuxGokzLMHvzTvIaPo8+Yj97FqaN1EwqIXwEy
 fCN99xUx7ZGQ3XZgu6cfaX2DSRWxAFAV7HV4lv67Qy/o7K9MHleb9j9whM3B
X-Google-Smtp-Source: AGHT+IE9SvooJSEnN20TC/lH5O8RIKlCfPeWlSncqL8fDoByiCttpyrFj9v5fR4jbXMmN6bcd8sv4g==
X-Received: by 2002:a17:906:6a13:b0:a52:3eff:13f1 with SMTP id
 qw19-20020a1709066a1300b00a523eff13f1mr10042202ejc.2.1713292947720; 
 Tue, 16 Apr 2024 11:42:27 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:ddfc:df5d:2cba:1046])
 by smtp.gmail.com with ESMTPSA id
 ht8-20020a170907608800b00a525669000csm4328455ejc.154.2024.04.16.11.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 11:42:27 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Tue, 16 Apr 2024 20:42:09 +0200
Message-Id: <20240416184209.2621561-4-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416184209.2621561-1-thomas@devoogdt.com>
References: <CACXRmJhRXXUUGFz=P9gOhVkqtAMePE4xgDg8rMNafuPMDWU3nQ@mail.gmail.com>
 <20240416184209.2621561-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v3 4/4] package/webkitgtk: bump to 2.44.1
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, Bernd Kuhls <bernd@kuhls.net>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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

In the meantime, a follow-up 2.44.1 release has been announced [7], which contains
a bunch of patches that were accepted upstream. Including build fixes for 32-bit
devices, and disabling video.

[1]: https://webkitgtk.org/2024/03/16/webkitgtk2.44.0-released.html
[2]: https://webkitgtk.org/2024/03/27/webkigit-2.44.html
[3]: https://webkitgtk.org/security/WSA-2024-0002.html
[4]: https://commits.webkit.org/271345@main
[5]: https://commits.webkit.org/268579@main
[6]: https://commits.webkit.org/271347@main
[7]: https://webkitgtk.org/2024/04/09/webkitgtk2.44.1-released.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: update patches with the upstream reference
v3: bump to 2.44.1 and drop the upstreamed patches
---
Used config to test:
```
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_LIBGTK3=y
BR2_PACKAGE_WEBKITGTK=y
```
---
 ...velInterpreter.cpp-339-21-error-t6-w.patch | 39 ---------------
 package/webkitgtk/Config.in                   |  4 +-
 package/webkitgtk/webkitgtk.hash              |  6 +--
 package/webkitgtk/webkitgtk.mk                | 50 ++++++++-----------
 4 files changed, 26 insertions(+), 73 deletions(-)
 delete mode 100644 package/webkitgtk/0001-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch

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
index ac4799d4cf..06363a5fe2 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.42.5.tar.xz.sums
-sha1  c3ffb2beaac56f1089029f2254482f48d9e3db37  webkitgtk-2.42.5.tar.xz
-sha256  b64278c1f20b8cfdbfb5ff573c37d871aba74a1db26d9b39f74e8953fe61e749  webkitgtk-2.42.5.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.44.1.tar.xz.sums
+sha1  070541abef5db19c32b64b68f664bacf05ef2e0e  webkitgtk-2.44.1.tar.xz
+sha256  425b1459b0f04d0600c78d1abb5e7edfa3c060a420f8b231e9a6a2d5d29c5561  webkitgtk-2.44.1.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 075a36654f..6761bae28f 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.42.5
+WEBKITGTK_VERSION = 2.44.1
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

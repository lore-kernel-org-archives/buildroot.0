Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05211CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 17:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 206DE60EC4;
	Wed,  3 Apr 2024 17:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pqLZLZGi63rW; Wed,  3 Apr 2024 17:14:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C231F60EC6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C231F60EC6;
	Wed,  3 Apr 2024 17:14:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 723D41BF420
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 17:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EF4760EC6
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 17:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSJatHU3wL62 for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 17:14:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.47;
 helo=mail-wr1-f47.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 07A4260EBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07A4260EBA
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07A4260EBA
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 17:14:34 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-34356f794a5so16182f8f.1
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 10:14:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712164472; x=1712769272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5yjQRzJ8dE7uTPUYmpRClBkXpuZ4Fd2l/VunjPsYHzo=;
 b=jr/6mPq4UYsrjKxdcOgVxi+BEmf8rIgNo7UrRYtz6IMVIVpg8atWA/FHV2+JltHOtn
 DJqbgm53FsI+9nJy+GqrOHaxSFi8Sim36Py+l42LnEvwhqomj5IIh7frVMdY5UhzcQLP
 wywmEegpsM2YWuOchhLjzMoRhRieIlbI+Cr1JE4RcLH/7SxoCU1Ox1qKx9F6ypoMbHo3
 JCsyHJ8JtgYcPU+aubPai+4Lg9Hn/puVzUQpyyid1AbMEnoJL6tAzlC2Yc64E9n37pRm
 cQgUkI1tus11DThe3mlNXccgjKNIOt7/Va3GhL7lFmnqSQjoh0+IAq+siI165T4QBsUJ
 tohw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHQz4Mj2SsedyDyXJ3qZKIlFf6MB7HEioBaedd+s6uI6Q+UOoAmeuBi09h0bk86U5BYWI6d6xApSRlwi9TzCJ8vnbjrDa7rQ==
X-Gm-Message-State: AOJu0Yz54jg6vOgPWwvw5p9nluQft2MqAT7cL85qMpni0Ld4dTfQ12/m
 A/mC6JschrfP8qZ5Uou8Ryg7UFMZ75FrQOF9EzQg+yojQCa20J/C
X-Google-Smtp-Source: AGHT+IHsZNhGLxaF4jIj0p7heQQod5FiF3k84PPLLhOKSkL2pQuYeeZHtJAINqUkCArpLplX7QuNyg==
X-Received: by 2002:a05:6000:50b:b0:343:6b09:653c with SMTP id
 a11-20020a056000050b00b003436b09653cmr90685wrf.43.1712164472335; 
 Wed, 03 Apr 2024 10:14:32 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:eb7f:31b3:c83f:7802])
 by smtp.gmail.com with ESMTPSA id
 dq6-20020a0560000cc600b00341c3071c93sm17729160wrb.73.2024.04.03.10.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 10:14:31 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Date: Wed,  3 Apr 2024 19:14:24 +0200
Message-Id: <20240403171424.44580-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403171424.44580-1-thomas@devoogdt.com>
References: <20240401183930.2557159-2-thomas@devoogdt.com>
 <20240403171424.44580-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2 2/2] package/webkitgtk: bump to 2.44.0
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
Cc: aperez@igalia.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A lot has been changed, please consult the announcement [1], what's new [2],
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

At last, a patch is needed to fix compilation if video is not enabled.

[1]: https://webkitgtk.org/2024/03/16/webkitgtk2.44.0-released.html
[2]: https://webkitgtk.org/2024/03/27/webkigit-2.44.html
[3]: https://webkitgtk.org/security/WSA-2024-0002.html
[4]: https://commits.webkit.org/271345@main
[5]: https://commits.webkit.org/268579@main
[6]: https://commits.webkit.org/271347@main

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: update patches with the upstream reference
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

Build fails:
                   bootlin-riscv32-glibc [17/42]: FAILED
                   bootlin-riscv64-glibc [18/42]: FAILED
                    bootlin-riscv64-musl [19/42]: FAILED

Reason:
>>> xlib_libxshmfence 1.3.2 Building
xshmfence_futex.h:58:24: error: 'SYS_futex' undeclared (first use in this function); did you mean 'sys_futex'?
   58 |         return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
      |                        ^~~~~~~~~
      |                        sys_futex
---
 ...velInterpreter.cpp-339-21-error-t6-w.patch |  39 --
 ...-fix-is_always_lock_free-assertion-o.patch |  64 ++++
 ...-fix-compilation-if-video-is-not-ena.patch | 355 ++++++++++++++++++
 package/webkitgtk/Config.in                   |   4 +-
 package/webkitgtk/webkitgtk.hash              |   6 +-
 package/webkitgtk/webkitgtk.mk                |  50 ++-
 6 files changed, 445 insertions(+), 73 deletions(-)
 delete mode 100644 package/webkitgtk/0001-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch
 create mode 100644 package/webkitgtk/0001-webkitgtk-2.44.0-fix-is_always_lock_free-assertion-o.patch
 create mode 100644 package/webkitgtk/0002-webkitgtk-2.44.0-fix-compilation-if-video-is-not-ena.patch

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
diff --git a/package/webkitgtk/0001-webkitgtk-2.44.0-fix-is_always_lock_free-assertion-o.patch b/package/webkitgtk/0001-webkitgtk-2.44.0-fix-is_always_lock_free-assertion-o.patch
new file mode 100644
index 0000000000..fffdb219c6
--- /dev/null
+++ b/package/webkitgtk/0001-webkitgtk-2.44.0-fix-is_always_lock_free-assertion-o.patch
@@ -0,0 +1,64 @@
+From 61dea7cc41a702752720b807da0164b896b183c4 Mon Sep 17 00:00:00 2001
+From: Charlie Lao <cclao@google.com>
+Date: Fri, 29 Mar 2024 10:30:59 -0700
+Subject: [PATCH] webkitgtk-2.44.0: fix is_always_lock_free assertion on 32 bit
+ arch
+
+Cherry-pick 276856.1@bugfix/angle_fix_is_always_lock_free (4399714e71df).
+
+https://bugs.webkit.org/show_bug.cgi?id=252670
+
+    [ANGLE]: fix is_always_lock_free assertion on 32 bit arch
+
+    Remove is_always_lock_free assertion from AtomicQueueSerial
+
+    Build will fail when compiled on 32 bit architecture. The code will
+    still function on 32 bit architecture but with performance penalty due
+    to lock. But we are not really expecting it actually run on 32 bit
+    platform with vulkan backend (the atomic queue serial is only used by
+    vulkan backend). We could move AtomicQueueSerial into vulkan backend,
+    but that will be a much larger change that I try to avoid. This CL
+    removes the static_assertion and make it 8 bytes aligned as well.
+
+    Bug: angleproject:7989
+    Change-Id: I3c0bd9877c4171485ca1aa9af0cf4621c1c23f56
+    Reviewed-on:
+    https://chromium-review.googlesource.com/c/angle/angle/+/5407870
+    Reviewed-by: Shahbaz Youssefi <syoussefi@chromium.org>
+    Commit-Queue: Charlie Lao <cclao@google.com>
+
+    Upstream:
+    https://chromium.googlesource.com/angle/angle/+/321c6b63bebce3f31414d8a53fb2f94b5561b818
+
+    Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+
+Upstream: (2.44) https://github.com/WebKit/WebKit/commit/45567b5403c1820b674654a4470b7d075aa79ba3
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ Source/ThirdParty/ANGLE/src/libANGLE/renderer/serial_utils.h | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Source/ThirdParty/ANGLE/src/libANGLE/renderer/serial_utils.h b/Source/ThirdParty/ANGLE/src/libANGLE/renderer/serial_utils.h
+index 812927743a64..7146690c95ab 100644
+--- a/Source/ThirdParty/ANGLE/src/libANGLE/renderer/serial_utils.h
++++ b/Source/ThirdParty/ANGLE/src/libANGLE/renderer/serial_utils.h
+@@ -116,7 +116,7 @@ class Serial final
+ };
+ 
+ // Defines class to track the queue serial that can be load/store from multiple threads atomically.
+-class AtomicQueueSerial final
++class alignas(8) AtomicQueueSerial final
+ {
+   public:
+     AtomicQueueSerial &operator=(const Serial &other)
+@@ -129,7 +129,6 @@ class AtomicQueueSerial final
+   private:
+     static constexpr uint64_t kInvalid = 0;
+     std::atomic<uint64_t> mValue       = kInvalid;
+-    static_assert(decltype(mValue)::is_always_lock_free, "Must always be lock free");
+ };
+ 
+ // Used as default/initial serial
+-- 
+2.34.1
+
diff --git a/package/webkitgtk/0002-webkitgtk-2.44.0-fix-compilation-if-video-is-not-ena.patch b/package/webkitgtk/0002-webkitgtk-2.44.0-fix-compilation-if-video-is-not-ena.patch
new file mode 100644
index 0000000000..19b3ca4253
--- /dev/null
+++ b/package/webkitgtk/0002-webkitgtk-2.44.0-fix-compilation-if-video-is-not-ena.patch
@@ -0,0 +1,355 @@
+From ee3cfea3078dafbf5e5c38891da85c35fceae717 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Tue, 2 Apr 2024 16:04:55 -0700
+Subject: [PATCH] webkitgtk-2.44.0: fix compilation if video is not enabled
+
+Cherry-pick 276977@main (ea2be408f27e).
+
+https://bugs.webkit.org/show_bug.cgi?id=271881
+
+Reviewed by Mike Wyrzykowski.
+
+    REGRESSION: fix compilation if !ENABLE(VIDEO)
+
+    [WebCore]: FullscreenManager: add missing include
+
+    HTMLMediaElement normally includes HTMLMediaElementEnums,
+    but only if VIDEO is enabled.
+
+    [WebCore]: FullscreenManager: fix undefined reference to HTMLMediaElement
+
+    HTMLMediaElement is not compiled if VIDEO is not enabled.
+
+    [WebCore]: css: fix fix undefined reference to HTMLMediaElement
+
+    HTMLMediaElement is not compiled if VIDEO is not enabled.
+
+    [WebCore]: InspectorDOMAgent: fix fix undefined reference to HTMLMediaElement
+
+    HTMLMediaElement is not compiled if VIDEO is not enabled.
+
+    [WebKit]: WebGPU: drop duplicate directive in RemoteDevice
+
+    The #if PLATFORM(COCOA) && ENABLE(VIDEO) directive is already defined
+    outside the function scope, so drop the inner ones.
+
+    [WebCore]: GPUDevice: fix undefined reference to HTMLMediaElement
+
+    HTMLMediaElement is not compiled if VIDEO is not enabled.
+
+    [WebKit]: WebFullScreenManagerProxy: add missing include
+
+    HTMLMediaElement normally includes HTMLMediaElementEnums,
+    but only if VIDEO is enabled.
+
+    [WebKit]: WebFullScreenManager: add missing include
+
+    HTMLMediaElement normally includes HTMLMediaElementEnums,
+    but only if VIDEO is enabled.
+
+    [WebKit]: InjectedBundlePageFullScreenClient: add missing include
+
+    HTMLMediaElement normally includes HTMLMediaElementEnums,
+    but only if VIDEO is enabled.
+
+    [WebKit]: WebCoreArgumentCoders.serialization.in: fix undefined reference
+
+    CaptionUserPreferencesDisplayMode and SerializedPlatformDataCueValue
+    are only compiled if VIDEO is enabled.
+
+    Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+    Canonical link: https://commits.webkit.org/276977@main
+
+Upstream: (2.44) https://github.com/WebKit/WebKit/commit/004c28e211d9fbc10edcb404332d0f6ab31242f5
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ Source/WebCore/Modules/WebGPU/GPUDevice.cpp               | 4 ++++
+ Source/WebCore/Modules/WebGPU/GPUDevice.h                 | 3 +++
+ Source/WebCore/css/SelectorChecker.cpp                    | 2 ++
+ Source/WebCore/css/SelectorCheckerTestFunctions.h         | 2 ++
+ Source/WebCore/cssjit/SelectorCompiler.cpp                | 8 ++++++++
+ Source/WebCore/dom/FullscreenManager.cpp                  | 2 ++
+ Source/WebCore/dom/FullscreenManager.h                    | 1 +
+ Source/WebCore/inspector/agents/InspectorDOMAgent.cpp     | 5 +++++
+ Source/WebKit/GPUProcess/graphics/WebGPU/RemoteDevice.cpp | 4 ----
+ .../WebKit/Shared/WebCoreArgumentCoders.serialization.in  | 4 ++++
+ Source/WebKit/UIProcess/WebFullScreenManagerProxy.h       | 1 +
+ .../WebKit/WebProcess/FullScreen/WebFullScreenManager.h   | 1 +
+ .../InjectedBundle/InjectedBundlePageFullScreenClient.h   | 1 +
+ 13 files changed, 34 insertions(+), 4 deletions(-)
+
+diff --git a/Source/WebCore/Modules/WebGPU/GPUDevice.cpp b/Source/WebCore/Modules/WebGPU/GPUDevice.cpp
+index 6f36a58b7839..2d9dd3b350aa 100644
+--- a/Source/WebCore/Modules/WebGPU/GPUDevice.cpp
++++ b/Source/WebCore/Modules/WebGPU/GPUDevice.cpp
+@@ -270,6 +270,7 @@ Ref<GPUSampler> GPUDevice::createSampler(const std::optional<GPUSamplerDescripto
+     return GPUSampler::create(m_backing->createSampler(convertToBacking(samplerDescriptor)));
+ }
+ 
++#if ENABLE(VIDEO)
+ GPUExternalTexture* GPUDevice::externalTextureForDescriptor(const GPUExternalTextureDescriptor& descriptor)
+ {
+     m_videoElementToExternalTextureMap.removeNullReferences();
+@@ -318,9 +319,11 @@ private:
+     HTMLVideoElement& m_videoElement;
+     WeakHashMap<HTMLVideoElement, WeakPtr<GPUExternalTexture>, WeakPtrImplWithEventTargetData> &m_weakMap;
+ };
++#endif
+ 
+ Ref<GPUExternalTexture> GPUDevice::importExternalTexture(const GPUExternalTextureDescriptor& externalTextureDescriptor)
+ {
++#if ENABLE(VIDEO)
+     if (auto* externalTexture = externalTextureForDescriptor(externalTextureDescriptor)) {
+         externalTexture->undestroy();
+ #if ENABLE(WEB_CODECS)
+@@ -331,6 +334,7 @@ Ref<GPUExternalTexture> GPUDevice::importExternalTexture(const GPUExternalTextur
+         m_videoElementToExternalTextureMap.remove(*videoElement.get());
+         return *externalTexture;
+     }
++#endif
+     auto externalTexture = GPUExternalTexture::create(m_backing->importExternalTexture(externalTextureDescriptor.convertToBacking()));
+ #if ENABLE(VIDEO)
+ #if ENABLE(WEB_CODECS)
+diff --git a/Source/WebCore/Modules/WebGPU/GPUDevice.h b/Source/WebCore/Modules/WebGPU/GPUDevice.h
+index 09f9dd6d61ec..925bb8c57fb1 100644
+--- a/Source/WebCore/Modules/WebGPU/GPUDevice.h
++++ b/Source/WebCore/Modules/WebGPU/GPUDevice.h
+@@ -157,7 +157,10 @@ private:
+     Ref<GPUQueue> m_queue;
+     Ref<GPUPipelineLayout> m_autoPipelineLayout;
+     HashSet<GPUBuffer*> m_buffersToUnmap;
++
++#if ENABLE(VIDEO)
+     GPUExternalTexture* externalTextureForDescriptor(const GPUExternalTextureDescriptor&);
++#endif
+ 
+     WeakHashMap<HTMLVideoElement, WeakPtr<GPUExternalTexture>, WeakPtrImplWithEventTargetData> m_videoElementToExternalTextureMap;
+     bool m_waitingForDeviceLostPromise { false };
+diff --git a/Source/WebCore/css/SelectorChecker.cpp b/Source/WebCore/css/SelectorChecker.cpp
+index 60db400f695a..1a4c72c4dbc5 100644
+--- a/Source/WebCore/css/SelectorChecker.cpp
++++ b/Source/WebCore/css/SelectorChecker.cpp
+@@ -1055,9 +1055,11 @@ bool SelectorChecker::checkOne(CheckingContext& checkingContext, const LocalCont
+             return matchesAnimatingFullscreenTransitionPseudoClass(element);
+         case CSSSelector::PseudoClass::InternalFullscreenDocument:
+             return matchesFullscreenDocumentPseudoClass(element);
++#if ENABLE(VIDEO)
+         case CSSSelector::PseudoClass::InternalInWindowFullScreen:
+             return matchesInWindowFullScreenPseudoClass(element);
+ #endif
++#endif
+ #if ENABLE(PICTURE_IN_PICTURE_API)
+         case CSSSelector::PseudoClass::PictureInPicture:
+             return matchesPictureInPicturePseudoClass(element);
+diff --git a/Source/WebCore/css/SelectorCheckerTestFunctions.h b/Source/WebCore/css/SelectorCheckerTestFunctions.h
+index 0be916897226..b14b4b87ec5e 100644
+--- a/Source/WebCore/css/SelectorCheckerTestFunctions.h
++++ b/Source/WebCore/css/SelectorCheckerTestFunctions.h
+@@ -432,6 +432,7 @@ ALWAYS_INLINE bool matchesFullscreenDocumentPseudoClass(const Element& element)
+     return fullscreenManager && fullscreenManager->fullscreenElement();
+ }
+ 
++#if ENABLE(VIDEO)
+ ALWAYS_INLINE bool matchesInWindowFullScreenPseudoClass(const Element& element)
+ {
+     if (&element != element.document().fullscreenManager().currentFullscreenElement())
+@@ -440,6 +441,7 @@ ALWAYS_INLINE bool matchesInWindowFullScreenPseudoClass(const Element& element)
+     auto* mediaElement = dynamicDowncast<HTMLMediaElement>(element);
+     return mediaElement && mediaElement->fullscreenMode() == HTMLMediaElementEnums::VideoFullscreenModeInWindow;
+ }
++#endif
+ 
+ #endif
+ 
+diff --git a/Source/WebCore/cssjit/SelectorCompiler.cpp b/Source/WebCore/cssjit/SelectorCompiler.cpp
+index 94972294daf9..6bf6658a1dbd 100644
+--- a/Source/WebCore/cssjit/SelectorCompiler.cpp
++++ b/Source/WebCore/cssjit/SelectorCompiler.cpp
+@@ -258,8 +258,10 @@ static JSC_DECLARE_JIT_OPERATION_WITHOUT_WTF_INTERNAL(operationMatchesLangPseudo
+ static JSC_DECLARE_JIT_OPERATION_WITHOUT_WTF_INTERNAL(operationMatchesFullscreenPseudoClass, bool, (const Element&));
+ static JSC_DECLARE_JIT_OPERATION_WITHOUT_WTF_INTERNAL(operationMatchesFullscreenDocumentPseudoClass, bool, (const Element&));
+ static JSC_DECLARE_JIT_OPERATION_WITHOUT_WTF_INTERNAL(operationMatchesAnimatingFullscreenTransitionPseudoClass, bool, (const Element&));
++#if ENABLE(VIDEO)
+ static JSC_DECLARE_JIT_OPERATION_WITHOUT_WTF_INTERNAL(operationMatchesInWindowFullScreenPseudoClass, bool, (const Element&));
+ #endif
++#endif
+ #if ENABLE(PICTURE_IN_PICTURE_API)
+ static JSC_DECLARE_JIT_OPERATION_WITHOUT_WTF_INTERNAL(operationMatchesPictureInPicturePseudoClass, bool, (const Element&));
+ #endif
+@@ -910,6 +912,8 @@ JSC_DEFINE_JIT_OPERATION(operationMatchesAnimatingFullscreenTransitionPseudoClas
+     COUNT_SELECTOR_OPERATION(operationMatchesAnimatingFullscreenTransitionPseudoClass);
+     return matchesAnimatingFullscreenTransitionPseudoClass(element);
+ }
++
++#if ENABLE(VIDEO)
+ JSC_DEFINE_JIT_OPERATION(operationMatchesInWindowFullScreenPseudoClass, bool, (const Element& element))
+ {
+     COUNT_SELECTOR_OPERATION(operationMatchesInWindowFullScreenPseudoClass);
+@@ -917,6 +921,8 @@ JSC_DEFINE_JIT_OPERATION(operationMatchesInWindowFullScreenPseudoClass, bool, (c
+ }
+ #endif
+ 
++#endif
++
+ #if ENABLE(PICTURE_IN_PICTURE_API)
+ JSC_DEFINE_JIT_OPERATION(operationMatchesPictureInPicturePseudoClass, bool, (const Element& element))
+ {
+@@ -1113,10 +1119,12 @@ static inline FunctionType addPseudoClassType(const CSSSelector& selector, Selec
+     case CSSSelector::PseudoClass::InternalAnimatingFullscreenTransition:
+         fragment.unoptimizedPseudoClasses.append(CodePtr<JSC::OperationPtrTag>(operationMatchesAnimatingFullscreenTransitionPseudoClass));
+         return FunctionType::SimpleSelectorChecker;
++#if ENABLE(VIDEO)
+     case CSSSelector::PseudoClass::InternalInWindowFullScreen:
+         fragment.unoptimizedPseudoClasses.append(CodePtr<JSC::OperationPtrTag>(operationMatchesInWindowFullScreenPseudoClass));
+         return FunctionType::SimpleSelectorChecker;
+ #endif
++#endif
+ 
+ #if ENABLE(PICTURE_IN_PICTURE_API)
+     case CSSSelector::PseudoClass::PictureInPicture:
+diff --git a/Source/WebCore/dom/FullscreenManager.cpp b/Source/WebCore/dom/FullscreenManager.cpp
+index 248694557dc3..58bf96045277 100644
+--- a/Source/WebCore/dom/FullscreenManager.cpp
++++ b/Source/WebCore/dom/FullscreenManager.cpp
+@@ -529,9 +529,11 @@ bool FullscreenManager::willEnterFullscreen(Element& element, HTMLMediaElementEn
+     INFO_LOG(LOGIDENTIFIER);
+     ASSERT(page()->settings().fullScreenEnabled());
+ 
++#if ENABLE(VIDEO)
+     if (RefPtr mediaElement = dynamicDowncast<HTMLMediaElement>(element))
+         mediaElement->willBecomeFullscreenElement(mode);
+     else
++#endif
+         element.willBecomeFullscreenElement();
+ 
+     ASSERT(&element == m_pendingFullscreenElement);
+diff --git a/Source/WebCore/dom/FullscreenManager.h b/Source/WebCore/dom/FullscreenManager.h
+index 3b1f74177cba..8f2287f8a756 100644
+--- a/Source/WebCore/dom/FullscreenManager.h
++++ b/Source/WebCore/dom/FullscreenManager.h
+@@ -31,6 +31,7 @@
+ #include "FrameDestructionObserverInlines.h"
+ #include "GCReachableRef.h"
+ #include "HTMLMediaElement.h"
++#include "HTMLMediaElementEnums.h"
+ #include "LayoutRect.h"
+ #include "Page.h"
+ #include <wtf/Deque.h>
+diff --git a/Source/WebCore/inspector/agents/InspectorDOMAgent.cpp b/Source/WebCore/inspector/agents/InspectorDOMAgent.cpp
+index 6e348089ef30..87f891547563 100644
+--- a/Source/WebCore/inspector/agents/InspectorDOMAgent.cpp
++++ b/Source/WebCore/inspector/agents/InspectorDOMAgent.cpp
+@@ -3098,6 +3098,7 @@ Protocol::ErrorStringOr<void> InspectorDOMAgent::setAllowEditingUserAgentShadowT
+ 
+ Protocol::ErrorStringOr<Ref<Protocol::DOM::MediaStats>> InspectorDOMAgent::getMediaStats(Protocol::DOM::NodeId nodeId)
+ {
++#if ENABLE(VIDEO)
+     Protocol::ErrorString errorString;
+ 
+     auto* element = assertElement(errorString, nodeId);
+@@ -3174,6 +3175,10 @@ Protocol::ErrorStringOr<Ref<Protocol::DOM::MediaStats>> InspectorDOMAgent::getMe
+     }
+ 
+     return stats;
++#else
++    UNUSED_PARAM(nodeId);
++    return makeUnexpected("no media support"_s);
++#endif
+ }
+ 
+ } // namespace WebCore
+diff --git a/Source/WebKit/GPUProcess/graphics/WebGPU/RemoteDevice.cpp b/Source/WebKit/GPUProcess/graphics/WebGPU/RemoteDevice.cpp
+index cffe7e6a8b46..86138574b84d 100644
+--- a/Source/WebKit/GPUProcess/graphics/WebGPU/RemoteDevice.cpp
++++ b/Source/WebKit/GPUProcess/graphics/WebGPU/RemoteDevice.cpp
+@@ -174,7 +174,6 @@ void RemoteDevice::setSharedVideoFrameMemory(WebCore::SharedMemory::Handle&& han
+ #if PLATFORM(COCOA) && ENABLE(VIDEO)
+ void RemoteDevice::importExternalTextureFromVideoFrame(const WebGPU::ExternalTextureDescriptor& descriptor, WebGPUIdentifier identifier)
+ {
+-#if PLATFORM(COCOA) && ENABLE(VIDEO)
+     std::optional<WebKit::SharedVideoFrame> sharedVideoFrame = descriptor.sharedFrame;
+     RetainPtr<CVPixelBufferRef> pixelBuffer { nullptr };
+     if (sharedVideoFrame) {
+@@ -195,9 +194,6 @@ void RemoteDevice::importExternalTextureFromVideoFrame(const WebGPU::ExternalTex
+     auto externalTexture = m_backing->importExternalTexture(*convertedDescriptor);
+     auto remoteExternalTexture = RemoteExternalTexture::create(externalTexture, m_objectHeap, m_streamConnection.copyRef(), identifier);
+     m_objectHeap.addObject(identifier, remoteExternalTexture);
+-#else
+-    UNUSED_PARAM(identifier);
+-#endif
+ }
+ #endif // PLATFORM(COCOA) && ENABLE(VIDEO)
+ 
+diff --git a/Source/WebKit/Shared/WebCoreArgumentCoders.serialization.in b/Source/WebKit/Shared/WebCoreArgumentCoders.serialization.in
+index 0ed841ce1a2a..419fcda6ce7f 100644
+--- a/Source/WebKit/Shared/WebCoreArgumentCoders.serialization.in
++++ b/Source/WebKit/Shared/WebCoreArgumentCoders.serialization.in
+@@ -7120,6 +7120,7 @@ header: <WebCore/Font.h>
+ [Nested] enum class WebCore::FontVisibility : bool;
+ [Nested] enum class WebCore::FontIsOrientationFallback : bool;
+ 
++#if ENABLE(VIDEO)
+ header: <WebCore/CaptionUserPreferences.h>
+ enum class WebCore::CaptionUserPreferencesDisplayMode : uint8_t {
+     Automatic,
+@@ -7127,6 +7128,7 @@ enum class WebCore::CaptionUserPreferencesDisplayMode : uint8_t {
+     AlwaysOn,
+     Manual,
+ };
++#endif
+ 
+ header: <WebCore/InspectorClient.h>
+ enum class WebCore::InspectorClientDeveloperPreference : uint8_t {
+@@ -7741,6 +7743,7 @@ header: <WebCore/FilterFunction.h>
+     SourceGraphic
+ };
+ 
++#if ENABLE(VIDEO)
+ class WebCore::SerializedPlatformDataCueValue {
+     std::optional<WebCore::SerializedPlatformDataCueValue::Data> data()
+ }
+@@ -7753,4 +7756,5 @@ class WebCore::SerializedPlatformDataCueValue {
+     RetainPtr<NSLocale> locale;
+     std::variant<std::nullptr_t, RetainPtr<NSString>, RetainPtr<NSDate>, RetainPtr<NSNumber>, RetainPtr<NSData>> value;
+ #endif
++#endif
+ };
+diff --git a/Source/WebKit/UIProcess/WebFullScreenManagerProxy.h b/Source/WebKit/UIProcess/WebFullScreenManagerProxy.h
+index e0834267bc71..dde36eae7f83 100644
+--- a/Source/WebKit/UIProcess/WebFullScreenManagerProxy.h
++++ b/Source/WebKit/UIProcess/WebFullScreenManagerProxy.h
+@@ -29,6 +29,7 @@
+ 
+ #include "MessageReceiver.h"
+ #include <WebCore/HTMLMediaElement.h>
++#include <WebCore/HTMLMediaElementEnums.h>
+ #include <wtf/CompletionHandler.h>
+ #include <wtf/RefCounted.h>
+ #include <wtf/RefPtr.h>
+diff --git a/Source/WebKit/WebProcess/FullScreen/WebFullScreenManager.h b/Source/WebKit/WebProcess/FullScreen/WebFullScreenManager.h
+index 4c3e0f50ee35..5313dc181b8f 100644
+--- a/Source/WebKit/WebProcess/FullScreen/WebFullScreenManager.h
++++ b/Source/WebKit/WebProcess/FullScreen/WebFullScreenManager.h
+@@ -30,6 +30,7 @@
+ #include "WebCoreArgumentCoders.h"
+ #include <WebCore/EventListener.h>
+ #include <WebCore/HTMLMediaElement.h>
++#include <WebCore/HTMLMediaElementEnums.h>
+ #include <WebCore/IntRect.h>
+ #include <WebCore/LengthBox.h>
+ #include <wtf/RefCounted.h>
+diff --git a/Source/WebKit/WebProcess/InjectedBundle/InjectedBundlePageFullScreenClient.h b/Source/WebKit/WebProcess/InjectedBundle/InjectedBundlePageFullScreenClient.h
+index c6d1113e1706..4b9490ac3c89 100644
+--- a/Source/WebKit/WebProcess/InjectedBundle/InjectedBundlePageFullScreenClient.h
++++ b/Source/WebKit/WebProcess/InjectedBundle/InjectedBundlePageFullScreenClient.h
+@@ -32,6 +32,7 @@
+ #include "WKBundlePageFullScreenClient.h"
+ #include <WebCore/FloatSize.h>
+ #include <WebCore/HTMLMediaElement.h>
++#include <WebCore/HTMLMediaElementEnums.h>
+ #include <WebCore/MediaPlayerEnums.h>
+ #include <wtf/Forward.h>
+ 
+-- 
+2.34.1
+
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
index ac4799d4cf..dd1ec855ae 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.42.5.tar.xz.sums
-sha1  c3ffb2beaac56f1089029f2254482f48d9e3db37  webkitgtk-2.42.5.tar.xz
-sha256  b64278c1f20b8cfdbfb5ff573c37d871aba74a1db26d9b39f74e8953fe61e749  webkitgtk-2.42.5.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.44.0.tar.xz.sums
+sha1  f3cf333015ab53aea66a5f4ad2343644e82d1c58  webkitgtk-2.44.0.tar.xz
+sha256  c66530e41ba59b1edba4ee89ef20b2188e273bed0497e95084729e3cfbe30c87  webkitgtk-2.44.0.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 075a36654f..e7fd567021 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.42.5
+WEBKITGTK_VERSION = 2.44.0
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

From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 18 May 2021 18:14:06 +0300
Subject: [Buildroot] [PATCH 3/4] package/wpewebkit: bump to version 2.32.1
In-Reply-To: <20210518151407.264769-1-aperez@igalia.com>
References: <20210518151407.264769-1-aperez@igalia.com>
Message-ID: <20210518151407.264769-4-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to a new major release which brings in improvements and a few new
features. Release notes:

  https://wpewebkit.org/release/wpewebkit-2.32.0.html
  https://wpewebkit.org/release/wpewebkit-2.32.1.html

None of the new features in WPE WebKit 2.32.x need additional
dependencies.

The existing patch for Musl compatibility is not needed anymore because
a better solution has been accepted upstream and backported to be
included in the 2.32.1 release.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 .../wpewebkit/0001-Fix-build-with-musl.patch  | 79 -------------------
 package/wpewebkit/wpewebkit.hash              |  8 +-
 package/wpewebkit/wpewebkit.mk                |  2 +-
 3 files changed, 5 insertions(+), 84 deletions(-)
 delete mode 100644 package/wpewebkit/0001-Fix-build-with-musl.patch

diff --git a/package/wpewebkit/0001-Fix-build-with-musl.patch b/package/wpewebkit/0001-Fix-build-with-musl.patch
deleted file mode 100644
index 705c67c7f6..0000000000
--- a/package/wpewebkit/0001-Fix-build-with-musl.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From cc3c27a7e997ef157ed469127f185a7bb6eb1feb Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 27 May 2019 23:51:32 +0200
-Subject: [PATCH] Fix build with musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[Retrieved (and slightly updated) from:
-https://github.com/WebPlatformForEmbedded/meta-wpe/blob/master/recipes-wpe/wpewebkit/wpewebkit/0001-Fix-build-with-musl.patch]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Source/JavaScriptCore/runtime/MachineContext.h | 10 +++++-----
- Source/WTF/wtf/PlatformHave.h                  |  2 +-
- 2 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/Source/JavaScriptCore/runtime/MachineContext.h b/Source/JavaScriptCore/runtime/MachineContext.h
-index bf0bdc7a51a..78d2ec81838 100644
---- a/Source/JavaScriptCore/runtime/MachineContext.h
-+++ b/Source/JavaScriptCore/runtime/MachineContext.h
-@@ -146,7 +146,7 @@ inline void*& stackPointer(mcontext_t& machineContext)
- #error Unknown Architecture
- #endif
-
--#elif OS(FUCHSIA) || defined(__GLIBC__) || defined(__BIONIC__)
-+#elif OS(FUCHSIA) || OS(LINUX) || defined(__BIONIC__) 
- 
- #if CPU(X86)
-     return reinterpret_cast<void*&>((uintptr_t&) machineContext.gregs[REG_ESP]);
-@@ -251,7 +251,7 @@ inline void*& framePointer(mcontext_t& machineContext)
- #error Unknown Architecture
- #endif
-
--#elif OS(FUCHSIA) || defined(__GLIBC__) || defined(__BIONIC__)
-+#elif OS(FUCHSIA) || OS(LINUX) || defined(__BIONIC__) 
- 
- // The following sequence depends on glibc's sys/ucontext.h.
- #if CPU(X86)
-@@ -354,7 +354,7 @@ inline void*& instructionPointer(mcontext_t& machineContext)
- #error Unknown Architecture
- #endif
- 
--#elif OS(FUCHSIA) || defined(__GLIBC__) || defined(__BIONIC__)
-+#elif OS(FUCHSIA) || OS(LINUX) || defined(__BIONIC__)
- 
- // The following sequence depends on glibc's sys/ucontext.h.
- #if CPU(X86)
-@@ -466,7 +466,7 @@ inline void*& argumentPointer<1>(mcontext_t& machineContext)
- #error Unknown Architecture
- #endif
-
--#elif OS(FUCHSIA) || defined(__GLIBC__) || defined(__BIONIC__)
-+#elif OS(FUCHSIA) || OS(LINUX) || defined(__BIONIC__) 
- 
- // The following sequence depends on glibc's sys/ucontext.h.
- #if CPU(X86)
-@@ -583,7 +583,7 @@ inline void*& llintInstructionPointer(mcontext_t& machineContext)
- #error Unknown Architecture
- #endif
-
--#elif OS(FUCHSIA) || defined(__GLIBC__) || defined(__BIONIC__)
-+#elif OS(FUCHSIA) || OS(LINUX) || defined(__BIONIC__) 
- 
- // The following sequence depends on glibc's sys/ucontext.h.
- #if CPU(X86)
-diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
-index e2a3388993f..95fe7c593cf 100644
---- a/Source/WTF/wtf/PlatformHave.h
-+++ b/Source/WTF/wtf/PlatformHave.h
-@@ -683,7 +683,7 @@
- #define HAVE_CFNETWORK_STORAGE_PARTITIONING 1
- #endif
-
--#if OS(DARWIN) || OS(FUCHSIA) || ((OS(FREEBSD) || defined(__GLIBC__) || defined(__BIONIC__)) && (CPU(X86) || CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
-+#if OS(DARWIN) || OS(FUCHSIA) || ((OS(FREEBSD) || OS(LINUX) || defined(__BIONIC__)) && (CPU(X86) || CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS))) 
- #define HAVE_MACHINE_CONTEXT 1
- #endif
- 
--- 
-2.20.1
-
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index c3aa8d4164..0c8c6dba6f 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.30.6.tar.xz.sums
-md5  e35b31932ad3da6c06736d8f2d347072  wpewebkit-2.30.6.tar.xz
-sha1  25a481e97e463df08fb2c0b0fa5d4299938670ac  wpewebkit-2.30.6.tar.xz
-sha256  893a3098226f116bbb38a665a3053c7d30e3c5dca786b954f9aa38f8c8581468  wpewebkit-2.30.6.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.32.1.tar.xz.sums
+md5  1dd3f56b8eba16266166d757acb979fc  wpewebkit-2.32.1.tar.xz
+sha1  c5b3a48d886375a6982dd2dc5c9cc2f92f5a9690  wpewebkit-2.32.1.tar.xz
+sha256  7b6b39a12ccf3f84da4cc6ac59e02fbe328f7476eaeb9c23de9b9288c2c2f39c  wpewebkit-2.32.1.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index b18ee2a37d..39424a26fa 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.30.6
+WPEWEBKIT_VERSION = 2.32.1
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.31.1

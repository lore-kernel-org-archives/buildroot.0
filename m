From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 12:37:08 +0200
Subject: [Buildroot] [git commit] package/wpewebkit: fix build with musl
Message-ID: <20190601103707.4D6318E8C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e9fba9741a94b6d51cac89c2d0664dc91a9ff4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/c703d45ab691641beabc3440f081a8bc195b4a23

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpewebkit/0001-Fix-build-with-musl.patch | 79 ++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/package/wpewebkit/0001-Fix-build-with-musl.patch b/package/wpewebkit/0001-Fix-build-with-musl.patch
new file mode 100644
index 0000000000..a436adf6ce
--- /dev/null
+++ b/package/wpewebkit/0001-Fix-build-with-musl.patch
@@ -0,0 +1,79 @@
+From cc3c27a7e997ef157ed469127f185a7bb6eb1feb Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 27 May 2019 23:51:32 +0200
+Subject: [PATCH] Fix build with musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[Retrieved (and slightly updated) from:
+https://github.com/WebPlatformForEmbedded/meta-wpe/blob/master/recipes-wpe/wpewebkit/wpewebkit/0001-Fix-build-with-musl.patch]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Source/JavaScriptCore/runtime/MachineContext.h | 10 +++++-----
+ Source/WTF/wtf/Platform.h                      |  2 +-
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/Source/JavaScriptCore/runtime/MachineContext.h b/Source/JavaScriptCore/runtime/MachineContext.h
+index bf0bdc7a51a..78d2ec81838 100644
+--- a/Source/JavaScriptCore/runtime/MachineContext.h
++++ b/Source/JavaScriptCore/runtime/MachineContext.h
+@@ -146,7 +146,7 @@ inline void*& stackPointer(mcontext_t& machineContext)
+ #error Unknown Architecture
+ #endif
+
+-#elif OS(FUCHSIA) || defined(__GLIBC__) || defined(__BIONIC__)
++#elif OS(FUCHSIA) || OS(LINUX) || defined(__BIONIC__) 
+ 
+ #if CPU(X86)
+     return reinterpret_cast<void*&>((uintptr_t&) machineContext.gregs[REG_ESP]);
+@@ -251,7 +251,7 @@ inline void*& framePointer(mcontext_t& machineContext)
+ #error Unknown Architecture
+ #endif
+
+-#elif OS(FUCHSIA) || defined(__GLIBC__) || defined(__BIONIC__)
++#elif OS(FUCHSIA) || OS(LINUX) || defined(__BIONIC__) 
+ 
+ // The following sequence depends on glibc's sys/ucontext.h.
+ #if CPU(X86)
+@@ -354,7 +354,7 @@ inline void*& instructionPointer(mcontext_t& machineContext)
+ #error Unknown Architecture
+ #endif
+ 
+-#elif OS(FUCHSIA) || defined(__GLIBC__) || defined(__BIONIC__)
++#elif OS(FUCHSIA) || OS(LINUX) || defined(__BIONIC__)
+ 
+ // The following sequence depends on glibc's sys/ucontext.h.
+ #if CPU(X86)
+@@ -466,7 +466,7 @@ inline void*& argumentPointer<1>(mcontext_t& machineContext)
+ #error Unknown Architecture
+ #endif
+
+-#elif OS(FUCHSIA) || defined(__GLIBC__) || defined(__BIONIC__)
++#elif OS(FUCHSIA) || OS(LINUX) || defined(__BIONIC__) 
+ 
+ // The following sequence depends on glibc's sys/ucontext.h.
+ #if CPU(X86)
+@@ -583,7 +583,7 @@ inline void*& llintInstructionPointer(mcontext_t& machineContext)
+ #error Unknown Architecture
+ #endif
+
+-#elif OS(FUCHSIA) || defined(__GLIBC__) || defined(__BIONIC__)
++#elif OS(FUCHSIA) || OS(LINUX) || defined(__BIONIC__) 
+ 
+ // The following sequence depends on glibc's sys/ucontext.h.
+ #if CPU(X86)
+diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
+index e2a3388993f..95fe7c593cf 100644
+--- a/Source/WTF/wtf/Platform.h
++++ b/Source/WTF/wtf/Platform.h
+@@ -683,7 +683,7 @@
+ #define HAVE_CFNETWORK_STORAGE_PARTITIONING 1
+ #endif
+
+-#if OS(DARWIN) || OS(FUCHSIA) || ((OS(FREEBSD) || defined(__GLIBC__) || defined(__BIONIC__)) && (CPU(X86) || CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
++#if OS(DARWIN) || OS(FUCHSIA) || ((OS(FREEBSD) || OS(LINUX) || defined(__BIONIC__)) && (CPU(X86) || CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS))) 
+ #define HAVE_MACHINE_CONTEXT 1
+ #endif
+ 
+-- 
+2.20.1
+

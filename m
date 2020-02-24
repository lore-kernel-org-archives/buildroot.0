From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Feb 2020 23:20:43 +0100
Subject: [Buildroot] [PATCH 26/36] package/qt5webkit: drop qt 5.6 support
In-Reply-To: <20200224222054.2686-1-peter@korsgaard.com>
References: <20200224222054.2686-1-peter@korsgaard.com>
Message-ID: <20200224222054.2686-26-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And get rid of the 5.9.1 subdir now that the version selection is gone.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-qtwebkit-fix-QA-issue-bad-RPATH.patch |  0
 ...acktrace-API-for-non-glibc-libraries.patch |  0
 ...-Detect-32-bits-armv8-a-architecture.patch |  0
 ...04-Fix-installation-of-class-headers.patch |  0
 ...005-Fix-ICU-related-compile-failures.patch |  0
 .../0002-Remove-TEXTREL-tag-in-x86.patch      | 85 -----------------
 ...acktrace-API-for-non-glibc-libraries.patch | 44 ---------
 .../0004-Fix-compilation-with-ICU-59.patch    | 93 -------------------
 ...-Detect-32-bits-armv8-a-architecture.patch | 48 ----------
 ...0001-qtwebkit-fix-QA-issue-bad-RPATH.patch | 36 -------
 package/qt5/qt5webkit/qt5webkit.hash          |  3 -
 package/qt5/qt5webkit/qt5webkit.mk            |  7 --
 12 files changed, 316 deletions(-)
 rename package/qt5/qt5webkit/{5.6.3 => }/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch (100%)
 rename package/qt5/qt5webkit/{5.9.1 => }/0002-Exclude-backtrace-API-for-non-glibc-libraries.patch (100%)
 rename package/qt5/qt5webkit/{5.9.1 => }/0003-Detect-32-bits-armv8-a-architecture.patch (100%)
 rename package/qt5/qt5webkit/{5.9.1 => }/0004-Fix-installation-of-class-headers.patch (100%)
 rename package/qt5/qt5webkit/{5.9.1 => }/0005-Fix-ICU-related-compile-failures.patch (100%)
 delete mode 100644 package/qt5/qt5webkit/5.6.3/0002-Remove-TEXTREL-tag-in-x86.patch
 delete mode 100644 package/qt5/qt5webkit/5.6.3/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
 delete mode 100644 package/qt5/qt5webkit/5.6.3/0004-Fix-compilation-with-ICU-59.patch
 delete mode 100644 package/qt5/qt5webkit/5.6.3/0005-Detect-32-bits-armv8-a-architecture.patch
 delete mode 100644 package/qt5/qt5webkit/5.9.1/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch

diff --git a/package/qt5/qt5webkit/5.6.3/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
similarity index 100%
rename from package/qt5/qt5webkit/5.6.3/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
rename to package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
diff --git a/package/qt5/qt5webkit/5.9.1/0002-Exclude-backtrace-API-for-non-glibc-libraries.patch b/package/qt5/qt5webkit/0002-Exclude-backtrace-API-for-non-glibc-libraries.patch
similarity index 100%
rename from package/qt5/qt5webkit/5.9.1/0002-Exclude-backtrace-API-for-non-glibc-libraries.patch
rename to package/qt5/qt5webkit/0002-Exclude-backtrace-API-for-non-glibc-libraries.patch
diff --git a/package/qt5/qt5webkit/5.9.1/0003-Detect-32-bits-armv8-a-architecture.patch b/package/qt5/qt5webkit/0003-Detect-32-bits-armv8-a-architecture.patch
similarity index 100%
rename from package/qt5/qt5webkit/5.9.1/0003-Detect-32-bits-armv8-a-architecture.patch
rename to package/qt5/qt5webkit/0003-Detect-32-bits-armv8-a-architecture.patch
diff --git a/package/qt5/qt5webkit/5.9.1/0004-Fix-installation-of-class-headers.patch b/package/qt5/qt5webkit/0004-Fix-installation-of-class-headers.patch
similarity index 100%
rename from package/qt5/qt5webkit/5.9.1/0004-Fix-installation-of-class-headers.patch
rename to package/qt5/qt5webkit/0004-Fix-installation-of-class-headers.patch
diff --git a/package/qt5/qt5webkit/5.9.1/0005-Fix-ICU-related-compile-failures.patch b/package/qt5/qt5webkit/0005-Fix-ICU-related-compile-failures.patch
similarity index 100%
rename from package/qt5/qt5webkit/5.9.1/0005-Fix-ICU-related-compile-failures.patch
rename to package/qt5/qt5webkit/0005-Fix-ICU-related-compile-failures.patch
diff --git a/package/qt5/qt5webkit/5.6.3/0002-Remove-TEXTREL-tag-in-x86.patch b/package/qt5/qt5webkit/5.6.3/0002-Remove-TEXTREL-tag-in-x86.patch
deleted file mode 100644
index 14352a160c..0000000000
--- a/package/qt5/qt5webkit/5.6.3/0002-Remove-TEXTREL-tag-in-x86.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From ae16ce17cc7060274a0b0c165b953fc32540f977 Mon Sep 17 00:00:00 2001
-From: Magnus Granberg <zorry@gentoo.org>
-Date: Fri, 27 Feb 2015 11:55:09 +0100
-Subject: [PATCH] Remove TEXTREL tag in x86
-
-Fix textrel QA warnings when building qtwebkit for x86:
-
-  WARNING: QA Issue: ELF binary '/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/qtwebkit/5.4.0-r0/packages-split/qtwebkit/usr/lib/libQt5WebKit.so.5.4.0' has relocations in .text [textrel]
-
-Patch from upstream webkit:
-
-  https://bugs.webkit.org/show_bug.cgi?id=70610
-
-Minor refresh required to apply cleanly to the older webkit sources used
-by qtwebkit. Specifically, the patch needed to be modified to account
-for PLATFORM(MAC) -> OS(DARWIN) renaming in recent webkit which is not
-part of qtwebkit yet ( https://bugs.webkit.org/show_bug.cgi?id=99683 ).
-
-Upstream status [webkit] : backport
-Upstream status [qtwebkit] : unclear
-
-Bug: https://bugs.webkit.org/show_bug.cgi?id=70610
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Downloaded from:
-https://github.com/meta-qt5/meta-qt5/blob/krogoth/recipes-qt/qt5/qtwebkit/
-0002-Remove-TEXTREL-tag-in-x86.patch
-
-Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
----
- Source/JavaScriptCore/jit/ThunkGenerators.cpp | 24 ++++++++++++++++++++++++
- Source/WTF/wtf/InlineASM.h                    |  2 ++
- 2 files changed, 26 insertions(+)
-
-diff --git a/Source/JavaScriptCore/jit/ThunkGenerators.cpp b/Source/JavaScriptCore/jit/ThunkGenerators.cpp
-index 9684df2..8af82d8 100644
---- a/Source/JavaScriptCore/jit/ThunkGenerators.cpp
-+++ b/Source/JavaScriptCore/jit/ThunkGenerators.cpp
-@@ -524,6 +524,30 @@ double jsRound(double d)
-     } \
-     static MathThunk UnaryDoubleOpWrapper(function) = &function##Thunk;
- 
-+#elif CPU(X86) && COMPILER(GCC) && OS(LINUX) && defined(__PIC__)
-+#define defineUnaryDoubleOpWrapper(function) \
-+    asm( \
-+        ".text\n" \
-+        ".globl " SYMBOL_STRING(function##Thunk) "\n" \
-+        HIDE_SYMBOL(function##Thunk) "\n" \
-+        SYMBOL_STRING(function##Thunk) ":" "\n" \
-+        "pushl %ebx\n" \
-+        "subl $20, %esp\n" \
-+        "movsd %xmm0, (%esp) \n" \
-+        "call __x86.get_pc_thunk.bx\n" \
-+        "addl $_GLOBAL_OFFSET_TABLE_, %ebx\n" \
-+        "call " GLOBAL_REFERENCE(function) "\n" \
-+        "fstpl (%esp) \n" \
-+        "movsd (%esp), %xmm0 \n" \
-+        "addl $20, %esp\n" \
-+        "popl %ebx\n" \
-+        "ret\n" \
-+    );\
-+    extern "C" { \
-+        MathThunkCallingConvention function##Thunk(MathThunkCallingConvention); \
-+    } \
-+    static MathThunk UnaryDoubleOpWrapper(function) = &function##Thunk;
-+
- #elif CPU(X86) && COMPILER(GCC) && (PLATFORM(MAC) || OS(LINUX))
- #define defineUnaryDoubleOpWrapper(function) \
-     asm( \
-diff --git a/Source/WTF/wtf/InlineASM.h b/Source/WTF/wtf/InlineASM.h
-index 0a2fe78..2dc40ef 100644
---- a/Source/WTF/wtf/InlineASM.h
-+++ b/Source/WTF/wtf/InlineASM.h
-@@ -46,6 +46,8 @@
- #define GLOBAL_REFERENCE(name) #name "@plt"
- #elif CPU(X86) && COMPILER(MINGW)
- #define GLOBAL_REFERENCE(name) "@" #name "@4"
-+#elif OS(LINUX) && CPU(X86) && defined(__PIC__)
-+#define GLOBAL_REFERENCE(name) SYMBOL_STRING(name) "@plt"
- #else
- #define GLOBAL_REFERENCE(name) SYMBOL_STRING(name)
- #endif
--- 
-2.7.0
-
diff --git a/package/qt5/qt5webkit/5.6.3/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch b/package/qt5/qt5webkit/5.6.3/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
deleted file mode 100644
index a2597a54bb..0000000000
--- a/package/qt5/qt5webkit/5.6.3/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 6c36f0ff8c1f5852c33d2b23714f9f187cc6ff26 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 5 Jun 2015 19:55:05 -0700
-Subject: [PATCH] Exclude backtrace() API for non-glibc libraries
-
-It was excluding musl with current checks, so lets make it such that it
-considers only glibc when using backtrace API
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Downloaded from:
-https://github.com/meta-qt5/meta-qt5/blob/krogoth/recipes-qt/qt5/qtwebkit/
-0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
-
-Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
----
- Source/WTF/wtf/Assertions.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Source/WTF/wtf/Assertions.cpp b/Source/WTF/wtf/Assertions.cpp
-index 1b2091f..ba03a28 100644
---- a/Source/WTF/wtf/Assertions.cpp
-+++ b/Source/WTF/wtf/Assertions.cpp
-@@ -61,7 +61,7 @@
- #include <windows.h>
- #endif
- 
--#if (OS(DARWIN) || (OS(LINUX) && !defined(__UCLIBC__))) && !OS(ANDROID)
-+#if (OS(DARWIN) || (OS(LINUX) && defined (__GLIBC__) && !defined(__UCLIBC__))) && !OS(ANDROID)
- #include <cxxabi.h>
- #include <dlfcn.h>
- #include <execinfo.h>
-@@ -245,7 +245,7 @@ void WTFReportArgumentAssertionFailure(const char* file, int line, const char* f
- 
- void WTFGetBacktrace(void** stack, int* size)
- {
--#if (OS(DARWIN) || (OS(LINUX) && !defined(__UCLIBC__))) && !OS(ANDROID)
-+#if (OS(DARWIN) || (OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))) && !OS(ANDROID)
-     *size = backtrace(stack, *size);
- #elif OS(WINDOWS) && !OS(WINCE)
-     // The CaptureStackBackTrace function is available in XP, but it is not defined
--- 
-2.7.0
-
diff --git a/package/qt5/qt5webkit/5.6.3/0004-Fix-compilation-with-ICU-59.patch b/package/qt5/qt5webkit/5.6.3/0004-Fix-compilation-with-ICU-59.patch
deleted file mode 100644
index f3b590eadd..0000000000
--- a/package/qt5/qt5webkit/5.6.3/0004-Fix-compilation-with-ICU-59.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From bf172ae289a1348842005a9421797970f9b72060 Mon Sep 17 00:00:00 2001
-From: Konstantin Tokarev <annulen@yandex.ru>
-Date: Thu, 4 May 2017 15:12:37 +0300
-Subject: [PATCH] Fix compilation with ICU 59
-
-Upstream fix: https://bugs.webkit.org/show_bug.cgi?id=171612
-
-Task-number: QTBUG-60532
-Change-Id: I6014feea213aa70ebe40b09d9d1a03fd1ed3c843
-Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Source/JavaScriptCore/API/JSStringRef.cpp        | 6 +++---
- Source/JavaScriptCore/runtime/DateConversion.cpp | 3 ++-
- Source/WTF/wtf/TypeTraits.h                      | 3 +++
- Source/WebKit2/Shared/API/c/WKString.cpp         | 2 +-
- 4 files changed, 9 insertions(+), 5 deletions(-)
-
-diff --git a/Source/JavaScriptCore/API/JSStringRef.cpp b/Source/JavaScriptCore/API/JSStringRef.cpp
-index 812f3d413..77a3fd0f4 100644
---- a/Source/JavaScriptCore/API/JSStringRef.cpp
-+++ b/Source/JavaScriptCore/API/JSStringRef.cpp
-@@ -37,7 +37,7 @@ using namespace WTF::Unicode;
- JSStringRef JSStringCreateWithCharacters(const JSChar* chars, size_t numChars)
- {
-     initializeThreading();
--    return OpaqueJSString::create(chars, numChars).leakRef();
-+    return OpaqueJSString::create(reinterpret_cast<const UChar*>(chars), numChars).leakRef();
- }
- 
- JSStringRef JSStringCreateWithUTF8CString(const char* string)
-@@ -62,7 +62,7 @@ JSStringRef JSStringCreateWithUTF8CString(const char* string)
- JSStringRef JSStringCreateWithCharactersNoCopy(const JSChar* chars, size_t numChars)
- {
-     initializeThreading();
--    return OpaqueJSString::create(StringImpl::createWithoutCopying(chars, numChars, WTF::DoesNotHaveTerminatingNullCharacter)).leakRef();
-+    return OpaqueJSString::create(StringImpl::createWithoutCopying(reinterpret_cast<const UChar*>(chars), numChars, WTF::DoesNotHaveTerminatingNullCharacter)).leakRef();
- }
- 
- JSStringRef JSStringRetain(JSStringRef string)
-@@ -83,7 +83,7 @@ size_t JSStringGetLength(JSStringRef string)
- 
- const JSChar* JSStringGetCharactersPtr(JSStringRef string)
- {
--    return string->characters();
-+    return reinterpret_cast<const JSChar*>(string->characters());
- }
- 
- size_t JSStringGetMaximumUTF8CStringSize(JSStringRef string)
-diff --git a/Source/JavaScriptCore/runtime/DateConversion.cpp b/Source/JavaScriptCore/runtime/DateConversion.cpp
-index 0b57f012d..05e27338b 100644
---- a/Source/JavaScriptCore/runtime/DateConversion.cpp
-+++ b/Source/JavaScriptCore/runtime/DateConversion.cpp
-@@ -107,7 +107,8 @@ String formatDateTime(const GregorianDateTime& t, DateTimeFormat format, bool as
- #if OS(WINDOWS)
-             TIME_ZONE_INFORMATION timeZoneInformation;
-             GetTimeZoneInformation(&timeZoneInformation);
--            const WCHAR* timeZoneName = t.isDST() ? timeZoneInformation.DaylightName : timeZoneInformation.StandardName;
-+            const WCHAR* winTimeZoneName = t.isDST() ? timeZoneInformation.DaylightName : timeZoneInformation.StandardName;
-+            String timeZoneName(reinterpret_cast<const UChar*>(winTimeZoneName));
- #else
-             struct tm gtm = t;
-             char timeZoneName[70];
-diff --git a/Source/WTF/wtf/TypeTraits.h b/Source/WTF/wtf/TypeTraits.h
-index 9df2c95cf..f5d6121fd 100644
---- a/Source/WTF/wtf/TypeTraits.h
-+++ b/Source/WTF/wtf/TypeTraits.h
-@@ -72,6 +72,9 @@ namespace WTF {
-     template<> struct IsInteger<unsigned long>      { static const bool value = true; };
-     template<> struct IsInteger<long long>          { static const bool value = true; };
-     template<> struct IsInteger<unsigned long long> { static const bool value = true; };
-+#if __cplusplus >= 201103L || defined(__GXX_EXPERIMENTAL_CXX0X__) || (defined(_HAS_CHAR16_T_LANGUAGE_SUPPORT) && _HAS_CHAR16_T_LANGUAGE_SUPPORT)
-+    template<> struct IsInteger<char16_t>           { static const bool value = true; };
-+#endif
- #if !COMPILER(MSVC) || defined(_NATIVE_WCHAR_T_DEFINED)
-     template<> struct IsInteger<wchar_t>            { static const bool value = true; };
- #endif
-diff --git a/Source/WebKit2/Shared/API/c/WKString.cpp b/Source/WebKit2/Shared/API/c/WKString.cpp
-index cbac67dd8..23400a64e 100644
---- a/Source/WebKit2/Shared/API/c/WKString.cpp
-+++ b/Source/WebKit2/Shared/API/c/WKString.cpp
-@@ -55,7 +55,7 @@ size_t WKStringGetLength(WKStringRef stringRef)
- size_t WKStringGetCharacters(WKStringRef stringRef, WKChar* buffer, size_t bufferLength)
- {
-     COMPILE_ASSERT(sizeof(WKChar) == sizeof(UChar), WKStringGetCharacters_sizeof_WKChar_matches_UChar);
--    return (toImpl(stringRef)->getCharacters(static_cast<UChar*>(buffer), bufferLength));
-+    return (toImpl(stringRef)->getCharacters(reinterpret_cast<UChar*>(buffer), bufferLength));
- }
- 
- size_t WKStringGetMaximumUTF8CStringSize(WKStringRef stringRef)
--- 
-2.11.0
-
diff --git a/package/qt5/qt5webkit/5.6.3/0005-Detect-32-bits-armv8-a-architecture.patch b/package/qt5/qt5webkit/5.6.3/0005-Detect-32-bits-armv8-a-architecture.patch
deleted file mode 100644
index 9c2205dd94..0000000000
--- a/package/qt5/qt5webkit/5.6.3/0005-Detect-32-bits-armv8-a-architecture.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 068bf2d2d91382ea0d8ec24a142a30ea429704db Mon Sep 17 00:00:00 2001
-From: =?utf-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
-Date: Tue, 15 Aug 2017 18:28:49 -0400
-Subject: [PATCH] Detect 32-bits armv8-a architecture
-MIME-Version: 1.0
-Content-Type: text/plain; charset=utf-8
-Content-Transfer-Encoding: 8bit
-
-Adds WTF platform support for the 32-bits armv8-a architectures.
-
-Theses toolchains define __ARM_ARCH_8A__ (for ARM architecture version)
-and __arm__ (for 32-bits word-size; __aarch64__ for 64-bits).
-
-This commit catches this new architecture (armv8a) within a #ifdef/#endif
-inside the if statement dedicated for 32-bits ARM detection.
-
-Fixes:
-
-	In file included from ./config.h:30:0,
-	                 from ...
-	./wtf/Platform.h:323:6: error: #error "Not supported ARM architecture"
-	 #    error "Not supported ARM architecture"
-	      ^~~~~
-
-Upstream-Status: Backport [with adaptations]
-Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
----
- Source/WTF/wtf/Platform.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
-index 562840cf7..9cf656845 100644
---- a/Source/WTF/wtf/Platform.h
-+++ b/Source/WTF/wtf/Platform.h
-@@ -243,6 +243,10 @@
-     || defined(__ARM_ARCH_7S__)
- #define WTF_ARM_ARCH_VERSION 7
- 
-+#elif defined(__ARM_ARCH_8__) \
-+    || defined(__ARM_ARCH_8A__)
-+#define WTF_ARM_ARCH_VERSION 8
-+
- /* MSVC sets _M_ARM */
- #elif defined(_M_ARM)
- #define WTF_ARM_ARCH_VERSION _M_ARM
--- 
-2.16.1
-
diff --git a/package/qt5/qt5webkit/5.9.1/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/package/qt5/qt5webkit/5.9.1/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
deleted file mode 100644
index 669c7e6aa2..0000000000
--- a/package/qt5/qt5webkit/5.9.1/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 1735a8484ef9ae336f8d607b56bda64c8af10c79 Mon Sep 17 00:00:00 2001
-From: Trevor Woerner <trevor.woerner@linaro.org>
-Date: Fri, 7 Feb 2014 04:07:17 +0100
-Subject: [PATCH] qtwebkit: fix QA issue (bad RPATH)
-
-Building qtwebkit causes a QA issue such that QtWebPluginProcess and
-QtWebProcess contain bad RPATHs which point into the build location. This fix
-adds a patch to not include the rpath.prf which causes this problem.
-
-Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Downloaded from:
-https://github.com/meta-qt5/meta-qt5/blob/krogoth/recipes-qt/qt5/qtwebkit/
-0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
-
-Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
----
- Tools/qmake/mkspecs/features/unix/default_post.prf | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Tools/qmake/mkspecs/features/unix/default_post.prf b/Tools/qmake/mkspecs/features/unix/default_post.prf
-index fd66af6..ef754c3 100644
---- a/Tools/qmake/mkspecs/features/unix/default_post.prf
-+++ b/Tools/qmake/mkspecs/features/unix/default_post.prf
-@@ -61,7 +61,6 @@ linux-*g++* {
-     }
- }
- 
--contains(TEMPLATE, app): CONFIG += rpath
- 
- CONFIG(debug, debug|release)|force_debug_info {
-     # Make ld not cache the symbol tables of input files in memory to avoid memory exhaustion during the linking phase.
--- 
-2.7.0
-
diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
index 57ff2ac1b7..3068ad920d 100644
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ b/package/qt5/qt5webkit/qt5webkit.hash
@@ -1,6 +1,3 @@
-# Hash from: https://download.qt.io/community_releases/5.6/5.6.3/qtwebkit-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256  098c6bb25798fbf1b619b540621287787064efc9b586d76ac0ce7e39b87a3896  qtwebkit-opensource-src-5.6.3.tar.xz
-
 # hash from: https://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebkit-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256  28a560becd800a4229bfac317c2e5407cd3cc95308bc4c3ca90dba2577b052cf  qtwebkit-opensource-src-5.9.1.tar.xz
 
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 25c5495482..c6441b5bdd 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -4,15 +4,8 @@
 #
 ################################################################################
 
-# no 5.9.2 package available, fall back to 5.9.1 version
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5WEBKIT_VERSION = 5.9.1
 QT5WEBKIT_SITE = https://download.qt.io/official_releases/qt/5.9/5.9.1/submodules
-else
-QT5WEBKIT_VERSION = $(QT5_VERSION)
-QT5WEBKIT_SITE = https://download.qt.io/community_releases/5.6/$(QT5_VERSION)
-endif
-
 QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
 QT5WEBKIT_DEPENDENCIES = \
 	host-bison host-flex host-gperf host-python host-ruby \
-- 
2.20.1

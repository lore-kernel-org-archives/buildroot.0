From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 14:32:32 +0200
Subject: [Buildroot] [git commit] webkitgtk: update to version 2.18.0
Message-ID: <20170924124819.B42678004A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=905b1ab5c21f39f9cd1777f6d5745c90d863da4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
    https://webkitgtk.org/2017/09/11/webkitgtk2.18.0-released.html

No corresponding WebKit Security Advisory (WSA) has been published.

All patches have been applied upstream.

This also bumps the required target GCC version, due to the WebKit code
now using more modern C++ features which were introduced in version
5.x of the compiler.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
[Arnout:
 - propagate dependency to midori;
 - mention in commit message why patches were removed.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/midori/Config.in                           |   6 +-
 ...-to-build-when-the-compiler-specifically-.patch |  36 ----
 ...lure-to-build-when-the-compiler-specifica.patch |  36 ----
 ...roken-build-when-ENABLE_VIDEO-is-disabled.patch | 207 ---------------------
 ...AGS-from-pkg-config-for-E-GL-are-not-pass.patch |  64 -------
 package/webkitgtk/Config.in                        |   6 +-
 package/webkitgtk/webkitgtk.hash                   |   8 +-
 package/webkitgtk/webkitgtk.mk                     |   2 +-
 8 files changed, 11 insertions(+), 354 deletions(-)

diff --git a/package/midori/Config.in b/package/midori/Config.in
index 43ba45e..bc37c6a 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -1,7 +1,7 @@
-comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 4.9, host gcc >= 4.8"
+comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 5, host gcc >= 4.8"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 || \
-		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_MIDORI
@@ -10,7 +10,7 @@ config BR2_PACKAGE_MIDORI
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # webkitgtk -> icu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # webkitgtk
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # webkitgtk
 	depends on BR2_TOOLCHAIN_USES_GLIBC # webkitgtk
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	# GCR can only be used with the X11 backend
diff --git a/package/webkitgtk/0001-WTF-Failure-to-build-when-the-compiler-specifically-.patch b/package/webkitgtk/0001-WTF-Failure-to-build-when-the-compiler-specifically-.patch
deleted file mode 100644
index 017771a..0000000
--- a/package/webkitgtk/0001-WTF-Failure-to-build-when-the-compiler-specifically-.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 09d5520d910b63fba67bea1d8c71f5d426f345b7 Mon Sep 17 00:00:00 2001
-From: "aperez at igalia.com"
- <aperez@igalia.com@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
-Date: Wed, 12 Jul 2017 18:42:29 +0000
-Subject: [PATCH] [WTF] Failure to build when the compiler specifically targets
- ARMv8-A / defines __ARM_ARCH_8A__
- https://bugs.webkit.org/show_bug.cgi?id=174425
-
-Reviewed by Michael Catanzaro.
-
-* wtf/Platform.h: Also check for __ARCH_ARM_8A__ to detect ARMv8.
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-
-git-svn-id: http://svn.webkit.org/repository/webkit/trunk at 219415 268f45cc-cd09-0410-ab3c-d52691b4dbfc
----
- Source/WTF/wtf/Platform.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
-index 44d929c333c..7dccb44fcbf 100644
---- a/Source/WTF/wtf/Platform.h
-+++ b/Source/WTF/wtf/Platform.h
-@@ -238,7 +238,8 @@
-     || defined(__ARM_ARCH_7S__)
- #define WTF_ARM_ARCH_VERSION 7
- 
--#elif defined(__ARM_ARCH_8__)
-+#elif defined(__ARM_ARCH_8__) \
-+    || defined(__ARM_ARCH_8A__)
- #define WTF_ARM_ARCH_VERSION 8
- 
- /* MSVC sets _M_ARM */
--- 
-2.13.3
-
diff --git a/package/webkitgtk/0002-bmalloc-Failure-to-build-when-the-compiler-specifica.patch b/package/webkitgtk/0002-bmalloc-Failure-to-build-when-the-compiler-specifica.patch
deleted file mode 100644
index e1623bf..0000000
--- a/package/webkitgtk/0002-bmalloc-Failure-to-build-when-the-compiler-specifica.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 07dab7fe552c53e7840e34d3c8bb1cc43a921706 Mon Sep 17 00:00:00 2001
-From: "aperez at igalia.com"
- <aperez@igalia.com@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
-Date: Wed, 12 Jul 2017 18:43:36 +0000
-Subject: [PATCH] bmalloc: Failure to build when the compiler specifically
- targets ARMv8-A / defines __ARM_ARCH_8A__
- https://bugs.webkit.org/show_bug.cgi?id=174424
-
-Reviewed by Michael Catanzaro.
-
-* bmalloc/BPlatform.h: Also check for __ARCH_ARM_8A__ to detect ARMv8.
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-
-git-svn-id: http://svn.webkit.org/repository/webkit/trunk at 219416 268f45cc-cd09-0410-ab3c-d52691b4dbfc
----
- Source/bmalloc/bmalloc/BPlatform.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Source/bmalloc/bmalloc/BPlatform.h b/Source/bmalloc/bmalloc/BPlatform.h
-index 8d768db63fb..400143a63fb 100644
---- a/Source/bmalloc/bmalloc/BPlatform.h
-+++ b/Source/bmalloc/bmalloc/BPlatform.h
-@@ -120,7 +120,8 @@
- || defined(__ARM_ARCH_7S__)
- #define BARM_ARCH_VERSION 7
- 
--#elif defined(__ARM_ARCH_8__)
-+#elif defined(__ARM_ARCH_8__) \
-+|| defined(__ARM_ARCH_8A__)
- #define BARM_ARCH_VERSION 8
- 
- /* MSVC sets _M_ARM */
--- 
-2.13.3
-
diff --git a/package/webkitgtk/0003-Fix-broken-build-when-ENABLE_VIDEO-is-disabled.patch b/package/webkitgtk/0003-Fix-broken-build-when-ENABLE_VIDEO-is-disabled.patch
deleted file mode 100644
index b460b0c..0000000
--- a/package/webkitgtk/0003-Fix-broken-build-when-ENABLE_VIDEO-is-disabled.patch
+++ /dev/null
@@ -1,207 +0,0 @@
-From c054224e551547c3e3593b60ca1226fa4ac41c01 Mon Sep 17 00:00:00 2001
-From: "timothy at hatcher.name"
- <timothy@hatcher.name@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
-Date: Tue, 11 Jul 2017 18:07:24 +0000
-Subject: [PATCH] Fix broken build when ENABLE_VIDEO is disabled.
- https://bugs.webkit.org/show_bug.cgi?id=174368
-
-Reviewed by Alex Christensen.
-
-* dom/Document.cpp:
-* html/canvas/WebGLRenderingContextBase.cpp:
-(WebCore::WebGLRenderingContextBase::texSubImage2D):
-(WebCore::WebGLRenderingContextBase::texImage2D):
-* html/canvas/WebGLRenderingContextBase.h:
-* html/canvas/WebGLRenderingContextBase.idl:
-* testing/Internals.cpp:
-(WebCore::Internals::mediaResponseSources):
-(WebCore::Internals::mediaResponseContentRanges):
-* testing/Internals.h:
-* testing/Internals.idl:
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-
-git-svn-id: http://svn.webkit.org/repository/webkit/trunk at 219343 268f45cc-cd09-0410-ab3c-d52691b4dbfc
----
- .../html/canvas/WebGLRenderingContextBase.cpp      | 16 +++++++++++----
- .../html/canvas/WebGLRenderingContextBase.h        | 12 ++++++++++-
- .../html/canvas/WebGLRenderingContextBase.idl      |  4 ++++
- Source/WebCore/testing/Internals.cpp               | 24 ++++++++++++++++++++++
- Source/WebCore/testing/Internals.h                 |  2 ++
- Source/WebCore/testing/Internals.idl               |  2 ++
- 6 files changed, 55 insertions(+), 5 deletions(-)
-
-diff --git a/Source/WebCore/html/canvas/WebGLRenderingContextBase.cpp b/Source/WebCore/html/canvas/WebGLRenderingContextBase.cpp
-index f8fd63f7d87..a76a44ff06b 100644
---- a/Source/WebCore/html/canvas/WebGLRenderingContextBase.cpp
-+++ b/Source/WebCore/html/canvas/WebGLRenderingContextBase.cpp
-@@ -3597,7 +3597,9 @@ ExceptionOr<void> WebGLRenderingContextBase::texSubImage2D(GC3Denum target, GC3D
-         else
-             texSubImage2DImpl(target, level, xoffset, yoffset, format, type, canvas->copiedImage(), GraphicsContext3D::HtmlDomCanvas, m_unpackFlipY, m_unpackPremultiplyAlpha);
-         return { };
--    }, [&](const RefPtr<HTMLVideoElement>& video) -> ExceptionOr<void> {
-+    }
-+#if ENABLE(VIDEO)
-+    , [&](const RefPtr<HTMLVideoElement>& video) -> ExceptionOr<void> {
-         ExceptionCode ec = 0;
-         if (isContextLostOrPending() || !validateHTMLVideoElement("texSubImage2D", video.get(), ec))
-             return ec ? Exception { ec } : ExceptionOr<void> { };
-@@ -3620,7 +3622,9 @@ ExceptionOr<void> WebGLRenderingContextBase::texSubImage2D(GC3Denum target, GC3D
-             return { };
-         texSubImage2DImpl(target, level, xoffset, yoffset, format, type, image.get(), GraphicsContext3D::HtmlDomVideo, m_unpackFlipY, m_unpackPremultiplyAlpha);
-         return { };
--    });
-+    }
-+#endif
-+    );
- 
-     return WTF::visit(visitor, source.value());
- }
-@@ -4107,7 +4111,9 @@ ExceptionOr<void> WebGLRenderingContextBase::texImage2D(GC3Denum target, GC3Dint
-         else
-             texImage2DImpl(target, level, internalformat, format, type, canvas->copiedImage(), GraphicsContext3D::HtmlDomCanvas, m_unpackFlipY, m_unpackPremultiplyAlpha);
-         return { };
--    }, [&](const RefPtr<HTMLVideoElement>& video) -> ExceptionOr<void> {
-+    }
-+#if ENABLE(VIDEO)
-+    , [&](const RefPtr<HTMLVideoElement>& video) -> ExceptionOr<void> {
-         ExceptionCode ec = 0;
-         if (isContextLostOrPending() || !validateHTMLVideoElement("texImage2D", video.get(), ec)
-             || !validateTexFunc("texImage2D", TexImage, SourceHTMLVideoElement, target, level, internalformat, video->videoWidth(), video->videoHeight(), 0, format, type, 0, 0))
-@@ -4137,7 +4143,9 @@ ExceptionOr<void> WebGLRenderingContextBase::texImage2D(GC3Denum target, GC3Dint
-             return { };
-         texImage2DImpl(target, level, internalformat, format, type, image.get(), GraphicsContext3D::HtmlDomVideo, m_unpackFlipY, m_unpackPremultiplyAlpha);
-         return { };
--    });
-+    }
-+#endif
-+    );
- 
-     return WTF::visit(visitor, source.value());
- }
-diff --git a/Source/WebCore/html/canvas/WebGLRenderingContextBase.h b/Source/WebCore/html/canvas/WebGLRenderingContextBase.h
-index 31e5542e612..d4738e834a1 100644
---- a/Source/WebCore/html/canvas/WebGLRenderingContextBase.h
-+++ b/Source/WebCore/html/canvas/WebGLRenderingContextBase.h
-@@ -57,7 +57,6 @@ class EXTShaderTextureLOD;
- class EXTsRGB;
- class EXTFragDepth;
- class HTMLImageElement;
--class HTMLVideoElement;
- class ImageData;
- class IntSize;
- class OESStandardDerivatives;
-@@ -85,6 +84,10 @@ class WebGLSharedObject;
- class WebGLShaderPrecisionFormat;
- class WebGLUniformLocation;
- 
-+#if ENABLE(VIDEO)
-+class HTMLVideoElement;
-+#endif
-+
- inline void clip1D(GC3Dint start, GC3Dsizei range, GC3Dsizei sourceRange, GC3Dint* clippedStart, GC3Dsizei* clippedRange)
- {
-     ASSERT(clippedStart && clippedRange);
-@@ -244,7 +247,12 @@ public:
- 
-     void texImage2D(GC3Denum target, GC3Dint level, GC3Denum internalformat, GC3Dsizei width, GC3Dsizei height, GC3Dint border, GC3Denum format, GC3Denum type, RefPtr<ArrayBufferView>&&);
- 
-+#if ENABLE(VIDEO)
-     using TexImageSource = WTF::Variant<RefPtr<ImageData>, RefPtr<HTMLImageElement>, RefPtr<HTMLCanvasElement>, RefPtr<HTMLVideoElement>>;
-+#else
-+    using TexImageSource = WTF::Variant<RefPtr<ImageData>, RefPtr<HTMLImageElement>, RefPtr<HTMLCanvasElement>>;
-+#endif
-+
-     ExceptionOr<void> texImage2D(GC3Denum target, GC3Dint level, GC3Denum internalformat, GC3Denum format, GC3Denum type, std::optional<TexImageSource>);
- 
-     void texParameterf(GC3Denum target, GC3Denum pname, GC3Dfloat param);
-@@ -677,7 +685,9 @@ protected:
-         SourceImageData,
-         SourceHTMLImageElement,
-         SourceHTMLCanvasElement,
-+#if ENABLE(VIDEO)
-         SourceHTMLVideoElement,
-+#endif
-     };
- 
-     // Helper function for tex{Sub}Image2D to check if the input format/type/level/target/width/height/border/xoffset/yoffset are valid.
-diff --git a/Source/WebCore/html/canvas/WebGLRenderingContextBase.idl b/Source/WebCore/html/canvas/WebGLRenderingContextBase.idl
-index 63b64cdebd2..3111e798a89 100644
---- a/Source/WebCore/html/canvas/WebGLRenderingContextBase.idl
-+++ b/Source/WebCore/html/canvas/WebGLRenderingContextBase.idl
-@@ -42,7 +42,11 @@ typedef (Float32Array or sequence<GLfloat>) Float32List;
- typedef (Int32Array or sequence<GLint>) Int32List;
- 
- // FIXME: Should allow ImageBitmap too.
-+#ifdef ENABLE_VIDEO
- typedef (ImageData or HTMLImageElement or HTMLCanvasElement or HTMLVideoElement) TexImageSource;
-+#else
-+typedef (ImageData or HTMLImageElement or HTMLCanvasElement) TexImageSource;
-+#endif
- 
- [
-     Conditional=WEBGL,
-diff --git a/Source/WebCore/testing/Internals.cpp b/Source/WebCore/testing/Internals.cpp
-index 6d26d556e33..6d64845fd27 100644
---- a/Source/WebCore/testing/Internals.cpp
-+++ b/Source/WebCore/testing/Internals.cpp
-@@ -2765,6 +2765,30 @@ String Internals::getImageSourceURL(Element& element)
- 
- #if ENABLE(VIDEO)
- 
-+Vector<String> Internals::mediaResponseSources(HTMLMediaElement& media)
-+{
-+    auto* resourceLoader = media.lastMediaResourceLoaderForTesting();
-+    if (!resourceLoader)
-+        return { };
-+    Vector<String> result;
-+    auto responses = resourceLoader->responsesForTesting();
-+    for (auto& response : responses)
-+        result.append(responseSourceToString(response));
-+    return result;
-+}
-+
-+Vector<String> Internals::mediaResponseContentRanges(HTMLMediaElement& media)
-+{
-+    auto* resourceLoader = media.lastMediaResourceLoaderForTesting();
-+    if (!resourceLoader)
-+        return { };
-+    Vector<String> result;
-+    auto responses = resourceLoader->responsesForTesting();
-+    for (auto& response : responses)
-+        result.append(response.httpHeaderField(HTTPHeaderName::ContentRange));
-+    return result;
-+}
-+
- void Internals::simulateAudioInterruption(HTMLMediaElement& element)
- {
- #if USE(GSTREAMER)
-diff --git a/Source/WebCore/testing/Internals.h b/Source/WebCore/testing/Internals.h
-index f5c08a87dfd..d35f651e452 100644
---- a/Source/WebCore/testing/Internals.h
-+++ b/Source/WebCore/testing/Internals.h
-@@ -401,6 +401,8 @@ public:
-     String getImageSourceURL(Element&);
- 
- #if ENABLE(VIDEO)
-+    Vector<String> mediaResponseSources(HTMLMediaElement&);
-+    Vector<String> mediaResponseContentRanges(HTMLMediaElement&);
-     void simulateAudioInterruption(HTMLMediaElement&);
-     ExceptionOr<bool> mediaElementHasCharacteristic(HTMLMediaElement&, const String&);
- #endif
-diff --git a/Source/WebCore/testing/Internals.idl b/Source/WebCore/testing/Internals.idl
-index 155b70b4abf..3fe6885d362 100644
---- a/Source/WebCore/testing/Internals.idl
-+++ b/Source/WebCore/testing/Internals.idl
-@@ -386,6 +386,8 @@ enum EventThrottlingBehavior {
- 
-     void enableAutoSizeMode(boolean enabled, long minimumWidth, long minimumHeight, long maximumWidth, long maximumHeight);
- 
-+    [Conditional=VIDEO] sequence<DOMString> mediaResponseSources(HTMLMediaElement media);
-+    [Conditional=VIDEO] sequence<DOMString> mediaResponseContentRanges(HTMLMediaElement media);
-     [Conditional=VIDEO] void simulateAudioInterruption(HTMLMediaElement element);
-     [Conditional=VIDEO, MayThrowException] boolean mediaElementHasCharacteristic(HTMLMediaElement element, DOMString characteristic);
- 
--- 
-2.13.3
-
diff --git a/package/webkitgtk/0004-GTK-WPE-CFLAGS-from-pkg-config-for-E-GL-are-not-pass.patch b/package/webkitgtk/0004-GTK-WPE-CFLAGS-from-pkg-config-for-E-GL-are-not-pass.patch
deleted file mode 100644
index 91c5116..0000000
--- a/package/webkitgtk/0004-GTK-WPE-CFLAGS-from-pkg-config-for-E-GL-are-not-pass.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 6579c307d85a9b447d3b7f13b25fb0a52177ed09 Mon Sep 17 00:00:00 2001
-From: Carlos Alberto Lopez Perez <clopez@igalia.com>
-Date: Thu, 3 Aug 2017 13:57:14 +0300
-Subject: [PATCH] [GTK][WPE] CFLAGS from pkg-config for (E)GL are not passed to
- WebKit https://bugs.webkit.org/show_bug.cgi?id=175125
-
-Patch by Carlos Alberto Lopez Perez <clopez@igalia.com> on 2017-08-03
-Reviewed by NOBODY (OOPS!).
-
-* CMakeLists.txt: Pass GL-related flags to the WebKit component when
-  appropriate.
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-
----
- Source/WebKit2/CMakeLists.txt | 31 +++++++++++++++++++++++++++++++
- Source/WebKit2/ChangeLog      | 10 ++++++++++
- 2 files changed, 41 insertions(+)
-
-diff --git a/Source/WebKit2/CMakeLists.txt b/Source/WebKit2/CMakeLists.txt
-index 2d8215f6a35..b25e9872de2 100644
---- a/Source/WebKit2/CMakeLists.txt
-+++ b/Source/WebKit2/CMakeLists.txt
-@@ -88,6 +88,37 @@ set(WebKit2_SYSTEM_INCLUDE_DIRECTORIES
- )
- 
- if (ENABLE_GRAPHICS_CONTEXT_3D)
-+    # For platforms that want to use system-provided OpenGL (ES) / EGL headers,
-+    # these include directories, libraries or definitions need to be
-+    # added before the ANGLE directories.
-+    if (USE_OPENGL)
-+        list(APPEND WebKit2_SYSTEM_INCLUDE_DIRECTORIES
-+            ${OPENGL_INCLUDE_DIRS}
-+        )
-+        list(APPEND WebKit2_LIBRARIES
-+            ${OPENGL_LIBRARIES}
-+        )
-+        add_definitions(${OPENGL_DEFINITIONS})
-+    elseif (USE_OPENGL_ES_2)
-+        list(APPEND WebKit2_SYSTEM_INCLUDE_DIRECTORIES
-+            ${OPENGLES2_INCLUDE_DIRS}
-+        )
-+        list(APPEND WebKit2_LIBRARIES
-+            ${OPENGLES2_LIBRARIES}
-+        )
-+        add_definitions(${OPENGLES2_DEFINITIONS})
-+    endif ()
-+
-+    if (USE_EGL)
-+        list(APPEND WebKit2_SYSTEM_INCLUDE_DIRECTORIES
-+            ${EGL_INCLUDE_DIRS}
-+        )
-+        list(APPEND WebKit2_LIBRARIES
-+            ${EGL_LIBRARIES}
-+        )
-+        add_definitions(${EGL_DEFINITIONS})
-+    endif ()
-+
-     list(APPEND WebKit2_INCLUDE_DIRECTORIES
-         "${THIRDPARTY_DIR}/ANGLE"
-         "${THIRDPARTY_DIR}/ANGLE/include/KHR"
---
-2.13.4
-
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 6d88b59..e0b5947 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -11,19 +11,19 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 4.9, host gcc >= 4.8"
+comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 5, host gcc >= 4.8"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_HOST_GCC_AT_LEAST_4_8 || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_WEBKITGTK
 	bool "webkitgtk"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 2c0fc50..c7a87f8 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,4 +1,4 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.16.6.tar.xz.sums
-md5  0e2d142a586e4ff79cf0324f4fdbf20c webkitgtk-2.16.6.tar.xz
-sha1 f7fca3fbac3dc99e39f353a6df250635e684c922 webkitgtk-2.16.6.tar.xz
-sha256 fc23650df953123c59b9c0edf3855e7bd55bd107820997fc72375811e1ea4b21 webkitgtk-2.16.6.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.18.0.tar.xz.sums
+md5 10d86dd5a5b68875654cc38af139f382 webkitgtk-2.18.0.tar.xz
+sha1 e4d6cc7cff8729aa5ae6c17e10ed5ddf31048983 webkitgtk-2.18.0.tar.xz
+sha256 b583e46a3de36a3e80ba33b084ead60512a2046aca01ff61e50e519436e5038d webkitgtk-2.18.0.tar.xz
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index e30d07f..bac1e71 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.16.6
+WEBKITGTK_VERSION = 2.18.0
 WEBKITGTK_SITE = http://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES

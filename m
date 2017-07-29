From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sat, 29 Jul 2017 16:58:37 +0300
Subject: [Buildroot] [PATCH v2 1/1] webkitgtk: Allow building with
	BR2_PACKAGE_WEBKITGTK_MULTIMEDIA disabled
Message-ID: <20170729135837.25668-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Explicitly pass "-DENABLE_MEDIA_STREAM=OFF" to CMake, to workaround a
missing feature dependency in the WebKitGTK+ build files. Additionally,
a patch for https://bugs.webkit.org/show_bug.cgi?id=174940 is needed.

Related upstream bug: https://bugs.webkit.org/show_bug.cgi?id=174940

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

---
Changes v1 -> v2:
    - Add patch for https://bugs.webkit.org/show_bug.cgi?id=174940
---
 ...roken-build-when-ENABLE_VIDEO-is-disabled.patch | 220 +++++++++++++++++++++
 package/webkitgtk/webkitgtk.mk                     |   6 +-
 2 files changed, 225 insertions(+), 1 deletion(-)
 create mode 100644 package/webkitgtk/0003-Fix-broken-build-when-ENABLE_VIDEO-is-disabled.patch

diff --git a/package/webkitgtk/0003-Fix-broken-build-when-ENABLE_VIDEO-is-disabled.patch b/package/webkitgtk/0003-Fix-broken-build-when-ENABLE_VIDEO-is-disabled.patch
new file mode 100644
index 0000000000..7aaa1f6980
--- /dev/null
+++ b/package/webkitgtk/0003-Fix-broken-build-when-ENABLE_VIDEO-is-disabled.patch
@@ -0,0 +1,220 @@
+From 3aea48fc5fa628e0956273eecadccceeadb1cfb0 Mon Sep 17 00:00:00 2001
+From: "timothy at hatcher.name"
+ <timothy@hatcher.name@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
+Date: Tue, 11 Jul 2017 18:07:24 +0000
+Subject: [PATCH] Fix broken build when ENABLE_VIDEO is disabled.
+ https://bugs.webkit.org/show_bug.cgi?id=174368
+
+Reviewed by Alex Christensen.
+
+* dom/Document.cpp:
+* html/canvas/WebGLRenderingContextBase.cpp:
+(WebCore::WebGLRenderingContextBase::texSubImage2D):
+(WebCore::WebGLRenderingContextBase::texImage2D):
+* html/canvas/WebGLRenderingContextBase.h:
+* html/canvas/WebGLRenderingContextBase.idl:
+* testing/Internals.cpp:
+(WebCore::Internals::mediaResponseSources):
+(WebCore::Internals::mediaResponseContentRanges):
+* testing/Internals.h:
+* testing/Internals.idl:
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+
+git-svn-id: http://svn.webkit.org/repository/webkit/trunk at 219343 268f45cc-cd09-0410-ab3c-d52691b4dbfc
+---
+ Source/WebCore/dom/Document.cpp                    |  1 +
+ .../html/canvas/WebGLRenderingContextBase.cpp      | 16 +++++++++++----
+ .../html/canvas/WebGLRenderingContextBase.h        | 12 ++++++++++-
+ .../html/canvas/WebGLRenderingContextBase.idl      |  4 ++++
+ Source/WebCore/testing/Internals.cpp               | 24 ++++++++++++++++++++++
+ Source/WebCore/testing/Internals.h                 |  2 ++
+ Source/WebCore/testing/Internals.idl               |  2 ++
+ 7 files changed, 56 insertions(+), 5 deletions(-)
+
+diff --git a/Source/WebCore/dom/Document.cpp b/Source/WebCore/dom/Document.cpp
+index f9e0bf2726e..1c95bcecb21 100644
+--- a/Source/WebCore/dom/Document.cpp
++++ b/Source/WebCore/dom/Document.cpp
+@@ -182,6 +182,7 @@
+ #include "TransformSource.h"
+ #include "TreeWalker.h"
+ #include "ValidationMessageClient.h"
++#include "VisibilityChangeClient.h"
+ #include "VisitedLinkState.h"
+ #include "WheelEvent.h"
+ #include "WindowFeatures.h"
+diff --git a/Source/WebCore/html/canvas/WebGLRenderingContextBase.cpp b/Source/WebCore/html/canvas/WebGLRenderingContextBase.cpp
+index f8fd63f7d87..a76a44ff06b 100644
+--- a/Source/WebCore/html/canvas/WebGLRenderingContextBase.cpp
++++ b/Source/WebCore/html/canvas/WebGLRenderingContextBase.cpp
+@@ -3597,7 +3597,9 @@ ExceptionOr<void> WebGLRenderingContextBase::texSubImage2D(GC3Denum target, GC3D
+         else
+             texSubImage2DImpl(target, level, xoffset, yoffset, format, type, canvas->copiedImage(), GraphicsContext3D::HtmlDomCanvas, m_unpackFlipY, m_unpackPremultiplyAlpha);
+         return { };
+-    }, [&](const RefPtr<HTMLVideoElement>& video) -> ExceptionOr<void> {
++    }
++#if ENABLE(VIDEO)
++    , [&](const RefPtr<HTMLVideoElement>& video) -> ExceptionOr<void> {
+         ExceptionCode ec = 0;
+         if (isContextLostOrPending() || !validateHTMLVideoElement("texSubImage2D", video.get(), ec))
+             return ec ? Exception { ec } : ExceptionOr<void> { };
+@@ -3620,7 +3622,9 @@ ExceptionOr<void> WebGLRenderingContextBase::texSubImage2D(GC3Denum target, GC3D
+             return { };
+         texSubImage2DImpl(target, level, xoffset, yoffset, format, type, image.get(), GraphicsContext3D::HtmlDomVideo, m_unpackFlipY, m_unpackPremultiplyAlpha);
+         return { };
+-    });
++    }
++#endif
++    );
+ 
+     return WTF::visit(visitor, source.value());
+ }
+@@ -4107,7 +4111,9 @@ ExceptionOr<void> WebGLRenderingContextBase::texImage2D(GC3Denum target, GC3Dint
+         else
+             texImage2DImpl(target, level, internalformat, format, type, canvas->copiedImage(), GraphicsContext3D::HtmlDomCanvas, m_unpackFlipY, m_unpackPremultiplyAlpha);
+         return { };
+-    }, [&](const RefPtr<HTMLVideoElement>& video) -> ExceptionOr<void> {
++    }
++#if ENABLE(VIDEO)
++    , [&](const RefPtr<HTMLVideoElement>& video) -> ExceptionOr<void> {
+         ExceptionCode ec = 0;
+         if (isContextLostOrPending() || !validateHTMLVideoElement("texImage2D", video.get(), ec)
+             || !validateTexFunc("texImage2D", TexImage, SourceHTMLVideoElement, target, level, internalformat, video->videoWidth(), video->videoHeight(), 0, format, type, 0, 0))
+@@ -4137,7 +4143,9 @@ ExceptionOr<void> WebGLRenderingContextBase::texImage2D(GC3Denum target, GC3Dint
+             return { };
+         texImage2DImpl(target, level, internalformat, format, type, image.get(), GraphicsContext3D::HtmlDomVideo, m_unpackFlipY, m_unpackPremultiplyAlpha);
+         return { };
+-    });
++    }
++#endif
++    );
+ 
+     return WTF::visit(visitor, source.value());
+ }
+diff --git a/Source/WebCore/html/canvas/WebGLRenderingContextBase.h b/Source/WebCore/html/canvas/WebGLRenderingContextBase.h
+index 31e5542e612..d4738e834a1 100644
+--- a/Source/WebCore/html/canvas/WebGLRenderingContextBase.h
++++ b/Source/WebCore/html/canvas/WebGLRenderingContextBase.h
+@@ -57,7 +57,6 @@ class EXTShaderTextureLOD;
+ class EXTsRGB;
+ class EXTFragDepth;
+ class HTMLImageElement;
+-class HTMLVideoElement;
+ class ImageData;
+ class IntSize;
+ class OESStandardDerivatives;
+@@ -85,6 +84,10 @@ class WebGLSharedObject;
+ class WebGLShaderPrecisionFormat;
+ class WebGLUniformLocation;
+ 
++#if ENABLE(VIDEO)
++class HTMLVideoElement;
++#endif
++
+ inline void clip1D(GC3Dint start, GC3Dsizei range, GC3Dsizei sourceRange, GC3Dint* clippedStart, GC3Dsizei* clippedRange)
+ {
+     ASSERT(clippedStart && clippedRange);
+@@ -244,7 +247,12 @@ public:
+ 
+     void texImage2D(GC3Denum target, GC3Dint level, GC3Denum internalformat, GC3Dsizei width, GC3Dsizei height, GC3Dint border, GC3Denum format, GC3Denum type, RefPtr<ArrayBufferView>&&);
+ 
++#if ENABLE(VIDEO)
+     using TexImageSource = WTF::Variant<RefPtr<ImageData>, RefPtr<HTMLImageElement>, RefPtr<HTMLCanvasElement>, RefPtr<HTMLVideoElement>>;
++#else
++    using TexImageSource = WTF::Variant<RefPtr<ImageData>, RefPtr<HTMLImageElement>, RefPtr<HTMLCanvasElement>>;
++#endif
++
+     ExceptionOr<void> texImage2D(GC3Denum target, GC3Dint level, GC3Denum internalformat, GC3Denum format, GC3Denum type, std::optional<TexImageSource>);
+ 
+     void texParameterf(GC3Denum target, GC3Denum pname, GC3Dfloat param);
+@@ -677,7 +685,9 @@ protected:
+         SourceImageData,
+         SourceHTMLImageElement,
+         SourceHTMLCanvasElement,
++#if ENABLE(VIDEO)
+         SourceHTMLVideoElement,
++#endif
+     };
+ 
+     // Helper function for tex{Sub}Image2D to check if the input format/type/level/target/width/height/border/xoffset/yoffset are valid.
+diff --git a/Source/WebCore/html/canvas/WebGLRenderingContextBase.idl b/Source/WebCore/html/canvas/WebGLRenderingContextBase.idl
+index 63b64cdebd2..3111e798a89 100644
+--- a/Source/WebCore/html/canvas/WebGLRenderingContextBase.idl
++++ b/Source/WebCore/html/canvas/WebGLRenderingContextBase.idl
+@@ -42,7 +42,11 @@ typedef (Float32Array or sequence<GLfloat>) Float32List;
+ typedef (Int32Array or sequence<GLint>) Int32List;
+ 
+ // FIXME: Should allow ImageBitmap too.
++#ifdef ENABLE_VIDEO
+ typedef (ImageData or HTMLImageElement or HTMLCanvasElement or HTMLVideoElement) TexImageSource;
++#else
++typedef (ImageData or HTMLImageElement or HTMLCanvasElement) TexImageSource;
++#endif
+ 
+ [
+     Conditional=WEBGL,
+diff --git a/Source/WebCore/testing/Internals.cpp b/Source/WebCore/testing/Internals.cpp
+index 6d26d556e33..6d64845fd27 100644
+--- a/Source/WebCore/testing/Internals.cpp
++++ b/Source/WebCore/testing/Internals.cpp
+@@ -2765,6 +2765,30 @@ String Internals::getImageSourceURL(Element& element)
+ 
+ #if ENABLE(VIDEO)
+ 
++Vector<String> Internals::mediaResponseSources(HTMLMediaElement& media)
++{
++    auto* resourceLoader = media.lastMediaResourceLoaderForTesting();
++    if (!resourceLoader)
++        return { };
++    Vector<String> result;
++    auto responses = resourceLoader->responsesForTesting();
++    for (auto& response : responses)
++        result.append(responseSourceToString(response));
++    return result;
++}
++
++Vector<String> Internals::mediaResponseContentRanges(HTMLMediaElement& media)
++{
++    auto* resourceLoader = media.lastMediaResourceLoaderForTesting();
++    if (!resourceLoader)
++        return { };
++    Vector<String> result;
++    auto responses = resourceLoader->responsesForTesting();
++    for (auto& response : responses)
++        result.append(response.httpHeaderField(HTTPHeaderName::ContentRange));
++    return result;
++}
++
+ void Internals::simulateAudioInterruption(HTMLMediaElement& element)
+ {
+ #if USE(GSTREAMER)
+diff --git a/Source/WebCore/testing/Internals.h b/Source/WebCore/testing/Internals.h
+index f5c08a87dfd..d35f651e452 100644
+--- a/Source/WebCore/testing/Internals.h
++++ b/Source/WebCore/testing/Internals.h
+@@ -401,6 +401,8 @@ public:
+     String getImageSourceURL(Element&);
+ 
+ #if ENABLE(VIDEO)
++    Vector<String> mediaResponseSources(HTMLMediaElement&);
++    Vector<String> mediaResponseContentRanges(HTMLMediaElement&);
+     void simulateAudioInterruption(HTMLMediaElement&);
+     ExceptionOr<bool> mediaElementHasCharacteristic(HTMLMediaElement&, const String&);
+ #endif
+diff --git a/Source/WebCore/testing/Internals.idl b/Source/WebCore/testing/Internals.idl
+index 155b70b4abf..3fe6885d362 100644
+--- a/Source/WebCore/testing/Internals.idl
++++ b/Source/WebCore/testing/Internals.idl
+@@ -386,6 +386,8 @@ enum EventThrottlingBehavior {
+ 
+     void enableAutoSizeMode(boolean enabled, long minimumWidth, long minimumHeight, long maximumWidth, long maximumHeight);
+ 
++    [Conditional=VIDEO] sequence<DOMString> mediaResponseSources(HTMLMediaElement media);
++    [Conditional=VIDEO] sequence<DOMString> mediaResponseContentRanges(HTMLMediaElement media);
+     [Conditional=VIDEO] void simulateAudioInterruption(HTMLMediaElement element);
+     [Conditional=VIDEO, MayThrowException] boolean mediaElementHasCharacteristic(HTMLMediaElement element, DOMString characteristic);
+ 
+-- 
+2.13.3
+
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index b200d23262..e30d07fc1d 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -40,9 +40,13 @@ WEBKITGTK_CONF_OPTS += \
 	-DENABLE_WEB_AUDIO=ON
 WEBKITGTK_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base gst1-plugins-good
 else
+# ENABLE_MEDIA_STREAM has to be explicitly disabled because there is a missing
+# feature dependency in the WebKitGTK+ CMake files. This can be removed once
+# https://bugs.webkit.org/show_bug.cgi?id=174940 makes it into a release.
 WEBKITGTK_CONF_OPTS += \
 	-DENABLE_VIDEO=OFF \
-	-DENABLE_WEB_AUDIO=OFF
+	-DENABLE_WEB_AUDIO=OFF \
+	-DENABLE_MEDIA_STREAM=OFF
 endif
 
 # Only one target platform can be built, assume X11 > Wayland
-- 
2.13.3

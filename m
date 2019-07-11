From: Ortmann, Michael <m.ortmann@lxinstruments.com>
Date: Thu, 11 Jul 2019 13:49:30 +0000
Subject: [Buildroot] [Patch] package/webkitgtk: Fix build with EGL enabled
Message-ID: <55a414c3ab9249f5853334041116f254@lxinstruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
webkitgtk build fails when EGL is enabled in package mesa3d. Apparently a enum called "None" causes a conflict with Xlib. This issue is related to:
https://bugs.webkit.org/show_bug.cgi?id=198659

Adding "@no-unify" to line 71 in "output/build/webkitgtk-2.24.3/Source/WebCore/SourcesGTK.txt" fixes this issue. Here is the content of the patch file I made:

--- a/Source/WebCore/SourcesGTK.txt 2019-07-11 12:50:07.385599078 +0200
+++ b/Source/WebCore/SourcesGTK.txt              2019-05-09 10:00:14.000000000 +0200
@@ -68,7 +68,7 @@
 platform/graphics/cairo/BackingStoreBackendCairoX11.cpp @no-unify
-platform/graphics/egl/GLContextEGL.cpp
+platform/graphics/egl/GLContextEGL.cpp @no-unify
platform/graphics/egl/GLContextEGLWayland.cpp @no-unify
platform/graphics/egl/GLContextEGLX11.cpp @no-unify


Here is the output with the error message when running make:

[ 59%] Building CXX object Source/WebCore/CMakeFiles/WebCore.dir/__/__/DerivedSources/WebCore/unified-sources/UnifiedSource-3c72abbe-34.cpp.o
In file included from /home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/platform/graphics/iso/ISOBox.cpp:29:0,
                 from /home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/DerivedSources/WebCore/unified-sources/UnifiedSource-3c72abbe-33.cpp:1:
/home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/DerivedSources/ForwardingHeaders/JavaScriptCore/DataView.h: In instantiation of 'T JSC::DataView::get(unsigned int, bool, bool*) [with T = unsigned int]':
/home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/DerivedSources/ForwardingHeaders/JavaScriptCore/DataView.h:72:11:   required from 'T JSC::DataView::read(unsigned int&, bool, bool*) [with T = unsigned int]'
/home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/platform/graphics/iso/ISOBox.h:65:11:   required from 'static bool WebCore::ISOBox::checkedRead(R&, V&, unsigned int&, WebCore::ISOBox::Endianness) [with T = unsigned int; R = long long unsigned int; V = JSC::DataView]'
/home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/platform/graphics/iso/ISOBox.cpp:38:61:   required from here
/home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/DerivedSources/ForwardingHeaders/JavaScriptCore/DataView.h:65:14: warning: cast from 'uint8_t* {aka unsigned char*}' to 'unsigned int*' increases required alignment of target type [-Wcast-align]
             *reinterpret_cast<T*>(static_cast<uint8_t*>(m_baseAddress.get()) + offset),
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/DerivedSources/ForwardingHeaders/JavaScriptCore/DataView.h: In instantiation of 'T JSC::DataView::get(unsigned int, bool, bool*) [with T = long long unsigned int]':
/home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/DerivedSources/ForwardingHeaders/JavaScriptCore/DataView.h:72:11:   required from 'T JSC::DataView::read(unsigned int&, bool, bool*) [with T = long long unsigned int]'
/home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/platform/graphics/iso/ISOBox.h:65:11:   required from 'static bool WebCore::ISOBox::checkedRead(R&, V&, unsigned int&, WebCore::ISOBox::Endianness) [with T = long long unsigned int; R = long long unsigned int; V = JSC::DataView]'
/home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/platform/graphics/iso/ISOBox.cpp:45:74:   required from here
/home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/DerivedSources/ForwardingHeaders/JavaScriptCore/DataView.h:65:14: warning: cast from 'uint8_t* {aka unsigned char*}' to 'long long unsigned int*' increases required alignment of target type [-Wcast-align]
[ 59%] Building CXX object Source/WebCore/CMakeFiles/WebCore.dir/__/__/DerivedSources/WebCore/unified-sources/UnifiedSource-3c72abbe-35.cpp.o
In file included from /home/lxi/buildroot/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/X11/Xlib.h:44:0,
                 from /home/lxi/buildroot/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/EGL/eglplatform.h:124,
                 from /home/lxi/buildroot/buildroot-2019.05/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/EGL/egl.h:39,
                 from /home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/platform/graphics/egl/GLContextEGL.cpp:30,
                 from /home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/DerivedSources/WebCore/unified-sources/UnifiedSource-3c72abbe-26.cpp:5:
/home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/rendering/style/RenderStyleConstants.h:70:5: error: expected identifier before numeric constant
     None        = 0,
     ^
/home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/rendering/style/RenderStyleConstants.h:70:5: error: expected '}' before numeric constant
/home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/rendering/style/RenderStyleConstants.h:70:5: error: expected unqualified-id before numeric constant
/home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/rendering/style/RenderStyleConstants.h:82:5: error: expected identifier before numeric constant
     None,
     ^
/home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/rendering/style/RenderStyleConstants.h:82:5: error: expected '}' before numeric constant
/home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/rendering/style/RenderStyleConstants.h:82:5: error: expected unqualified-id before numeric constant
In file included from /home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/platform/animation/Animation.h:28:0,
                 from /home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/platform/graphics/GraphicsLayer.h:28,
                 from /home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/platform/graphics/texmap/TextureMapperAnimation.h:23,
                 from /home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/platform/graphics/nicosia/NicosiaPlatformLayer.h:38,
                 from /home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/platform/graphics/nicosia/texmap/NicosiaContentLayerTextureMapperImpl.h:33,
                 from /home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/platform/graphics/cairo/ImageBufferDataCairo.h:42,
                 from /home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/platform/graphics/ImageBufferData.h:31,
                 from /home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/platform/graphics/ImageBuffer.h:34,
                 from /home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/platform/graphics/filters/Filter.h:26,
                 from /home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/platform/graphics/filters/FEBlend.h:27,
                 from /home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/platform/graphics/filters/FEBlend.cpp:26,
                 from /home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/DerivedSources/WebCore/unified-sources/UnifiedSource-3c72abbe-26.cpp:7:
/home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/rendering/style/RenderStyleConstants.h:106:1: error: expected declaration before '}' token
};
^
Source/WebCore/CMakeFiles/WebCore.dir/build.make:12474: recipe for target 'Source/WebCore/CMakeFiles/WebCore.dir/__/__/DerivedSources/WebCore/unified-sources/UnifiedSource-3c72abbe-26.cpp.o' failed
make[4]: *** [Source/WebCore/CMakeFiles/WebCore.dir/__/__/DerivedSources/WebCore/unified-sources/UnifiedSource-3c72abbe-26.cpp.o] Error 1
make[4]: *** Waiting for unfinished jobs....
In file included from /home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/DerivedSources/WebCore/unified-sources/UnifiedSource-3c72abbe-34.cpp:5:0:
/home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/platform/graphics/opentype/OpenTypeVerticalData.cpp: In member function 'void WebCore::OpenTypeVerticalData::loadMetrics(const WebCore::FontPlatformData&)':
/home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/Source/WebCore/platform/graphics/opentype/OpenTypeVerticalData.cpp:481:129: warning: cast from 'const WebCore::OpenType::VmtxTable::Entry*' to 'const Int16* {aka const WebCore::OpenType::BigEndianShort*}' increases required alignment of target type [-Wcast-align]
         const OpenType::Int16* pTopSideBearingsExtra = reinterpret_cast<const OpenType::Int16*>(&vmtx->entries[countVmtxEntries]);
                                                                                                                                 ^
CMakeFiles/Makefile2:768: recipe for target 'Source/WebCore/CMakeFiles/WebCore.dir/all' failed
make[3]: *** [Source/WebCore/CMakeFiles/WebCore.dir/all] Error 2
Makefile:151: recipe for target 'all' failed
make[2]: *** [all] Error 2
package/pkg-generic.mk:238: recipe for target '/home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/.stamp_built' failed
make[1]: *** [/home/lxi/buildroot/buildroot-2019.05/output/build/webkitgtk-2.24.3/.stamp_built] Error 2
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2





-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190711/df26bff8/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-GLContextEGL-use-no-unify.patch
Type: application/octet-stream
Size: 435 bytes
Desc: 0001-GLContextEGL-use-no-unify.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190711/df26bff8/attachment.obj>

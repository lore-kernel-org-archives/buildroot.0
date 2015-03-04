From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed,  4 Mar 2015 12:07:16 +0100
Subject: [Buildroot] [PATCH] cmake: use system libzma when the xz package is
	enabled
Message-ID: <1425467236-27158-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build failure:
.../output/build/host-cmake-3.1.3/Utilities/cmliblzma/liblzma/common/block_buffer_decoder.c:17:1: error: conflicting types for ?lzma_block_buffer_decode?
 lzma_block_buffer_decode(lzma_block *block, lzma_allocator *allocator,
 ^
In file included from /home/tetsuya/buildroot/br2/output/host/usr/include/lzma.h:296:0,
                 from /home/tetsuya/buildroot/br2/output/build/host-cmake-3.1.3/Utilities/cmliblzma/liblzma/common/common.h:34,
                 from /home/tetsuya/buildroot/br2/output/build/host-cmake-3.1.3/Utilities/cmliblzma/liblzma/common/block_decoder.h:16,
                 from /home/tetsuya/buildroot/br2/output/build/host-cmake-3.1.3/Utilities/cmliblzma/liblzma/common/block_buffer_decoder.c:13:
/home/tetsuya/buildroot/br2/output/host/usr/include/lzma/block.h:577:27: note: previous declaration of ?lzma_block_buffer_decode? was here
 extern LZMA_API(lzma_ret) lzma_block_buffer_decode(
                           ^
Utilities/cmliblzma/CMakeFiles/cmliblzma.dir/build.make:261: recipe for target 'Utilities/cmliblzma/CMakeFiles/cmliblzma.dir/liblzma/common/block_buffer_decoder.c.o' failed
make[3]: *** [Utilities/cmliblzma/CMakeFiles/cmliblzma.dir/liblzma/common/block_buffer_decoder.c.o] Error 1

Fixes:
http://autobuild.buildroot.org/results/4edf6e169dc4a00d8a8bd16a86eba2316cbbd9e5
http://autobuild.buildroot.org/results/a9ff38b22a36a2f8427d33085d3263a8cbfbd746
http://autobuild.buildroot.org/results/ecaa0227249207b5450519832a193c1585ac8177

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/cmake/cmake.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 8c64b58..4b53559 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -12,6 +12,11 @@ CMAKE_LICENSE_FILES = Copyright.txt
 
 HOST_CMAKE_DEPENDENCIES = host-pkgconf
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+ HOST_CMAKE_DEPENDENCIES += host-xz
+ HOST_CMAKE_CONF_OPTS += -DCMAKE_USE_SYSTEM_LIBLZMA=ON
+endif
+
 define HOST_CMAKE_CONFIGURE_CMDS
 	(cd $(@D); \
 		LDFLAGS="$(HOST_LDFLAGS)" \
@@ -22,6 +27,7 @@ define HOST_CMAKE_CONFIGURE_CMDS
 			-DCMAKE_CXX_FLAGS="$(HOST_CXXFLAGS)" \
 			-DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
 			-DBUILD_CursesDialog=OFF \
+			$(HOST_CMAKE_CONF_OPTS) \
 	)
 endef
 
-- 
2.3.1

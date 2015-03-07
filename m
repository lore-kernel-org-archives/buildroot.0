From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 11:05:12 +0100
Subject: [Buildroot] [git commit] cmake: don't use any header available in
	$(HOST_DIR)/usr/include
Message-ID: <20150307100623.3AEB4807AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=46bf8e8fd2428a733486ca192ba93588a7ac8d0e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The -I<dir> options added to CMAKE_C_FLAGS are passed to the compiler
before the -I<dir> options of the cmake internal headers, so when the
host-xz package was already built, a #include <lzma.h> directive loads
the host-xz header instead of the cmake internal one.

Because we don't want to use any header avaiable in -I$(HOST_DIR)/usr/include,
just get rid of the -I<dir> options in the HOST_CFLAGS.

Fix build failure:
  make host-xz host-cmake

.../output/build/host-cmake-3.1.3/Utilities/cmliblzma/liblzma/common/block_buffer_decoder.c:17:1: error: conflicting types for ???lzma_block_buffer_decode???
 lzma_block_buffer_decode(lzma_block *block, lzma_allocator *allocator,
 ^
In file included from /home/tetsuya/buildroot/br2/output/host/usr/include/lzma.h:296:0,
                 from /home/tetsuya/buildroot/br2/output/build/host-cmake-3.1.3/Utilities/cmliblzma/liblzma/common/common.h:34,
                 from /home/tetsuya/buildroot/br2/output/build/host-cmake-3.1.3/Utilities/cmliblzma/liblzma/common/block_decoder.h:16,
                 from /home/tetsuya/buildroot/br2/output/build/host-cmake-3.1.3/Utilities/cmliblzma/liblzma/common/block_buffer_decoder.c:13:
/home/tetsuya/buildroot/br2/output/host/usr/include/lzma/block.h:577:27: note: previous declaration of ???lzma_block_buffer_decode??? was here
 extern LZMA_API(lzma_ret) lzma_block_buffer_decode(
                           ^
Utilities/cmliblzma/CMakeFiles/cmliblzma.dir/build.make:261: recipe for target 'Utilities/cmliblzma/CMakeFiles/cmliblzma.dir/liblzma/common/block_buffer_decoder.c.o' failed
make[3]: *** [Utilities/cmliblzma/CMakeFiles/cmliblzma.dir/liblzma/common/block_buffer_decoder.c.o] Error 1

Fixes:
http://autobuild.buildroot.org/results/4edf6e169dc4a00d8a8bd16a86eba2316cbbd9e5
http://autobuild.buildroot.org/results/a9ff38b22a36a2f8427d33085d3263a8cbfbd746
http://autobuild.buildroot.org/results/ecaa0227249207b5450519832a193c1585ac8177

[Thomas:
 - simplify the sed expression. Instead of trying to remove '-I
   <something>' from $(HOST_CFLAGS), simply remove $(HOST_CPPFLAGS)
   from $(HOST_CFLAGS).
 - add the same logic for HOST_CXXFLAGS.]

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Samuel Martin <s.martin49@gmail.com>
Tested-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cmake/cmake.mk |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 8c64b58..a00b8cd 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -12,14 +12,20 @@ CMAKE_LICENSE_FILES = Copyright.txt
 
 HOST_CMAKE_DEPENDENCIES = host-pkgconf
 
+# Get rid of -I* options from $(HOST_CPPFLAGS) to prevent that a
+# header available in $(HOST_DIR)/usr/include is used instead of a
+# CMake internal header, e.g. lzma* headers of the xz package
+HOST_CMAKE_CFLAGS = $(shell echo $(HOST_CFLAGS) | sed -r "s%$(HOST_CPPFLAGS)%%")
+HOST_CMAKE_CXXFLAGS = $(shell echo $(HOST_CXXFLAGS) | sed -r "s%$(HOST_CPPFLAGS)%%")
+
 define HOST_CMAKE_CONFIGURE_CMDS
 	(cd $(@D); \
 		LDFLAGS="$(HOST_LDFLAGS)" \
-		CFLAGS="$(HOST_CFLAGS)" \
+		CFLAGS="$(HOST_CMAKE_CFLAGS)" \
 		./bootstrap --prefix=$(HOST_DIR)/usr \
 			--parallel=$(PARALLEL_JOBS) -- \
-			-DCMAKE_C_FLAGS="$(HOST_CFLAGS)" \
-			-DCMAKE_CXX_FLAGS="$(HOST_CXXFLAGS)" \
+			-DCMAKE_C_FLAGS="$(HOST_CMAKE_CFLAGS)" \
+			-DCMAKE_CXX_FLAGS="$(HOST_CMAKE_CXXFLAGS)" \
 			-DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
 			-DBUILD_CursesDialog=OFF \
 	)

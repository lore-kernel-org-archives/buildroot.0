From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  2 Aug 2019 18:22:26 +0200
Subject: [Buildroot] [PATCH] python-matplotlib: needs a toolchain with C++
 support
Message-ID: <20190802162226.15556-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matplotlib contains .cpp source code:

ls src/*.cpp
src/_backend_agg.cpp
src/_backend_agg_wrapper.cpp
src/_contour.cpp
src/_contour_wrapper.cpp
src/ft2font.cpp
src/ft2font_wrapper.cpp
src/_image.cpp
src/_image_wrapper.cpp
src/mplutils.cpp
src/_path_wrapper.cpp
src/_png.cpp
src/py_converters.cpp
src/_tkagg.cpp
src/_ttconv.cpp
src/_windowing.cpp

So add a dependency on C++ support in the toolchain to fix build errors like
(no autobuilder reference yet):

../output/host/bin/powerpc-buildroot-linux-uclibc-gcc -Wno-unused-result \
  -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE \
  -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC \
  -DFREETYPE_BUILD_TYPE=system \
  -DPY_ARRAY_UNIQUE_SYMBOL=MPL_matplotlib_ft2font_ARRAY_API \
  -DNPY_NO_DEPRECATED_API=NPY_1_7_API_VERSION -D__STDC_FORMAT_MACROS=1 \
  -I../output/host/lib/python3.7/site-packages/numpy/core/include \
  -Iextern/agg24-svn/include \
  -I../output/host/bin/../powerpc-buildroot-linux-uclibc/sysroot/usr/include \
  -I../output/host/bin/../powerpc-buildroot-linux-uclibc/sysroot/usr/include/freetype2 \
  -I. \
  -I../output/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/python3.7m \
  -c src/ft2font.cpp -o build/temp.linux-x86_64-3.7/src/ft2font.o
powerpc-buildroot-linux-uclibc-gcc.br_real: error: src/ft2font.cpp: C++
  compiler not installed on this system

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-matplotlib/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index c5cb94dac7..14f43568f3 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_MATPLOTLIB
 	bool "python-matplotlib"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	select BR2_PACKAGE_FREETYPE # runtime
@@ -19,3 +20,6 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB
 	  formats.
 
 	  https://matplotlib.org/
+
+comment "python-matplotlib needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.11.0

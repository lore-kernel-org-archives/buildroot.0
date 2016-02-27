From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 27 Feb 2016 14:13:38 +0100
Subject: [Buildroot] [PATCH 2/2] package/qhull: add dependency on gcc >= 4.4
In-Reply-To: <1456578818-32619-1-git-send-email-romain.naour@gmail.com>
References: <1456578818-32619-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1456578818-32619-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A variadic template template parameters [1] is used in QhullSet.h, this require
a toolchain with (at least) gcc 4.4 [2][3].

Fixes (bfin toolchain with gcc 4.3):
http://autobuild.buildroot.net/results/32f/32f324c7920ac46d393954de13b8a98a77a0c392

[1] http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2008/n2555.pdf
[2] https://gcc.gnu.org/gcc-4.3/cxx0x_status.html
[3] https://gcc.gnu.org/gcc-4.4/cxx0x_status.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
Build tested with old toolchain:

[gcc 4.3]: KO
http://www.codesourcery.com/sgpp/lite/arm/portal/package4571/public/arm-none-linux-gnueabi/arm-2009q1-203-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2

[gcc 4.4]: OK
http://www.codesourcery.com/sgpp/lite/arm/portal/package6488/public/arm-none-linux-gnueabi/arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
---
 package/qhull/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/qhull/Config.in b/package/qhull/Config.in
index 2bc8ff6..0a4b60f 100644
--- a/package/qhull/Config.in
+++ b/package/qhull/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_QHULL
 	bool "qhull"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_4 # needs gcc >= 4.4
 	help
 	  Qhull computes the convex hull, Delaunay triangulation,
 	  Voronoi diagram, halfspace intersection about a point,
@@ -14,5 +15,5 @@ config BR2_PACKAGE_QHULL
 
 	  http://www.qhull.org
 
-comment "qhull needs a toolchain w/ C++, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
+comment "qhull needs a toolchain w/ C++, dynamic library, gcc >= 4.4"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
-- 
2.5.0

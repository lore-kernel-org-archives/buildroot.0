From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 17 Mar 2015 11:20:23 +0100
Subject: [Buildroot] [PATCH v3 1/2] package/cmake: disable on unsupported
	architectures
Message-ID: <1426587624-24938-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Supported architectures are listed at [1].

Fixes:
  http://autobuild.buildroot.net/results/de9/de9021fdc63600536ffa91e4b8718584e3e5702c/
  http://autobuild.buildroot.net/results/0f1/0f1afc62e91ab798fa65685af3dea3caac663f11/

[1] https://github.com/Kitware/CMake/blob/master/Utilities/KWIML/ABI.h.in#L339

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
changes v2->v3
- introduce BR2_PACKAGE_CMAKE_ARCH_SUPPORTS (ThomasP)

changes v1->v2:
- use positive logic (ThomasP)
- add depends on statement to the comment (Baruch)
---
 package/cmake/Config.in | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index 0b5bba9..36c5413 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -1,3 +1,14 @@
+config BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_arm || BR2_armeb || \
+		BR2_aarch64 || \
+		BR2_m68k || \
+		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
+		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
+		BR2_sparc || \
+		BR2_i386 || BR2_x86_64
+
 config BR2_PACKAGE_CMAKE
 	bool
 
@@ -10,6 +21,7 @@ config BR2_PACKAGE_CMAKE_CTEST
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_XZ
+	depends on BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
 	depends on BR2_USE_WCHAR # libarchive
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
@@ -22,4 +34,5 @@ config BR2_PACKAGE_CMAKE_CTEST
 	  http://www.cmake.org/
 
 comment "ctest needs a toolchain w/ C++, wchar"
+	depends on BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
-- 
2.1.0

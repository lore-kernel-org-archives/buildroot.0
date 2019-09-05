From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  5 Sep 2019 20:44:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: python support needs .py
 modules
Message-ID: <20190905184403.19368-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=12171

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opencv3/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index cf7763d4ae..a0bdea529e 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -157,6 +157,7 @@ config BR2_PACKAGE_OPENCV3_LIB_PHOTO
 config BR2_PACKAGE_OPENCV3_LIB_PYTHON
 	bool "python"
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on !BR2_PACKAGE_PYTHON_PYC_ONLY # runtime
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	select BR2_PACKAGE_PYTHON_NUMPY
@@ -164,8 +165,9 @@ config BR2_PACKAGE_OPENCV3_LIB_PYTHON
 	  Include opencv_python module into the OpenCV build.  No
 	  python example is installed.
 
-comment "python support needs glibc or musl"
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+comment "python support needs .py modules and glibc or musl"
+	depends on BR2_PACKAGE_PYTHON_PYC_ONLY || \
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 
 config BR2_PACKAGE_OPENCV3_LIB_SHAPE
 	bool "shape"
-- 
2.23.0.rc1

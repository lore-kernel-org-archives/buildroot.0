From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 17:16:19 +0200
Subject: [Buildroot] [git commit] opencv: mark as not available on Xtensa
Message-ID: <20150808151801.B5D6980E15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d21932508e69d4ab849cba9958f953ae9342cb8c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenCV currently does not build on Xtensa due to compiler/assembler
issues:

  Error: operand 2 of 'l32r' has out of range value '4294632228'

Until this gets fixed, let's disable OpenCV on Xtensa.

Temporarily works around:

   http://autobuild.buildroot.net/results/0be/0bed0779685d9ed83466a4d29a0281ca93043a2e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 0b5d1ac..a52092d 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -5,6 +5,8 @@ menuconfig BR2_PACKAGE_OPENCV
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS # include dlfcn.h
+	# Causes some toolchain failures on Xtensa
+	depends on !BR2_xtensa
 	help
 	  OpenCV (Open Source Computer Vision) is a library of programming
 	  functions for real time computer vision.
@@ -334,6 +336,7 @@ config BR2_PACKAGE_OPENCV_INSTALL_DATA
 endif # BR2_PACKAGE_OPENCV
 
 comment "opencv needs a toolchain w/ C++, NPTL, wchar, dynamic library"
+	depends on !BR2_xtensa
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \

From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  1 Oct 2018 16:42:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: dri i965 driver needs
 headers >= 3.18
Message-ID: <20181001144238.9459-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since
https://cgit.freedesktop.org/mesa/mesa/commit/src/intel/tools/aubinator.c?h=18.2&id=3228335b55c300cd07c4aa69329e58e70afae6a8
the dri i965 driver needs linux/memfd.h which is not available in kernel
headers older than 3.18:
https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/log/include/uapi/linux/memfd.h?id=refs/tags/v3.18.36

Fixes
http://autobuild.buildroot.net/results/5aa/5aac9e9cad789da11b05cbf5d2a5e3f3cf8f1614/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Although the autobuilders only detected the build error with mesa3d
18.2.0 I could reproduce the problem with version 18.2.1 as well.

 package/mesa3d/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index aea579d4e3..a516332d46 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -187,11 +187,16 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_I915
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
 	bool "DRI i965 driver"
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # memfd.h
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM_INTEL
 	help
 	  Support for i965-based Intel GPUs.
 
+comment "DRI i965 driver needs a toolchain w/ headers >= 3.18"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
+
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
 	bool "DRI nouveau driver"
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER
-- 
2.19.0

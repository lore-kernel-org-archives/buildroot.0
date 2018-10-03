From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Oct 2018 09:43:18 +0200
Subject: [Buildroot] [git commit] package/mesa3d: dri i965 driver needs
 headers >= 3.17
Message-ID: <20181003074357.179608A460@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7a9f919c02358964b88d43daa456230b11f5588
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since
https://cgit.freedesktop.org/mesa/mesa/commit/src/intel/tools/aubinator.c?h=18.2&id=3228335b55c300cd07c4aa69329e58e70afae6a8
the dri i965 driver needs linux/memfd.h which is not available in kernel
headers older than 3.17:
https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/log/include/uapi/linux/memfd.h?id=refs/tags/v3.18.36

Fixes
http://autobuild.buildroot.net/results/5aa/5aac9e9cad789da11b05cbf5d2a5e3f3cf8f1614/

[Peter: memfd.h added in 3.17]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index aea579d4e3..8b171b0d7f 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -187,11 +187,16 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_I915
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
 	bool "DRI i965 driver"
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM_INTEL
 	help
 	  Support for i965-based Intel GPUs.
 
+comment "DRI i965 driver needs a toolchain w/ headers >= 3.17"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
 	bool "DRI nouveau driver"
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER

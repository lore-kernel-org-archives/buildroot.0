From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Sep 2016 22:17:02 +0200
Subject: [Buildroot] [git commit] package/kodi: Fix compilation of
	kodi-pvr-vbox with gcc6
Message-ID: <20160905201728.EC3BE8218D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83cdd08d9e08d1c5cb4d84018197d6da9e58f7f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a compile error not yet caught by autobuilders:

In file included from /home/bernd/buildroot/br2/output/build/kodi-pvr-vbox-15e864d160da5a051e18aef06f3a53e49808be02/src/client.cpp:24:0:
/home/bernd/buildroot/br2/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/include/kodi/xbmc_pvr_dll.h:423:63: error: 'SEEK_SET' was not declared in this scope
   long long SeekLiveStream(long long iPosition, int iWhence = SEEK_SET);
                                                               ^~~~~~~~
/home/bernd/buildroot/br2/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/include/kodi/xbmc_pvr_dll.h:510:67: error: 'SEEK_SET' was not declared in this scope
   long long SeekRecordedStream(long long iPosition, int iWhence = SEEK_SET);
                                                                   ^~~~~~~~
CMakeFiles/pvr.vbox.dir/build.make:62: recipe for target 'CMakeFiles/pvr.vbox.dir/src/client.cpp.o' failed

using this defconfig

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_BINUTILS_VERSION_2_26_X=y
BR2_GCC_VERSION_6_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_INIT_NONE=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_KODI_PVR_VBOX=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_XORG7=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...bmc_pvr_types.h-Fix-compilation-with-gcc6.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/kodi/0011-xbmc_pvr_types.h-Fix-compilation-with-gcc6.patch b/package/kodi/0011-xbmc_pvr_types.h-Fix-compilation-with-gcc6.patch
new file mode 100644
index 0000000..a3a9d50
--- /dev/null
+++ b/package/kodi/0011-xbmc_pvr_types.h-Fix-compilation-with-gcc6.patch
@@ -0,0 +1,30 @@
+From a17e8d39cf01e26955574acd236b4ef5b54b8c3b Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Mon, 5 Sep 2016 12:34:20 +0200
+Subject: [PATCH 2/2] xbmc_pvr_types.h: Fix compilation with gcc6
+
+Backport of upstream commit from master branch:
+https://github.com/xbmc/xbmc/commit/c8a346109926fa03bf6882c0b6e3885af0e0f8ed
+
+This patch can be removed when Kodi is bumped to 17.0-Krypton.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ xbmc/addons/include/xbmc_pvr_types.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/xbmc/addons/include/xbmc_pvr_types.h b/xbmc/addons/include/xbmc_pvr_types.h
+index c5ab20b..e518de1 100644
+--- a/xbmc/addons/include/xbmc_pvr_types.h
++++ b/xbmc/addons/include/xbmc_pvr_types.h
+@@ -34,6 +34,7 @@
+ #endif
+ #include <string.h>
+ #include <stdint.h>
++#include <stdio.h>
+ 
+ #include "xbmc_addon_types.h"
+ #include "xbmc_epg_types.h"
+-- 
+2.9.3
+

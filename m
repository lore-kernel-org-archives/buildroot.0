From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 12 Oct 2019 19:30:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d-headers: fix install of
 dri.pc
Message-ID: <20191012173011.11419-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to the switch of mesa3d to the meson build system the upstream
tarball does not include dri.pc.in anymore, it is created during the
build now:
https://cgit.freedesktop.org/mesa/mesa/tree/src/mesa/drivers/dri/meson.build?h=19.2#n93

In order to provide dri.pc we need to add a version taken from a dri-
based mesa3d build to our source repository, by doing so we can reduce
the number of sed commands.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/dri.pc            | 10 ++++++++++
 package/mesa3d-headers/mesa3d-headers.mk |  9 ++-------
 2 files changed, 12 insertions(+), 7 deletions(-)
 create mode 100644 package/mesa3d-headers/dri.pc

diff --git a/package/mesa3d-headers/dri.pc b/package/mesa3d-headers/dri.pc
new file mode 100644
index 0000000000..bd9a33b6c6
--- /dev/null
+++ b/package/mesa3d-headers/dri.pc
@@ -0,0 +1,10 @@
+prefix=/usr
+libdir=${prefix}/lib
+includedir=${prefix}/include
+
+dridriverdir=/usr/lib/dri
+
+Name: dri
+Description: Direct Rendering Infrastructure
+Version: @VERSION@
+Cflags: -I${includedir}
diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 8670184742..99d6e52498 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -34,13 +34,8 @@ ifeq ($(BR2_PACKAGE_XORG7),y)
 # Not using $(SED) because we do not want to work in-place, and $(SED)
 # contains -i.
 define MESA3D_HEADERS_BUILD_DRI_PC
-	sed -e 's:@\(exec_\)\?prefix@:/usr:' \
-	    -e 's:@libdir@:$${exec_prefix}/lib:' \
-	    -e 's:@includedir@:$${prefix}/include:' \
-	    -e 's:@DRI_DRIVER_INSTALL_DIR@:$${libdir}/dri:' \
-	    -e 's:@VERSION@:$(MESA3D_HEADERS_VERSION):' \
-	    -e 's:@DRI_PC_REQ_PRIV@::' \
-	    $(@D)/src/mesa/drivers/dri/dri.pc.in \
+	sed -e 's:@VERSION@:$(MESA3D_HEADERS_VERSION):' \
+	    package/mesa3d-headers/dri.pc \
 	    >$(@D)/src/mesa/drivers/dri/dri.pc
 endef
 
-- 
2.20.1

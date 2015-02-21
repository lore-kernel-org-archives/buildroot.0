From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 17:45:26 +0100
Subject: [Buildroot] [git commit] package/mesa3d-headers: also install dri
	header and .pc file
Message-ID: <20150302222721.AA8D4807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7468b60e7c7fe7ff2e813de6a43f9f26fa453819
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building GL with Xorg requires the DRI interface.

Provide that header and pkg-config file for those binary blobs
that do not provide them.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: J??r??me Pouiller <jezz@sysmic.org>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d-headers/mesa3d-headers.mk |   33 +++++++++++++++++++++++++++++-
 1 files changed, 32 insertions(+), 1 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 0c4c9f4..e20859e 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -25,8 +25,34 @@ MESA3D_HEADERS_INSTALL_TARGET = NO
 MESA3D_HEADERS_DIRS = KHR
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+
 MESA3D_HEADERS_DIRS += GL
-endif
+
+ifeq ($(BR2_PACKAGE_XORG7),y)
+
+# Not using $(SED) because we do not want to work in-place, and $(SED)
+# contains -i.
+define MESA3D_HEADERS_BUILD_DRI_PC
+	sed -e 's:@\(exec_\)\?prefix@:/usr:' \
+	    -e 's:@libdir@:${exec_prefix}/lib:' \
+	    -e 's:@includedir@:${prefix}/include:' \
+	    -e 's:@DRI_DRIVER_INSTALL_DIR@:${libdir}/dri:' \
+	    -e 's:@VERSION@:$(MESA3D_HEADERS_VERSION):' \
+	    -e 's:@DRI_PC_REQ_PRIV@::' \
+	    $(@D)/src/mesa/drivers/dri/dri.pc.in \
+	    >$(@D)/src/mesa/drivers/dri/dri.pc
+endef
+
+define MESA3D_HEADERS_INSTALL_DRI_PC
+	$(INSTALL) -D -m 0644 $(@D)/include/GL/internal/dri_interface.h \
+		$(STAGING_DIR)/usr/include/GL/internal/dri_interface.h
+	$(INSTALL) -D -m 0644 $(@D)/src/mesa/drivers/dri/dri.pc \
+		$(STAGING_DIR)/usr/lib/pkg-config/dri.pc
+endef
+
+endif # Xorg
+
+endif # OpenGL
 
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
 MESA3D_HEADERS_DIRS += EGL
@@ -40,9 +66,14 @@ ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
 MESA3D_HEADERS_DIRS += VG
 endif
 
+define MESA3D_HEADERS_BUILD_CMDS
+	$(MESA3D_HEADERS_BUILD_DRI_PC)
+endef
+
 define MESA3D_HEADERS_INSTALL_STAGING_CMDS
 	$(foreach d,$(MESA3D_HEADERS_DIRS),\
 		cp -dpfr $(@D)/include/$(d) $(STAGING_DIR)/usr/include/ || exit 1$(sep))
+	$(MESA3D_HEADERS_INSTALL_DRI_PC)
 endef
 
 $(eval $(generic-package))

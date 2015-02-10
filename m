From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 10 Feb 2015 21:01:11 +0100
Subject: [Buildroot] [PATCH 04/10 v7] package/mesa3d-headers: also install
	dri header and .pc file
In-Reply-To: <cover.1423597914.git.yann.morin.1998@free.fr>
References: <cover.1423597914.git.yann.morin.1998@free.fr>
Message-ID: <a88ca46ce32c884d4aeea74af80f1ebbcff9dc16.1423597914.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building GL with Xorg requires the DRI interface.

Provide that header and pkg-config file for those binary blobs
that do not provide them.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: J?r?me Pouiller <jezz@sysmic.org>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 33 +++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index acfc9a3..0a2702f 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -33,8 +33,34 @@ MESA3D_HEADERS_INSTALL_TARGET = NO
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
@@ -48,11 +74,16 @@ ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
 MESA3D_HEADERS_DIRS += VG
 endif
 
+define MESA3D_HEADERS_BUILD_CMDS
+	$(MESA3D_HEADERS_BUILD_DRI_PC)
+endef
+
 define MESA3D_HEADERS_INSTALL_STAGING_CMDS
 	$(foreach d,$(MESA3D_HEADERS_DIRS),\
 		for h in $(@D)/include/$(d)/*.h; do \
 			$(INSTALL) -D -m 0644 $${h} $(STAGING_DIR)/usr/include/$(d)/$$(basename $${h}) || exit 1; \
 		done$(sep))
+	$(MESA3D_HEADERS_INSTALL_DRI_PC)
 endef
 
 endif # !mesa3d
-- 
1.9.1

From: Vincent Fazio <vfazio@xes-inc.com>
Date: Thu, 20 Feb 2020 14:11:48 -0600
Subject: [Buildroot] [PATCH v2 1/2] package/nvidia-driver: fixup libraries
 according to README
Message-ID: <20200220201149.7426-1-vfazio@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Create a symlink for libglx.so and drop libnvidia-wfb.so (aka libwfb.so)
since all selectable xserver versions in Buildroot provide their own.

VDPAU libraries should be installed into /usr/lib/vdpau/

https://download.nvidia.com/XFree86/Linux-x86_64/390.67/README/installedcomponents.html

Also, allow specifying target subdirectory per library and respect it in
the install loop.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
Depends on http://patchwork.ozlabs.org/patch/1181847/

 package/nvidia-driver/nvidia-driver.mk | 57 ++++++++++++++++----------
 1 file changed, 35 insertions(+), 22 deletions(-)

diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index baf2ba2be5..0ac8d2a5fb 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -62,7 +62,7 @@ NVIDIA_DRIVER_LIBS_MISC = \
 	libnvidia-glcore.so.$(NVIDIA_DRIVER_VERSION) \
 	libnvidia-glsi.so.$(NVIDIA_DRIVER_VERSION) \
 	tls/libnvidia-tls.so.$(NVIDIA_DRIVER_VERSION) \
-	libvdpau_nvidia.so.$(NVIDIA_DRIVER_VERSION) \
+	libvdpau_nvidia.so.$(NVIDIA_DRIVER_VERSION):vdpau/ \
 	libnvidia-ml.so.$(NVIDIA_DRIVER_VERSION)
 
 NVIDIA_DRIVER_LIBS += \
@@ -92,10 +92,9 @@ NVIDIA_DRIVER_LIBS += \
 endif
 
 # We refer to the destination path; the origin file has no directory component
-NVIDIA_DRIVER_X_MODS = \
-	drivers/nvidia_drv.so \
-	extensions/libglx.so.$(NVIDIA_DRIVER_VERSION) \
-	libnvidia-wfb.so.$(NVIDIA_DRIVER_VERSION)
+NVIDIA_DRIVER_LIBS += \
+	nvidia_drv.so:xorg/modules/drivers/ \
+	libglx.so.$(NVIDIA_DRIVER_VERSION):xorg/modules/extensions/
 
 endif # X drivers
 
@@ -154,24 +153,31 @@ define NVIDIA_DRIVER_EXTRACT_CMDS
 endef
 
 # Helper to install libraries
-# $1: destination directory (target or staging)
+# $1: library name
+# $2: target directory
 #
 # For all libraries, we install them and create a symlink using
 # their SONAME, so we can link to them at runtime; we also create
 # the no-version symlink, so we can link to them at build time.
+define NVIDIA_DRIVER_INSTALL_LIB
+	$(INSTALL) -D -m 0644 $(@D)/$(1) $(2)$(notdir $(1))
+	libsoname="$$( $(TARGET_READELF) -d "$(@D)/$(1)" \
+		|sed -r -e '/.*\(SONAME\).*\[(.*)\]$$/!d; s//\1/;' )"; \
+	if [ -n "$${libsoname}" -a "$${libsoname}" != "$(notdir $(1))" ]; then \
+		ln -sf $(notdir $(1)) $(2)$${libsoname}; \
+	fi
+	baseso=$(firstword $(subst .,$(space),$(notdir $(1)))).so; \
+	if [ -n "$${baseso}" -a "$${baseso}" != "$(notdir $(1))" ]; then \
+		ln -sf $(notdir $(1)) $(2)$${baseso}; \
+	fi
+endef
+
+# Helper to install libraries
+# $1: destination directory (target or staging)
 define NVIDIA_DRIVER_INSTALL_LIBS
-	$(foreach lib,$(NVIDIA_DRIVER_LIBS),\
-		$(INSTALL) -D -m 0644 $(@D)/$(lib) $(1)/usr/lib/$(notdir $(lib))
-		libsoname="$$( $(TARGET_READELF) -d "$(@D)/$(lib)" \
-			|sed -r -e '/.*\(SONAME\).*\[(.*)\]$$/!d; s//\1/;' )"; \
-		if [ -n "$${libsoname}" -a "$${libsoname}" != "$(notdir $(lib))" ]; then \
-			ln -sf $(notdir $(lib)) \
-				$(1)/usr/lib/$${libsoname}; \
-		fi
-		baseso=$(firstword $(subst .,$(space),$(notdir $(lib)))).so; \
-		if [ -n "$${baseso}" -a "$${baseso}" != "$(notdir $(lib))" ]; then \
-			ln -sf $(notdir $(lib)) $(1)/usr/lib/$${baseso}; \
-		fi
+	$(foreach lib,$(NVIDIA_DRIVER_LIBS),
+		$(call NVIDIA_DRIVER_INSTALL_LIB,$(shell echo $(lib) | awk -F":" '{print $$1}'), \
+			$(1)/usr/lib/$(shell echo $(lib) | awk -F":" '{print $$2}'))
 	)
 endef
 
@@ -181,18 +187,25 @@ define NVIDIA_DRIVER_INSTALL_STAGING_CMDS
 	$(NVIDIA_DRIVER_INSTALL_GL_DEV)
 endef
 
+define NVIDIA_DRIVER_SYMLINK_LIBGLX
+	# libglx needs a symlink according to the driver README. It has no SONAME
+	ln -sf libglx.so.$(NVIDIA_DRIVER_VERSION) \
+		$(TARGET_DIR)/usr/lib/xorg/modules/extensions/libglx.so
+endef
+
 # For target, install libraries and X.org modules
 define NVIDIA_DRIVER_INSTALL_TARGET_CMDS
 	$(call NVIDIA_DRIVER_INSTALL_LIBS,$(TARGET_DIR))
-	$(foreach m,$(NVIDIA_DRIVER_X_MODS), \
-		$(INSTALL) -D -m 0644 $(@D)/$(notdir $(m)) \
-			$(TARGET_DIR)/usr/lib/xorg/modules/$(m)
-	)
 	$(foreach p,$(NVIDIA_DRIVER_PROGS), \
 		$(INSTALL) -D -m 0755 $(@D)/$(p) \
 			$(TARGET_DIR)/usr/bin/$(p)
 	)
+	$(NVIDIA_DRIVER_SYMLINK_LIBGLX)
 	$(NVIDIA_DRIVER_INSTALL_KERNEL_MODULE)
 endef
 
+# Due to a conflict with xserver_xorg-server, this needs to be performed when
+# finalizing the target filesystem to make sure this version is used.
+NVIDIA_DRIVER_TARGET_FINALIZE_HOOKS += NVIDIA_DRIVER_SYMLINK_LIBGLX
+
 $(eval $(generic-package))
-- 
2.25.1

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Oct 2008 16:39:02 +0200
Subject: [Buildroot] [PATCH] Add  the DirectFB examples package
Message-ID: <20081015163902.1807265d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the DirectFB examples package

This patch adds the DirectFB examples package to Buildroot. It is
largely based on a patch written by Daniel Laird, and available at
http://bugs.uclibc.org/view.php?id=4224. I only made a few adaptations
to get it to work properly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                                    |    1 
 package/directfb-examples/Config.in                                  |   97 +++++++++
 package/directfb-examples/directfb-examples-1.2.0-remove-bzero.patch |   17 +
 package/directfb-examples/directfb-examples.mk                       |  101 ++++++++++
 4 files changed, 216 insertions(+)

Index: buildroot/package/Config.in
===================================================================
--- buildroot.orig/package/Config.in
+++ buildroot/package/Config.in
@@ -309,6 +309,7 @@
 
 comment "graphic libraries"
 source "package/directfb/Config.in"
+source "package/directfb-examples/Config.in"
 source "package/fbdump/Config.in"
 source "package/fusion/Config.in"
 source "package/imagemagick/Config.in"
Index: buildroot/package/directfb-examples/Config.in
===================================================================
--- /dev/null
+++ buildroot/package/directfb-examples/Config.in
@@ -0,0 +1,97 @@
+config BR2_PACKAGE_DIRECTFB_EXAMPLES
+       bool "directfb examples"
+       depends on BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI
+       bool "usr/bin/df_andi"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_BLTLOAD
+       bool "usr/bin/df_bltload"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_CPULOAD
+       bool "usr/bin/df_cpuload"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_DATABUFFER
+       bool "usr/bin/df_databuffer"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_DIOLOAD
+       bool "usr/bin/df_dioload"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK
+       bool "usr/bin/df_dok"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST
+       bool "usr/bin/df_drivertest"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_FIRE
+       bool "usr/bin/df_fire"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_FLIP
+       bool "usr/bin/df_flip"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_FONTS
+       bool "usr/bin/df_fonts"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT
+       bool "usr/bin/df_input"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_JOYSTICK
+       bool "usr/bin/df_joystick"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_KNUCKLES
+       bool "usr/bin/df_knuckles"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_LAYER
+       bool "usr/bin/df_layer"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO
+       bool "usr/bin/df_neo"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_NETLOAD
+       bool "usr/bin/df_netload"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_PALETTE
+       bool "usr/bin/df_palette"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_PARTICLE
+       bool "usr/bin/df_particle"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_PORTER
+       bool "usr/bin/df_porter"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_STRESS
+       bool "usr/bin/df_stress"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_TEXTURE
+       bool "usr/bin/df_texture"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO
+       bool "usr/bin/df_video"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO_PARTICLE
+       bool "usr/bin/df_video_particle"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW
+       bool "usr/bin/df_window"
+       depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
Index: buildroot/package/directfb-examples/directfb-examples-1.2.0-remove-bzero.patch
===================================================================
--- /dev/null
+++ buildroot/package/directfb-examples/directfb-examples-1.2.0-remove-bzero.patch
@@ -0,0 +1,17 @@
+---
+ src/df_knuckles/matrix.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: directfb-examples-1.2.0/src/df_knuckles/matrix.c
+===================================================================
+--- directfb-examples-1.2.0.orig/src/df_knuckles/matrix.c
++++ directfb-examples-1.2.0/src/df_knuckles/matrix.c
+@@ -19,7 +19,7 @@
+ static float Cosine[3600];
+ static float Sine[3600];
+ 
+-#define M_CLEAR(m) bzero(m, MATRIX_SIZE)
++#define M_CLEAR(m) memset(m, 0, MATRIX_SIZE)
+ #define M_IDENTITY(m) memcpy(m, IdentityMatrix, MATRIX_SIZE)
+ 
+ static void MultiplyMatrix(float *A, float *B)
Index: buildroot/package/directfb-examples/directfb-examples.mk
===================================================================
--- /dev/null
+++ buildroot/package/directfb-examples/directfb-examples.mk
@@ -0,0 +1,101 @@
+#############################################################
+#
+# directfb examples
+#
+#############################################################
+DIRECTFB_EXAMPLES_VERSION:=1.2.0
+DIRECTFB_EXAMPLES_SITE:=http://www.directfb.org/downloads/Extras
+DIRECTFB_EXAMPLES_SOURCE = DirectFB-examples-$(DIRECTFB_EXAMPLES_VERSION).tar.gz
+DIRECTFB_EXAMPLES_INSTALL_STAGING = YES
+DIRECTFB_EXAMPLES_INSTALL_TARGET = YES
+DIRECTFB_EXAMPLES_DEPENDENCIES = directfb
+
+DIRECTFB_EXAMPLES_TARGETS_ :=
+DIRECTFB_EXAMPLES_TARGETS_y :=
+
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI) += usr/bin/df_andi
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_BLTLOAD) += usr/bin/df_bltload
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_CPULOAD) += usr/bin/df_cpuload
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DATABUFFER) += usr/bin/df_databuffer
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DIOLOAD) += usr/bin/df_dioload
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/bin/df_dok
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST) += usr/bin/df_drivertest
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_FIRE) += usr/bin/df_fire
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_FLIP) += usr/bin/df_flip
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_FONTS) += usr/bin/df_fonts
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT) += usr/bin/df_input
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_JOYSTICK) += usr/bin/df_joystick
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_KNUCKLES) += usr/bin/df_knuckles
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_LAYER) += usr/bin/df_layer
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO) += usr/bin/df_neo
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_NETLOAD) += usr/bin/df_netload
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_PALETTE) += usr/bin/df_palette
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_PARTICLE) += usr/bin/df_particle
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_PORTER) += usr/bin/df_porter
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_STRESS) += usr/bin/df_stress
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_TEXTURE) += usr/bin/df_texture
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO) += usr/bin/df_video
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO_PARTICLE) += usr/bin/df_video_particle
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW) += usr/bin/df_window
+
+$(eval $(call AUTOTARGETS,package,directfb-examples))
+
+$(DIRECTFB_EXAMPLES_TARGET_INSTALL_TARGET): $(DIRECTFB_EXAMPLES_TARGET_INSTALL_STAGING)
+	$(call MESSAGE,"Installing to target")
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DIRECTFB_EXAMPLES_DIR) install
+	$(Q)mkdir -p $(TARGET_DIR)/usr/bin
+	$(Q)mkdir -p $(TARGET_DIR)/usr/share/directfb-examples/
+	$(Q)mkdir -p $(TARGET_DIR)/usr/share/directfb-examples/fonts/
+	for file in $(DIRECTFB_EXAMPLES_TARGETS_y); do \
+	        cp -dpf $(STAGING_DIR)/$$file $(TARGET_DIR)/$$file; \
+	done
+
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/fonts/decker.ttf $(TARGET_DIR)/usr/share/directfb-examples/fonts/
+
+ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI),y)
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/destination_mask.png $(TARGET_DIR)/usr/share/directfb-examples/
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/tux.png $(TARGET_DIR)/usr/share/directfb-examples/
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/wood_andi.jpg $(TARGET_DIR)/usr/share/directfb-examples/
+endif
+ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK),y)
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/biglogo.png $(TARGET_DIR)/usr/share/directfb-examples/
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/card.png $(TARGET_DIR)/usr/share/directfb-examples/
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/melted.png $(TARGET_DIR)/usr/share/directfb-examples/
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/meter.png $(TARGET_DIR)/usr/share/directfb-examples/
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/pngtest*.png $(TARGET_DIR)/usr/share/directfb-examples/
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/colorkeyed.gif $(TARGET_DIR)/usr/share/directfb-examples/
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/intro.png $(TARGET_DIR)/usr/share/directfb-examples/
+endif
+ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST),y)
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/pngtest.png $(TARGET_DIR)/usr/share/directfb-examples/
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/testmask.png $(TARGET_DIR)/usr/share/directfb-examples/
+endif
+ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_FONTS),y)
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/fonts/* $(TARGET_DIR)/usr/share/directfb-examples/fonts/
+endif
+ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT),y)
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/joystick.png $(TARGET_DIR)/usr/share/directfb-examples/
+endif
+ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO),y)
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/apple-red.png $(TARGET_DIR)/usr/share/directfb-examples/
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/gnome-*.png $(TARGET_DIR)/usr/share/directfb-examples/
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/gnu-*.png $(TARGET_DIR)/usr/share/directfb-examples/
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/background*.jpg $(TARGET_DIR)/usr/share/directfb-examples/
+endif
+ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_STRESS),y)
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/melted.png $(TARGET_DIR)/usr/share/directfb-examples/
+endif
+ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_TEXTURE),y)
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/texture.png $(TARGET_DIR)/usr/share/directfb-examples/
+endif
+ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO),y)
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/shot.png $(TARGET_DIR)/usr/share/directfb-examples/
+endif
+ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO_PARTICLE),y)
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/convergence.png $(TARGET_DIR)/usr/share/directfb-examples/
+endif
+ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW),y)
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/desktop.png $(TARGET_DIR)/usr/share/directfb-examples/
+	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/dfblogo.png $(TARGET_DIR)/usr/share/directfb-examples/
+endif
+	$(Q)touch -c $@


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com

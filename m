From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Oct 2014 00:38:15 +0200
Subject: [Buildroot] [PATCH 06/30] package/qemu: add SDL frontends
In-Reply-To: <cover.1412719495.git.yann.morin.1998@free.fr>
References: <cover.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <ed3ac18b40f236202ab544d90aa727fc14835065.1412719495.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in | 17 +++++++++++++++++
 package/qemu/qemu.mk   | 12 ++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index d0006d5..f81b6ca 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -62,4 +62,21 @@ config BR2_PACKAGE_QEMU_LINUX_USER
 
 endif # BR2_PACKAGE_QEMU_CUSTOM_TARGETS == ""
 
+config QEMU_HAS_EMULS
+    def_bool y
+    depends on BR2_PACKAGE_QEMU_SYSTEM || BR2_PACKAGE_QEMU_LINUX_USER || BR2_PACKAGE_QEMU_CUSTOM_TARGETS != ""
+
+if QEMU_HAS_EMULS
+
+comment "Frontends"
+
+config BR2_PACKAGE_QEMU_SDL
+	bool "Enable SDL frontend"
+	select BR2_PACKAGE_SDL
+	help
+	  Say 'y' to enable the SDL frontend, that is, a graphical window
+	  presenting the VM's display.
+
+endif # QEMU_HAS_EMULS
+
 endif # BR2_PACKAGE_QEMU
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 5d9fd48..24fc535 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -97,7 +97,8 @@ QEMU_OPTS =
 QEMU_VARS = \
 	LIBTOOL=$(HOST_DIR)/usr/bin/libtool \
     PYTHON=$(HOST_DIR)/usr/bin/python \
-    PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+    PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+    SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
 
 ifeq ($(BR2_PACKAGE_QEMU_SYSTEM),y)
 QEMU_OPTS += --enable-system
@@ -115,6 +116,14 @@ ifneq ($(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS)),)
 QEMU_OPTS += --target-list="$(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS))"
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_SDL),y)
+QEMU_OPTS += --enable-sdl
+QEMU_DEPENDENCIES += sdl
+QEMU_VARS += SDL_CONFIG=$(BR2_STAGING_DIR)/usr/bin/sdl-config
+else
+QEMU_OPTS += --disable-sdl
+endif
+
 define QEMU_CONFIGURE_CMDS
 	( cd $(@D);                                 \
 	    LIBS='$(QEMU_LIBS)'                     \
@@ -132,7 +141,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-bsd-user                  \
 	        --disable-xen                       \
 	        --disable-slirp                     \
-	        --disable-sdl                       \
 	        --disable-vnc                       \
 	        --disable-virtfs                    \
 	        --disable-brlapi                    \
-- 
1.9.1

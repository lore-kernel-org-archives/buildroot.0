From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Oct 2014 00:38:33 +0200
Subject: [Buildroot] [PATCH 24/30] package/qemu: enable sound
In-Reply-To: <cover.1412719495.git.yann.morin.1998@free.fr>
References: <cover.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <4d3dea1658ba94393002e6969690676bee3ea9f4.1412719495.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in | 19 +++++++++++++++++++
 package/qemu/qemu.mk   | 14 +++++++++++++-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 1ec6def..549e0ac 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -193,6 +193,25 @@ config BR2_PACKAGE_QEMU_VDE
 	  Say 'y' here to have QEMU connect to VDE (Virtual Distributed
 	  Ethernet) switches.
 
+comment "Sound"
+
+config BR2_PACKAGE_QEMU_SOUND_ALSA
+	bool "Enable sound via alsa"
+	select BR2_PACKAGE_ALSA_LIB
+	help
+	  Say 'y' here to have QEMU play sound from the VMs via alsa.
+	  
+	  Note: this is only for system emulation, not user emulation.
+
+config BR2_PACKAGE_QEMU_SOUND_SDL
+	bool "Enable sound via SDL"
+	select BR2_PACKAGE_QEMU_SDL # Requires that SDL frontend be selected
+	select BR2_PACKAGE_SDL
+	help
+	  Say 'y' here to have QEMU play sound from the VMs via SDL.
+	  
+	  Note: this is only for system emulation, not user emulation.
+
 comment "Misc. features"
 
 config BR2_PACKAGE_QEMU_UUID
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 16434f1..6ae1592 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -213,6 +213,19 @@ else
 QEMU_OPTS += --disable-vde
 endif
 
+QEMU_SND_DRV =
+ifeq ($(BR2_PACKAGE_QEMU_SOUND_ALSA),y)
+QEMU_SND_DRV += alsa
+QEMU_DEPENDENCIES += alsa-lib
+endif
+ifeq ($(BR2_PACKAGE_QEMU_SOUND_SDL),y)
+QEMU_SND_DRV += sdl
+QEMU_DEPENDENCIES += sdl
+endif
+ifneq ($(QEMU_SND_DRV),)
+QEMU_OPTS += --audio-drv-list="$(QEMU_SND_DRV)"
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_UUID),y)
 QEMU_OPTS += --enable-uuid
 QEMU_DEPENDENCIES += util-linux
@@ -305,7 +318,6 @@ define QEMU_CONFIGURE_CMDS
 	        --prefix=/usr                       \
 	        --cross-prefix=$(TARGET_CROSS)      \
 	        --with-system-pixman                \
-	        --audio-drv-list=                   \
 	        --enable-kvm                        \
 	        --enable-vhost-net                  \
 	        --disable-bsd-user                  \
-- 
1.9.1

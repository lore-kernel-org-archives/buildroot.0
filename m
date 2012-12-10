From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Dec 2012 00:45:05 +0100
Subject: [Buildroot] [PATCH 45/52] package/qemu: enable sound
In-Reply-To: <1355183112-10735-1-git-send-email-yann.morin.1998@free.fr>
References: <1355183112-10735-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1355183112-10735-46-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |   38 ++++++++++++++++++++++++++++++++++++++
 package/qemu/qemu.mk   |   19 +++++++++++++++++--
 2 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index deabb6f..dad72a8 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -200,6 +200,44 @@ config BR2_PACKAGE_QEMU_VDE
 	  Say 'y' here to have QEMU connect to VDE (Virtual Distributed
 	  Ethernet) switches.
 
+comment "Sound"
+
+config BR2_PACKAGE_QEMU_SOUND_CARDS
+	string "Enable sound cards"
+	default "ac97 es1370 hda"
+	help
+	  Enter here the list of sound cards you want QEMU to emulate.
+	  The available sound cards are:
+	    ac97 es1370 sb16 cs4231a adlib gus hda
+	  
+	  The default is: ac97 es1370 hda
+	  
+	  Note: even if you say 'n' to both alsa and SDL drivers, below, QEMU
+	  always include the 'wav' driver, which stores the generated sound
+	  into a file, and the 'none' driver, which discards generated sound.
+
+config BR2_PACKAGE_QEMU_MIXEMU
+	bool "Enable mixer emulation"
+	help
+	  Say 'y' here to have QEMU emulate a mixer device.
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
index 34a3a04..dfe9cbb 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -211,6 +211,23 @@ else
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
+QEMU_OPTS += --audio-card-list=$(BR2_PACKAGE_QEMU_SOUND_CARDS)
+ifeq ($(BR2_PACKAGE_QEMU_MIXEMU),y)
+QEMU_OPTS += --enable-mixemu
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_UUID),y)
 QEMU_OPTS += --enable-uuid
 QEMU_DEPENDENCIES += util-linux
@@ -307,8 +324,6 @@ define QEMU_CONFIGURE_CMDS
 	    ./configure                             \
 	        --prefix=/usr                       \
 	        --cross-prefix=$(TARGET_CROSS)      \
-	        --audio-drv-list=                   \
-	        --audio-card-list=                  \
 	        --enable-kvm                        \
 	        --enable-nptl                       \
 	        --enable-vhost-net                  \
-- 
1.7.2.5

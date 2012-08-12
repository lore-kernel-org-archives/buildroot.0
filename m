From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:54:13 +0200
Subject: [Buildroot] [PATCH 25/36] package/qemu: enable use of the curses
	frontend
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-25-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |   11 +++++++++++
 package/qemu/qemu.mk   |    8 +++++++-
 2 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index bbcd308..e2864f4 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -109,6 +109,17 @@ config BR2_PACKAGE_QEMU_SDL
 	  Say 'y' to enable the SDL frontend, that is, a graphical window
 	  presenting the VM's display.
 
+config BR2_PACKAGE_QEMU_CURSES
+	bool "Enable the curses frontend"
+	select BR2_PACKAGE_NCURSES
+	help
+	  Say 'y' to use curses to display the text-mode of VGA outpout.
+	  
+	  If the VM's graphic adapter does not support VGA text-mode, or it
+	  is in graphical mode, then nothing will be displayed with this
+	  frontend (although you can still use the SDL or VNC frontends to
+	  display the graphical output).
+
 comment "Block backends"
 
 config BR2_PACKAGE_QEMU_VIRTFS
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index fb1bbcd..31e3d0c 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -81,6 +81,13 @@ else
 QEMU_OPTS += --disable-sdl
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_CURSES),y)
+QEMU_OPTS += --enable-curses
+QEMU_DEPENDENCIES += ncurses
+else
+QEMU_OPTS += --disable-curses
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_VIRTFS),y)
 QEMU_OPTS += --enable-virtfs
 else
@@ -205,7 +212,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-slirp                     \
 	        --disable-vnc-sasl                  \
 	        --disable-brlapi                    \
-	        --disable-curses                    \
 	        --disable-fdt                       \
 	        --disable-bluez                     \
 	        --disable-guest-base                \
-- 
1.7.2.5

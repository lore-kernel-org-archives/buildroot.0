From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Dec 2012 17:35:10 +0100
Subject: [Buildroot] [PATCH 37/51] package/qemu: enable use of the curses
	frontend
In-Reply-To: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1355070924-8009-38-git-send-email-yann.morin.1998@free.fr>
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
index 2cf4d65..7b80c09 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -115,6 +115,17 @@ config BR2_PACKAGE_QEMU_SDL
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
index eb3b261..ced6009 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -149,6 +149,13 @@ else
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
@@ -268,7 +275,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-slirp                     \
 	        --disable-vnc-sasl                  \
 	        --disable-brlapi                    \
-	        --disable-curses                    \
 	        --disable-fdt                       \
 	        --disable-bluez                     \
 	        --disable-guest-base                \
-- 
1.7.2.5

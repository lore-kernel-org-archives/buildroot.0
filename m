From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Nov 2012 00:54:45 +0100
Subject: [Buildroot] [PATCH 46/51] package/qemu: add support for Spice
In-Reply-To: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1354146890-27380-47-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |   10 ++++++++++
 package/qemu/qemu.mk   |    8 +++++++-
 2 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 67b6083..fd14c3c 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -127,6 +127,16 @@ config BR2_PACKAGE_QEMU_CURSES
 	  frontend (although you can still use the SDL or VNC frontends to
 	  display the graphical output).
 
+config BR2_PACKAGE_QEMU_SPICE
+	bool "Enable Spice frontend"
+	depends on BR2_PACKAGE_SPICE
+	help
+	  Say 'y' here to have QEMU support Spice as a (VNC-like) frontend.
+
+if !BR2_PACKAGE_SPICE
+comment "Spice support requires spice-server"
+endif
+
 comment "Block backends"
 
 config BR2_PACKAGE_QEMU_VIRTFS
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 8d889a8..0495233 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -171,6 +171,13 @@ else
 QEMU_OPTS += --disable-curses
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_SPICE),y)
+QEMU_OPTS += --enable-spice
+QEMU_DEPENDENCIES += spice
+else
+QEMU_OPTS += --disable-spice
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_VIRTFS),y)
 QEMU_OPTS += --enable-virtfs
 else
@@ -338,7 +345,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-brlapi                    \
 	        --disable-guest-base                \
 	        --disable-docs                      \
-	        --disable-spice                     \
 	        --disable-rbd                       \
 	        --disable-smartcard                 \
 	        --disable-strip                     \
-- 
1.7.2.5

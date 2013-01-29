From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jan 2013 23:44:06 +0100
Subject: [Buildroot] [PATCH 22/29] package/qemu: add support for Spice
In-Reply-To: <cover.1359498903.git.yann.morin.1998@free.fr>
References: <cover.1359498903.git.yann.morin.1998@free.fr>
Message-ID: <bfbcd9db5e723dd5e63a052d05165c7af59cc96a.1359498903.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |    9 +++++++++
 package/qemu/qemu.mk   |    8 +++++++-
 2 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 3b0221e..0e45b18 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -124,6 +124,15 @@ config BR2_PACKAGE_QEMU_CURSES
 	  frontend (although you can still use the SDL or VNC frontends to
 	  display the graphical output).
 
+config BR2_PACKAGE_QEMU_SPICE
+	bool "Enable Spice frontend"
+	depends on BR2_PACKAGE_SPICE
+	help
+	  Say 'y' here to have QEMU support Spice as a (VNC-like) frontend.
+
+comment "Spice support requires spice-server"
+	depends on !BR2_PACKAGE_SPICE
+
 comment "Block backends"
 
 config BR2_PACKAGE_QEMU_VIRTFS
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 195a808..8a082b4 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -156,6 +156,13 @@ else
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
@@ -314,7 +321,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-fdt                       \
 	        --disable-guest-base                \
 	        --disable-docs                      \
-	        --disable-spice                     \
 	        --disable-rbd                       \
 	        --disable-smartcard                 \
 	        --disable-strip                     \
-- 
1.7.2.5

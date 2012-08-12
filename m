From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:54:20 +0200
Subject: [Buildroot] [PATCH 32/36] package/qemu: add support for Spice
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-32-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |   12 ++++++++++++
 package/qemu/qemu.mk   |    8 +++++++-
 2 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index b56fef4..89b37af 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -120,6 +120,18 @@ config BR2_PACKAGE_QEMU_CURSES
 	  frontend (although you can still use the SDL or VNC frontends to
 	  display the graphical output).
 
+config BR2_PACKAGE_QEMU_SPICE
+	bool "Enable Spice frontend"
+	depends on BR2_PACKAGE_SPICE
+	depends on !BR2_PREFER_STATIC_LIB
+	help
+	  Say 'y' here to have QEMU support Spice as a (VNC-like) frontend.
+
+if !BR2_PACKAGE_SPICE || BR2_PREFER_STATIC_LIB
+comment "Spice support requires spice-server,"
+comment "and does not work for static linking."
+endif
+
 comment "Block backends"
 
 config BR2_PACKAGE_QEMU_VIRTFS
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index c14b3c3..a1d192e 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -88,6 +88,13 @@ else
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
@@ -256,7 +263,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-brlapi                    \
 	        --disable-guest-base                \
 	        --disable-docs                      \
-	        --disable-spice                     \
 	        --disable-rbd                       \
 	        --disable-guest-agent               \
 	        --disable-smartcard                 \
-- 
1.7.2.5

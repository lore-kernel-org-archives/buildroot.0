From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Oct 2014 00:38:32 +0200
Subject: [Buildroot] [PATCH 23/30] package/qemu: add support for Spice
In-Reply-To: <cover.1412719495.git.yann.morin.1998@free.fr>
References: <cover.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <84135f9f859605c398428a55216c19c69bea7fda.1412719495.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in | 9 +++++++++
 package/qemu/qemu.mk   | 8 +++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 2769dba..1ec6def 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -116,6 +116,15 @@ config BR2_PACKAGE_QEMU_CURSES
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
index d6b6abf..16434f1 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -158,6 +158,13 @@ else
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
@@ -309,7 +316,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-fdt                       \
 	        --disable-guest-base                \
 	        --disable-docs                      \
-	        --disable-spice                     \
 	        --disable-rbd                       \
 	        --disable-smartcard-nss             \
 	        --disable-strip                     \
-- 
1.9.1

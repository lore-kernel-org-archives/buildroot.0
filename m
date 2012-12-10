From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Dec 2012 00:45:01 +0100
Subject: [Buildroot] [PATCH 41/52] package/qemu: add support for VDE switches
In-Reply-To: <1355183112-10735-1-git-send-email-yann.morin.1998@free.fr>
References: <1355183112-10735-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1355183112-10735-42-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |    7 +++++++
 package/qemu/qemu.mk   |    8 +++++++-
 2 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index c91ce33..38bb290 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -169,6 +169,13 @@ config BR2_PACKAGE_QEMU_BLUEZ
 comment "BlueZ connectivity depends on bluez-utils"
 	depends on !BR2_PACKAGE_BLUEZ_UTILS
 
+config BR2_PACKAGE_QEMU_VDE
+	bool "Enable VDE"
+	select BR2_PACKAGE_VDE2
+	help
+	  Say 'y' here to have QEMU connect to VDE (Virtual Distributed
+	  Ethernet) switches.
+
 comment "Misc. features"
 
 config BR2_PACKAGE_QEMU_UUID
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 941babc..eaea30c 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -183,6 +183,13 @@ else
 QEMU_OPTS += --disable-bluez
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_VDE),y)
+QEMU_OPTS += --enable-vde
+QEMU_DEPENDENCIES += vde2
+else
+QEMU_OPTS += --disable-vde
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_UUID),y)
 QEMU_OPTS += --enable-uuid
 QEMU_DEPENDENCIES += util-linux
@@ -291,7 +298,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-brlapi                    \
 	        --disable-fdt                       \
 	        --disable-guest-base                \
-	        --disable-vde                       \
 	        --disable-docs                      \
 	        --disable-spice                     \
 	        --disable-rbd                       \
-- 
1.7.2.5

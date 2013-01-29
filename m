From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jan 2013 23:44:03 +0100
Subject: [Buildroot] [PATCH 19/29] package/qemu: add support for VDE switches
In-Reply-To: <cover.1359498903.git.yann.morin.1998@free.fr>
References: <cover.1359498903.git.yann.morin.1998@free.fr>
Message-ID: <661c5820fba63660d1730ad190b731e4914a34c7.1359498903.git.yann.morin.1998@free.fr>
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
index d57d2e9..123fe6b 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -170,6 +170,13 @@ config BR2_PACKAGE_QEMU_BLUEZ
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
index 31bd2e7..9915155 100644
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
@@ -292,7 +299,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-brlapi                    \
 	        --disable-fdt                       \
 	        --disable-guest-base                \
-	        --disable-vde                       \
 	        --disable-docs                      \
 	        --disable-spice                     \
 	        --disable-rbd                       \
-- 
1.7.2.5

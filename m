From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Oct 2014 00:38:29 +0200
Subject: [Buildroot] [PATCH 20/30] package/qemu: add support for VDE switches
In-Reply-To: <cover.1412719495.git.yann.morin.1998@free.fr>
References: <cover.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <da4ffe8f7ca621add48ff68380c3efa74ff8feec.1412719495.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in | 7 +++++++
 package/qemu/qemu.mk   | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 17f5e05..f183be7 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -162,6 +162,13 @@ config BR2_PACKAGE_QEMU_BLUEZ
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
index f2f7d25..11d721b 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -185,6 +185,13 @@ else
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
@@ -287,7 +294,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-brlapi                    \
 	        --disable-fdt                       \
 	        --disable-guest-base                \
-	        --disable-vde                       \
 	        --disable-docs                      \
 	        --disable-spice                     \
 	        --disable-rbd                       \
-- 
1.9.1

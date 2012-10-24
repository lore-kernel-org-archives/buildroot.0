From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Oct 2012 23:26:05 +0200
Subject: [Buildroot] [PATCH 39/47] package/qemu: add support for VDE switches
In-Reply-To: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
References: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1351113973-17237-40-git-send-email-yann.morin.1998@free.fr>
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
index c718be4..78ec4c8 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -172,6 +172,13 @@ config BR2_PACKAGE_QEMU_BLUEZ
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
 
 config BR2_PACKAGE_QEMU_FDT
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 1303b41..ede431b 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -117,6 +117,13 @@ else
 QEMU_OPTS += --disable-bluez
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_VDE),y)
+QEMU_OPTS += --enable-vde
+QEMU_DEPENDENCIES += vde2
+else
+QEMU_OPTS += --disable-vde
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_FDT),y)
 QEMU_OPTS += --enable-fdt
 QEMU_DEPENDENCIES += dtc
@@ -230,7 +237,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-vnc-sasl                  \
 	        --disable-brlapi                    \
 	        --disable-guest-base                \
-	        --disable-vde                       \
 	        --disable-docs                      \
 	        --disable-spice                     \
 	        --disable-rbd                       \
-- 
1.7.2.5

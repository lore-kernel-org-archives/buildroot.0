From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Nov 2012 00:54:41 +0100
Subject: [Buildroot] [PATCH 42/51] package/qemu: add support for FDT
In-Reply-To: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1354146890-27380-43-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FDT is the Flat Device Tree, and allows QEMU to pass DTs to the VMs.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |    7 +++++++
 package/qemu/qemu.mk   |    8 +++++++-
 2 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index e1521d5..a6fe857 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -175,6 +175,13 @@ comment "BlueZ connectivity depends on bluez-utils"
 
 comment "Misc. features"
 
+config BR2_PACKAGE_QEMU_FDT
+        bool "Enable FDT"
+        select BR2_PACKAGE_DTC
+        help
+          Say 'y' here to have QEMU capable of constructing Device Trees,
+          and passing them to the VMs.
+
 config BR2_PACKAGE_QEMU_UUID
 	bool "Enable VMs UUID"
 	depends on BR2_PACKAGE_UTIL_LINUX_LIBUUID
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 18aa85a..25af62c 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -198,6 +198,13 @@ else
 QEMU_OPTS += --disable-bluez
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_FDT),y)
+QEMU_OPTS += --enable-fdt
+QEMU_DEPENDENCIES += dtc
+else
+QEMU_OPTS += --disable-fdt
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_UUID),y)
 QEMU_OPTS += --enable-uuid
 QEMU_DEPENDENCIES += util-linux
@@ -308,7 +315,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-slirp                     \
 	        --disable-vnc-sasl                  \
 	        --disable-brlapi                    \
-	        --disable-fdt                       \
 	        --disable-guest-base                \
 	        --disable-vde                       \
 	        --disable-docs                      \
-- 
1.7.2.5

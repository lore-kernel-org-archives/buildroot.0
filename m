From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Dec 2012 18:01:56 +0100
Subject: [Buildroot] [PATCH 27/27] package/qemu: add support for FDT
In-Reply-To: <cover.1355677144.git.yann.morin.1998@free.fr>
References: <cover.1355677144.git.yann.morin.1998@free.fr>
Message-ID: <ffdeea3abe0d8b910fce832bc8f04173708459b1.1355677144.git.yann.morin.1998@free.fr>
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
index f88a1f4..b258df6 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -264,6 +264,13 @@ comment "Alsa sound static link works only if BR2_PREFER_STATIC is set"
 >>>>>>> dd73234... package/qemu: enable a static build
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
 	depends on BR2_PACKAGE_UTIL_LINUX
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 267d7b9..507a001 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -228,6 +228,13 @@ ifeq ($(BR2_PACKAGE_QEMU_MIXEMU),y)
 QEMU_OPTS += --enable-mixemu
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
@@ -349,7 +356,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-slirp                     \
 	        --disable-vnc-sasl                  \
 	        --disable-brlapi                    \
-	        --disable-fdt                       \
 	        --disable-guest-base                \
 	        --disable-rbd                       \
 	        --disable-smartcard                 \
-- 
1.7.2.5

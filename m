From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Oct 2014 00:38:39 +0200
Subject: [Buildroot] [PATCH 30/30] package/qemu: add support for FDT
In-Reply-To: <cover.1412719495.git.yann.morin.1998@free.fr>
References: <cover.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <ae4e379071183585d080fdedcf006e19b7e58a43.1412719495.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FDT is the Flat Device Tree, and allows QEMU to pass DTs to the VMs.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in | 7 +++++++
 package/qemu/qemu.mk   | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index d9ec754..dd93e15 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -243,6 +243,13 @@ config BR2_PACKAGE_QEMU_SOUND_SDL
 
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
index a4d00e1..007a757 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -226,6 +226,13 @@ ifneq ($(QEMU_SND_DRV),)
 QEMU_OPTS += --audio-drv-list="$(QEMU_SND_DRV)"
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
@@ -348,7 +355,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-slirp                     \
 	        --disable-vnc-sasl                  \
 	        --disable-brlapi                    \
-	        --disable-fdt                       \
 	        --disable-guest-base                \
 	        --disable-rbd                       \
 	        --disable-smartcard-nss             \
-- 
1.9.1

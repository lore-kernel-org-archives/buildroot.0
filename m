From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:54:16 +0200
Subject: [Buildroot] [PATCH 28/36] package/qemu: add support for FDT
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-28-git-send-email-yann.morin.1998@free.fr>
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
index c1628a9..7142c09 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -168,6 +168,13 @@ comment "BlueZ connectivity depends on bluez-utils"
 
 comment "Misc. features"
 
+config BR2_PACKAGE_QEMU_FDT
+        bool "Enable FDT"
+        select BR2_PACKAGE_LIBFDT
+        help
+          Say 'y' here to have QEMU capable of constructing Device Trees,
+          and passing them to the VMs.
+
 config BR2_PACKAGE_QEMU_UUID
 	bool "Enable VMs UUID"
 	select BR2_PACKAGE_UTIL_LINUX
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 58eb9f1..4d888a8 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -115,6 +115,13 @@ else
 QEMU_OPTS += --disable-bluez
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_FDT),y)
+QEMU_OPTS += --enable-fdt
+QEMU_DEPENDENCIES += libfdt
+else
+QEMU_OPTS += --disable-fdt
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_UUID),y)
 QEMU_OPTS += --enable-uuid
 QEMU_DEPENDENCIES += util-linux
@@ -226,7 +233,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-slirp                     \
 	        --disable-vnc-sasl                  \
 	        --disable-brlapi                    \
-	        --disable-fdt                       \
 	        --disable-guest-base                \
 	        --disable-vde                       \
 	        --disable-docs                      \
-- 
1.7.2.5

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Dec 2012 17:35:05 +0100
Subject: [Buildroot] [PATCH 32/51] package/qemu: add uuid support
In-Reply-To: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1355070924-8009-33-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |    9 +++++++++
 package/qemu/qemu.mk   |    8 +++++++-
 2 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index d97e7da..6daaf98 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -117,6 +117,15 @@ config BR2_PACKAGE_QEMU_SDL
 
 comment "Misc. features"
 
+config BR2_PACKAGE_QEMU_UUID
+	bool "Enable VMs UUID"
+	depends on BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Say 'y' here to have QEMU support UUIDs for VMs.
+
+comment "UUID support requires libuuid (from util-linux)"
+	depends on !BR2_PACKAGE_UTIL_LINUX_LIBUUID
+
 config BR2_PACKAGE_QEMU_BLOBS
 	bool "Install binary blobs"
 	default y
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 62eb066..29e01d4 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -149,6 +149,13 @@ else
 QEMU_OPTS += --disable-sdl
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_UUID),y)
+QEMU_OPTS += --enable-uuid
+QEMU_DEPENDENCIES += util-linux
+else
+QEMU_OPTS += --disable-uuid
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_BLOBS),)
 QEMU_OPTS += --disable-blobs
 endif
@@ -239,7 +246,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-fdt                       \
 	        --disable-bluez                     \
 	        --disable-guest-base                \
-	        --disable-uuid                      \
 	        --disable-vde                       \
 	        --disable-linux-aio                 \
 	        --disable-cap-ng                    \
-- 
1.7.2.5

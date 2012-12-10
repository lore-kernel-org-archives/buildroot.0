From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Dec 2012 00:44:53 +0100
Subject: [Buildroot] [PATCH 33/52] package/qemu: add uuid support
In-Reply-To: <1355183112-10735-1-git-send-email-yann.morin.1998@free.fr>
References: <1355183112-10735-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1355183112-10735-34-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |   10 ++++++++++
 package/qemu/qemu.mk   |    8 +++++++-
 2 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 5181fdc..0c4aa0a 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -114,6 +114,16 @@ config BR2_PACKAGE_QEMU_SDL
 
 comment "Misc. features"
 
+config BR2_PACKAGE_QEMU_UUID
+	bool "Enable VMs UUID"
+	depends on BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Say 'y' here to have QEMU support UUIDs for VMs.
+
+comment "UUID support requires util-linux (for libuuid)"
+	depends on !BR2_PACKAGE_UTIL_LINUX
+
 config BR2_PACKAGE_QEMU_BLOBS
 	bool "Install binary blobs"
 	default y
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 9ed6d6f..54cbefc 100644
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

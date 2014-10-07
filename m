From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Oct 2014 00:38:21 +0200
Subject: [Buildroot] [PATCH 12/30] package/qemu: add uuid support
In-Reply-To: <cover.1412719495.git.yann.morin.1998@free.fr>
References: <cover.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <c78cbd87f30583ab48a27028a8314387fd604ce9.1412719495.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in | 10 ++++++++++
 package/qemu/qemu.mk   |  8 +++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 05b884c..83d9d76 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -107,6 +107,16 @@ config BR2_PACKAGE_QEMU_SDL
 
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
index f168298..d10d7dd 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -151,6 +151,13 @@ else
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
@@ -235,7 +242,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-fdt                       \
 	        --disable-bluez                     \
 	        --disable-guest-base                \
-	        --disable-uuid                      \
 	        --disable-vde                       \
 	        --disable-linux-aio                 \
 	        --disable-cap-ng                    \
-- 
1.9.1

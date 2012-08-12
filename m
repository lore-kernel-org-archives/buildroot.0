From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:54:08 +0200
Subject: [Buildroot] [PATCH 20/36] package/qemu: add uuid support
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-20-git-send-email-yann.morin.1998@free.fr>
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
index 0ae7fc3..ea85e5f 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -111,6 +111,13 @@ config BR2_PACKAGE_QEMU_SDL
 
 comment "Misc. features"
 
+config BR2_PACKAGE_QEMU_UUID
+	bool "Enable VMs UUID"
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Say 'y' here to have QEMU support UUIDs for VMs.
+
 config BR2_PACKAGE_QEMU_BLOBS
 	bool "Install binary blobs"
 	default y
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index c00209b..3806fa7 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -81,6 +81,13 @@ else
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
@@ -176,7 +183,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-fdt                       \
 	        --disable-bluez                     \
 	        --disable-guest-base                \
-	        --disable-uuid                      \
 	        --disable-vde                       \
 	        --disable-linux-aio                 \
 	        --disable-cap-ng                    \
-- 
1.7.2.5

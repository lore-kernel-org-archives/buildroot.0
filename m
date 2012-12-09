From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Dec 2012 17:35:09 +0100
Subject: [Buildroot] [PATCH 36/51] package/qemu: add support for cURL
In-Reply-To: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1355070924-8009-37-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

QEMU can use libcurl as a block backend, to access remote block devices.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |   10 ++++++++++
 package/qemu/qemu.mk   |    8 +++++++-
 2 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index bd83855..2cf4d65 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -131,6 +131,16 @@ config BR2_PACKAGE_QEMU_VIRTFS
 	  file-system called 9p, and can be accelerated by using the 9p
 	  virtio).
 
+config BR2_PACKAGE_QEMU_CURL
+	bool "Enable remote block-devices using cURL"
+	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_PACKAGE_LIBCURL
+	help
+	  Say 'y' to access remote block-devices using libcurl.
+
+comment "cURL support is not possible with static linking"
+    depends on BR2_PREFER_STATIC_LIB
+
 comment "Misc. features"
 
 config BR2_PACKAGE_QEMU_UUID
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index bf4515c..eb3b261 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -155,6 +155,13 @@ else
 QEMU_OPTS += --disable-virtfs
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_CURL),y)
+QEMU_OPTS += --enable-curl
+QEMU_DEPENDENCIES += libcurl
+else
+QEMU_OPTS += --disable-curl
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_UUID),y)
 QEMU_OPTS += --enable-uuid
 QEMU_DEPENDENCIES += util-linux
@@ -262,7 +269,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-vnc-sasl                  \
 	        --disable-brlapi                    \
 	        --disable-curses                    \
-	        --disable-curl                      \
 	        --disable-fdt                       \
 	        --disable-bluez                     \
 	        --disable-guest-base                \
-- 
1.7.2.5

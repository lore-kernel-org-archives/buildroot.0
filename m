From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Dec 2012 17:35:12 +0100
Subject: [Buildroot] [PATCH 39/51] package/qemu: add AIO support
In-Reply-To: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1355070924-8009-40-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for Asynchronous Input/Ouput (AIO).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |    9 +++++++++
 package/qemu/qemu.mk   |    8 +++++++-
 2 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index d513746..bb12965 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -152,6 +152,15 @@ config BR2_PACKAGE_QEMU_CURL
 comment "cURL support is not possible with static linking"
     depends on BR2_PREFER_STATIC_LIB
 
+config BR2_PACKAGE_QEMU_AIO
+	bool "Enable AIO"
+	depends on BR2_PACKAGE_LIBAIO
+	help
+	  Say 'y' here to enable Asynchronous Input/Output (AIO).
+
+comment "AIO support depends on libaio"
+	depends on !BR2_PACKAGE_LIBAIO
+
 comment "Networking"
 
 config BR2_PACKAGE_QEMU_BLUEZ
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 021bd32..c5e7547 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -169,6 +169,13 @@ else
 QEMU_OPTS += --disable-curl
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_AIO),y)
+QEMU_OPTS += --enable-linux-aio
+QEMU_DEPENDENCIES += libaio
+else
+QEMU_OPTS += --disable-linux-aio
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_BLUEZ),y)
 QEMU_OPTS += --enable-bluez
 QEMU_DEPENDENCIES += bluez_utils
@@ -285,7 +292,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-fdt                       \
 	        --disable-guest-base                \
 	        --disable-vde                       \
-	        --disable-linux-aio                 \
 	        --disable-docs                      \
 	        --disable-spice                     \
 	        --disable-rbd                       \
-- 
1.7.2.5

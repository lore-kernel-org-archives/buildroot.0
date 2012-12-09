From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Dec 2012 17:35:11 +0100
Subject: [Buildroot] [PATCH 38/51] package/qemu: add BlueZ connectivity
In-Reply-To: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1355070924-8009-39-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |   11 +++++++++++
 package/qemu/qemu.mk   |    8 +++++++-
 2 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 7b80c09..d513746 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -152,6 +152,17 @@ config BR2_PACKAGE_QEMU_CURL
 comment "cURL support is not possible with static linking"
     depends on BR2_PREFER_STATIC_LIB
 
+comment "Networking"
+
+config BR2_PACKAGE_QEMU_BLUEZ
+	bool "Enable BlueZ connectivity"
+	depends on BR2_PACKAGE_BLUEZ_UTILS
+	help
+	  Say 'y' here to enable BlueZ (bluetooth) connectivity in QEMU.
+
+comment "BlueZ connectivity depends on bluez-utils"
+	depends on !BR2_PACKAGE_BLUEZ_UTILS
+
 comment "Misc. features"
 
 config BR2_PACKAGE_QEMU_UUID
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index ced6009..021bd32 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -169,6 +169,13 @@ else
 QEMU_OPTS += --disable-curl
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_BLUEZ),y)
+QEMU_OPTS += --enable-bluez
+QEMU_DEPENDENCIES += bluez_utils
+else
+QEMU_OPTS += --disable-bluez
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_UUID),y)
 QEMU_OPTS += --enable-uuid
 QEMU_DEPENDENCIES += util-linux
@@ -276,7 +283,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-vnc-sasl                  \
 	        --disable-brlapi                    \
 	        --disable-fdt                       \
-	        --disable-bluez                     \
 	        --disable-guest-base                \
 	        --disable-vde                       \
 	        --disable-linux-aio                 \
-- 
1.7.2.5

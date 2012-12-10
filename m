From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Dec 2012 00:45:02 +0100
Subject: [Buildroot] [PATCH 42/52] package/qemu: add iSCSI support
In-Reply-To: <1355183112-10735-1-git-send-email-yann.morin.1998@free.fr>
References: <1355183112-10735-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1355183112-10735-43-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |    6 ++++++
 package/qemu/qemu.mk   |    8 +++++++-
 2 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 38bb290..a10abb1 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -149,6 +149,12 @@ config BR2_PACKAGE_QEMU_CURL
 comment "cURL support is not possible with static linking"
     depends on BR2_PREFER_STATIC_LIB
 
+config BR2_PACKAGE_QEMU_ISCSI
+	bool "Enable remote block-devices using iSCSI"
+	select BR2_PACKAGE_LIBISCSI
+	help
+	  Say 'y' here to have QEMU use iSCSI targets as block-devices.
+
 config BR2_PACKAGE_QEMU_AIO
 	bool "Enable AIO"
 	depends on BR2_PACKAGE_LIBAIO
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index eaea30c..4c67215 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -169,6 +169,13 @@ else
 QEMU_OPTS += --disable-curl
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_ISCSI),y)
+QEMU_OPTS += --enable-libiscsi
+QEMU_DEPENDENCIES += libiscsi
+else
+QEMU_OPTS += --disable-libiscsi
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_AIO),y)
 QEMU_OPTS += --enable-linux-aio
 QEMU_DEPENDENCIES += libaio
@@ -301,7 +308,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-docs                      \
 	        --disable-spice                     \
 	        --disable-rbd                       \
-	        --disable-libiscsi                  \
 	        --disable-usb-redir                 \
 	        --disable-smartcard                 \
 	        --disable-strip                     \
-- 
1.7.2.5

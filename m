From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jan 2013 23:44:04 +0100
Subject: [Buildroot] [PATCH 20/29] package/qemu: add iSCSI support
In-Reply-To: <cover.1359498903.git.yann.morin.1998@free.fr>
References: <cover.1359498903.git.yann.morin.1998@free.fr>
Message-ID: <b7e693d852fcb37568498d9fe40281fb6b2681f1.1359498903.git.yann.morin.1998@free.fr>
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
index 123fe6b..9f50533 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -150,6 +150,12 @@ config BR2_PACKAGE_QEMU_CURL
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
index 9915155..77ecde4 100644
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
@@ -302,7 +309,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-docs                      \
 	        --disable-spice                     \
 	        --disable-rbd                       \
-	        --disable-libiscsi                  \
 	        --disable-usb-redir                 \
 	        --disable-smartcard                 \
 	        --disable-strip                     \
-- 
1.7.2.5

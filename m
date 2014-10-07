From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Oct 2014 00:38:30 +0200
Subject: [Buildroot] [PATCH 21/30] package/qemu: add iSCSI support
In-Reply-To: <cover.1412719495.git.yann.morin.1998@free.fr>
References: <cover.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <6d4d25ca32f4983ad6c999fdb777566c40ae2d8e.1412719495.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in | 6 ++++++
 package/qemu/qemu.mk   | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index f183be7..50d7a71 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -142,6 +142,12 @@ config BR2_PACKAGE_QEMU_CURL
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
index 11d721b..1d30173 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -171,6 +171,13 @@ else
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
@@ -297,7 +304,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-docs                      \
 	        --disable-spice                     \
 	        --disable-rbd                       \
-	        --disable-libiscsi                  \
 	        --disable-usb-redir                 \
 	        --disable-smartcard-nss             \
 	        --disable-strip                     \
-- 
1.9.1

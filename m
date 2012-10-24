From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Oct 2012 23:26:06 +0200
Subject: [Buildroot] [PATCH 40/47] package/qemu: add iSCSI support
In-Reply-To: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
References: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1351113973-17237-41-git-send-email-yann.morin.1998@free.fr>
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
index 78ec4c8..e92a587 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -152,6 +152,12 @@ config BR2_PACKAGE_QEMU_CURL
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
index ede431b..d1d05e5 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -103,6 +103,13 @@ else
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
@@ -240,7 +247,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-docs                      \
 	        --disable-spice                     \
 	        --disable-rbd                       \
-	        --disable-libiscsi                  \
 	        --disable-usb-redir                 \
 	        --disable-smartcard                 \
 	        --disable-strip                     \
-- 
1.7.2.5

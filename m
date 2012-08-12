From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:54:18 +0200
Subject: [Buildroot] [PATCH 30/36] package/qemu: add iSCSI support
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-30-git-send-email-yann.morin.1998@free.fr>
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
index 847c137..e81a089 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -146,6 +146,12 @@ config BR2_PACKAGE_QEMU_CURL
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
index b0f6512..4436047 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -101,6 +101,13 @@ else
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
@@ -244,7 +251,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-docs                      \
 	        --disable-spice                     \
 	        --disable-rbd                       \
-	        --disable-libiscsi                  \
 	        --disable-usb-redir                 \
 	        --disable-guest-agent               \
 	        --disable-smartcard                 \
-- 
1.7.2.5

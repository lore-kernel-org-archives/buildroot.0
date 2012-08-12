From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:54:19 +0200
Subject: [Buildroot] [PATCH 31/36] package/qemu: add support for USB
	redirection
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-31-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |    9 +++++++++
 package/qemu/qemu.mk   |    8 +++++++-
 2 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index e81a089..b56fef4 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -152,6 +152,15 @@ config BR2_PACKAGE_QEMU_ISCSI
 	help
 	  Say 'y' here to have QEMU use iSCSI targets as block-devices.
 
+config BR2_PACKAGE_QEMU_USBREDIR
+	bool "Enable USB redirection"
+	depends on BR2_PACKAGE_USBREDIR
+	help
+	  Say 'y' here to have QEMU support USB redirection over the network.
+
+comment "USB redirection requires usbredir"
+	depends on !BR2_PACKAGE_USBREDIR
+
 config BR2_PACKAGE_QEMU_AIO
 	bool "Enable AIO"
 	depends on BR2_PACKAGE_LIBAIO
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 4436047..c14b3c3 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -108,6 +108,13 @@ else
 QEMU_OPTS += --disable-libiscsi
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_USBREDIR),y)
+QEMU_OPTS += --enable-usb-redir
+QEMU_DEPENDENCIES += usbredir
+else
+QEMU_OPTS += --disable-usb-redir
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_AIO),y)
 QEMU_OPTS += --enable-linux-aio
 QEMU_DEPENDENCIES += libaio
@@ -251,7 +258,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-docs                      \
 	        --disable-spice                     \
 	        --disable-rbd                       \
-	        --disable-usb-redir                 \
 	        --disable-guest-agent               \
 	        --disable-smartcard                 \
 	        --disable-strip                     \
-- 
1.7.2.5

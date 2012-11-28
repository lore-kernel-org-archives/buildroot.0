From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Nov 2012 00:54:44 +0100
Subject: [Buildroot] [PATCH 45/51] package/qemu: add support for USB
	redirection
In-Reply-To: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1354146890-27380-46-git-send-email-yann.morin.1998@free.fr>
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
index 2c401ca..67b6083 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -159,6 +159,15 @@ config BR2_PACKAGE_QEMU_ISCSI
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
index 43987c5..8d889a8 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -191,6 +191,13 @@ else
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
@@ -333,7 +340,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-docs                      \
 	        --disable-spice                     \
 	        --disable-rbd                       \
-	        --disable-usb-redir                 \
 	        --disable-smartcard                 \
 	        --disable-strip                     \
 	        --disable-seccomp                   \
-- 
1.7.2.5

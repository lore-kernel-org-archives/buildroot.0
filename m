From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Oct 2012 23:26:07 +0200
Subject: [Buildroot] [PATCH 41/47] package/qemu: add support for USB
	redirection
In-Reply-To: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
References: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1351113973-17237-42-git-send-email-yann.morin.1998@free.fr>
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
index e92a587..3f608cc 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -158,6 +158,15 @@ config BR2_PACKAGE_QEMU_ISCSI
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
index d1d05e5..a2d84e1 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -110,6 +110,13 @@ else
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
@@ -247,7 +254,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-docs                      \
 	        --disable-spice                     \
 	        --disable-rbd                       \
-	        --disable-usb-redir                 \
 	        --disable-smartcard                 \
 	        --disable-strip                     \
 	        --disable-seccomp                   \
-- 
1.7.2.5

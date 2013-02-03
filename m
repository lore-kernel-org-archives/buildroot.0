From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Feb 2013 15:06:58 +0100
Subject: [Buildroot] [PATCH 21/29] package/qemu: add support for USB
	redirection
In-Reply-To: <cover.1359899108.git.yann.morin.1998@free.fr>
References: <cover.1359899108.git.yann.morin.1998@free.fr>
Message-ID: <c4b71063f006a14662741345bb1ac8b69854cc70.1359899108.git.yann.morin.1998@free.fr>
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
index 4522daf..1055c3c 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -142,6 +142,15 @@ config BR2_PACKAGE_QEMU_ISCSI
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
index 2b08d77..b8c2b9a 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -176,6 +176,13 @@ else
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
@@ -304,7 +311,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-docs                      \
 	        --disable-spice                     \
 	        --disable-rbd                       \
-	        --disable-usb-redir                 \
 	        --disable-smartcard                 \
 	        --disable-strip                     \
 	        --disable-seccomp                   \
-- 
1.7.2.5

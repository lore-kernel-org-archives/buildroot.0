From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Oct 2014 00:38:31 +0200
Subject: [Buildroot] [PATCH 22/30] package/qemu: add support for USB
	redirection
In-Reply-To: <cover.1412719495.git.yann.morin.1998@free.fr>
References: <cover.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <3d7345a16afedf901fedb1766633450c68a6b0bc.1412719495.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in | 9 +++++++++
 package/qemu/qemu.mk   | 8 +++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 50d7a71..2769dba 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -148,6 +148,15 @@ config BR2_PACKAGE_QEMU_ISCSI
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
index 1d30173..d6b6abf 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -178,6 +178,13 @@ else
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
 	        --disable-smartcard-nss             \
 	        --disable-strip                     \
 	        --disable-seccomp                   \
-- 
1.9.1

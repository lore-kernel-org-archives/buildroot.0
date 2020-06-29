From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Mon, 29 Jun 2020 15:50:00 -0500
Subject: [Buildroot] [PATCH v1 1/3] package/qemu: add spice support
Message-ID: <20200629205002.8087-1-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

update to add qemu spice support

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
 package/qemu/Config.in | 9 +++++++++
 package/qemu/qemu.mk   | 8 +++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 33d4cccd7b..3de73b69ec 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -127,6 +127,15 @@ config BR2_PACKAGE_QEMU_SDL
 comment "SDL frontend needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
+config BR2_PACKAGE_QEMU_SPICE
+	bool "Enable Spice frontend"
+	depends on BR2_PACKAGE_SPICE
+	help
+	  Say 'y' here to have QEMU support Spice as a (VNC-like) frontend.
+
+comment "Spice support requires spice-server"
+	depends on !BR2_PACKAGE_SPICE
+
 comment "Misc. features"
 
 config BR2_PACKAGE_QEMU_FDT
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index cb138fd488..0b76e432e0 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -112,6 +112,13 @@ else
 QEMU_OPTS += --disable-numa
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_SPICE),y)
+QEMU_OPTS += --enable-spice
+QEMU_DEPENDENCIES += spice
+else
+QEMU_OPTS += --disable-spice
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define QEMU_CONFIGURE_CMDS
@@ -143,7 +150,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-linux-io-uring \
 			--disable-cap-ng \
 			--disable-docs \
-			--disable-spice \
 			--disable-rbd \
 			--disable-libiscsi \
 			--disable-usb-redir \
-- 
2.17.1

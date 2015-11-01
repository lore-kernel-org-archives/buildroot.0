From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun,  1 Nov 2015 09:35:18 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/wpa_supplicant: add config
	option to build wpa_client library
Message-ID: <1446366918-4504-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 2.5 of wpa_supplicant introduces the config option
CONFIG_BUILD_WPA_CLIENT_SO to enable building wpa_client as shared library.

We need to add a patch from upstream to fix a runtime error with
libwpa_client.so:
  Error relocating /usr/lib/libwpa_client.so: bin_clear_free: symbol not found

Cc: Martin Bark <martin@barkynet.com>
Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
Changes v2:
 - depends on dynamic build (Martin Bark)
 - Installs -> Install in help text
 - Add upstream patch
---
 .../wpa_supplicant/0002-fix-libwpa_client.patch    | 39 ++++++++++++++++++++++
 package/wpa_supplicant/Config.in                   |  9 +++++
 package/wpa_supplicant/wpa_supplicant.mk           | 24 +++++++++++++
 3 files changed, 72 insertions(+)
 create mode 100644 package/wpa_supplicant/0002-fix-libwpa_client.patch

diff --git a/package/wpa_supplicant/0002-fix-libwpa_client.patch b/package/wpa_supplicant/0002-fix-libwpa_client.patch
new file mode 100644
index 0000000..11c5402
--- /dev/null
+++ b/package/wpa_supplicant/0002-fix-libwpa_client.patch
@@ -0,0 +1,39 @@
+From 6f7e0354a9035ce33742a5f869f817a6b39b2f31 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Thu, 29 Oct 2015 11:39:03 +0100
+Subject: [PATCH 1/1] wpa_supplicant/Makefile: fix libwpa_client
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Building libwpa_client requires src/utils/common.c for bin_clear_free() else
+loading the library fails with:
+
+  Error relocating /usr/lib/libwpa_client.so: bin_clear_free: symbol not found
+
+Backported from: 736b7cb2daf877a0cb9ad42ff15a2efbbd65fa42
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ wpa_supplicant/Makefile | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
+index 61f8f18..0c444b0 100644
+--- a/wpa_supplicant/Makefile
++++ b/wpa_supplicant/Makefile
+@@ -1706,9 +1706,11 @@ wpa_cli: $(OBJS_c)
+ 
+ LIBCTRL += ../src/common/wpa_ctrl.o
+ LIBCTRL += ../src/utils/os_$(CONFIG_OS).o
++LIBCTRL += ../src/utils/common.c
+ LIBCTRL += ../src/utils/wpa_debug.o
+ LIBCTRLSO += ../src/common/wpa_ctrl.c
+ LIBCTRLSO += ../src/utils/os_$(CONFIG_OS).c
++LIBCTRLSO += ../src/utils/common.c
+ LIBCTRLSO += ../src/utils/wpa_debug.c
+ 
+ libwpa_client.a: $(LIBCTRL)
+-- 
+2.6.2
+
diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index eb42257..f4c4167 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -63,6 +63,15 @@ config BR2_PACKAGE_WPA_SUPPLICANT_CLI
 	help
 	  Install wpa_cli command line utility
 
+config BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO
+	depends on !BR2_STATIC_LIBS
+	bool "Install wpa_client shared library"
+	help
+	  Install libwpa_client.so.
+
+comment "wpa_client library needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE
 	bool "Install wpa_passphrase binary"
 	help
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 839a419..e3f1434 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -15,6 +15,9 @@ WPA_SUPPLICANT_DBUS_NEW_SERVICE = fi.w1.wpa_supplicant1
 WPA_SUPPLICANT_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
 WPA_SUPPLICANT_LDFLAGS = $(TARGET_LDFLAGS)
 
+# install the wpa_client library
+WPA_SUPPLICANT_INSTALL_STAGING = YES
+
 WPA_SUPPLICANT_CONFIG_EDITS =
 
 WPA_SUPPLICANT_CONFIG_SET =
@@ -117,6 +120,22 @@ WPA_SUPPLICANT_DEPENDENCIES += readline
 WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_READLINE
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO),y)
+WPA_SUPPLICANT_CONFIG_SET += CONFIG_BUILD_WPA_CLIENT_SO
+define WPA_SUPPLICANT_INSTALL_WPA_CLIENT_SO
+	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/libwpa_client.so \
+		$(TARGET_DIR)/usr/lib/libwpa_client.so
+	$(INSTALL) -m 0644 -D $(@D)/src/common/wpa_ctrl.h \
+		$(TARGET_DIR)/usr/include/wpa_ctrl.h
+endef
+define WPA_SUPPLICANT_INSTALL_STAGING_WPA_CLIENT_SO
+	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/libwpa_client.so \
+		$(STAGING_DIR)/usr/lib/libwpa_client.so
+	$(INSTALL) -m 0644 -D $(@D)/src/common/wpa_ctrl.h \
+		$(STAGING_DIR)/usr/include/wpa_ctrl.h
+endef
+endif
+
 define WPA_SUPPLICANT_CONFIGURE_CMDS
 	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
 	sed -i $(patsubst %,-e 's/^#\(%\)/\1/',$(WPA_SUPPLICANT_CONFIG_ENABLE)) \
@@ -159,6 +178,10 @@ define WPA_SUPPLICANT_INSTALL_DBUS
 endef
 endif
 
+define WPA_SUPPLICANT_INSTALL_STAGING_CMDS
+	$(WPA_SUPPLICANT_INSTALL_STAGING_WPA_CLIENT_SO)
+endef
+
 define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/wpa_supplicant \
 		$(TARGET_DIR)/usr/sbin/wpa_supplicant
@@ -167,6 +190,7 @@ define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
 	$(WPA_SUPPLICANT_INSTALL_CLI)
 	$(WPA_SUPPLICANT_INSTALL_PASSPHRASE)
 	$(WPA_SUPPLICANT_INSTALL_DBUS)
+	$(WPA_SUPPLICANT_INSTALL_WPA_CLIENT_SO)
 endef
 
 define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
-- 
2.6.2

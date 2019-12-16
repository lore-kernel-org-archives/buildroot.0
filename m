From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
Date: Mon, 16 Dec 2019 11:30:42 +0100
Subject: [Buildroot] [PATCH v5 03/13] package/systemd: fix tty handling
In-Reply-To: <20191216103052.35220-1-jeremy.rosen@smile.fr>
References: <20191216103052.35220-1-jeremy.rosen@smile.fr>
Message-ID: <20191216103052.35220-4-jeremy.rosen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Handling of tty is a bit tricky, we need to aggressively disable what
systemd does with tty1 then update for what buildroot wants to do

Rework the whole tty generation to work with presets

Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
---
 package/systemd/80-buildroot.preset |  5 ++---
 package/systemd/systemd.mk          | 25 +++++++++++++++++--------
 2 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/package/systemd/80-buildroot.preset b/package/systemd/80-buildroot.preset
index 4074901cbd..5dbae39173 100644
--- a/package/systemd/80-buildroot.preset
+++ b/package/systemd/80-buildroot.preset
@@ -1,5 +1,4 @@
 # Higher priority than systemd presets
 
-# by default systemd enables a getty on tty1
-# we don't want that because tty1 may not exist
-disable getty at .service
+# This file is currently empty, but is available for demonstration and future use
+
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 057a4eb9e5..6adf3adca4 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -433,22 +433,33 @@ ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
 # systemd needs getty.service for VTs and serial-getty.service for serial ttys
 # note that console-getty.service should be used on /dev/console as it should not have dependencies
 # also patch the file to use the correct baud-rate, the default baudrate is 115200 so look for that
+#
+# systemd defaults to only have getty at tty.service enabled
+# * DefaultInstance=tty1 in getty at service
+# * no DefaultInstance in serial-getty at .service
+# * WantedBy=getty.target in console-getty.service
+# * console-getty is not enabled because of 90-systemd.preset
+# We want "systemctl preset-all" to do the right thing, even when run on the target after boot
+# * remove the default instance of getty at .service via a drop-in in /usr/lib
+# * set a new DefaultInstance for getty at .service instead, if needed
+# * set a new DefaultInstance for serial-getty at .service, if needed
+# * override the systemd-provided preset for console-getty.service if needed
 define SYSTEMD_INSTALL_SERVICE_TTY
+	mkdir $(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d;\
+	printf '[Install]\nDefaultInstance=\n' > $(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d/buildroot-console.conf;\
 	if [ $(BR2_TARGET_GENERIC_GETTY_PORT) = "console" ]; \
 	then \
 		TARGET="console-getty.service"; \
-		LINK_NAME="console-getty.service"; \
+		printf 'enable console-getty.service\n' > $(TARGET_DIR)/usr/lib/systemd/system-preset/81-buildroot-tty.preset;\
 	elif echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'tty[0-9]*$$'; \
 	then \
 		TARGET="getty at .service"; \
-		LINK_NAME="getty@$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)).service"; \
+		printf '[Install]\nDefaultInstance=%s\n' $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)) > $(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d/buildroot-console.conf;\
 	else \
 		TARGET="serial-getty at .service"; \
-		LINK_NAME="serial-getty@$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)).service"; \
+		mkdir $(TARGET_DIR)/usr/lib/systemd/system/serial-getty at .service.d;\
+		printf '[Install]\nDefaultInstance=%s\n' $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)) > $(TARGET_DIR)/usr/lib/systemd/system/serial-getty at .service.d/buildroot-console.conf;\
 	fi; \
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/getty.target.wants/; \
-	ln -fs ../../../../lib/systemd/system/$${TARGET} \
-		$(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${LINK_NAME}; \
 	if [ $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE)) -gt 0 ] ; \
 	then \
 		$(SED) 's,115200,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE),' $(TARGET_DIR)/lib/systemd/system/$${TARGET}; \
@@ -456,7 +467,6 @@ define SYSTEMD_INSTALL_SERVICE_TTY
 endef
 endif
 
-
 define SYSTEMD_INSTALL_PRESET
 	$(INSTALL) -D -m 644 $(SYSTEMD_PKGDIR)/80-buildroot.preset $(TARGET_DIR)/usr/lib/systemd/system-preset/80-buildroot.preset
 endef
@@ -472,7 +482,6 @@ define SYSTEMD_PRESET_ALL
 endef
 SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_PRESET_ALL
 
-
 SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
 SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
 
-- 
2.24.0

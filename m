From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2019 18:27:41 +0100
Subject: [Buildroot] [git commit] package/systemd: fix tty handling
Message-ID: <20191218172934.39801812A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c3944a0572d101e583c62d62144ba1b2c6cbd1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Handling of tty is a bit tricky, we need to aggressively disable what
systemd does with tty1 then update for what buildroot wants to do

Rework the whole tty generation to work with presets

Signed-off-by: J??r??my Rosen <jeremy.rosen@smile.fr>
[yann.morin.1998 at free.fr:
  - fold long lines
  - drop spurious empty lines removals
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/80-buildroot.preset |  5 +----
 package/systemd/systemd.mk          | 29 +++++++++++++++++++++++------
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/package/systemd/80-buildroot.preset b/package/systemd/80-buildroot.preset
index 4074901cbd..778dab38d2 100644
--- a/package/systemd/80-buildroot.preset
+++ b/package/systemd/80-buildroot.preset
@@ -1,5 +1,2 @@
 # Higher priority than systemd presets
-
-# by default systemd enables a getty on tty1
-# we don't want that because tty1 may not exist
-disable getty at .service
+# This file is currently empty, but is available for demonstration and future use
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 0b5dc54bc8..cfe4e2a108 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -436,22 +436,39 @@ ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
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
+	mkdir $(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d; \
+	printf '[Install]\nDefaultInstance=\n' \
+		>$(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d/buildroot-console.conf; \
 	if [ $(BR2_TARGET_GENERIC_GETTY_PORT) = "console" ]; \
 	then \
 		TARGET="console-getty.service"; \
-		LINK_NAME="console-getty.service"; \
+		printf 'enable console-getty.service\n' \
+			>$(TARGET_DIR)/usr/lib/systemd/system-preset/81-buildroot-tty.preset; \
 	elif echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'tty[0-9]*$$'; \
 	then \
 		TARGET="getty at .service"; \
-		LINK_NAME="getty@$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)).service"; \
+		printf '[Install]\nDefaultInstance=%s\n' \
+			$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)) \
+			>$(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d/buildroot-console.conf; \
 	else \
 		TARGET="serial-getty at .service"; \
-		LINK_NAME="serial-getty@$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)).service"; \
+		mkdir $(TARGET_DIR)/usr/lib/systemd/system/serial-getty at .service.d;\
+		printf '[Install]\nDefaultInstance=%s\n' \
+			$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)) \
+			>$(TARGET_DIR)/usr/lib/systemd/system/serial-getty at .service.d/buildroot-console.conf;\
 	fi; \
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/getty.target.wants/; \
-	ln -fs ../../../../lib/systemd/system/$${TARGET} \
-		$(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${LINK_NAME}; \
 	if [ $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE)) -gt 0 ] ; \
 	then \
 		$(SED) 's,115200,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE),' $(TARGET_DIR)/lib/systemd/system/$${TARGET}; \

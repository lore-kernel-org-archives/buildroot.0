From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2020 23:14:22 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] packages/systemd: fix
 double getty on console
Message-ID: <20200531211436.1F22485F2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ed71fff5271ca58732e531d8e90ba144a91b153
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

When selecting "console" for the automatic getty, the buildroot logic
would collide with systemd's internal console detection logic, resulting
in two getty being started on the console.

This commit fixes that by doing nothing when "console" is selected and
letting systemd-getty-generator deal with starting the proper getty.

Note that if something other than the console is selected
* Things will work properly, even if the selected terminal is also the
  console
* A getty will still be started on the console.
  This is what systemd has been doing on buildroot since the beginning. it
  could be disabled but I left it for backward compatibility

Fixes: #12361
Signed-off-by: J??r??my Rosen <jeremy.rosen@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 26c32d933eb4d841b7fbe9c1e0b61cef89665b15)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 46 +++++++++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index ca2174e5fb..16ef131ba6 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -434,37 +434,42 @@ define SYSTEMD_USERS
 endef
 
 ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
-# systemd needs getty.service for VTs and serial-getty.service for serial ttys
-# note that console-getty.service should be used on /dev/console as it should not have dependencies
-# also patch the file to use the correct baud-rate, the default baudrate is 115200 so look for that
+# systemd provides multiple units to autospawn getty as neede
+# * getty at .service to start a getty on normal TTY
+# * sertial-getty at .service to start a getty on serial lines
+# * console-getty.service for generic /dev/console
+# * container-getty at .service for a getty on /dev/pts/*
 #
-# systemd defaults to only have getty at tty.service enabled
-# * DefaultInstance=tty1 in getty at service
-# * no DefaultInstance in serial-getty at .service
-# * WantedBy=getty.target in console-getty.service
-# * console-getty is not enabled because of 90-systemd.preset
-# We want "systemctl preset-all" to do the right thing, even when run on the target after boot
-# * remove the default instance of getty at .service via a drop-in in /usr/lib
-# * set a new DefaultInstance for getty at .service instead, if needed
-# * set a new DefaultInstance for serial-getty at .service, if needed
-# * override the systemd-provided preset for console-getty.service if needed
+# the generator systemd-getty-generator will
+# * read the console= kernel command line parameter
+# * enable one of the above units depending on what it finds
+#
+# Systemd defaults to enablinb getty at tty1.service
+#
+# What we want to do
+# * Enable a getty on $BR2_TARGET_GENERIC_TTY_PATH
+# * Set the baudrate for all units according to BR2_TARGET_GENERIC_GETTY_BAUDRATE
+# * Always enable a getty on the console using systemd-getty-generator
+#   (backward compatibility with previous releases of buildroot)
+#
+# What we do
+# * disable getty at tty1 (enabled by upstream systemd)
+# * enable getty at xxx if  $BR2_TARGET_GENERIC_TTY_PATH is a tty
+# * enable serial-getty at xxx for other $BR2_TARGET_GENERIC_TTY_PATH
+# * rewrite baudrates if a baudrate is provided
 define SYSTEMD_INSTALL_SERVICE_TTY
 	mkdir $(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d; \
 	printf '[Install]\nDefaultInstance=\n' \
 		>$(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d/buildroot-console.conf; \
 	if [ $(BR2_TARGET_GENERIC_GETTY_PORT) = "console" ]; \
 	then \
-		TARGET="console-getty.service"; \
-		printf 'enable console-getty.service\n' \
-			>$(TARGET_DIR)/usr/lib/systemd/system-preset/81-buildroot-tty.preset; \
+		: ; \
 	elif echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'tty[0-9]*$$'; \
 	then \
-		TARGET="getty at .service"; \
 		printf '[Install]\nDefaultInstance=%s\n' \
 			$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)) \
 			>$(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d/buildroot-console.conf; \
 	else \
-		TARGET="serial-getty at .service"; \
 		mkdir $(TARGET_DIR)/usr/lib/systemd/system/serial-getty at .service.d;\
 		printf '[Install]\nDefaultInstance=%s\n' \
 			$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)) \
@@ -472,7 +477,10 @@ define SYSTEMD_INSTALL_SERVICE_TTY
 	fi; \
 	if [ $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE)) -gt 0 ] ; \
 	then \
-		$(SED) 's,115200,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE),' $(TARGET_DIR)/lib/systemd/system/$${TARGET}; \
+		$(SED) 's/115200/$(BR2_TARGET_GENERIC_GETTY_BAUDRATE),115200/' $(TARGET_DIR)/lib/systemd/system/getty at .service; \
+		$(SED) 's/115200/$(BR2_TARGET_GENERIC_GETTY_BAUDRATE),115200/' $(TARGET_DIR)/lib/systemd/system/serial-getty at .service; \
+		$(SED) 's/115200/$(BR2_TARGET_GENERIC_GETTY_BAUDRATE),115200/' $(TARGET_DIR)/lib/systemd/system/console-getty at .service; \
+		$(SED) 's/115200/$(BR2_TARGET_GENERIC_GETTY_BAUDRATE),115200/' $(TARGET_DIR)/lib/systemd/system/container-getty at .service; \
 	fi
 endef
 endif

From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Mar 2019 23:13:16 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/systemd: fix
 "Timed out waiting for device /dev/console."
Message-ID: <20190317221134.3FBDA8EC5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ff5e05f55e05ef0f8324ebfbbf2bdf95e070dc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Buildroot built with systemd fails to open a login prompt on the
serial port when /dev/console is specified as BR2_TARGET_GENERIC_GETTY_PORT
(which is its default value):

systemd[1]: dev-console.device: Job dev-console.device/start timed out.
systemd[1]: Timed out waiting for device /dev/console.
systemd[1]: Dependency failed for Serial Getty on console.
systemd[1]: serial-getty at console.service: Job serial-getty at console.service/start failed with result 'dependency'.
systemd[1]: dev-console.device: Job dev-console.device/start failed with result 'timeout'.
systemd[1]: Reached target Login Prompts.
systemd[1]: Reached target Multi-User System.

According to this issue on Github [1], serial-getty at .service should
not be instantiated on /dev/console, console-getty at .service should
be used instead. This stems from the fact that there should be no
dependency on /dev/console.

[1] https://github.com/systemd/systemd/issues/10914

Signed-off-by: Xavier Ruppen <xruppen@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Peter: drop SERVICE variable as suggested by Yann]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 940e7deab09e34585a5b70dd6ce1c9afd22fd8f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 15db1969e5..15257e2b3b 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -376,19 +376,26 @@ endef
 
 ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
 # systemd needs getty.service for VTs and serial-getty.service for serial ttys
+# note that console-getty.service should be used on /dev/console as it should not have dependencies
 # also patch the file to use the correct baud-rate, the default baudrate is 115200 so look for that
 define SYSTEMD_INSTALL_SERVICE_TTY
-	if echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'tty[0-9]*$$'; \
+	if [ $(BR2_TARGET_GENERIC_GETTY_PORT) = "console" ]; \
 	then \
-		SERVICE="getty"; \
+		TARGET="console-getty.service"; \
+		LINK_NAME="console-getty.service"; \
+	elif echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'tty[0-9]*$$'; \
+	then \
+		TARGET="getty at .service"; \
+		LINK_NAME="getty@$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)).service"; \
 	else \
-		SERVICE="serial-getty"; \
+		TARGET="serial-getty at .service"; \
+		LINK_NAME="serial-getty@$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)).service"; \
 	fi; \
-	ln -fs ../../../../lib/systemd/system/$${SERVICE}@.service \
-		$(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${SERVICE}@$(BR2_TARGET_GENERIC_GETTY_PORT).service; \
+	ln -fs ../../../../lib/systemd/system/$${TARGET} \
+		$(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${LINK_NAME}; \
 	if [ $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE)) -gt 0 ] ; \
 	then \
-		$(SED) 's,115200,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE),' $(TARGET_DIR)/lib/systemd/system/$${SERVICE}@.service; \
+		$(SED) 's,115200,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE),' $(TARGET_DIR)/lib/systemd/system/$${TARGET}; \
 	fi
 endef
 endif

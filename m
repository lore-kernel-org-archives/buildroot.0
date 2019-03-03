From: Xavier Ruppen <xruppen@gmail.com>
Date: Sun,  3 Mar 2019 12:30:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix "Timed out waiting for
 device /dev/console."
Message-ID: <20190303113052.9120-1-xruppen@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/systemd/systemd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 7a46a50ed3..f378203e8d 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -397,11 +397,15 @@ endef
 
 ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
 # systemd needs getty.service for VTs and serial-getty.service for serial ttys
+# note that console-getty.service should be used on /dev/console as it should not have dependencies
 # also patch the file to use the correct baud-rate, the default baudrate is 115200 so look for that
 define SYSTEMD_INSTALL_SERVICE_TTY
 	if echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'tty[0-9]*$$'; \
 	then \
 		SERVICE="getty"; \
+	elif echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'console'; \
+	then \
+		SERVICE="console-getty"; \
 	else \
 		SERVICE="serial-getty"; \
 	fi; \
-- 
2.21.0

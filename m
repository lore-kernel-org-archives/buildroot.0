From: Cyril Bur <cyrilbur@gmail.com>
Date: Mon,  7 Mar 2016 12:05:09 +1100
Subject: [Buildroot] [PATCH V2] package/systemd: Respect
	BR2_TARGET_GENERIC_GETTY_BAUDRATE
Message-ID: <1457312709-6191-1-git-send-email-cyrilbur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently systemd getty services ignore baudrates set in buildroot in
favour of a hardcoded 115200. This patch SEDs out that hardcoded value with
what is selected.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
V2: Address comments from Martin Bark and Maxime Hadjinlian
    - Don't change the symlink
    - Use qstrip (for consistency) around
      $(BR2_TARGET_GENERIC_GETTY_BAUDRATE) in shell test statement

---
 package/systemd/systemd.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 05121cf..0d52481 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -169,6 +169,7 @@ endef
 
 ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
 # systemd needs getty.service for VTs and serial-getty.service for serial ttys
+# also patch the file to use the correct baud-rate, the default baudrate is 115200 so look for that
 define SYSTEMD_INSTALL_SERVICE_TTY
 	if echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'tty[0-9]*$$'; \
 	then \
@@ -177,7 +178,11 @@ define SYSTEMD_INSTALL_SERVICE_TTY
 		SERVICE="serial-getty"; \
 	fi; \
 	ln -fs ../../../../lib/systemd/system/$${SERVICE}@.service \
-		$(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${SERVICE}@$(BR2_TARGET_GENERIC_GETTY_PORT).service
+		$(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${SERVICE}@$(BR2_TARGET_GENERIC_GETTY_PORT).service; \
+	if [ $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE)) -gt 0 ] ; \
+	then \
+		$(SED) 's,115200,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE),' $(TARGET_DIR)/lib/systemd/system/$${SERVICE}@.service; \
+	fi
 endef
 endif
 
-- 
2.7.2

From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 31 Aug 2017 11:49:31 +0200
Subject: [Buildroot] [PATCH 1/2] bluez5_utils: define FIRMWARE_DIR for
	hciattach_bcm43xx
Message-ID: <20170831094932.11121-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tool hciattach_bcm43xx defines the default firmware path in `/etc/firmware`,
but the Broadcom firmware blobs are usually stored in `/lib/firmware`.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/bluez5_utils/bluez5_utils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 13658cd050..af3dfbe38d 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -80,6 +80,10 @@ define BLUEZ5_UTILS_INSTALL_GATTTOOL
 	$(INSTALL) -D -m 0755 $(@D)/attrib/gatttool $(TARGET_DIR)/usr/bin/gatttool
 endef
 BLUEZ5_UTILS_POST_INSTALL_TARGET_HOOKS += BLUEZ5_UTILS_INSTALL_GATTTOOL
+# hciattach_bcm43xx defines default firmware path in `/etc/firmware`, but
+# Broadcom firmware blobs are usually located in `/lib/firmware`.
+BLUEZ5_UTILS_CONF_ENV += \
+	CPPFLAGS='$(TARGET_CPPFLAGS) -DFIRMWARE_DIR=\"/lib/firmware\"'
 BLUEZ5_UTILS_CONF_OPTS += --enable-deprecated
 else
 BLUEZ5_UTILS_CONF_OPTS += --disable-deprecated
-- 
2.14.1

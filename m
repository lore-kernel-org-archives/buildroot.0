From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 16:59:22 +0200
Subject: [Buildroot] [git commit] bluez5_utils: define FIRMWARE_DIR for
	hciattach_bcm43xx
Message-ID: <20171022154030.D511880835@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=361d1b969ecdba1a8a62613626f90fc025b94660
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tool hciattach_bcm43xx defines the default firmware path in `/etc/firmware`,
but the Broadcom firmware blobs are usually stored in `/lib/firmware`.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bluez5_utils/bluez5_utils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 1bc6969..57e9c26 100644
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

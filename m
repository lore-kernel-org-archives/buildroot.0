From: Christian Stewart <christian@paral.in>
Date: Mon, 10 Aug 2015 14:54:47 -0700
Subject: [Buildroot] [PATCH v2 2/2] package/rtl8821au: change upstream to
	more recent fork
In-Reply-To: <1439243687-5583-1-git-send-email-christian@paral.in>
References: <1439243687-5583-1-git-send-email-christian@paral.in>
Message-ID: <1439243687-5583-2-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current rtl8821au driver maintained by ulli-kroll is based on a
much older upstream version. I have forked the asus rtl8821au driver
from http://support.asus.com/ and patched it with various fixes to
improve stability and fix various bugs with kernel panics, newer kernel
versions, and wps issues.

In testing, ulli-kroll's driver will fail with a kernel oops
approximately 50% of the time. This issue has been reported upstream:
https://github.com/ulli-kroll/rtl8821au/issues/3 but as of yet there
has been no response with a fix.

With the newer version of the driver, we have not experienced any
kernel panics, or connectivity issues. Power management works fine on
or off. With the older version of the driver, the wireless connection
will randomly drop every 5-10 minutes due to older power management
code that has not yet been removed. Furthermore, it sometimes will fail
to reconnect properly.

The newer version of the driver handles the LED light slightly
differently. Other than that, it should behave the same, except without
quite so many stability and performance issues.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/rtl8821au/rtl8821au.mk | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index ee3741c..70e94c9 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -4,21 +4,14 @@
 #
 ################################################################################
 
-RTL8821AU_VERSION = fef8c9d67d076eee9dfb9e19cb7cb69815d5a207
-RTL8821AU_SITE = $(call github,ulli-kroll,rtl8821au,$(RTL8821AU_VERSION))
-RTL8821AU_LICENSE = GPLv2, proprietary (rtl8821au.bin firmware)
+RTL8821AU_VERSION = 9414fc290176d549ed73099059d6320025804dc1
+RTL8821AU_SITE = $(call github,paralin,rtl8821au,$(RTL8821AU_VERSION))
+RTL8821AU_LICENSE = GPLv2
 RTL8821AU_LICENSE_FILES = COPYING
 
 RTL8821AU_MODULE_MAKE_OPTS = \
-	CONFIG_RTL8812AU_8821AU=m \
-	RTL8821AU_EXTRA_CFLAGS=-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
-
-define RTL8821AU_FIRMWARE_INSTALL
-	mkdir -p $(TARGET_DIR)/lib/firmware/rtlwifi/
-	$(INSTALL) -D -m 0644 $(@D)/firmware/* $(TARGET_DIR)/lib/firmware/rtlwifi/
-endef
-
-RTL8821AU_POST_INSTALL_TARGET_HOOKS += RTL8821AU_FIRMWARE_INSTALL
+	CONFIG_RTL8821AU=m \
+	USER_EXTRA_CFLAGS=-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
 
 $(eval $(kernel-module))
 $(eval $(generic-package))
-- 
2.1.4

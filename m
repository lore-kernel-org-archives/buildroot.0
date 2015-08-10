From: Christian Stewart <christian@paral.in>
Date: Mon, 10 Aug 2015 15:08:37 -0700
Subject: [Buildroot] [PATCH v3 2/2] package/rtl8821au: change upstream to
	more recent fork
In-Reply-To: <1439244517-19882-1-git-send-email-christian@paral.in>
References: <1439244517-19882-1-git-send-email-christian@paral.in>
Message-ID: <1439244517-19882-2-git-send-email-christian@paral.in>
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

The 001 patch has been removed as it is no longer necessary with the
updated fork.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 ...e-default-powermanagement-and-i386-config.patch | 43 ----------------------
 package/rtl8821au/rtl8821au.mk                     | 17 +++------
 2 files changed, 5 insertions(+), 55 deletions(-)
 delete mode 100644 package/rtl8821au/0001-Remove-default-powermanagement-and-i386-config.patch

diff --git a/package/rtl8821au/0001-Remove-default-powermanagement-and-i386-config.patch b/package/rtl8821au/0001-Remove-default-powermanagement-and-i386-config.patch
deleted file mode 100644
index 6c1f8af..0000000
--- a/package/rtl8821au/0001-Remove-default-powermanagement-and-i386-config.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From e49c13919be05708a6918e204d7385284f00f73d Mon Sep 17 00:00:00 2001
-From: Christian Stewart <christian@paral.in>
-Date: Thu, 6 Aug 2015 10:53:34 -0700
-Subject: [PATCH v1 1/1] Remove default powermanagement and i386 config
-
-On default power management is enabled, as well as a bunch if i386
-related config options. This patch removes these options and adds the
-variable RTL8821AU_EXTRA_CFLAGS. This patch would likely not be
-accepted upstream because the repository is geared towards easy usage,
-so the defaults for power management and i386 configuration will likely
-stay.
-
-Signed-off-by: Christian Stewart <christian@paral.in>
----
- Makefile | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 65076c5..9b71bd5 100644
---- a/Makefile
-+++ b/Makefile
-@@ -5,6 +5,8 @@ EXTRA_CFLAGS += -Wno-uninitialized
- 
- EXTRA_CFLAGS += -I$(src)/include
- 
-+EXTRA_CFLAGS += $(RTL8821AU_EXTRA_CFLAGS)
-+
- CONFIG_RTL8812A = y
- CONFIG_RTL8821A = y
- 
-@@ -16,9 +18,6 @@ CONFIG_RTL8821A = y
- 
- CONFIG_RTLWIFI_DEBUG = y
- 
--CONFIG_POWER_SAVING = y
--CONFIG_PLATFORM_I386_PC = y
--
- export TopDIR ?= $(shell pwd)
- 
- RTLWIFI_FILES :=	debug.o \
--- 
-2.1.4
-
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

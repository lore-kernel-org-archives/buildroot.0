From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 14:49:51 +0200
Subject: [Buildroot] [git commit] package/rtl8821au: switch to abperiasamy
	fork
Message-ID: <20160724125002.85C6081973@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5eecaf354ced9f322707fa07bb75570d209850e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switching to the rtl8821au fork at github.com/abperiasamy/rtl8812AU_8821AU_linux.

 - The current fork we are using is maintained by 1 person.
 - The current fork does not work, and there are no plans to fix this:
     - https://github.com/ulli-kroll/rtl8821au/issues/5
     - https://github.com/ulli-kroll/rtl8821au/issues/6
 - In practice, the current fork has numerous instability issues.
 - Our lab switched to the abperiasamy fork a couple months ago and have been very happy with it.
 - The contributor list for the abperiasamy fork contains 21 well-known individuals in the community.
 - The raspberry pi community recommends the abperiasamy fork and uses it extensively.
 - Firmware blobs are not necessary with the new fork.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rtl8821au/rtl8821au.hash |  2 +-
 package/rtl8821au/rtl8821au.mk   | 15 ++++-----------
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
index cac4ce2..01f22cc 100644
--- a/package/rtl8821au/rtl8821au.hash
+++ b/package/rtl8821au/rtl8821au.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 64d068b92215f06f877629b2e6cd5da41329ac1222104ff9dc7ec504ca23af09  rtl8821au-116a3abe7783b023655e9917afe2d1eabe178028.tar.gz
+sha256 6e4334b0718b2ac611bf8b4d7a493b016bdb1c24daa7b459f091b92b6fd961c7  rtl8821au-c33ddb05a77741d2a9c9b974ad0cf0fa26d17b6e.tar.gz
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index ebb1665..9ba43ef 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -4,22 +4,15 @@
 #
 ################################################################################
 
-RTL8821AU_VERSION = 116a3abe7783b023655e9917afe2d1eabe178028
-RTL8821AU_SITE = $(call github,ulli-kroll,rtl8821au,$(RTL8821AU_VERSION))
-RTL8821AU_LICENSE = GPLv2, proprietary (rtl8821au.bin firmware)
+RTL8821AU_VERSION = c33ddb05a77741d2a9c9b974ad0cf0fa26d17b6e
+RTL8821AU_SITE = $(call github,abperiasamy,rtl8812AU_8821AU_linux,$(RTL8821AU_VERSION))
+RTL8821AU_LICENSE = GPLv2
 RTL8821AU_LICENSE_FILES = COPYING
 
 RTL8821AU_MODULE_MAKE_OPTS = \
-	CONFIG_RTL8821AU=m \
+	CONFIG_RTL8812AU_8821AU=m \
 	KVER=$(LINUX_VERSION_PROBED) \
 	USER_EXTRA_CFLAGS=-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
 
-define RTL8821AU_FIRMWARE_INSTALL
-	mkdir -p $(TARGET_DIR)/lib/firmware/rtlwifi/
-	$(INSTALL) -D -m 0644 $(@D)/firmware/* $(TARGET_DIR)/lib/firmware/rtlwifi/
-endef
-
-RTL8821AU_POST_INSTALL_TARGET_HOOKS += RTL8821AU_FIRMWARE_INSTALL
-
 $(eval $(kernel-module))
 $(eval $(generic-package))

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Aug 2019 22:33:39 +0200
Subject: [Buildroot] [git commit] package/pigpio: install to staging
Message-ID: <20190819203007.52702837EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=589b8cb7e2d81067fde9ee4f11acecf8fd677dde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The pigpio package installs programs and libraries to target, but does
not install the libraries and its headers to staging, while they may
be used by other packages. Let's install them, as was requested in bug

Fixes:

  https://bugs.busybox.net/show_bug.cgi?id=11741

Cc: vishalbhalani89 at gmail.com
Cc: ivan.nazarenko at gmail.com
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pigpio/pigpio.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/pigpio/pigpio.mk b/package/pigpio/pigpio.mk
index dc60204aab..ed83d83790 100644
--- a/package/pigpio/pigpio.mk
+++ b/package/pigpio/pigpio.mk
@@ -8,6 +8,7 @@ PIGPIO_VERSION = 68
 PIGPIO_SITE = $(call github,joan2937,pigpio,V$(PIGPIO_VERSION))
 PIGPIO_LICENSE = Unlicense
 PIGPIO_LICENSE_FILES = UNLICENCE
+PIGPIO_INSTALL_STAGING = YES
 
 define PIGPIO_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
@@ -22,4 +23,13 @@ define PIGPIO_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if2.so $(TARGET_DIR)/usr/lib/libpigpiod_if2.so
 endef
 
+define PIGPIO_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/libpigpio.so $(STAGING_DIR)/usr/lib/libpigpio.so
+	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if.so $(STAGING_DIR)/usr/lib/libpigpiod_if.so
+	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if2.so $(STAGING_DIR)/usr/lib/libpigpiod_if2.so
+	$(INSTALL) -D -m 0644 $(@D)/pigpio.h $(STAGING_DIR)/usr/include/pigpio.h
+	$(INSTALL) -D -m 0644 $(@D)/pigpiod_if.h $(STAGING_DIR)/usr/include/pigpiod_if.h
+	$(INSTALL) -D -m 0644 $(@D)/pigpiod_if2.h $(STAGING_DIR)/usr/include/pigpiod_if2.h
+endef
+
 $(eval $(generic-package))

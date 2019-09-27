From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 22:22:56 +0200
Subject: [Buildroot] [git commit] package/pigpio: add soversion to shared
 libraries
Message-ID: <20190927202141.4CF5F8E95F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc224938d0ae3468c0e916eda378d9d0551bd91c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The SONAME of the libraries installed by pigpio now contain a major
version number:

$ readelf -d output/target/usr/lib/libpigpio* | grep soname
 0x0000000e (SONAME)                     Library soname: [libpigpiod_if2.so.1]
 0x0000000e (SONAME)                     Library soname: [libpigpiod_if.so.1]
 0x0000000e (SONAME)                     Library soname: [libpigpio.so.1]

So we must make sure they are installed with this name, and not just
with a .so extension. For consistency, we do the same logic for both
the target and the staging installation.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
[Thomas: improve commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pigpio/pigpio.mk | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/pigpio/pigpio.mk b/package/pigpio/pigpio.mk
index 90a23f6678..1cf8f50afc 100644
--- a/package/pigpio/pigpio.mk
+++ b/package/pigpio/pigpio.mk
@@ -18,18 +18,24 @@ define PIGPIO_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/pig2vcd $(TARGET_DIR)/usr/bin/pig2vcd
 	$(INSTALL) -D -m 0755 $(@D)/pigpiod $(TARGET_DIR)/usr/bin/pigpiod
 	$(INSTALL) -D -m 0755 $(@D)/pigs $(TARGET_DIR)/usr/bin/pigs
-	$(INSTALL) -D -m 0755 $(@D)/libpigpio.so $(TARGET_DIR)/usr/lib/libpigpio.so
-	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if.so $(TARGET_DIR)/usr/lib/libpigpiod_if.so
-	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if2.so $(TARGET_DIR)/usr/lib/libpigpiod_if2.so
+	$(INSTALL) -D -m 0755 $(@D)/libpigpio.so.1 $(TARGET_DIR)/usr/lib/libpigpio.so.1
+	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if.so.1 $(TARGET_DIR)/usr/lib/libpigpiod_if.so.1
+	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if2.so.1 $(TARGET_DIR)/usr/lib/libpigpiod_if2.so.1
+	ln -sf libpigpio.so.1 $(TARGET_DIR)/usr/lib/libpigpio.so
+	ln -sf libpigpiod_if.so.1 $(TARGET_DIR)/usr/lib/libpigpiod_if.so
+	ln -sf libpigpiod_if2.so.1 $(TARGET_DIR)/usr/lib/libpigpiod_if2.so
 endef
 
 define PIGPIO_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/libpigpio.so $(STAGING_DIR)/usr/lib/libpigpio.so
-	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if.so $(STAGING_DIR)/usr/lib/libpigpiod_if.so
-	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if2.so $(STAGING_DIR)/usr/lib/libpigpiod_if2.so
+	$(INSTALL) -D -m 0755 $(@D)/libpigpio.so.1 $(STAGING_DIR)/usr/lib/libpigpio.so.1
+	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if.so.1 $(STAGING_DIR)/usr/lib/libpigpiod_if.so.1
+	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if2.so.1 $(STAGING_DIR)/usr/lib/libpigpiod_if2.so.1
 	$(INSTALL) -D -m 0644 $(@D)/pigpio.h $(STAGING_DIR)/usr/include/pigpio.h
 	$(INSTALL) -D -m 0644 $(@D)/pigpiod_if.h $(STAGING_DIR)/usr/include/pigpiod_if.h
 	$(INSTALL) -D -m 0644 $(@D)/pigpiod_if2.h $(STAGING_DIR)/usr/include/pigpiod_if2.h
+	ln -sf libpigpio.so.1 $(STAGING_DIR)/usr/lib/libpigpio.so
+	ln -sf libpigpiod_if.so.1 $(STAGING_DIR)/usr/lib/libpigpiod_if.so
+	ln -sf libpigpiod_if2.so.1 $(STAGING_DIR)/usr/lib/libpigpiod_if2.so
 endef
 
 $(eval $(generic-package))

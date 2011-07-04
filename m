From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  4 Jul 2011 09:00:29 +0300
Subject: [Buildroot] [PATCH 1/2] hostapd: fix build
Message-ID: <52492b5cb97af2b80f86cf2dee27c8a931d14856.1309759154.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The --sysroot option is required in CFLAGS and LDFLAGS to avoid compile time
and link time failures.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/hostapd/hostapd.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index f097e75..8ca091d 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -71,8 +71,8 @@ endif
 define HOSTAPD_CONFIGURE_CMDS
 	cp $(@D)/$(HOSTAPD_SUBDIR)/defconfig $(HOSTAPD_CONFIG)
 	$(SED) "s/\/local//" $(@D)/$(HOSTAPD_SUBDIR)/Makefile
-	echo "CFLAGS += $(TARGET_CFLAGS)" >>$(HOSTAPD_CONFIG)
-	echo "LDFLAGS += $(TARGET_LDFLAGS)" >>$(HOSTAPD_CONFIG)
+	echo "CFLAGS += $(TARGET_CFLAGS) --sysroot=$(STAGING_DIR)" >>$(HOSTAPD_CONFIG)
+	echo "LDFLAGS += $(TARGET_LDFLAGS) --sysroot=$(STAGING_DIR)" >>$(HOSTAPD_CONFIG)
 	echo "CC = $(TARGET_CC)" >>$(HOSTAPD_CONFIG)
 # Drivers
 	$(SED) "s/^#CONFIG_DRIVER_WIRED/CONFIG_DRIVER_WIRED/" $(HOSTAPD_CONFIG)
-- 
1.7.5.4

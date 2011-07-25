From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Jul 2011 16:26:40 +0200
Subject: [Buildroot] [git commit] hostapd: fix libnl linking with
	BR2_PREFER_STATIC_LIB
Message-ID: <20110725151830.480FD8B4A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=43a2e623870e0b5c562794f632b3e27eaac5e900
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/hostapd/hostapd.mk |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index f097e75..d733999 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -10,6 +10,13 @@ HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
 HOSTAPD_DEPENDENCIES = libnl
 
+HOSTAPD_LDFLAGS = $(TARGET_LDFLAGS)
+
+# libnl needs -lm (for rint) if linking statically
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+HOSTAPD_LDFLAGS += -lm
+endif
+
 define HOSTAPD_LIBNL_CONFIG
 	echo "CONFIG_LIBNL20=y" >>$(HOSTAPD_CONFIG)
 endef
@@ -72,7 +79,7 @@ define HOSTAPD_CONFIGURE_CMDS
 	cp $(@D)/$(HOSTAPD_SUBDIR)/defconfig $(HOSTAPD_CONFIG)
 	$(SED) "s/\/local//" $(@D)/$(HOSTAPD_SUBDIR)/Makefile
 	echo "CFLAGS += $(TARGET_CFLAGS)" >>$(HOSTAPD_CONFIG)
-	echo "LDFLAGS += $(TARGET_LDFLAGS)" >>$(HOSTAPD_CONFIG)
+	echo "LDFLAGS += $(HOSTAPD_LDFLAGS)" >>$(HOSTAPD_CONFIG)
 	echo "CC = $(TARGET_CC)" >>$(HOSTAPD_CONFIG)
 # Drivers
 	$(SED) "s/^#CONFIG_DRIVER_WIRED/CONFIG_DRIVER_WIRED/" $(HOSTAPD_CONFIG)
-- 
1.7.3.4

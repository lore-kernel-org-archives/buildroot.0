From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu,  9 Dec 2010 10:55:01 +0100
Subject: [Buildroot] [PATCH 03/16] hostapd: ensure hostapd binaries are
	installed in the right place
In-Reply-To: <1291888514-31385-1-git-send-email-llandwerlin@gmail.com>
References: <1291888514-31385-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1291888514-31385-4-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Ensure hostapd and hostapd_cli are installed in /usr/bin/ even if the
directory does not exist.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/hostapd/hostapd.mk |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 27689b8..4c95066 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -74,7 +74,7 @@ define HOSTAPD_CONFIGURE_CMDS
 	$(SED) "s/^#CONFIG_DRIVER_WIRED/CONFIG_DRIVER_WIRED/" $(HOSTAPD_CONFIG)
 	$(SED) "s/^#CONFIG_DRIVER_NL80211/CONFIG_DRIVER_NL80211/" $(HOSTAPD_CONFIG)
 # Misc
- 	$(SED) "s/^CONFIG_IPV6/#CONFIG_IPV6/" $(HOSTAPD_CONFIG)
+	$(SED) "s/^CONFIG_IPV6/#CONFIG_IPV6/" $(HOSTAPD_CONFIG)
 	$(SED) "s/^#CONFIG_IEEE80211N/CONFIG_IEEE80211N/" $(HOSTAPD_CONFIG)
 	$(SED) "s/^#CONFIG_IEEE80211R/CONFIG_IEEE80211R/" $(HOSTAPD_CONFIG)
 	$(HOSTAPD_CRYPTO_CONFIG)
@@ -85,10 +85,10 @@ define HOSTAPD_CONFIGURE_CMDS
 endef
 
 define HOSTAPD_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 $(@D)/$(HOSTAPD_SUBDIR)/hostapd \
-		$(TARGET_DIR)/usr/sbin
-	$(INSTALL) -m 0755 $(@D)/$(HOSTAPD_SUBDIR)/hostapd_cli \
-		$(TARGET_DIR)/usr/bin
+	$(INSTALL) -m 0755 -D $(@D)/$(HOSTAPD_SUBDIR)/hostapd \
+		$(TARGET_DIR)/usr/sbin/hostapd
+	$(INSTALL) -m 0755 -D $(@D)/$(HOSTAPD_SUBDIR)/hostapd_cli \
+		$(TARGET_DIR)/usr/bin/hostapd_cli
 endef
 
 define HOSTAPD_UNINSTALL_TARGET_CMDS
-- 
1.7.2.3

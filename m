From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Dec 2010 00:42:03 +0100
Subject: [Buildroot] [git commit master 1/1] hostapd: ensure hostapd
	binaries are installed in the right place
Message-ID: <20101212234309.2D09B8E0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1696823707d50530136bc872f36a9810a03910bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ensure hostapd and hostapd_cli are installed in /usr/bin/ even if the
directory does not exist.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    3 ++-
 package/hostapd/hostapd.mk |   10 +++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index e625d59..2c24609 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,7 +4,8 @@
 	compilation, and cache is stored in ~/.buildroot-ccache.
 
 	Updated/fixed packages: busybox, dbus, cloop, gdk-pixbuf,
-	libconfig, m4, openssh, openssl, qt, usbutils, xz, zlib
+	hostapd, libconfig, m4, openssh, openssl, qt, usbutils, xz,
+	zlib
 
 	New packages: dhrystone, lsuio, rsh-redone, whetstone
 
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
1.7.2.2

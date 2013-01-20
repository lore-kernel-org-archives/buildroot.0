From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 22:28:23 +0100
Subject: [Buildroot] [git commit] hostapd: bump to version 2.0
Message-ID: <20130120212853.F265E9A40B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae5f324678458d27073d1c4e544c7c1d3383b4bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

802.11ac support isn't enabled on purpose since it's broken on some
architectures.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/hostapd/hostapd.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index b18881a..e00ad5a 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-HOSTAPD_VERSION = 1.1
+HOSTAPD_VERSION = 2.0
 HOSTAPD_SITE = http://hostap.epitest.fi/releases
 HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
@@ -21,6 +21,7 @@ endif
 
 define HOSTAPD_LIBNL_CONFIG
 	echo 'CONFIG_LIBNL32=y' >>$(HOSTAPD_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_VLAN_NETLINK.*\)/\2/' $(HOSTAPD_CONFIG)
 endef
 
 define HOSTAPD_LIBTOMMATH_CONFIG
@@ -52,6 +53,7 @@ define HOSTAPD_EAP_CONFIG
 	$(SED) 's/\(#\)\(CONFIG_EAP_SIM.*\)/\2/' $(HOSTAPD_CONFIG)
 	$(SED) 's/\(#\)\(CONFIG_EAP_TNC.*\)/\2/' $(HOSTAPD_CONFIG)
 	$(SED) 's/\(#\)\(CONFIG_RADIUS_SERVER.*\)/\2/' $(HOSTAPD_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_TLSV1.*\)/\2/' $(HOSTAPD_CONFIG)
 endef
 ifneq ($(BR2_INET_IPV6),y)
 define HOSTAPD_RADIUS_IPV6_CONFIG
@@ -75,8 +77,10 @@ endif
 define HOSTAPD_CONFIGURE_CMDS
 	cp $(@D)/hostapd/defconfig $(HOSTAPD_CONFIG)
 # Misc
+	$(SED) 's/\(#\)\(CONFIG_HS20.*\)/\2/' $(HOSTAPD_CONFIG)
 	$(SED) 's/\(#\)\(CONFIG_IEEE80211N.*\)/\2/' $(HOSTAPD_CONFIG)
 	$(SED) 's/\(#\)\(CONFIG_IEEE80211R.*\)/\2/' $(HOSTAPD_CONFIG)
+	$(SED) 's/\(#\)\(CONFIG_IEEE80211W.*\)/\2/' $(HOSTAPD_CONFIG)
 	$(SED) 's/\(#\)\(CONFIG_INTERWORKING.*\)/\2/' $(HOSTAPD_CONFIG)
 	$(SED) 's/\(#\)\(CONFIG_FULL_DYNAMIC_VLAN.*\)/\2/' $(HOSTAPD_CONFIG)
 	$(HOSTAPD_LIBTOMMATH_CONFIG)

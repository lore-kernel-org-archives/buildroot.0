From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 16:42:16 +0100
Subject: [Buildroot] [git commit] hostapd: rework .config and bump to
	version 2.1
Message-ID: <20140302154633.286BE9B2DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=806a57dd25a0478c52834a58db7fde28df3d28e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rework .config file editing as was done for wpa_supplicant and bump to
version 2.1 which includes 802.11ac and ACS support.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hostapd/hostapd.mk |   92 ++++++++++++++++++--------------------------
 1 files changed, 37 insertions(+), 55 deletions(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 0fbd8bc..37de60d 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOSTAPD_VERSION = 2.0
+HOSTAPD_VERSION = 2.1
 HOSTAPD_SITE = http://hostap.epitest.fi/releases
 HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
@@ -12,6 +12,22 @@ HOSTAPD_DEPENDENCIES = libnl
 HOSTAPD_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
 HOSTAPD_LICENSE = GPLv2/BSD-3c
 HOSTAPD_LICENSE_FILES = README
+HOSTAPD_CONFIG_SET =
+
+HOSTAPD_CONFIG_ENABLE = \
+	CONFIG_ACS \
+	CONFIG_FULL_DYNAMIC_VLAN \
+	CONFIG_HS20 \
+	CONFIG_IEEE80211AC \
+	CONFIG_IEEE80211N \
+	CONFIG_IEEE80211R \
+	CONFIG_IEEE80211W \
+	CONFIG_INTERNAL_LIBTOMMATH \
+	CONFIG_INTERWORKING \
+	CONFIG_LIBNL32 \
+	CONFIG_VLAN_NETLINK
+
+HOSTAPD_CONFIG_DISABLE =
 
 # libnl-3 needs -lm (for rint) and -lpthread if linking statically
 # And library order matters hence stick -lnl-3 first since it's appended
@@ -20,76 +36,42 @@ ifeq ($(BR2_PREFER_STATIC_LIB),y)
 HOSTAPD_LIBS += -lnl-3 -lm -lpthread
 endif
 
-define HOSTAPD_LIBNL_CONFIG
-	echo 'CONFIG_LIBNL32=y' >>$(HOSTAPD_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_VLAN_NETLINK.*\)/\2/' $(HOSTAPD_CONFIG)
-endef
-
-define HOSTAPD_LIBTOMMATH_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_INTERNAL_LIBTOMMATH.*\)/\2/' $(HOSTAPD_CONFIG)
-endef
+ifeq ($(BR2_INET_IPV6),)
+	HOSTAPD_CONFIG_DISABLE += CONFIG_IPV6
+endif
 
 # Try to use openssl if it's already available
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	HOSTAPD_DEPENDENCIES += openssl
-define HOSTAPD_TLS_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_TLS=openssl\)/\2/' $(HOSTAPD_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_PWD.*\)/\2/' $(HOSTAPD_CONFIG)
-endef
+	HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
 else
-define HOSTAPD_TLS_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_TLS=\).*/\2internal/' $(HOSTAPD_CONFIG)
-endef
+	HOSTAPD_CONFIG_DISABLE += CONFIG_EAP_PWD
+	HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
 endif
 
 ifeq ($(BR2_PACKAGE_HOSTAPD_EAP),y)
-define HOSTAPD_EAP_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_EAP_AKA.*\)/\2/' $(HOSTAPD_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_FAST.*\)/\2/' $(HOSTAPD_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_GPSK.*\)/\2/' $(HOSTAPD_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_IKEV2.*\)/\2/' $(HOSTAPD_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_PAX.*\)/\2/' $(HOSTAPD_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_PSK.*\)/\2/' $(HOSTAPD_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_SAKE.*\)/\2/' $(HOSTAPD_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_SIM.*\)/\2/' $(HOSTAPD_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_EAP_TNC.*\)/\2/' $(HOSTAPD_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_RADIUS_SERVER.*\)/\2/' $(HOSTAPD_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_TLSV1.*\)/\2/' $(HOSTAPD_CONFIG)
-endef
-ifneq ($(BR2_INET_IPV6),y)
-define HOSTAPD_RADIUS_IPV6_CONFIG
-	$(SED) 's/\(CONFIG_IPV6.*\)/#\1/' $(HOSTAPD_CONFIG)
-endef
-endif
+	HOSTAPD_CONFIG_ENABLE += \
+		CONFIG_EAP \
+		CONFIG_RADIUS_SERVER \
+		CONFIG_TLSV1
 else
-define HOSTAPD_EAP_CONFIG
-	$(SED) 's/^\(CONFIG_EAP.*\)/#\1/' $(HOSTAPD_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_NO_ACCOUNTING.*\)/\2/' $(HOSTAPD_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_NO_RADIUS.*\)/\2/' $(HOSTAPD_CONFIG)
-endef
+	HOSTAPD_CONFIG_DISABLE += CONFIG_EAP
+	HOSTAPD_CONFIG_ENABLE += \
+		CONFIG_NO_ACCOUNTING \
+		CONFIG_NO_RADIUS
 endif
 
 ifeq ($(BR2_PACKAGE_HOSTAPD_WPS),y)
-define HOSTAPD_WPS_CONFIG
-	$(SED) 's/\(#\)\(CONFIG_WPS.*\)/\2/' $(HOSTAPD_CONFIG)
-endef
+	HOSTAPD_CONFIG_ENABLE += CONFIG_WPS
 endif
 
 define HOSTAPD_CONFIGURE_CMDS
 	cp $(@D)/hostapd/defconfig $(HOSTAPD_CONFIG)
-# Misc
-	$(SED) 's/\(#\)\(CONFIG_HS20.*\)/\2/' $(HOSTAPD_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_IEEE80211N.*\)/\2/' $(HOSTAPD_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_IEEE80211R.*\)/\2/' $(HOSTAPD_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_IEEE80211W.*\)/\2/' $(HOSTAPD_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_INTERWORKING.*\)/\2/' $(HOSTAPD_CONFIG)
-	$(SED) 's/\(#\)\(CONFIG_FULL_DYNAMIC_VLAN.*\)/\2/' $(HOSTAPD_CONFIG)
-	$(HOSTAPD_LIBTOMMATH_CONFIG)
-	$(HOSTAPD_TLS_CONFIG)
-	$(HOSTAPD_RADIUS_IPV6_CONFIG)
-	$(HOSTAPD_EAP_CONFIG)
-	$(HOSTAPD_WPS_CONFIG)
-	$(HOSTAPD_LIBNL_CONFIG)
+	sed -i $(patsubst %,-e 's/^#\(%\)/\1/',$(HOSTAPD_CONFIG_ENABLE)) \
+		$(patsubst %,-e 's/^\(%\)/#\1/',$(HOSTAPD_CONFIG_DISABLE)) \
+		$(patsubst %,-e '1i%=y',$(HOSTAPD_CONFIG_SET)) \
+		$(patsubst %,-e %,$(HOSTAPD_CONFIG_EDITS)) \
+		$(HOSTAPD_CONFIG)
 endef
 
 define HOSTAPD_BUILD_CMDS

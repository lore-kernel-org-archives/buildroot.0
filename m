From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Tue, 5 Sep 2017 22:26:19 +0300
Subject: [Buildroot] [PATCH] hostapd-realtek: new package
Message-ID: <CADmjQgsHvSv6ziqqCY9nXg2DkYwGXABBfvUSCVjen+tEjEzFmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a version of hostapd to work with Realtek Wi-Fi chips only.
Since Linux drivers for Realtek chips do not fully support netlink
interface, the stock hostapd doesn't work with them. See
https://github.com/pritambaral/hostapd-rtl871xdrv

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
---
 DEVELOPERS                                         |  3 ++
 package/Config.in                                  |  1 +
 .../0001-add-rtw-driver-to-defconfig.patch         | 11 ++++
 .../0002-set-rtl871xdrv-in-config-file.patch       | 18 +++++++
 package/hostapd-realtek/Config.in                  | 12 +++++
 package/hostapd-realtek/hostapd-realtek.hash       |  3 ++
 package/hostapd-realtek/hostapd-realtek.mk         | 63 ++++++++++++++++++++++
 7 files changed, 111 insertions(+)
 create mode 100644
package/hostapd-realtek/0001-add-rtw-driver-to-defconfig.patch
 create mode 100644
package/hostapd-realtek/0002-set-rtl871xdrv-in-config-file.patch
 create mode 100644 package/hostapd-realtek/Config.in
 create mode 100644 package/hostapd-realtek/hostapd-realtek.hash
 create mode 100644 package/hostapd-realtek/hostapd-realtek.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cc9c1eeca..c386cd4e9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1877,3 +1877,6 @@ F: package/qjson/
 F: package/quazip/
 F: package/shapelib/
 F: package/tinc/
+
+N: Alexander Mukhin <alexander.i.mukhin@gmail.com>
+F: package/hostapd-realtek/
diff --git a/package/Config.in b/package/Config.in
index 66ce30701..fd21a0fbb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1619,6 +1619,7 @@ menu "Networking applications"
  source "package/hans/Config.in"
  source "package/hiawatha/Config.in"
  source "package/hostapd/Config.in"
+ source "package/hostapd-realtek/Config.in"
  source "package/hplip/Config.in"
  source "package/httping/Config.in"
  source "package/ibrdtn-tools/Config.in"
diff --git a/package/hostapd-realtek/0001-add-rtw-driver-to-defconfig.patch
b/package/hostapd-realtek/0001-add-rtw-driver-to-defconfig.patch
new file mode 100644
index 000000000..0b434b902
--- /dev/null
+++ b/package/hostapd-realtek/0001-add-rtw-driver-to-defconfig.patch
@@ -0,0 +1,11 @@
+diff --git a/hostapd/defconfig b/hostapd/defconfig
+index 4659dd1..7ddffcf 100644
+--- a/hostapd/defconfig
++++ b/hostapd/defconfig
+@@ -343,3 +343,6 @@ CONFIG_IPV6=y
+ # a client, from which a signature can be produced which can
identify the model
+ # of client device like "Nexus 6P" or "iPhone 5s".
+ #CONFIG_TAXONOMY=y
++
++# -rtl patch
++CONFIG_DRIVER_RTW=y
diff --git a/package/hostapd-realtek/0002-set-rtl871xdrv-in-config-file.patch
b/package/hostapd-realtek/0002-set-rtl871xdrv-in-config-file.patch
new file mode 100644
index 000000000..1d1fcc96c
--- /dev/null
+++ b/package/hostapd-realtek/0002-set-rtl871xdrv-in-config-file.patch
@@ -0,0 +1,18 @@
+diff --git a/hostapd/hostapd.conf b/hostapd/hostapd.conf
+index fa9a855..7642055 100644
+--- a/hostapd/hostapd.conf
++++ b/hostapd/hostapd.conf
+@@ -20,11 +20,8 @@ interface=wlan0
+ # interface is also created.
+ #bridge=br0
+
+-# Driver interface type (hostap/wired/none/nl80211/bsd);
+-# default: hostap). nl80211 is used with all Linux mac80211 drivers.
+-# Use driver=none if building hostapd as a standalone RADIUS server that does
+-# not control any wireless/wired driver.
+-# driver=hostap
++# Driver interface type
++driver=rtl871xdrv
+
+ # Driver interface parameters (mainly for development testing use)
+ # driver_params=<params>
diff --git a/package/hostapd-realtek/Config.in
b/package/hostapd-realtek/Config.in
new file mode 100644
index 000000000..ab626f1ca
--- /dev/null
+++ b/package/hostapd-realtek/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOSTAPD_REALTEK
+ bool "hostapd-realtek"
+ depends on BR2_USE_MMU # fork()
+ help
+  User space daemon for Realtek wireless access points.
+
+  It implements IEEE 802.11 access point management,
+  IEEE 802.1X/WPA/WPA2/EAP authenticators, RADIUS client,
+  EAP server and RADIUS authentication server.
+
+  http://w1.fi/
+  https://github.com/pritambaral/hostapd-rtl871xdrv
diff --git a/package/hostapd-realtek/hostapd-realtek.hash
b/package/hostapd-realtek/hostapd-realtek.hash
new file mode 100644
index 000000000..83bfd0e7e
--- /dev/null
+++ b/package/hostapd-realtek/hostapd-realtek.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  01526b90c1d23bec4b0f052039cc4456c2fd19347b4d830d1d58a0a6aea7117d
 hostapd-2.6.tar.gz
+sha256  e204da659d0583c71af23cb9b55536fe99598ee26a44104344f456e4d17350c6
 rtlxdrv.patch
diff --git a/package/hostapd-realtek/hostapd-realtek.mk
b/package/hostapd-realtek/hostapd-realtek.mk
new file mode 100644
index 000000000..6ca7480ca
--- /dev/null
+++ b/package/hostapd-realtek/hostapd-realtek.mk
@@ -0,0 +1,63 @@
+################################################################################
+#
+# hostapd-realtek
+#
+################################################################################
+
+HOSTAPD_REALTEK_VERSION = 2.6
+HOSTAPD_REALTEK_SITE = http://w1.fi/releases
+HOSTAPD_REALTEK_SOURCE = hostapd-$(HOSTAPD_REALTEK_VERSION).tar.gz
+HOSTAPD_REALTEK_PATCH =
https://github.com/pritambaral/hostapd-rtl871xdrv/raw/master/rtlxdrv.patch
+HOSTAPD_REALTEK_SUBDIR = hostapd
+HOSTAPD_REALTEK_CONFIG =
$(HOSTAPD_REALTEK_DIR)/$(HOSTAPD_REALTEK_SUBDIR)/.config
+HOSTAPD_REALTEK_DEPENDENCIES = host-pkgconf
+HOSTAPD_REALTEK_CFLAGS = $(TARGET_CFLAGS)
+HOSTAPD_REALTEK_LICENSE = BSD-3c
+HOSTAPD_REALTEK_LICENSE_FILES = README
+HOSTAPD_REALTEK_CONFIG_SET =
+
+HOSTAPD_REALTEK_CONFIG_ENABLE = \
+ CONFIG_NO_VLAN \
+ CONFIG_HS20 \
+ CONFIG_IEEE80211AC \
+ CONFIG_IEEE80211N \
+ CONFIG_IEEE80211R \
+ CONFIG_INTERNAL_LIBTOMMATH \
+ CONFIG_INTERWORKING \
+ CONFIG_NO_ACCOUNTING \
+ CONFIG_NO_RADIUS
+
+HOSTAPD_REALTEK_CONFIG_DISABLE = \
+ CONFIG_EAP \
+ CONFIG_DRIVER_NL80211
+
+# Use internal crypto
+HOSTAPD_REALTEK_CONFIG_DISABLE += CONFIG_EAP_PWD
+HOSTAPD_REALTEK_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
+
+define HOSTAPD_REALTEK_CONFIGURE_CMDS
+ cp $(@D)/hostapd/defconfig $(HOSTAPD_REALTEK_CONFIG)
+ sed -i $(patsubst %,-e 's/^#\(%\)/\1/',$(HOSTAPD_REALTEK_CONFIG_ENABLE)) \
+ $(patsubst %,-e 's/^\(%\)/#\1/',$(HOSTAPD_REALTEK_CONFIG_DISABLE)) \
+ $(patsubst %,-e '1i%=y',$(HOSTAPD_REALTEK_CONFIG_SET)) \
+ $(patsubst %,-e %,$(HOSTAPD_REALTEK_CONFIG_EDITS)) \
+ $(HOSTAPD_REALTEK_CONFIG)
+endef
+
+define HOSTAPD_REALTEK_BUILD_CMDS
+ $(TARGET_MAKE_ENV) CFLAGS="$(HOSTAPD_REALTEK_CFLAGS)" \
+ LDFLAGS="$(TARGET_LDFLAGS)" LIBS="$(HOSTAPD_REALTEK_LIBS)" \
+ $(MAKE) CC="$(TARGET_CC)" -C $(@D)/$(HOSTAPD_REALTEK_SUBDIR)
+endef
+
+define HOSTAPD_REALTEK_INSTALL_TARGET_CMDS
+ $(INSTALL) -m 0755 -D $(@D)/$(HOSTAPD_REALTEK_SUBDIR)/hostapd \
+ $(TARGET_DIR)/usr/sbin/hostapd_rtl
+        $(INSTALL) -m 0755 -D $(@D)/$(HOSTAPD_SUBDIR)/hostapd_cli \
+                $(TARGET_DIR)/usr/bin/hostapd_cli
+ $(INSTALL) -m 0644 -D $(@D)/$(HOSTAPD_SUBDIR)/hostapd.conf \
+ $(TARGET_DIR)/etc/hostapd_rtl.conf
+
+endef
+
+$(eval $(generic-package))
-- 
2.11.0

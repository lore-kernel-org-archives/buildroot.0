From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 17 Mar 2019 18:54:55 +0200
Subject: [Buildroot] [PATCH] package/libpcap: disable bluez to avoid
 circular dependency
Message-ID: <951ac67f2443cb18f758560abe96a5ae78350f63.1552841695.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The optional bluez_utils dependency of libpcap creates a circular
dependency:

$ make dbus-show-recursive-depends

Recursion detected for  : systemd
which is a dependency of: dbus
which is a dependency of: bluez_utils
which is a dependency of: libpcap
which is a dependency of: iptables
which is a dependency of: systemd
make: *** [package/dbus/dbus.mk:121: dbus-show-recursive-depends] Error 1

Like in the case of dbus (commit b01d463c140) the bluez_utils dependency
looks less useful. Disable bluetooth support unconditionally.

Fixes:
http://autobuild.buildroot.net/results/9c3/9c3ee798fa6bb501a20a7892c0b085d2b279b664/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libpcap/libpcap.mk | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 83188c8c4847..82461390de4d 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -16,8 +16,8 @@ LIBPCAP_CONF_ENV = \
 	CFLAGS="$(LIBPCAP_CFLAGS)"
 LIBPCAP_CFLAGS = $(TARGET_CFLAGS)
 LIBPCAP_CONF_OPTS = --disable-yydebug --with-pcap=linux --without-dag
-# Disable dbus to break recursive dependencies
-LIBPCAP_CONF_OPTS += --disable-dbus
+# Disable dbus and bluez_utils to break recursive dependencies
+LIBPCAP_CONF_OPTS += --disable-dbus --disable-bluetooth
 LIBPCAP_CONFIG_SCRIPTS = pcap-config
 
 # Omit -rpath from pcap-config output
@@ -26,14 +26,6 @@ define LIBPCAP_CONFIG_REMOVE_RPATH
 endef
 LIBPCAP_POST_BUILD_HOOKS = LIBPCAP_CONFIG_REMOVE_RPATH
 
-ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
-LIBPCAP_DEPENDENCIES += bluez_utils
-else ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
-LIBPCAP_DEPENDENCIES += bluez5_utils
-else
-LIBPCAP_CONF_OPTS += --disable-bluetooth
-endif
-
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 LIBPCAP_DEPENDENCIES += libnl
 LIBPCAP_CFLAGS += "-I$(STAGING_DIR)/usr/include/libnl3"
-- 
2.20.1

From: Baruch Siach <baruch@tkos.co.il>
Date: Sat,  9 Mar 2019 20:28:14 +0200
Subject: [Buildroot] [PATCH] package/libpcap: disable dbus to break circular
 dependency
Message-ID: <87d1255df9dbfe03c8503a1fdb74bb2385675351.1552156094.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The optional dbus dependency of libpcap creates a circular dependency
chain:

$ make libpcap-show-recursive-depends

Recursion detected for  : systemd
which is a dependency of: dbus
which is a dependency of: libpcap
which is a dependency of: iptables
which is a dependency of: systemd
make: *** [package/libpcap/libpcap.mk:55: libpcap-show-recursive-depends] Error 1

Of all these dependencies the one of libpcap on dbus seems to be less
useful. Drop it.

Fixes:
http://autobuild.buildroot.net/results/0b5d18bff816cbcee11e8645449701722d956de5/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libpcap/libpcap.mk | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 126087220b02..83188c8c4847 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -16,6 +16,8 @@ LIBPCAP_CONF_ENV = \
 	CFLAGS="$(LIBPCAP_CFLAGS)"
 LIBPCAP_CFLAGS = $(TARGET_CFLAGS)
 LIBPCAP_CONF_OPTS = --disable-yydebug --with-pcap=linux --without-dag
+# Disable dbus to break recursive dependencies
+LIBPCAP_CONF_OPTS += --disable-dbus
 LIBPCAP_CONFIG_SCRIPTS = pcap-config
 
 # Omit -rpath from pcap-config output
@@ -32,13 +34,6 @@ else
 LIBPCAP_CONF_OPTS += --disable-bluetooth
 endif
 
-ifeq ($(BR2_PACKAGE_DBUS),y)
-LIBPCAP_CONF_OPTS += --enable-dbus
-LIBPCAP_DEPENDENCIES += dbus
-else
-LIBPCAP_CONF_OPTS += --disable-dbus
-endif
-
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 LIBPCAP_DEPENDENCIES += libnl
 LIBPCAP_CFLAGS += "-I$(STAGING_DIR)/usr/include/libnl3"
-- 
2.20.1

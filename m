From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 21:39:23 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libpcap: disable
 dbus to break circular dependency
Message-ID: <20190325204337.AA00E84059@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d902c871d494edbcf2f467f65c896b0962d459a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b01d463c14060318743ce5d0a2da01a5b3a5e0e2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpcap/libpcap.mk | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 126087220b..83188c8c48 100644
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

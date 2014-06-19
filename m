From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 19 Jun 2014 07:26:48 -0300
Subject: [Buildroot] [PATCH] tcpreplay: use pcap-config
Message-ID: <1403173608-15736-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since other libs can be pulled in by libpcap switch to using
pcap-config, it's the correct way and simpler. Fixes:
http://autobuild.buildroot.net/results/c02/c023bacd35e9ef1addeb881cd3d572f97f9b4b56/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tcpreplay/tcpreplay.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 2ee224e..0f2f2e6 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -15,10 +15,8 @@ TCPREPLAY_CONF_ENV = \
 TCPREPLAY_CONF_OPT = --with-libpcap=$(STAGING_DIR)/usr
 TCPREPLAY_DEPENDENCIES = libpcap
 
-# libpcap may depend on symbols in libdbus-1 and libusb as well
-TCPREPLAY_LIBS = -lpcap \
-	$(if $(BR2_PACKAGE_DBUS),-ldbus-1) \
-	$(if $(BR2_PACKAGE_LIBUSB),-lusb-1.0)
+# libpcap may depend on symbols in other libs
+TCPREPLAY_LIBS = $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --libs)
 TCPREPLAY_CONF_ENV += ac_cv_search_pcap_close='$(TCPREPLAY_LIBS)' \
 	LIBS="$(TCPREPLAY_LIBS)"
 
-- 
1.8.5.5

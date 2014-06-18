From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Jun 2014 10:21:37 -0300
Subject: [Buildroot] [PATCH 3/3] tcpreplay: bump to version 4.0.4
In-Reply-To: <1403097697-15782-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403097697-15782-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403097697-15782-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tcpreplay/tcpreplay.mk | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index e1ff1f5..2ee224e 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,19 +4,23 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.0.3
+TCPREPLAY_VERSION = 4.0.4
 TCPREPLAY_SITE = http://downloads.sourceforge.net/project/tcpreplay/tcpreplay/$(TCPREPLAY_VERSION)
 TCPREPLAY_LICENSE = GPLv3
 TCPREPLAY_LICENSE_FILES = docs/LICENSE
 TCPREPLAY_CONF_ENV = \
 	tr_cv_libpcap_version=">= 0.7.0" \
-	ac_cv_have_bpf=no
+	ac_cv_have_bpf=no \
+	$(call AUTOCONF_AC_CHECK_FILE_VAL,$(STAGING_DIR)/usr/include/pcap-netmap.c)=no
 TCPREPLAY_CONF_OPT = --with-libpcap=$(STAGING_DIR)/usr
 TCPREPLAY_DEPENDENCIES = libpcap
 
-# libpcap may depend on symbols in libusb as well
-TCPREPLAY_LIBS = -lpcap $(if $(BR2_PACKAGE_LIBUSB),-lusb-1.0)
-TCPREPLAY_CONF_ENV += ac_cv_search_pcap_close='$(TCPREPLAY_LIBS)'
+# libpcap may depend on symbols in libdbus-1 and libusb as well
+TCPREPLAY_LIBS = -lpcap \
+	$(if $(BR2_PACKAGE_DBUS),-ldbus-1) \
+	$(if $(BR2_PACKAGE_LIBUSB),-lusb-1.0)
+TCPREPLAY_CONF_ENV += ac_cv_search_pcap_close='$(TCPREPLAY_LIBS)' \
+	LIBS="$(TCPREPLAY_LIBS)"
 
 ifeq ($(BR2_PACKAGE_TCPDUMP),y)
 TCPREPLAY_CONF_ENV += ac_cv_path_tcpdump_path=/usr/sbin/tcpdump
-- 
1.8.5.5

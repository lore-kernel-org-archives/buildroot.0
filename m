From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 23:56:56 +0200
Subject: [Buildroot] [git commit] tcpreplay: bump to version 4.0.4
Message-ID: <20140618220023.565499D047@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c7ed007adcd270c8b5b84c14aa62010a6e6dbc2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpreplay/tcpreplay.mk |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

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

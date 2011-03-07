From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Mar 2011 23:28:35 +0100
Subject: [Buildroot] [PATCH 2/9] Rename BR2_INET_IPV6 to
	BR2_TOOLCHAIN_HAS_IPV6
In-Reply-To: <cover.1299536722.git.thomas.petazzoni@free-electrons.com>
References: <cover.1299536722.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4c32d152300021229dbec3b7f99de812ba7feb59.1299536722.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/arm_nptl_toolchain_defconfig             |    2 +-
 configs/arm_toolchain_defconfig                  |    2 +-
 package/Makefile.in                              |    2 +-
 package/bmon/Config.in                           |    4 ++--
 package/busybox/busybox.mk                       |    2 +-
 package/dnsmasq/dnsmasq.mk                       |    2 +-
 package/hostapd/hostapd.mk                       |    2 +-
 package/ipsec-tools/ipsec-tools.mk               |    2 +-
 package/iptables/iptables.mk                     |    2 +-
 package/libsoup/libsoup.mk                       |    2 +-
 package/lsof/lsof.mk                             |    2 +-
 package/mtd/Config.in                            |    4 ++--
 package/multimedia/ffmpeg/Config.in              |    5 +++--
 package/multimedia/gst-ffmpeg/Config.in          |    5 +++--
 package/multimedia/gst-plugins-good/Config.in    |    4 ++--
 package/multimedia/mplayer/mplayer.mk            |    2 +-
 package/netsnmp/netsnmp.mk                       |    2 +-
 package/ntp/ntp.mk                               |    2 +-
 package/olsr/Config.in                           |    4 ++--
 package/pppd/pppd.mk                             |    2 +-
 package/qt/qt.mk                                 |    2 +-
 package/quagga/Config.in                         |    4 ++--
 package/radvd/Config.in                          |    2 +-
 package/samba/samba.mk                           |    2 +-
 package/spawn-fcgi/spawn-fcgi.mk                 |    2 +-
 package/squid/Config.in                          |    4 ++--
 toolchain/helpers.mk                             |    4 ++--
 toolchain/toolchain-buildroot/Config.in.2        |    2 +-
 toolchain/toolchain-common.in                    |    2 +-
 toolchain/toolchain-crosstool-ng/Config.in       |    6 +++---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    2 +-
 toolchain/toolchain-external/Config.in           |    4 ++--
 toolchain/uClibc/uclibc.mk                       |    2 +-
 33 files changed, 47 insertions(+), 45 deletions(-)

diff --git a/configs/arm_nptl_toolchain_defconfig b/configs/arm_nptl_toolchain_defconfig
index 78dc557..62870c9 100644
--- a/configs/arm_nptl_toolchain_defconfig
+++ b/configs/arm_nptl_toolchain_defconfig
@@ -4,7 +4,7 @@ BR2_arm926t=y
 
 # Toolchain options
 BR2_TOOLCHAIN_HAS_LARGEFILE=y
-BR2_INET_IPV6=y
+BR2_TOOLCHAIN_HAS_IPV6=y
 BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
 BR2_USE_WCHAR=y
diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index 7fa51c2..4c7b96d 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -3,7 +3,7 @@ BR2_arm=y
 
 # Common Toolchain Options
 BR2_TOOLCHAIN_HAS_LARGEFILE=y
-BR2_INET_IPV6=y
+BR2_TOOLCHAIN_HAS_IPV6=y
 BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
 BR2_USE_WCHAR=y
diff --git a/package/Makefile.in b/package/Makefile.in
index 4aa52dc..92060bd 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -303,7 +303,7 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 DISABLE_DOCUMENTATION=--disable-gtk-doc
 endif
 
-ifneq ($(BR2_INET_IPV6),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_IPV6),y)
 DISABLE_IPV6= --disable-ipv6
 endif
 
diff --git a/package/bmon/Config.in b/package/bmon/Config.in
index 667788b..1eecc8a 100644
--- a/package/bmon/Config.in
+++ b/package/bmon/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_BMON
 	bool "bmon"
-	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_IPV6
 	select BR2_PACKAGE_NCURSES
 	help
 	  Linux bandwidth monitor
 
 comment "bmon requires a toolchain with IPv6 support"
-	depends on !BR2_INET_IPV6
+	depends on !BR2_TOOLCHAIN_HAS_IPV6
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 6764427..7c6f28a 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -60,7 +60,7 @@ endef
 endif
 
 # If IPv6 is enabled then enable basic ifupdown support for it
-ifeq ($(BR2_INET_IPV6),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_IPV6),y)
 define BUSYBOX_SET_IPV6
 	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_IPV6,$(BUSYBOX_BUILD_CONFIG))
 	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_IFUPDOWN_IPV6,$(BUSYBOX_BUILD_CONFIG))
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 9347ee5..2c11dca 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -10,7 +10,7 @@ DNSMASQ_MAKE_ENV = CC="$(TARGET_CC)" LDFLAGS="$(TARGET_LDFLAGS)"
 DNSMASQ_MAKE_OPT = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
 DNSMASQ_MAKE_OPT += DESTDIR=$(TARGET_DIR)
 
-ifneq ($(BR2_INET_IPV6),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_IPV6),y)
 	DNSMASQ_COPTS += -DNO_IPV6
 endif
 
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 4c95066..24fc072 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -45,7 +45,7 @@ define HOSTAPD_EAP_CONFIG
 	echo "CONFIG_EAP_SIM=y" >>$(HOSTAPD_CONFIG)
 	echo "CONFIG_RADIUS_SERVER=y" >>$(HOSTAPD_CONFIG)
 endef
-ifeq ($(BR2_INET_IPV6),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_IPV6),y)
 define HOSTAPD_RADIUS_IPV6_CONFIG
 	$(SED) "s/^#CONFIG_IPV6/CONFIG_IPV6/" $(HOSTAPD_CONFIG)
 endef
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index 0861a05..f989224 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -44,7 +44,7 @@ else
 IPSEC_TOOLS_CONF_OPT+= --disable-stats
 endif
 
-ifeq ($(BR2_INET_IPV6),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_IPV6),y)
 IPSEC_TOOLS_CONF_OPT+= --enable-ipv6
 else
 IPSEC_TOOLS_CONF_OPT+= --disable-ipv6
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 8652de4..385e480 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -31,7 +31,7 @@ endef
 
 IPTABLES_POST_INSTALL_TARGET_HOOKS += IPTABLES_TARGET_SYMLINK_CREATE
 
-ifeq ($(BR2_INET_IPV6),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_IPV6),y)
 IPTABLES_POST_INSTALL_TARGET_HOOKS += IPTABLES_TARGET_IPV6_SYMLINK_CREATE
 else
 IPTABLES_POST_INSTALL_TARGET_HOOKS += IPTABLES_TARGET_IPV6_REMOVE
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 132ea34..e081bf7 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -12,7 +12,7 @@ LIBSOUP_INSTALL_STAGING = YES
 
 LIBSOUP_CONF_ENV = ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY)
 
-ifneq ($(BR2_INET_IPV6),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_IPV6),y)
 LIBSOUP_CONF_ENV += soup_cv_ipv6=no
 endif
 
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 18783d0..854dbb3 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -11,7 +11,7 @@ BR2_LSOF_CFLAGS =
 ifeq ($(BR2_TOOLCHAIN_HAS_LARGEFILE),)
 BR2_LSOF_CFLAGS += -U_FILE_OFFSET_BITS
 endif
-ifeq ($(BR2_INET_IPV6),)
+ifeq ($(BR2_TOOLCHAIN_HAS_IPV6),)
 BR2_LSOF_CFLAGS += -UHASIPv6
 endif
 
diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 692654c..bfcde4f 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -79,11 +79,11 @@ config BR2_PACKAGE_MTD_NFTL_FORMAT
 	bool "nftl_format"
 
 config BR2_PACKAGE_MTD_RECV_IMAGE
-	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_IPV6
 	bool "recv_image"
 
 comment "recv_image requires a toolchain with IPv6 support"
-	depends on !BR2_INET_IPV6
+	depends on !BR2_TOOLCHAIN_HAS_IPV6
 
 config BR2_PACKAGE_MTD_RFDDUMP
 	bool "rfddump"
diff --git a/package/multimedia/ffmpeg/Config.in b/package/multimedia/ffmpeg/Config.in
index 901a6dd..f4cf3b7 100644
--- a/package/multimedia/ffmpeg/Config.in
+++ b/package/multimedia/ffmpeg/Config.in
@@ -1,10 +1,11 @@
 comment "ffmpeg requires a toolchain with LARGEFILE and IPV6 support"
-	depends on !(BR2_TOOLCHAIN_HAS_LARGEFILE && BR2_INET_IPV6)
+	depends on !(BR2_TOOLCHAIN_HAS_LARGEFILE && \
+		     BR2_TOOLCHAIN_HAS_IPV6)
 
 menuconfig BR2_PACKAGE_FFMPEG
 	bool "ffmpeg"
 	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
-	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_IPV6
 	help
          FFmpeg is a complete, cross-platform solution to record, convert
          and stream audio and video.
diff --git a/package/multimedia/gst-ffmpeg/Config.in b/package/multimedia/gst-ffmpeg/Config.in
index c4f4681..f4f1557 100644
--- a/package/multimedia/gst-ffmpeg/Config.in
+++ b/package/multimedia/gst-ffmpeg/Config.in
@@ -7,11 +7,12 @@ config BR2_PACKAGE_GST_FFMPEG
 	select BR2_PACKAGE_FFMPEG_POSTPROC
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
-	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_IPV6
 	help
 	  GStreamer plugin using FFmpeg.
 
 	  http://gstreamer.freedesktop.org/
 
 comment "gst-ffmpeg requires a toolchain with LARGEFILE and IPV6 support"
-	depends on !(BR2_TOOLCHAIN_HAS_LARGEFILE && BR2_INET_IPV6)
+	depends on !(BR2_TOOLCHAIN_HAS_LARGEFILE && \
+		     BR2_TOOLCHAIN_HAS_IPV6)
diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
index 368642f..1cac766 100644
--- a/package/multimedia/gst-plugins-good/Config.in
+++ b/package/multimedia/gst-plugins-good/Config.in
@@ -134,11 +134,11 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPECTRUM
 	bool "spectrum"
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_UDP
-	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_IPV6
 	bool "udp"
 
 comment "udp requires a toolchain with IPv6 support"
-	depends on !BR2_INET_IPV6
+	depends on !BR2_TOOLCHAIN_HAS_IPV6
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOBOX
 	bool "videobox"
diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index ac51ece..389a84c 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -121,7 +121,7 @@ endef
 
 # this is available on uClibc 0.9.31 even without ipv6 support, breaking the
 # build in ffmpeg/libavformat/udp.c
-ifneq ($(BR2_INET_IPV6),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_IPV6),y)
 define MPLAYER_FIXUP_IPV6_MREQ_DETECTION
 	$(SED) 's/\(#define HAVE_STRUCT_IPV6_MREQ\) 1/\1 0/' $(@D)/config.h
 endef
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index e8d7788..6e06bad 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -44,7 +44,7 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 endif
 
 # Remove IPv6 MIBs if there's no IPv6
-ifneq ($(BR2_INET_IPV6),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_IPV6),y)
 define NETSNMP_REMOVE_MIBS_IPV6
 	rm -f $(TARGET_DIR)/usr/share/snmp/mibs/IPV6*
 endef
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 72e462e..f3f948f 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -9,7 +9,7 @@ NTP_SITE = http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2
 
 NTP_CONF_ENV = ac_cv_lib_md5_MD5Init=no
 
-ifneq ($(BR2_INET_IPV6),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_IPV6),y)
 NTP_CONF_ENV += isc_cv_have_in6addr_any=no
 endif
 
diff --git a/package/olsr/Config.in b/package/olsr/Config.in
index ada82b4..6193fad 100644
--- a/package/olsr/Config.in
+++ b/package/olsr/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_OLSR
 	bool "OLSR mesh networking Daemon"
-	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_IPV6
 	help
 	  The Optimized Link State Routing protocol (OLSR) is a
 	  routing protocol that is optimised for mobile ad-hoc
@@ -12,4 +12,4 @@ config BR2_PACKAGE_OLSR
 	  http://www.olsr.org/
 
 comment "olsr requires a toolchain with IPv6 support"
-	depends on !BR2_INET_IPV6
+	depends on !BR2_TOOLCHAIN_HAS_IPV6
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 05c1c32..82ea720 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -19,7 +19,7 @@ ifeq ($(BR2_PACKAGE_PPPD_FILTER),y)
 	PPPD_MAKE_OPT += FILTER=y
 endif
 
-ifeq ($(BR2_INET_IPV6),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_IPV6),y)
 	PPPD_MAKE_OPT += HAVE_INET6=y
 endif
 
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index a4a1fc8..d098585 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -495,7 +495,7 @@ $(QT_TARGET_DIR)/.unpacked: $(DL_DIR)/$(QT_SOURCE)
 
 $(QT_TARGET_DIR)/.configured: $(QT_TARGET_DIR)/.unpacked
 	-[ -f $(QT_TARGET_DIR)/Makefile ] && $(MAKE) -C $(QT_TARGET_DIR) confclean
-ifneq ($(BR2_INET_IPV6),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_IPV6),y)
 	$(SED) 's/^CFG_IPV6=auto/CFG_IPV6=no/' $(QT_TARGET_DIR)/configure
 	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QT_TARGET_DIR)/configure
 endif
diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index 9ca2f98..75e96d4 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -47,7 +47,7 @@ config BR2_PACKAGE_QUAGGA_OPAQUE_LSA
 
 config BR2_PACKAGE_QUAGGA_OSPF6D
 	bool "OSPFv3 (IPv6) protocol"
-	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_IPV6
 	help
 	  Build ospf6d daemon.
 
@@ -58,7 +58,7 @@ config BR2_PACKAGE_QUAGGA_RIPD
 
 config BR2_PACKAGE_QUAGGA_RIPNGD
 	bool "RIPng (IPv6) protocol"
-	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_IPV6
 	help
 	  Build ripngd daemon.
 
diff --git a/package/radvd/Config.in b/package/radvd/Config.in
index c7753f0..2eecb0e 100644
--- a/package/radvd/Config.in
+++ b/package/radvd/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_RADVD
 	bool "radvd"
 	select BR2_PACKAGE_FLEX
 	select BR2_PACKAGE_FLEX_LIBFL
-	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_IPV6
 	help
 	  IPv6 Router Advertisement Daemon.
 
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index f61444d..160cf2e 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -32,7 +32,7 @@ SAMBA_CONF_ENV = \
 	samba_cv_HAVE_SECURE_MKSTEMP=yes \
 	samba_cv_CC_NEGATIVE_ENUM_VALUES=yes \
 	samba_cv_fpie=no \
-	libreplace_cv_HAVE_IPV6=$(if $(BR2_INET_IPV6),yes,no) \
+	libreplace_cv_HAVE_IPV6=$(if $(BR2_TOOLCHAIN_HAS_IPV6),yes,no) \
 	$(if $(BR2_PACKAGE_SAMBA_AVAHI),AVAHI_LIBS=-pthread)
 
 
diff --git a/package/spawn-fcgi/spawn-fcgi.mk b/package/spawn-fcgi/spawn-fcgi.mk
index 5070f73..b08029a 100644
--- a/package/spawn-fcgi/spawn-fcgi.mk
+++ b/package/spawn-fcgi/spawn-fcgi.mk
@@ -8,7 +8,7 @@ SPAWN_FCGI_VERSION = 1.6.3
 SPAWN_FCGI_SITE = http://www.lighttpd.net/download
 SPAWN_FCGI_SOURCE = spawn-fcgi-$(SPAWN_FCGI_VERSION).tar.bz2
 
-ifneq ($(BR2_INET_IPV6),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_IPV6),y)
 SPAWN_FCGI_CONF_OPT = --disable-ipv6
 endif
 
diff --git a/package/squid/Config.in b/package/squid/Config.in
index 4ec7fa4..5834ac9 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -1,10 +1,10 @@
 comment "Squid requires a toolchain with C++ and IPv6 support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_INET_IPV6
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_IPV6
 
 config BR2_PACKAGE_SQUID
 	bool "squid"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_IPV6
 	select BR2_PACKAGE_LIBCAP
 	help
 	  Caching proxy for the Web supporting HTTP, HTTPS, FTP, and more.
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index fd587ce..10b2328 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -143,7 +143,7 @@ check_glibc = \
 		exit -1; \
 	fi; \
 	$(call check_glibc_feature,BR2_TOOLCHAIN_HAS_LARGEFILE,Large file support) ;\
-	$(call check_glibc_feature,BR2_INET_IPV6,IPv6 support) ;\
+	$(call check_glibc_feature,BR2_TOOLCHAIN_HAS_IPV6,IPv6 support) ;\
 	$(call check_glibc_feature,BR2_INET_RPC,RPC support) ;\
 	$(call check_glibc_feature,BR2_ENABLE_LOCALE,Locale support) ;\
 	$(call check_glibc_feature,BR2_USE_MMU,MMU support) ;\
@@ -190,7 +190,7 @@ check_uclibc = \
 	UCLIBC_CONFIG_FILE=$${SYSROOT_DIR}/usr/include/bits/uClibc_config.h ; \
 	$(call check_uclibc_feature,__ARCH_USE_MMU__,BR2_USE_MMU,$${UCLIBC_CONFIG_FILE},MMU support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_LFS__,BR2_TOOLCHAIN_HAS_LARGEFILE,$${UCLIBC_CONFIG_FILE},Large file support) ;\
-	$(call check_uclibc_feature,__UCLIBC_HAS_IPV6__,BR2_INET_IPV6,$${UCLIBC_CONFIG_FILE},IPv6 support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_IPV6__,BR2_TOOLCHAIN_HAS_IPV6,$${UCLIBC_CONFIG_FILE},IPv6 support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_RPC__,BR2_INET_RPC,$${UCLIBC_CONFIG_FILE},RPC support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_WCHAR__,BR2_USE_WCHAR,$${UCLIBC_CONFIG_FILE},Wide char support) ;\
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index ef786e5..6e2fcc6 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -13,7 +13,7 @@ config BR2_TOOLCHAIN_BUILDROOT_LARGEFILE
 
 config BR2_TOOLCHAIN_BUILDROOT_INET_IPV6
 	bool "Enable IPv6 support"
-	select BR2_INET_IPV6
+	select BR2_TOOLCHAIN_HAS_IPV6
 	help
 	  Enable this option if you want your toolchain to support
 	  IPv6.
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 31d017c..c13776c 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -8,7 +8,7 @@ source "toolchain/gdb/Config.in"
 config BR2_TOOLCHAIN_HAS_LARGEFILE
 	bool
 
-config BR2_INET_IPV6
+config BR2_TOOLCHAIN_HAS_IPV6
 	bool
 
 config BR2_INET_RPC
diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 76222f4..5e724e2 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -13,7 +13,7 @@ config BR2_TOOLCHAIN_CTNG_uClibc
 config BR2_TOOLCHAIN_CTNG_eglibc
 	bool "eglibc"
 	select BR2_TOOLCHAIN_HAS_LARGEFILE
-	select BR2_INET_IPV6
+	select BR2_TOOLCHAIN_HAS_IPV6
 	select BR2_INET_RPC
 	select BR2_ENABLE_LOCALE
 	select BR2_USE_WCHAR
@@ -22,7 +22,7 @@ config BR2_TOOLCHAIN_CTNG_eglibc
 config BR2_TOOLCHAIN_CTNG_glibc
 	bool "glibc"
 	select BR2_TOOLCHAIN_HAS_LARGEFILE
-	select BR2_INET_IPV6
+	select BR2_TOOLCHAIN_HAS_IPV6
 	select BR2_INET_RPC
 	select BR2_ENABLE_LOCALE
 	select BR2_USE_WCHAR
@@ -58,7 +58,7 @@ config BR2_TOOLCHAIN_CTNG_uClibc_LARGEFILE
 
 config BR2_TOOLCHAIN_CTNG_uClibc_INET_IPV6
 	bool "Enable IPv6 support"
-	select BR2_INET_IPV6
+	select BR2_TOOLCHAIN_HAS_IPV6
 	help
 	  Enable this option if you want your toolchain to support
 	  IPv6.
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 5dd3c57..c6469ee 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -286,7 +286,7 @@ CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^(UCLIBC_HAS_LFS)=.*:\# \1 is not set:;
 endif
 
 # Handle the IPv6 option
-ifneq ($(call qstrip,$(BR2_INET_IPV6)),)
+ifneq ($(call qstrip,$(BR2_TOOLCHAIN_HAS_IPV6)),)
 CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_IPV6) is not set:\1=y:;
 else
 CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^(UCLIBC_HAS_IPV6)=.*:\# \1 is not set:;
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 40318e3..2fe0bc3 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -144,7 +144,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 config BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	bool
 	select BR2_TOOLCHAIN_HAS_LARGEFILE
-	select BR2_INET_IPV6
+	select BR2_TOOLCHAIN_HAS_IPV6
 	select BR2_INET_RPC
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -182,7 +182,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LARGEFILE
 
 config BR2_TOOLCHAIN_EXTERNAL_INET_IPV6
 	bool "Toolchain has IPv6 support?"
-	select BR2_INET_IPV6
+	select BR2_TOOLCHAIN_HAS_IPV6
 	help
 	  Select this option if your external toolchain supports
 	  IPv6. If you don't know, leave the default value, Buildroot
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 8422834..a92bb58 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -243,7 +243,7 @@ else
 	$(SED) '/.*UCLIBC_HAS_FOPEN_LARGEFILE_MODE.*/d' $(UCLIBC_DIR)/.oldconfig
 	echo "# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set" >> $(UCLIBC_DIR)/.oldconfig
 endif
-ifeq ($(BR2_INET_IPV6),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_IPV6),y)
 	$(SED) 's,^.*UCLIBC_HAS_IPV6.*,UCLIBC_HAS_IPV6=y,g' $(UCLIBC_DIR)/.oldconfig
 else
 	$(SED) 's,^.*UCLIBC_HAS_IPV6.*,UCLIBC_HAS_IPV6=n,g' $(UCLIBC_DIR)/.oldconfig
-- 
1.7.0.4

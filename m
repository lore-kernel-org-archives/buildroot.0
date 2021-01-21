From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 21 Jan 2021 19:16:03 +0200
Subject: [Buildroot] [PATCH 1/2] package/libpcap: bump to version 1.10.0
Message-ID: <b121a9435d868681c957e7bc9243fb84676d80e3.1611249364.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

configure script now uses pkg-config. Add host-pkgconf dependency.

pkg-config should provide necessary info for libnl build/link. Don't
pass paths to configure.

Add --without-dpdk to make sure we don't link with host installed
libraries.

Format hashes with two space delimiters.

Use https for SITE to save redirect.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libpcap/libpcap.hash |  5 +++--
 package/libpcap/libpcap.mk   | 12 ++++++------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
index a24fba24dead..e70d071294a5 100644
--- a/package/libpcap/libpcap.hash
+++ b/package/libpcap/libpcap.hash
@@ -1,5 +1,6 @@
 # Locally calculated after checking pgp signature
-sha256	635237637c5b619bcceba91900666b64d56ecb7be63f298f601ec786ce087094	libpcap-1.9.1.tar.gz
+# https://www.tcpdump.org/release/libpcap-1.10.0.tar.gz.sig
+sha256  8d12b42623eeefee872f123bd0dc85d535b00df4d42e865f993c40f7bfc92b1e  libpcap-1.10.0.tar.gz
 
 # Hash for license file:
-sha256	8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd	LICENSE
+sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index e323461529fe..81e7cd4ab05c 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,19 +4,20 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.9.1
-LIBPCAP_SITE = http://www.tcpdump.org/release
+LIBPCAP_VERSION = 1.10.0
+LIBPCAP_SITE = https://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3-Clause
 LIBPCAP_LICENSE_FILES = LICENSE
 LIBPCAP_CPE_ID_VENDOR = tcpdump
 LIBPCAP_INSTALL_STAGING = YES
-LIBPCAP_DEPENDENCIES = host-flex host-bison
+LIBPCAP_DEPENDENCIES = host-flex host-bison host-pkgconf
 
 LIBPCAP_CONF_ENV = \
 	ac_cv_header_linux_wireless_h=yes \
 	CFLAGS="$(LIBPCAP_CFLAGS)"
 LIBPCAP_CFLAGS = $(TARGET_CFLAGS)
-LIBPCAP_CONF_OPTS = --disable-yydebug --with-pcap=linux --without-dag
+LIBPCAP_CONF_OPTS = --disable-yydebug --with-pcap=linux --without-dag \
+	--without-dpdk
 # Disable dbus to break recursive dependencies
 LIBPCAP_CONF_OPTS += --disable-dbus
 LIBPCAP_CONFIG_SCRIPTS = pcap-config
@@ -35,8 +36,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 LIBPCAP_DEPENDENCIES += libnl
-LIBPCAP_CFLAGS += "-I$(STAGING_DIR)/usr/include/libnl3"
-LIBPCAP_CONF_OPTS += --with-libnl=$(STAGING_DIR)/usr
+LIBPCAP_CONF_OPTS += --with-libnl
 else
 LIBPCAP_CONF_OPTS += --without-libnl
 endif
-- 
2.29.2

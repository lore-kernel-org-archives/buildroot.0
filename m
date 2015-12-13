From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Dec 2015 10:16:25 +0100
Subject: [Buildroot] [PATCH 2/2] package/wireshark: libpcap is an optional
	dependency
In-Reply-To: <1449998185-15082-1-git-send-email-bernd.kuhls@t-online.de>
References: <1449998185-15082-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1449998185-15082-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/wireshark/Config.in    |  1 -
 package/wireshark/wireshark.mk | 14 ++++++++++----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index 52b0f52..fec583b 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_WIRESHARK
 	bool "wireshark"
-	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_MMU # fork(), glib2
 	depends on BR2_USE_WCHAR # glib2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 2b06699..69f7b22 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -9,9 +9,7 @@ WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
 WIRESHARK_LICENSE_FILES = COPYING
-WIRESHARK_DEPENDENCIES = host-pkgconf libpcap libglib2
-WIRESHARK_CONF_ENV = \
-	ac_cv_path_PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
+WIRESHARK_DEPENDENCIES = host-pkgconf libglib2
 
 # patch touching configure.ac
 WIRESHARK_AUTORECONF = YES
@@ -24,7 +22,6 @@ WIRESHARK_CONF_OPTS = \
 	--enable-static=no \
 	--with-libsmi=no \
 	--with-lua=no \
-	--with-pcap=$(STAGING_DIR)/usr \
 	--includedir=$(STAGING_DIR)/usr/include
 
 # wireshark GUI options
@@ -92,4 +89,13 @@ else
 WIRESHARK_CONF_OPTS += --without-libnl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPCAP),y)
+WIRESHARK_CONF_OPTS += --with-pcap=$(STAGING_DIR)/usr
+WIRESHARK_CONF_ENV += \
+	ac_cv_path_PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
+WIRESHARK_DEPENDENCIES += libpcap
+else
+WIRESHARK_CONF_OPTS += --without-pcap
+endif
+
 $(eval $(autotools-package))
-- 
2.6.2

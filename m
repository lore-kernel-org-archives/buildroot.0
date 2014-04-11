From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Apr 2014 14:46:33 -0300
Subject: [Buildroot] [PATCH] dnsmasq: bump to version 2.69
Message-ID: <1397238393-3866-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now with DNSSEC support.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dnsmasq/Config.in  |  7 +++++++
 package/dnsmasq/dnsmasq.mk | 17 +++++++++++++----
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index 6158b10..40376ad 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -20,6 +20,13 @@ config BR2_PACKAGE_DNSMASQ_DHCP
 	help
 	  Enable DHCP server support in dnsmasq.
 
+config BR2_PACKAGE_DNSMASQ_DNSSEC
+	bool "DNSSEC support"
+	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_NETTLE
+	help
+	  Enable DNSSEC validation and caching support.
+
 config BR2_PACKAGE_DNSMASQ_IDN
 	bool "IDN support"
 	depends on BR2_USE_WCHAR
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 56d11ee..e5307e4 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.68
+DNSMASQ_VERSION = 2.69
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
 DNSMASQ_MAKE_OPT = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
 DNSMASQ_MAKE_OPT += DESTDIR=$(TARGET_DIR) LDFLAGS="$(TARGET_LDFLAGS)"
+DNSMASQ_DEPENDENCIES = host-pkgconf
 DNSMASQ_LICENSE = Dual GPLv2/GPLv3
 DNSMASQ_LICENSE_FILES = COPYING COPYING-v3
 
@@ -21,6 +22,14 @@ ifneq ($(BR2_PACKAGE_DNSMASQ_DHCP),y)
 	DNSMASQ_COPTS += -DNO_DHCP
 endif
 
+ifeq ($(BR2_PACKAGE_DNSMASQ_DNSSEC),y)
+	DNSMASQ_DEPENDENCIES += gmp nettle
+	DNSMASQ_COPTS += -DHAVE_DNSSEC
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+	DNSMASQ_COPTS += -DHAVE_DNSSEC_STATIC
+endif
+endif
+
 ifneq ($(BR2_PACKAGE_DNSMASQ_TFTP),y)
 	DNSMASQ_COPTS += -DNO_TFTP
 endif
@@ -34,7 +43,7 @@ ifeq ($(BR2_PACKAGE_DNSMASQ_IDN),y)
 endif
 
 ifeq ($(BR2_PACKAGE_DNSMASQ_CONNTRACK),y)
-	DNSMASQ_DEPENDENCIES += host-pkgconf libnetfilter_conntrack
+	DNSMASQ_DEPENDENCIES += libnetfilter_conntrack
 endif
 
 ifeq ($(BR2_PACKAGE_DNSMASQ_CONNTRACK),y)
@@ -45,7 +54,7 @@ endef
 endif
 
 ifeq ($(BR2_PACKAGE_DNSMASQ_LUA),y)
-	DNSMASQ_DEPENDENCIES += lua host-pkgconf
+	DNSMASQ_DEPENDENCIES += lua
 	DNSMASQ_MAKE_OPT += LDFLAGS+="-ldl"
 
 define DNSMASQ_ENABLE_LUA
@@ -60,7 +69,7 @@ ifneq ($(BR2_LARGEFILE),y)
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-	DNSMASQ_DEPENDENCIES += host-pkgconf dbus
+	DNSMASQ_DEPENDENCIES += dbus
 endif
 
 define DNSMASQ_FIX_PKGCONFIG
-- 
1.8.3.2

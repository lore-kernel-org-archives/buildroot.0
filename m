From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  4 May 2018 07:16:35 +0300
Subject: [Buildroot] [PATCH] openvpn: bump to version 2.4.6
Message-ID: <a8ecc558bbd852aa168aa2b59e7f1fc4e1b2c5ec.1525407395.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Note that CVE-2018-9336 fixed in this version does not affect Buildroot
since it is Windows specific.

Drop interoperability with older busybox versions. We removed support
for busybox version selection long ago.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/openvpn/openvpn.hash |  2 +-
 package/openvpn/openvpn.mk   | 15 +++------------
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 079595d44003..b740ea9a86f6 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256 43c0a363a332350f620d1cd93bb431e082bedbc93d4fb872f758650d53c1d29e  openvpn-2.4.5.tar.xz
+sha256 4f6434fa541cc9e363434ea71a16a62cf2615fb2f16af5b38f43ab5939998c26  openvpn-2.4.6.tar.xz
 sha256 1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index fbe65ad863a5..858398a3219d 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.4.5
+OPENVPN_VERSION = 2.4.6
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf openssl
@@ -17,7 +17,8 @@ OPENVPN_CONF_OPTS = \
 	$(if $(BR2_STATIC_LIBS),--disable-plugins)
 OPENVPN_CONF_ENV = IFCONFIG=/sbin/ifconfig \
 	NETSTAT=/bin/netstat \
-	ROUTE=/sbin/route
+	ROUTE=/sbin/route \
+	IPROUTE=/sbin/ip
 
 ifeq ($(BR2_PACKAGE_OPENVPN_SMALL),y)
 OPENVPN_CONF_OPTS += \
@@ -25,16 +26,6 @@ OPENVPN_CONF_OPTS += \
 	--disable-plugins
 endif
 
-# BusyBox 1.21+ places the ip applet in the "correct" place
-# but previous versions didn't.
-ifeq ($(BR2_PACKAGE_IPROUTE2),y)
-OPENVPN_CONF_ENV += IPROUTE=/sbin/ip
-else ifeq ($(BR2_BUSYBOX_VERSION_1_19_X)$(BR2_BUSYBOX_VERSION_1_20_X),y)
-OPENVPN_CONF_ENV += IPROUTE=/bin/ip
-else
-OPENVPN_CONF_ENV += IPROUTE=/sbin/ip
-endif
-
 ifeq ($(BR2_PACKAGE_OPENVPN_LZ4),y)
 OPENVPN_DEPENDENCIES += lz4
 else
-- 
2.17.0

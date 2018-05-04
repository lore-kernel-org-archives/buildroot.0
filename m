From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 May 2018 09:15:28 +0200
Subject: [Buildroot] [git commit] openvpn: bump to version 2.4.6
Message-ID: <20180504071550.2C9FC8B6CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=525f20dae15a1e79fc182779576bf517ea913db2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note that CVE-2018-9336 fixed in this version does not affect Buildroot
since it is Windows specific.

Drop interoperability with older busybox versions. We removed support
for busybox version selection long ago.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openvpn/openvpn.hash |  2 +-
 package/openvpn/openvpn.mk   | 15 +++------------
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 079595d440..b740ea9a86 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256 43c0a363a332350f620d1cd93bb431e082bedbc93d4fb872f758650d53c1d29e  openvpn-2.4.5.tar.xz
+sha256 4f6434fa541cc9e363434ea71a16a62cf2615fb2f16af5b38f43ab5939998c26  openvpn-2.4.6.tar.xz
 sha256 1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index fbe65ad863..858398a321 100644
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

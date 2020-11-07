From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Nov 2020 15:04:16 +0100
Subject: [Buildroot] [git commit branch/next] package/openvpn: bump to
 version 2.5.0
Message-ID: <20201107135115.64800868E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba8f55d7c1c945178aa9f409edb374c6bdba48ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Disable unit-tests which are enabled by default if cmocka is found:
  https://github.com/OpenVPN/openvpn/commit/222e691739a111f5becbce39c4cceaa8fff3c284
- Drop --enable-iproute2 to enable netlink(3) support (and so drop
  IFCONFIG, IPROUTE and ROUTE environment variables and keep NETSTAT
  even if it is only used by tests/t_client.sh.in).
  netlink is much faster than calling ifconfig or route and also enables
  OpenVPN to run with less privileges.
- Update indentation in hash file (two spaces)

https://github.com/OpenVPN/openvpn/blob/release/2.5/Changes.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openvpn/openvpn.hash | 4 ++--
 package/openvpn/openvpn.mk   | 9 +++------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index b9b0a4d8d5..4e371fc87b 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256 641f3add8694b2ccc39fd4fd92554e4f089ad16a8db6d2b473ec284839a5ebe2  openvpn-2.4.9.tar.xz
-sha256 1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
+sha256  029a426e44d656cb4e1189319c95fe6fc9864247724f5599d99df9c4c3478fbd  openvpn-2.5.0.tar.xz
+sha256  1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 1008c47b5a..3efc9e2354 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,19 +4,16 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.4.9
+OPENVPN_VERSION = 2.5.0
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
 OPENVPN_LICENSE = GPL-2.0
 OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
 OPENVPN_CONF_OPTS = \
-	--enable-iproute2 \
+	--disable-unit-tests \
 	$(if $(BR2_STATIC_LIBS),--disable-plugins)
-OPENVPN_CONF_ENV = IFCONFIG=/sbin/ifconfig \
-	NETSTAT=/bin/netstat \
-	ROUTE=/sbin/route \
-	IPROUTE=/sbin/ip
+OPENVPN_CONF_ENV = NETSTAT=/bin/netstat
 
 ifeq ($(BR2_PACKAGE_OPENVPN_SMALL),y)
 OPENVPN_CONF_OPTS += \

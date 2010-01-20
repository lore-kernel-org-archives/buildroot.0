From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 20 Jan 2010 11:10:32 +0100
Subject: [Buildroot] [git commit master] Bump openvpn to 2.1.1
Message-ID: <20100120101208.EBC9D776FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b3febdac86d3ec64b6c51ed4db421304f2872347
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #937.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    3 ++-
 package/openvpn/Config.in  |   21 ++++++++++++++++-----
 package/openvpn/openvpn.mk |   17 +++++++++++++----
 3 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7350560..bd7d59d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,7 +7,7 @@
 	Updated/fixed packages: autoconf, bind, binutils, bootutils, busybox,
 	directfb, e2fsprogs, gstreamer, gst-plugins-bad, hal, iptables,
 	iw, jpeg, kismet, libfuse, libpcap, libungif, lighttpd, mesa, mpg123,
-	mtd-utils, neon, pcre, qt, rpm, sshfs, tremor, u-boot,
+	mtd-utils, neon, openvpn, pcre, qt, rpm, sshfs, tremor, u-boot,
 	usb_modeswitch, usbutils, wpa_supplicant, xfsprogs
 
 	Issues resolved (http://bugs.uclibc.org):
@@ -35,6 +35,7 @@
 	#919: Bump usb_modeswitch package to 1.0.7
 	#925: Bump wpa_supplicant package to 0.6.10
 	#931: Bump kismet package to 2010-01-R1
+	#937: Bump openvpn package to 2.1.1
 
 2009.11, Released December 1st, 2009:
 
diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
index 6bbb859..9f9057d 100644
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -1,10 +1,5 @@
-comment "openvpn has no inherent support for AVR32" 
-	depends on BR2_avr32 && BR2_PACKAGE_OPENVPN
-
 config BR2_PACKAGE_OPENVPN
 	bool "openvpn"
-	select BR2_PACKAGE_LZO
-	select BR2_PACKAGE_OPENSSL
  	help
 	  OpenVPN is a full-featured SSL VPN solution which can
 	  accomodate a wide range of configurations, including road
@@ -14,3 +9,19 @@ config BR2_PACKAGE_OPENVPN
 	  fine-grained access-controls.
 
 	  http://openvpn.sourceforge.net/
+
+config BR2_PACKAGE_OPENVPN_LZO
+	bool "LZO compression"
+	default y
+	depends on BR2_PACKAGE_OPENVPN
+	select BR2_PACKAGE_LZO
+	help
+	  Enable LZO compression.
+
+config BR2_PACKAGE_OPENVPN_OPENSSL
+	bool "OpenSSL support"
+	default y
+	depends on BR2_PACKAGE_OPENVPN
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Enable TLS-based key exchange and OpenSSL crypto support.
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index bfacc41..084ee2f 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,11 +4,8 @@
 #
 #############################################################
 
-OPENVPN_VERSION = 2.0.9
-OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.gz
+OPENVPN_VERSION = 2.1.1
 OPENVPN_SITE = http://openvpn.net/release
-OPENVPN_DEPENDENCIES = lzo openssl
-
 OPENVPN_CONF_OPT = --enable-small
 
 ifeq ($(BR2_PTHREADS_NATIVE),y)
@@ -17,6 +14,18 @@ else
 	OPENVPN_CONF_OPT += --enable-pthread
 endif
 
+ifeq ($(BR2_PACKAGE_OPENVPN_LZO),y)
+	OPENVPN_DEPENDENCIES += lzo
+else
+	OPENVPN_CONF_OPT += --disable-lzo
+endif
+
+ifeq ($(BR2_PACKAGE_OPENVPN_OPENSSL),y)
+	OPENVPN_DEPENDENCIES += openssl
+else
+	OPENVPN_CONF_OPT += --disable-crypto --disable-ssl
+endif
+
 $(eval $(call AUTOTARGETS,package,openvpn))
 
 $(OPENVPN_TARGET_INSTALL_TARGET):
-- 
1.6.3.3

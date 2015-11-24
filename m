From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 24 Nov 2015 12:41:01 +0000
Subject: [Buildroot] [PATCH] gmp: disable for MIPS R6
Message-ID: <1448368861-24776-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gmplib is not yet supported for MIPS R6, so disable it and also
propagate that dependency recursively to all packages who select it.

Fixes:

  http://autobuild.buildroot.net/results/d06/d0686b3e7b8884f93034d4ea4b79fa8590ffa221/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/aiccu/Config.in                       | 1 +
 package/connman/Config.in                     | 1 +
 package/dnsmasq/Config.in                     | 1 +
 package/gmp/Config.in                         | 2 ++
 package/gnutls/Config.in                      | 1 +
 package/gstreamer1/gst1-plugins-bad/Config.in | 1 +
 package/guile/Config.in                       | 1 +
 package/libmicrohttpd/Config.in               | 1 +
 package/libsoup/Config.in                     | 1 +
 package/midori/Config.in                      | 1 +
 package/mpc/Config.in                         | 1 +
 package/mpfr/Config.in                        | 1 +
 package/nettle/Config.in                      | 1 +
 package/network-manager/Config.in             | 1 +
 package/nftables/Config.in                    | 1 +
 package/ntfs-3g/Config.in                     | 1 +
 package/openswan/Config.in                    | 1 +
 package/php/Config.ext                        | 1 +
 package/python-pycrypto/Config.in             | 1 +
 package/python-pysnmp-apps/Config.in          | 1 +
 package/python-pysnmp-mibs/Config.in          | 3 ++-
 package/python-pysnmp/Config.in               | 1 +
 package/samba4/Config.in                      | 1 +
 package/sconeserver/Config.in                 | 1 +
 package/strongswan/Config.in                  | 1 +
 25 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/package/aiccu/Config.in b/package/aiccu/Config.in
index 4a0d20d..7bfdb96 100644
--- a/package/aiccu/Config.in
+++ b/package/aiccu/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_AICCU
 	bool "aiccu"
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # gnutls
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
diff --git a/package/connman/Config.in b/package/connman/Config.in
index ba238af..f891e3d 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -31,6 +31,7 @@ config BR2_PACKAGE_CONNMAN_WIFI
 
 config BR2_PACKAGE_CONNMAN_WISPR
 	bool "enable WISPr support"
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # gnutls
 	select BR2_PACKAGE_GNUTLS
 	help
 	  Enable support for Wireless Internet Service Provider
diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index 9e1c462..e1e3a82 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -22,6 +22,7 @@ config BR2_PACKAGE_DNSMASQ_DHCP
 
 config BR2_PACKAGE_DNSMASQ_DNSSEC
 	bool "DNSSEC support"
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # gmp, nettle
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_NETTLE
 	help
diff --git a/package/gmp/Config.in b/package/gmp/Config.in
index 226e088..b1f831e 100644
--- a/package/gmp/Config.in
+++ b/package/gmp/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_GMP
 	bool "gmp"
+	# gmplib not yet supported for MIPS R6
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6
 	help
 	  GNU Multiple Precision Arithmetic Library.
 
diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index ecb6756..4ebba68 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GNUTLS
 	bool "gnutls"
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # nettle
 	select BR2_PACKAGE_NETTLE
 	select BR2_PACKAGE_PCRE
 	depends on BR2_USE_WCHAR
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index f771401..694d5b7 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -629,6 +629,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS
 	bool "hls"
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # gnutls
 	select BR2_PACKAGE_GNUTLS
 	help
 	  Fragmented streaming plugins
diff --git a/package/guile/Config.in b/package/guile/Config.in
index d24f318..ed4e132 100644
--- a/package/guile/Config.in
+++ b/package/guile/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GUILE
 	bool "guile"
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # gmp
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS # bdwgc
 	depends on BR2_USE_WCHAR # libunistring
diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index d9e6493..12add7b 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -14,6 +14,7 @@ if BR2_PACKAGE_LIBMICROHTTPD
 
 config BR2_PACKAGE_LIBMICROHTTPD_SSL
 	bool "https support"
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # gnutls
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBGCRYPT
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index bc0ba95..16d4354 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -22,6 +22,7 @@ config BR2_PACKAGE_LIBSOUP_GNOME
 
 config BR2_PACKAGE_LIBSOUP_SSL
 	bool "https support"
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # gnutls
 	select BR2_PACKAGE_GLIB_NETWORKING
 	select BR2_PACKAGE_GNUTLS
 	help
diff --git a/package/midori/Config.in b/package/midori/Config.in
index 11a2806..3147848 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -28,6 +28,7 @@ if BR2_PACKAGE_MIDORI
 
 config BR2_PACKAGE_MIDORI_HTTPS
 	bool "HTTPS support"
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # gnutls
 	select BR2_PACKAGE_CA_CERTIFICATES # runtime
 	select BR2_PACKAGE_GLIB_NETWORKING
 	select BR2_PACKAGE_GNUTLS # for glib-networking
diff --git a/package/mpc/Config.in b/package/mpc/Config.in
index 8377013..16c2e15 100644
--- a/package/mpc/Config.in
+++ b/package/mpc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MPC
 	bool "mpc"
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # gmp, mpfr
 	select BR2_PACKAGE_MPFR
 	select BR2_PACKAGE_GMP
 	help
diff --git a/package/mpfr/Config.in b/package/mpfr/Config.in
index e02511f..13b0110 100644
--- a/package/mpfr/Config.in
+++ b/package/mpfr/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MPFR
 	bool "mpfr"
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # gmp
 	select BR2_PACKAGE_GMP
 	help
 	  C library for multiple-precision floating-point computations
diff --git a/package/nettle/Config.in b/package/nettle/Config.in
index 5577621..e609344 100644
--- a/package/nettle/Config.in
+++ b/package/nettle/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NETTLE
 	bool "nettle"
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # gmp
 	select BR2_PACKAGE_GMP
 	help
 	  Nettle is a cryptographic library that is designed to fit easily
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 5a0e636..771633f 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NETWORK_MANAGER
 	bool "networkmanager"
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # gnutls
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_PACKAGE_HAS_UDEV
 	# Tested with 3.2, but may even work with earlier versions
diff --git a/package/nftables/Config.in b/package/nftables/Config.in
index 9b20b90..110e01c 100644
--- a/package/nftables/Config.in
+++ b/package/nftables/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NFTABLES
 	bool "nftables"
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # gmp
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 	select BR2_PACKAGE_GMP
diff --git a/package/ntfs-3g/Config.in b/package/ntfs-3g/Config.in
index d6d1481..f162f75 100644
--- a/package/ntfs-3g/Config.in
+++ b/package/ntfs-3g/Config.in
@@ -18,6 +18,7 @@ if BR2_PACKAGE_NTFS_3G
 
 config BR2_PACKAGE_NTFS_3G_ENCRYPTED
 	bool "encrypted volumes"
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # gnutls
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBGCRYPT
 	help
diff --git a/package/openswan/Config.in b/package/openswan/Config.in
index 0370143..6f0ccd0 100644
--- a/package/openswan/Config.in
+++ b/package/openswan/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_OPENSWAN
 	bool "openswan"
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # gmp
 	depends on BR2_USE_MMU # iproute2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # iproute2
 	select BR2_PACKAGE_GMP
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 5324e79..48a3bdd 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -244,6 +244,7 @@ config BR2_PACKAGE_PHP_EXT_BCMATH
 
 config BR2_PACKAGE_PHP_EXT_GMP
 	bool "GMP"
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # gmp
 	select BR2_PACKAGE_GMP
 	help
 	  GNU Multiple Precision support
diff --git a/package/python-pycrypto/Config.in b/package/python-pycrypto/Config.in
index e998ecf..c471376 100644
--- a/package/python-pycrypto/Config.in
+++ b/package/python-pycrypto/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYCRYPTO
 	bool "python-pycrypto"
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # gmp
 	select BR2_PACKAGE_GMP
 	help
 	  PyCrypto is a collection of cryptographic algorithms and
diff --git a/package/python-pysnmp-apps/Config.in b/package/python-pysnmp-apps/Config.in
index b032eba..9b4a95d 100644
--- a/package/python-pysnmp-apps/Config.in
+++ b/package/python-pysnmp-apps/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYSNMP_APPS
 	bool "python-pysnmp-apps"
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # python-pysnmp
 	select BR2_PACKAGE_PYTHON_PYSNMP
 	depends on BR2_INSTALL_LIBSTDCPP # pysnmp -> pyasn
 	help
diff --git a/package/python-pysnmp-mibs/Config.in b/package/python-pysnmp-mibs/Config.in
index eca17d2..a84590d 100644
--- a/package/python-pysnmp-mibs/Config.in
+++ b/package/python-pysnmp-mibs/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_PYTHON_PYSNMP_MIBS
 	bool "python-pysnmp-mibs"
-	select BR2_PACKAGE_PYTHON_PYSNMP
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # python-pysnmp
 	depends on BR2_INSTALL_LIBSTDCPP # pysnmp -> pyasn
+	select BR2_PACKAGE_PYTHON_PYSNMP
 	help
 	  PySNMP MIBs is a set of IETF & IANA MIBs pre-compiled and
 	  packaged to simplify their use with the PySNMP library.
diff --git a/package/python-pysnmp/Config.in b/package/python-pysnmp/Config.in
index c7cdf38..94f993d 100644
--- a/package/python-pysnmp/Config.in
+++ b/package/python-pysnmp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYSNMP
 	bool "python-pysnmp"
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # python-pycrypto
 	depends on BR2_INSTALL_LIBSTDCPP # pyasn
 	select BR2_PACKAGE_PYTHON_PYASN
 	select BR2_PACKAGE_PYTHON_PYCRYPTO
diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index 1411b08..4d65dd3 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -30,6 +30,7 @@ if BR2_PACKAGE_SAMBA4
 
 config BR2_PACKAGE_SAMBA4_AD_DC
 	bool "AD DC"
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # gnutls
 	select BR2_PACKAGE_GNUTLS
 	help
 	  Enable Active Directory Domain Controller functionality.
diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 4083aa7..0c1383e 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -81,6 +81,7 @@ config BR2_PACKAGE_SCONESERVER_LETTUCE
 
 config BR2_PACKAGE_SCONESERVER_MATHS
 	bool "maths"
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # mpfr
 	select BR2_PACKAGE_MPFR
 	help
 	  Mathematics module for Sconeserver
diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index b26f1c7..2bd54c3 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -36,6 +36,7 @@ config BR2_PACKAGE_STRONGSWAN_GCRYPT
 
 config BR2_PACKAGE_STRONGSWAN_GMP
 	bool "GNU MP (libgmp)"
+	depends on !BR2_mips_32r6 && !BR2_mips_64r6 # gmp
 	select BR2_PACKAGE_GMP
 
 endchoice
-- 
2.4.10

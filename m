From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri,  8 Feb 2013 18:43:03 +0100
Subject: [Buildroot] [PATCH] strongswan: new package
Message-ID: <1360345383-8622-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

strongSwan is an OpenSource IPsec implementation for the
Linux operating system. It is based on the discontinued
FreeS/WAN project and the X.509 patch.

The focus is on:
     - simplicity of configuration
     - strong encryption and authentication methods
     - powerful IPsec policies supporting large and complex VPN networks

http://www.strongswan.org/

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/Config.in                |    1 +
 package/strongswan/Config.in     |  318 +++++++++++++++++++
 package/strongswan/strongswan.mk |  633 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 952 insertions(+)
 create mode 100644 package/strongswan/Config.in
 create mode 100644 package/strongswan/strongswan.mk

diff --git a/package/Config.in b/package/Config.in
index 8e4235b..383a0e0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -700,6 +700,7 @@ source "package/spawn-fcgi/Config.in"
 source "package/spice-protocol/Config.in"
 source "package/spice/Config.in"
 source "package/squid/Config.in"
+source "package/strongswan/Config.in"
 source "package/stunnel/Config.in"
 source "package/tcpdump/Config.in"
 source "package/tcpreplay/Config.in"
diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
new file mode 100644
index 0000000..b206bb8
--- /dev/null
+++ b/package/strongswan/Config.in
@@ -0,0 +1,318 @@
+menuconfig BR2_PACKAGE_STRONGSWAN
+	bool "strongswan"
+	help
+	  strongSwan is an OpenSource IPsec implementation for the 
+	  Linux operating system. It is based on the discontinued 
+	  FreeS/WAN project and the X.509 patch.
+
+	  The focus is on:
+	     - simplicity of configuration
+	     - strong encryption and authentication methods
+	     - powerful IPsec policies supporting large and complex VPN networks
+
+	  http://www.strongswan.org/
+
+if BR2_PACKAGE_STRONGSWAN
+config BR2_PACKAGE_STRONGSWAN_CURL
+	bool "enable CURL fetcher plugin to fetch files via libcurl"
+	select BR2_PACKAGE_LIBCURL
+config BR2_PACKAGE_STRONGSWAN_SOUP
+	bool "enable soup fetcher plugin to fetch from HTTP via libsoup"
+	select BR2_PACKAGE_LIBSOUP
+#config BR2_PACKAGE_STRONGSWAN_LDAP
+#	bool "enable LDAP fetching plugin to fetch files via libldap"
+#	select BR2_PACKAGE_LDAP
+config BR2_PACKAGE_STRONGSWAN_AES
+	default y
+	bool "enable AES software implementation plugin"
+config BR2_PACKAGE_STRONGSWAN_DES
+	default y
+	bool "enable DES/3DES software implementation plugin"
+config BR2_PACKAGE_STRONGSWAN_BLOWFISH
+	bool "enable Blowfish software implementation plugin"
+config BR2_PACKAGE_STRONGSWAN_MD4
+	bool "enable MD4 software implementation plugin"
+config BR2_PACKAGE_STRONGSWAN_MD5
+	default y
+	bool "enable MD5 software implementation plugin"
+config BR2_PACKAGE_STRONGSWAN_SHA1
+	default y
+	bool "enable SHA1 software implementation plugin"
+config BR2_PACKAGE_STRONGSWAN_SHA2
+	default y
+	bool "enable SHA256/SHA384/SHA512 software implementation plugin"
+config BR2_PACKAGE_STRONGSWAN_FIPS-PRF
+	default y
+	bool "enable FIPS PRF software implementation plugin"
+config BR2_PACKAGE_STRONGSWAN_GMP
+	default y
+	bool "enable GNU MP (libgmp) based crypto implementation plugin"
+	select BR2_PACKAGE_GMP
+config BR2_PACKAGE_STRONGSWAN_RANDOM
+	default y
+	bool "enable RNG implementation on top of /dev/(u)random"
+config BR2_PACKAGE_STRONGSWAN_NONCE
+	default y
+	bool "enable nonce generation plugin"
+config BR2_PACKAGE_STRONGSWAN_X509
+	default y
+	bool "enable X509 certificate implementation plugin"
+config BR2_PACKAGE_STRONGSWAN_REVOCATION
+	default y
+	bool "enable X509 CRL/OCSP revocation check plugin"
+config BR2_PACKAGE_STRONGSWAN_CONSTRAINTS
+	default y
+	bool "enable advanced X509 constraint checking plugin"
+config BR2_PACKAGE_STRONGSWAN_PUBKEY
+	default y
+	bool "enable RAW public key support plugin"
+config BR2_PACKAGE_STRONGSWAN_PKCS1
+	default y
+	bool "enable PKCS1 key decoding plugin"
+config BR2_PACKAGE_STRONGSWAN_PKCS8
+	default y
+	bool "enable PKCS8 private key decoding plugin"
+config BR2_PACKAGE_STRONGSWAN_PGP
+	default y
+	bool "enable PGP key decoding plugin"
+config BR2_PACKAGE_STRONGSWAN_DNSKEY
+	default y
+	bool "enable DNS RR key decoding plugin"
+config BR2_PACKAGE_STRONGSWAN_PEM
+	default y
+	bool "enable PEM decoding plugin"
+config BR2_PACKAGE_STRONGSWAN_HMAC
+	default y
+	bool "enable HMAC crypto implementation plugin"
+config BR2_PACKAGE_STRONGSWAN_CMAC
+	default y
+	bool "enable CMAC crypto implementation plugin"
+config BR2_PACKAGE_STRONGSWAN_XCBC
+	default y
+	bool "enable xcbc crypto implementation plugin"
+config BR2_PACKAGE_STRONGSWAN_AF-ALG
+	bool "enable AF_ALG crypto interface to Linux Crypto API"
+config BR2_PACKAGE_STRONGSWAN_TEST-VECTORS
+	bool "enable plugin providing crypto test vectors"
+# mysql_config is not installed in staging dir, so it does not work
+#config BR2_PACKAGE_STRONGSWAN_MYSQL
+#	bool "enable MySQL database support"
+#	select BR2_PACKAGE_MYSQL_CLIENT
+config BR2_PACKAGE_STRONGSWAN_SQLITE
+	bool "enable SQLite database support"
+	select BR2_PACKAGE_SQLITE
+config BR2_PACKAGE_STRONGSWAN_STROKE
+	default y
+	bool "enable charons stroke configuration backend"
+config BR2_PACKAGE_STRONGSWAN_SMP
+	bool "enable SMP configuration and control interface"
+	select BR2_PACKAGE_LIBXML2
+config BR2_PACKAGE_STRONGSWAN_SQL
+	bool "enable SQL database configuration backend"
+#config BR2_PACKAGE_STRONGSWAN_LEAK-DETECTIVE
+#	bool "enable malloc hooks to find memory leaks"
+config BR2_PACKAGE_STRONGSWAN_LOCK-PROFILER
+	bool "enable lock/mutex profiling code"
+config BR2_PACKAGE_STRONGSWAN_UNIT-TESTER
+	bool "enable unit tests on IKEv2 daemon startup"
+config BR2_PACKAGE_STRONGSWAN_LOAD-TESTER
+	bool "enable load testing plugin for IKEv2 daemon"
+config BR2_PACKAGE_STRONGSWAN_EAP-SIM
+	bool "enable SIM authentication module for EAP"
+config BR2_PACKAGE_STRONGSWAN_EAP-SIM-FILE
+	bool "enable EAP-SIM backend based on a triplet file"
+config BR2_PACKAGE_STRONGSWAN_EAP-SIM-PCSC
+	bool "enable EAP-SIM backend based on a smartcard reader"
+	select BR2_PACKAGE_PCSC_LITE
+config BR2_PACKAGE_STRONGSWAN_EAP-AKA
+	bool "enable EAP AKA authentication module"
+config BR2_PACKAGE_STRONGSWAN_EAP-AKA-3GPP2
+	bool "enable EAP AKA backend implementing 3GPP2 algorithms in software"
+	select BR2_PACKAGE_GMP
+config BR2_PACKAGE_STRONGSWAN_EAP-SIMAKA-SQL
+	bool "enable EAP-SIM/AKA backend based on a triplet/quintuplet SQL database"
+config BR2_PACKAGE_STRONGSWAN_EAP-SIMAKA-PSEUDONYM
+	bool "enable EAP-SIM/AKA pseudonym storage plugin"
+config BR2_PACKAGE_STRONGSWAN_EAP-SIMAKA-REAUTH
+	bool "enable EAP-SIM/AKA reauthentication data storage plugin"
+config BR2_PACKAGE_STRONGSWAN_EAP-IDENTITY
+	bool "enable EAP module providing EAP-Identity helper"
+config BR2_PACKAGE_STRONGSWAN_EAP-MD5
+	bool "enable EAP MD5 (CHAP) authentication module"
+config BR2_PACKAGE_STRONGSWAN_EAP-GTC
+	bool "enable EAP GTC authentication module"
+config BR2_PACKAGE_STRONGSWAN_EAP-MSCHAPV2
+	bool "enable EAP MS-CHAPv2 authentication module"
+config BR2_PACKAGE_STRONGSWAN_EAP-TLS
+	bool "enable EAP TLS authentication module"
+config BR2_PACKAGE_STRONGSWAN_EAP-TTLS
+	bool "enable EAP TTLS authentication module"
+config BR2_PACKAGE_STRONGSWAN_EAP-PEAP
+	bool "enable EAP PEAP authentication module"
+config BR2_PACKAGE_STRONGSWAN_EAP-TNC
+	bool "enable EAP TNC trusted network connect module"
+config BR2_PACKAGE_STRONGSWAN_EAP-DYNAMIC
+	bool "enable dynamic EAP proxy module"
+config BR2_PACKAGE_STRONGSWAN_EAP-RADIUS
+	bool "enable RADIUS proxy authentication module"
+config BR2_PACKAGE_STRONGSWAN_XAUTH-GENERIC
+	default y
+	bool "enable generic XAuth backend"
+config BR2_PACKAGE_STRONGSWAN_XAUTH-EAP
+	bool "enable XAuth backend using EAP methods to verify passwords"
+config BR2_PACKAGE_STRONGSWAN_XAUTH-PAM
+	bool "enable XAuth backend using PAM to verify passwords"
+	select BR2_PACKAGE_LINUX_PAM
+#config BR2_PACKAGE_STRONGSWAN_TNC-IFMAP
+#	bool "enable TNC IF-MAP module"
+#	select BR2_PACKAGE_AXIS2C
+config BR2_PACKAGE_STRONGSWAN_TNC-PDP
+	bool "enable TNC policy decision point module"
+config BR2_PACKAGE_STRONGSWAN_TNC-IMC
+	bool "enable TNC IMC module"
+config BR2_PACKAGE_STRONGSWAN_TNC-IMV
+	bool "enable TNC IMV module"
+config BR2_PACKAGE_STRONGSWAN_TNCCS-11
+	bool "enable TNCCS 1.1 protocol module"
+	select BR2_PACKAGE_LIBXML2
+config BR2_PACKAGE_STRONGSWAN_TNCCS-20
+	bool "enable TNCCS 2.0 protocol module"
+config BR2_PACKAGE_STRONGSWAN_TNCCS-DYNAMIC
+	bool "enable dynamic TNCCS protocol discovery module"
+config BR2_PACKAGE_STRONGSWAN_IMC-TEST
+	bool "enable IMC test module"
+config BR2_PACKAGE_STRONGSWAN_IMV-TEST
+	bool "enable IMV test module"
+config BR2_PACKAGE_STRONGSWAN_IMC-SCANNER
+	bool "enable IMC port scanner module"
+config BR2_PACKAGE_STRONGSWAN_IMV-SCANNER
+	bool "enable IMV port scanner module"
+#config BR2_PACKAGE_STRONGSWAN_IMC-ATTESTATION
+#	bool "enable IMC attestation module"
+#	select LIBTSPI
+#config BR2_PACKAGE_STRONGSWAN_IMV-ATTESTATION
+#	bool "enable IMV attestation module"
+#	select LIBTSPI
+config BR2_PACKAGE_STRONGSWAN_NETLINK
+	default y
+	bool "enable the netlink kernel interface"
+config BR2_PACKAGE_STRONGSWAN_KERNEL-PFKEY
+	bool "enable the PF_KEY kernel interface"
+config BR2_PACKAGE_STRONGSWAN_KERNEL-PFROUTE
+	bool "enable the PF_ROUTE kernel interface"
+config BR2_PACKAGE_STRONGSWAN_KERNEL-KLIPS
+	bool "enable the KLIPS kernel interface"
+config BR2_PACKAGE_STRONGSWAN_LIBIPSEC
+	bool "enable user space IPsec implementation"
+config BR2_PACKAGE_STRONGSWAN_SOCKET-DEFAULT
+	default y
+	bool "enable default socket implementation for charon"
+config BR2_PACKAGE_STRONGSWAN_SOCKET-DYNAMIC
+	bool "enable dynamic socket implementation for charon"
+config BR2_PACKAGE_STRONGSWAN_FARP
+	bool "enable ARP faking plugin that responds to ARP requests to peers virtual IP"
+#config BR2_PACKAGE_STRONGSWAN_DUMM
+#	bool "enable the DUMM UML test framework"
+#	select BR2_PACKAGE_LIBGTK2 
+#	select BR2_PACKAGE_VTE
+#config BR2_PACKAGE_STRONGSWAN_FAST
+#	bool "enable libfast (FastCGI Application Server w/ templates)"
+#	select BR2_PACKAGE_
+#config BR2_PACKAGE_STRONGSWAN_MANAGER
+#	bool "enable web management console (proof of concept)"
+#	select BR2_PACKAGE_STRONGSWAN_FAST
+config BR2_PACKAGE_STRONGSWAN_MEDIATION
+	bool "enable IKEv2 Mediation Extension"
+
+if BR2_PACKAGE_STRONGSWAN_MEDIATION
+#config BR2_PACKAGE_STRONGSWAN_MEDSRV
+#	bool "enable mediation server web frontend and daemon plugin"
+#	select BR2_PACKAGE_STRONGSWAN_FAST
+config BR2_PACKAGE_STRONGSWAN_MEDCLI
+	bool "enable mediation client configuration database plugin"
+endif
+
+config BR2_PACKAGE_STRONGSWAN_INTEGRITY-TEST
+	bool "enable integrity testing of libstrongswan and plugins"
+config BR2_PACKAGE_STRONGSWAN_LOAD-WARNING
+	default y
+	bool "enable the charon plugin load option warning in starter"
+config BR2_PACKAGE_STRONGSWAN_IKEV1
+	default y
+	bool "enable IKEv1 protocol support in charon"
+config BR2_PACKAGE_STRONGSWAN_IKEV2
+	default y
+	bool "enable IKEv2 protocol support in charon"
+config BR2_PACKAGE_STRONGSWAN_CHARON
+	default y
+	bool "enable the IKEv1/IKEv2 keying daemon charon"
+config BR2_PACKAGE_STRONGSWAN_TOOLS
+	default y
+	bool "enable additional utilities (openac, scepclient and pki)"
+config BR2_PACKAGE_STRONGSWAN_SCRIPTS
+	default y
+	bool "enable additional utilities (found in directory scripts)"
+config BR2_PACKAGE_STRONGSWAN_CONFTEST
+	bool "enforce Suite B conformance test framework"
+config BR2_PACKAGE_STRONGSWAN_UPDOWN
+	default y
+	bool "enable updown firewall script plugin"
+config BR2_PACKAGE_STRONGSWAN_ATTR
+	default y
+	bool "enable strongswan.conf based configuration attribute plugin"
+config BR2_PACKAGE_STRONGSWAN_ATTR-SQL
+	bool "enable SQL based configuration attribute plugin"
+config BR2_PACKAGE_STRONGSWAN_DHCP
+	bool "enable DHCP based attribute provider plugin"
+config BR2_PACKAGE_STRONGSWAN_RESOLVE
+	default y
+	bool "enable resolve DNS handler plugin"
+config BR2_PACKAGE_STRONGSWAN_PADLOCK
+	bool "enables VIA Padlock crypto plugin"
+	depends on (BR2_i386 || BR2_x86_64)
+config BR2_PACKAGE_STRONGSWAN_OPENSSL
+	bool "enables the OpenSSL crypto plugin"
+config BR2_PACKAGE_STRONGSWAN_GCRYPT
+	bool "enables the libgcrypt plugin"
+	select LIBGCRYPT
+config BR2_PACKAGE_STRONGSWAN_AGENT
+	bool "enables the ssh-agent signing plugin"
+config BR2_PACKAGE_STRONGSWAN_PKCS11
+	bool "enables the PKCS11 token support plugin"
+config BR2_PACKAGE_STRONGSWAN_CTR
+	bool "enables the Counter Mode wrapper crypto plugin"
+config BR2_PACKAGE_STRONGSWAN_CCM
+	bool "enables the CCM AEAD wrapper crypto plugin"
+config BR2_PACKAGE_STRONGSWAN_GCM
+	bool "enables the GCM AEAD wrapper crypto plugin"
+config BR2_PACKAGE_STRONGSWAN_ADDRBLOCK
+	bool "enables RFC 3779 address block constraint support"
+config BR2_PACKAGE_STRONGSWAN_UNITY
+	bool "enables Cisco Unity extension plugin"
+#config BR2_PACKAGE_STRONGSWAN_UCI
+#	bool "enable OpenWRT UCI configuration plugin"
+#	select BR2_PACKAGE_LIBUCI
+#config BR2_PACKAGE_STRONGSWAN_ANDROID
+#	bool "enable Android specific plugin"
+#config BR2_PACKAGE_STRONGSWAN_ANDROID-LOG
+#	bool "enable Android specific logger plugin"
+#config BR2_PACKAGE_STRONGSWAN_MAEMO
+#	bool "enable Maemo specific plugin"
+config BR2_PACKAGE_STRONGSWAN_NM
+	bool "enable NetworkManager backend"
+	select BR2_PACKAGE_NETWORK_MANAGER
+config BR2_PACKAGE_STRONGSWAN_HA
+	bool "enable high availability cluster plugin"
+config BR2_PACKAGE_STRONGSWAN_WHITELIST
+	bool "enable peer identity whitelisting plugin"
+config BR2_PACKAGE_STRONGSWAN_CERTEXPIRE
+	bool "enable CSV export of expiration dates of used certificates"
+config BR2_PACKAGE_STRONGSWAN_LED
+	bool "enable plugin to control LEDs on IKEv2 activity using the Linux kernel LED subsystem"
+config BR2_PACKAGE_STRONGSWAN_DUPLICHECK
+	bool "advanced duplicate checking plugin using liveness checks"
+config BR2_PACKAGE_STRONGSWAN_COUPLING
+	bool "enable IKEv2 plugin to couple peer certificates permanently to authentication"
+config BR2_PACKAGE_STRONGSWAN_RADATTR
+	bool "enable plugin to inject and process custom RADIUS attributes as IKEv2 client"
+endif
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
new file mode 100644
index 0000000..5d7712b
--- /dev/null
+++ b/package/strongswan/strongswan.mk
@@ -0,0 +1,633 @@
+#############################################################
+#
+# strongSwan
+#
+#############################################################
+
+STRONGSWAN_VERSION = 5.0.1
+STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
+STRONGSWAN_SITE = http://download.strongswan.org
+#STRONGSWAN_DEPENDENCIES = host-bison
+
+ifeq ($(BR2_PACKAGE_STRONGSWAN_CURL),y)
+	STRONGSWAN_DEPENDENCIES += libcurl
+	STRONGSWAN_CONF_OPT += --enable-curl
+else
+	STRONGSWAN_CONF_OPT += --disable-curl
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_SOUP),y)
+	STRONGSWAN_DEPENDENCIES += libsoup
+	STRONGSWAN_CONF_OPT += --enable-soup
+else
+	STRONGSWAN_CONF_OPT += --disable-soup
+endif
+#ifeq ($(BR2_PACKAGE_STRONGSWAN_LDAP),y)
+#	STRONGSWAN_DEPENDENCIES += openldap
+#	STRONGSWAN_CONF_OPT += --enable-ldap
+#else
+#	STRONGSWAN_CONF_OPT += --disable-ldap
+#endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_AES),y)
+	STRONGSWAN_CONF_OPT += --enable-aes
+else
+	STRONGSWAN_CONF_OPT += --disable-aes
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_DES),y)
+	STRONGSWAN_CONF_OPT += --enable-des
+else
+	STRONGSWAN_CONF_OPT += --disable-des
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_BLOWFISH),y)
+	STRONGSWAN_CONF_OPT += --enable-blowfish
+else
+	STRONGSWAN_CONF_OPT += --disable-blowfish
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_MD4),y)
+	STRONGSWAN_CONF_OPT += --enable-md4
+else
+	STRONGSWAN_CONF_OPT += --disable-md4
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_MD5),y)
+	STRONGSWAN_CONF_OPT += --enable-md5
+else
+	STRONGSWAN_CONF_OPT += --disable-md5
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_SHA1),y)
+	STRONGSWAN_CONF_OPT += --enable-sha1
+else
+	STRONGSWAN_CONF_OPT += --disable-sha1
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_SHA2),y)
+	STRONGSWAN_CONF_OPT += --enable-sha2
+else
+	STRONGSWAN_CONF_OPT += --disable-sha2
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_FIPS-PRF),y)
+	STRONGSWAN_CONF_OPT += --enable-fips-prf
+else
+	STRONGSWAN_CONF_OPT += --disable-fips-prf
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_GMP),y)
+	STRONGSWAN_DEPENDENCIES += gmp
+	STRONGSWAN_CONF_OPT += --enable-gmp
+else
+	STRONGSWAN_CONF_OPT += --disable-gmp
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_RANDOM),y)
+	STRONGSWAN_CONF_OPT += --enable-random
+else
+	STRONGSWAN_CONF_OPT += --disable-random
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_NONCE),y)
+	STRONGSWAN_CONF_OPT += --enable-nonce
+else
+	STRONGSWAN_CONF_OPT += --disable-nonce
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_X509),y)
+	STRONGSWAN_CONF_OPT += --enable-x509
+else
+	STRONGSWAN_CONF_OPT += --disable-x509
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_REVOCATION),y)
+	STRONGSWAN_CONF_OPT += --enable-revocation
+else
+	STRONGSWAN_CONF_OPT += --disable-revocation
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_CONSTRAINTS),y)
+	STRONGSWAN_CONF_OPT += --enable-constraints
+else
+	STRONGSWAN_CONF_OPT += --disable-constraints
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_PUBKEY),y)
+	STRONGSWAN_CONF_OPT += --enable-pubkey
+else
+	STRONGSWAN_CONF_OPT += --disable-pubkey
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_PKCS1),y)
+	STRONGSWAN_CONF_OPT += --enable-pkcs1
+else
+	STRONGSWAN_CONF_OPT += --disable-pkcs1
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_PKCS8),y)
+	STRONGSWAN_CONF_OPT += --enable-pkcs8
+else
+	STRONGSWAN_CONF_OPT += --disable-pkcs8
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_PGP),y)
+	STRONGSWAN_CONF_OPT += --enable-pgp
+else
+	STRONGSWAN_CONF_OPT += --disable-pgp
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_DNSKEY),y)
+	STRONGSWAN_CONF_OPT += --enable-dnskey
+else
+	STRONGSWAN_CONF_OPT += --disable-dnskey
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_PEM),y)
+	STRONGSWAN_CONF_OPT += --enable-pem
+else
+	STRONGSWAN_CONF_OPT += --disable-pem
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_HMAC),y)
+	STRONGSWAN_CONF_OPT += --enable-hmac
+else
+	STRONGSWAN_CONF_OPT += --disable-hmac
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_CMAC),y)
+	STRONGSWAN_CONF_OPT += --enable-cmac
+else
+	STRONGSWAN_CONF_OPT += --disable-cmac
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_XCBC),y)
+	STRONGSWAN_CONF_OPT += --enable-xcbc
+else
+	STRONGSWAN_CONF_OPT += --disable-xcbc
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_AF-ALG),y)
+	STRONGSWAN_CONF_OPT += --enable-af-alg
+else
+	STRONGSWAN_CONF_OPT += --disable-af-alg
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_TEST-VECTORS),y)
+	STRONGSWAN_CONF_OPT += --enable-test-vectors
+else
+	STRONGSWAN_CONF_OPT += --disable-test-vectors
+endif
+#ifeq ($(BR2_PACKAGE_STRONGSWAN_MYSQL),y)
+#	STRONGSWAN_DEPENDENCIES += mysql_client
+#	STRONGSWAN_CONF_OPT += --enable-mysql
+#else
+#	STRONGSWAN_CONF_OPT += --disable-mysql
+#endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_SQLITE),y)
+	STRONGSWAN_DEPENDENCIES += sqlite
+	STRONGSWAN_CONF_OPT += --enable-sqlite
+else
+	STRONGSWAN_CONF_OPT += --disable-sqlite
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_STROKE),y)
+	STRONGSWAN_CONF_OPT += --enable-stroke
+else
+	STRONGSWAN_CONF_OPT += --disable-stroke
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_MEDSRV),y)
+	STRONGSWAN_CONF_OPT += --enable-medsrv
+else
+	STRONGSWAN_CONF_OPT += --disable-medsrv
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_MEDCLI),y)
+	STRONGSWAN_CONF_OPT += --enable-medcli
+else
+	STRONGSWAN_CONF_OPT += --disable-medcli
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_SMP),y)
+	STRONGSWAN_DEPENDENCIES += libxml2
+	STRONGSWAN_CONF_OPT += --enable-smp
+else
+	STRONGSWAN_CONF_OPT += --disable-smp
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_SQL),y)
+	STRONGSWAN_CONF_OPT += --enable-sql
+else
+	STRONGSWAN_CONF_OPT += --disable-sql
+endif
+# Not work?
+#ifeq ($(BR2_PACKAGE_STRONGSWAN_LEAK-DETECTIVE),y)
+#	STRONGSWAN_CONF_OPT += --enable-leak-detective
+#else
+#	STRONGSWAN_CONF_OPT += --disable-leak-detective
+#endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_LOCK-PROFILER),y)
+	STRONGSWAN_CONF_OPT += --enable-lock-profiler
+else
+	STRONGSWAN_CONF_OPT += --disable-lock-profiler
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_UNIT-TESTER),y)
+	STRONGSWAN_CONF_OPT += --enable-unit-tester
+else
+	STRONGSWAN_CONF_OPT += --disable-unit-tester
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_LOAD-TESTER),y)
+	STRONGSWAN_CONF_OPT += --enable-load-tester
+else
+	STRONGSWAN_CONF_OPT += --disable-load-tester
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP-SIM),y)
+	STRONGSWAN_CONF_OPT += --enable-eap-sim
+else
+	STRONGSWAN_CONF_OPT += --disable-eap-sim
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP-SIM-FILE),y)
+	STRONGSWAN_CONF_OPT += --enable-eap-sim-file
+else
+	STRONGSWAN_CONF_OPT += --disable-eap-sim-file
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP-SIM-PCSC),y)
+	STRONGSWAN_DEPENDENCIES += pcsc-lite
+	STRONGSWAN_CONF_OPT += --enable-eap-sim-pcsc
+else
+	STRONGSWAN_CONF_OPT += --disable-eap-sim-pcsc
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP-AKA),y)
+	STRONGSWAN_CONF_OPT += --enable-eap-aka
+else
+	STRONGSWAN_CONF_OPT += --disable-eap-aka
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP-AKA-3GPP2),y)
+	STRONGSWAN_CONF_OPT += --enable-eap-aka-3gpp2
+else
+	STRONGSWAN_CONF_OPT += --disable-eap-aka-3gpp2
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP-SIMAKA-SQL),y)
+	STRONGSWAN_CONF_OPT += --enable-eap-simaka-sql
+else
+	STRONGSWAN_CONF_OPT += --disable-eap-simaka-sql
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP-SIMAKA-PSEUDONYM),y)
+	STRONGSWAN_CONF_OPT += --enable-eap-simaka-pseudonym
+else
+	STRONGSWAN_CONF_OPT += --disable-eap-simaka-pseudonym
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP-SIMAKA-REAUTH),y)
+	STRONGSWAN_CONF_OPT += --enable-eap-simaka-reauth
+else
+	STRONGSWAN_CONF_OPT += --disable-eap-simaka-reauth
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP-IDENTITY),y)
+	STRONGSWAN_CONF_OPT += --enable-eap-identity
+else
+	STRONGSWAN_CONF_OPT += --disable-eap-identity
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP-MD5),y)
+	STRONGSWAN_CONF_OPT += --enable-eap-md5
+else
+	STRONGSWAN_CONF_OPT += --disable-eap-md5
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP-GTC),y)
+	STRONGSWAN_CONF_OPT += --enable-eap-gtc
+else
+	STRONGSWAN_CONF_OPT += --disable-eap-gtc
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP-MSCHAPV2),y)
+	STRONGSWAN_CONF_OPT += --enable-eap-mschapv2
+else
+	STRONGSWAN_CONF_OPT += --disable-eap-mschapv2
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP-TLS),y)
+	STRONGSWAN_CONF_OPT += --enable-eap-tls
+else
+	STRONGSWAN_CONF_OPT += --disable-eap-tls
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP-TTLS),y)
+	STRONGSWAN_CONF_OPT += --enable-eap-ttls
+else
+	STRONGSWAN_CONF_OPT += --disable-eap-ttls
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP-PEAP),y)
+	STRONGSWAN_CONF_OPT += --enable-eap-peap
+else
+	STRONGSWAN_CONF_OPT += --disable-eap-peap
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP-TNC),y)
+	STRONGSWAN_CONF_OPT += --enable-eap-tnc
+else
+	STRONGSWAN_CONF_OPT += --disable-eap-tnc
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP-DYNAMIC),y)
+	STRONGSWAN_CONF_OPT += --enable-eap-dynamic
+else
+	STRONGSWAN_CONF_OPT += --disable-eap-dynamic
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP-RADIUS),y)
+	STRONGSWAN_CONF_OPT += --enable-eap-radius
+else
+	STRONGSWAN_CONF_OPT += --disable-eap-radius
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_XAUTH-GENERIC),y)
+	STRONGSWAN_CONF_OPT += --enable-xauth-generic
+else
+	STRONGSWAN_CONF_OPT += --disable-xauth-generic
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_XAUTH-EAP),y)
+	STRONGSWAN_CONF_OPT += --enable-xauth-eap
+else
+	STRONGSWAN_CONF_OPT += --disable-xauth-eap
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_XAUTH-PAM),y)
+	STRONGSWAN_DEPENDENCIES += linux-pam
+	STRONGSWAN_CONF_OPT += --enable-xauth-pam
+else
+	STRONGSWAN_CONF_OPT += --disable-xauth-pam
+endif
+#ifeq ($(BR2_PACKAGE_STRONGSWAN_TNC-IFMAP),y)
+#	STRONGSWAN_DEPENDENCIES += axis2c
+#	STRONGSWAN_CONF_OPT += --enable-tnc-ifmap
+#else
+#	STRONGSWAN_CONF_OPT += --disable-tnc-ifmap
+#endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_TNC-PDP),y)
+	STRONGSWAN_CONF_OPT += --enable-tnc-pdp
+else
+	STRONGSWAN_CONF_OPT += --disable-tnc-pdp
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_TNC-IMC),y)
+	STRONGSWAN_CONF_OPT += --enable-tnc-imc
+else
+	STRONGSWAN_CONF_OPT += --disable-tnc-imc
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_TNC-IMV),y)
+	STRONGSWAN_CONF_OPT += --enable-tnc-imv
+else
+	STRONGSWAN_CONF_OPT += --disable-tnc-imv
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_TNCCS-11),y)
+	STRONGSWAN_DEPENDENCIES += libxml2
+	STRONGSWAN_CONF_OPT += --enable-tnccs-11
+else
+	STRONGSWAN_CONF_OPT += --disable-tnccs-11
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_TNCCS-20),y)
+	STRONGSWAN_CONF_OPT += --enable-tnccs-20
+else
+	STRONGSWAN_CONF_OPT += --disable-tnccs-20
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_TNCCS-DYNAMIC),y)
+	STRONGSWAN_CONF_OPT += --enable-tnccs-dynamic
+else
+	STRONGSWAN_CONF_OPT += --disable-tnccs-dynamic
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_IMC-TEST),y)
+	STRONGSWAN_CONF_OPT += --enable-imc-test
+else
+	STRONGSWAN_CONF_OPT += --disable-imc-test
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_IMV-TEST),y)
+	STRONGSWAN_CONF_OPT += --enable-imv-test
+else
+	STRONGSWAN_CONF_OPT += --disable-imv-test
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_IMC-SCANNER),y)
+	STRONGSWAN_CONF_OPT += --enable-imc-scanner
+else
+	STRONGSWAN_CONF_OPT += --disable-imc-scanner
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_IMV-SCANNER),y)
+	STRONGSWAN_CONF_OPT += --enable-imv-scanner
+else
+	STRONGSWAN_CONF_OPT += --disable-imv-scanner
+endif
+# ifeq ($(BR2_PACKAGE_STRONGSWAN_IMC-ATTESTATION),y)
+#	STRONGSWAN_DEPENDENCIES += libtspi
+# 	STRONGSWAN_CONF_OPT += --enable-imc-attestation
+# else
+# 	STRONGSWAN_CONF_OPT += --disable-imc-attestation
+# endif
+# ifeq ($(BR2_PACKAGE_STRONGSWAN_IMV-ATTESTATION),y)
+#	STRONGSWAN_DEPENDENCIES += libtspi
+# 	STRONGSWAN_CONF_OPT += --enable-imv-attestation
+# else
+# 	STRONGSWAN_CONF_OPT += --disable-imv-attestation
+# endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_KERNEL-NETLINK),y)
+	STRONGSWAN_CONF_OPT += --enable-kernel-netlink
+else
+	STRONGSWAN_CONF_OPT += --disable-kernel-netlink
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_KERNEL-PFKEY),y)
+	STRONGSWAN_CONF_OPT += --enable-kernel-pfkey
+else
+	STRONGSWAN_CONF_OPT += --disable-kernel-pfkey
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_KERNEL-PFROUTE),y)
+	STRONGSWAN_CONF_OPT += --enable-kernel-pfroute
+else
+	STRONGSWAN_CONF_OPT += --disable-kernel-pfroute
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_KERNEL-KLIPS),y)
+	STRONGSWAN_CONF_OPT += --enable-kernel-klips
+else
+	STRONGSWAN_CONF_OPT += --disable-kernel-klips
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_LIBIPSEC),y)
+	STRONGSWAN_CONF_OPT += --enable-libipsec
+else
+	STRONGSWAN_CONF_OPT += --disable-libipsec
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_SOCKET-DEFAULT),y)
+	STRONGSWAN_CONF_OPT += --enable-socket-default
+else
+	STRONGSWAN_CONF_OPT += --disable-socket-default
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_SOCKET-DYNAMIC),y)
+	STRONGSWAN_CONF_OPT += --enable-socket-dynamic
+else
+	STRONGSWAN_CONF_OPT += --disable-socket-dynamic
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_FARP),y)
+	STRONGSWAN_CONF_OPT += --enable-farp
+else
+	STRONGSWAN_CONF_OPT += --disable-farp
+endif
+#ifeq ($(BR2_PACKAGE_STRONGSWAN_DUMM),y)
+#	STRONGSWAN_DEPENDENCIES += libgtk2 vte
+#	STRONGSWAN_CONF_OPT += --enable-dumm
+#else
+#	STRONGSWAN_CONF_OPT += --disable-dumm
+#endif
+#ifeq ($(BR2_PACKAGE_STRONGSWAN_FAST),y)
+#	STRONGSWAN_DEPENDENCIES += neo_cgi
+#	STRONGSWAN_CONF_OPT += --enable-fast
+#else
+#	STRONGSWAN_CONF_OPT += --disable-fast
+#endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_MANAGER),y)
+	STRONGSWAN_CONF_OPT += --enable-manager
+else
+	STRONGSWAN_CONF_OPT += --disable-manager
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_MEDIATION),y)
+	STRONGSWAN_CONF_OPT += --enable-mediation
+else
+	STRONGSWAN_CONF_OPT += --disable-mediation
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_INTEGRITY-TEST),y)
+	STRONGSWAN_CONF_OPT += --enable-integrity-test
+else
+	STRONGSWAN_CONF_OPT += --disable-integrity-test
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_LOAD-WARNING),y)
+	STRONGSWAN_CONF_OPT += --enable-load-warning
+else
+	STRONGSWAN_CONF_OPT += --disable-load-warning
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_IKEV1),y)
+	STRONGSWAN_CONF_OPT += --enable-ikev1
+else
+	STRONGSWAN_CONF_OPT += --disable-ikev1
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_IKEV2),y)
+	STRONGSWAN_CONF_OPT += --enable-ikev2
+else
+	STRONGSWAN_CONF_OPT += --disable-ikev2
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_CHARON),y)
+	STRONGSWAN_CONF_OPT += --enable-charon
+else
+	STRONGSWAN_CONF_OPT += --disable-charon
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_TOOLS),y)
+	STRONGSWAN_CONF_OPT += --enable-tools
+else
+	STRONGSWAN_CONF_OPT += --disable-tools
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_SCRIPTS),y)
+	STRONGSWAN_CONF_OPT += --enable-scripts
+else
+	STRONGSWAN_CONF_OPT += --disable-scripts
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_CONFTEST),y)
+	STRONGSWAN_CONF_OPT += --enable-conftest
+else
+	STRONGSWAN_CONF_OPT += --disable-conftest
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_UPDOWN),y)
+	STRONGSWAN_CONF_OPT += --enable-updown
+else
+	STRONGSWAN_CONF_OPT += --disable-updown
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_ATTR),y)
+	STRONGSWAN_CONF_OPT += --enable-attr
+else
+	STRONGSWAN_CONF_OPT += --disable-attr
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_ATTR-SQL),y)
+	STRONGSWAN_CONF_OPT += --enable-attr-sql
+else
+	STRONGSWAN_CONF_OPT += --disable-attr-sql
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_DHCP),y)
+	STRONGSWAN_CONF_OPT += --enable-dhcp
+else
+	STRONGSWAN_CONF_OPT += --disable-dhcp
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_RESOLVE),y)
+	STRONGSWAN_CONF_OPT += --enable-resolve
+else
+	STRONGSWAN_CONF_OPT += --disable-resolve
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_PADLOCK),y)
+	STRONGSWAN_CONF_OPT += --enable-padlock
+else
+	STRONGSWAN_CONF_OPT += --disable-padlock
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_OPENSSL),y)
+	STRONGSWAN_CONF_OPT += --enable-openssl
+else
+	STRONGSWAN_CONF_OPT += --disable-openssl
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_GCRYPT),y)
+	STRONGSWAN_DEPENDENCIES += libgcrypt
+	STRONGSWAN_CONF_OPT += --enable-gcrypt
+else
+	STRONGSWAN_CONF_OPT += --disable-gcrypt
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_AGENT),y)
+	STRONGSWAN_CONF_OPT += --enable-agent
+else
+	STRONGSWAN_CONF_OPT += --disable-agent
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_PKCS11),y)
+	STRONGSWAN_CONF_OPT += --enable-pkcs11
+else
+	STRONGSWAN_CONF_OPT += --disable-pkcs11
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_CTR),y)
+	STRONGSWAN_CONF_OPT += --enable-ctr
+else
+	STRONGSWAN_CONF_OPT += --disable-ctr
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_CCM),y)
+	STRONGSWAN_CONF_OPT += --enable-ccm
+else
+	STRONGSWAN_CONF_OPT += --disable-ccm
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_GCM),y)
+	STRONGSWAN_CONF_OPT += --enable-gcm
+else
+	STRONGSWAN_CONF_OPT += --disable-gcm
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_ADDRBLOCK),y)
+	STRONGSWAN_CONF_OPT += --enable-addrblock
+else
+	STRONGSWAN_CONF_OPT += --disable-addrblock
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_UNITY),y)
+	STRONGSWAN_CONF_OPT += --enable-unity
+else
+	STRONGSWAN_CONF_OPT += --disable-unity
+endif
+#ifeq ($(BR2_PACKAGE_STRONGSWAN_UCI),y)
+#	STRONGSWAN_DEPENDENCIES += libuci
+#	STRONGSWAN_CONF_OPT += --enable-uci
+#else
+#	STRONGSWAN_CONF_OPT += --disable-uci
+#endif
+#ifeq ($(BR2_PACKAGE_STRONGSWAN_ANDROID),y)
+#	STRONGSWAN_CONF_OPT += --enable-android
+#else
+#	STRONGSWAN_CONF_OPT += --disable-android
+#endif
+#ifeq ($(BR2_PACKAGE_STRONGSWAN_ANDROID-LOG),y)
+#	STRONGSWAN_CONF_OPT += --enable-android-log
+#else
+#	STRONGSWAN_CONF_OPT += --disable-android-log
+#endif
+#ifeq ($(BR2_PACKAGE_STRONGSWAN_MAEMO),y)
+#	STRONGSWAN_CONF_OPT += --enable-maemo
+#else
+#	STRONGSWAN_CONF_OPT += --disable-maemo
+#endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_NM),y)
+	STRONGSWAN_DEPENDENCIES += network-manager
+	STRONGSWAN_CONF_OPT += --enable-nm
+else
+	STRONGSWAN_CONF_OPT += --disable-nm
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_HA),y)
+	STRONGSWAN_CONF_OPT += --enable-ha
+else
+	STRONGSWAN_CONF_OPT += --disable-ha
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_WHITELIST),y)
+	STRONGSWAN_CONF_OPT += --enable-whitelist
+else
+	STRONGSWAN_CONF_OPT += --disable-whitelist
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_CERTEXPIRE),y)
+	STRONGSWAN_CONF_OPT += --enable-certexpire
+else
+	STRONGSWAN_CONF_OPT += --disable-certexpire
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_LED),y)
+	STRONGSWAN_CONF_OPT += --enable-led
+else
+	STRONGSWAN_CONF_OPT += --disable-led
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_DUPLICHECK),y)
+	STRONGSWAN_CONF_OPT += --enable-duplicheck
+else
+	STRONGSWAN_CONF_OPT += --disable-duplicheck
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_COUPLING),y)
+	STRONGSWAN_CONF_OPT += --enable-coupling
+else
+	STRONGSWAN_CONF_OPT += --disable-coupling
+endif
+ifeq ($(BR2_PACKAGE_STRONGSWAN_RADATTR),y)
+	STRONGSWAN_CONF_OPT += --enable-radattr
+else
+	STRONGSWAN_CONF_OPT += --disable-radattr
+endif
+
+$(eval $(autotools-package))
+
-- 
1.7.9.5

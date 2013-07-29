From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jul 2013 23:53:24 +0200
Subject: [Buildroot] [git commit] strongswan: new package
Message-ID: <20130729215322.200A39AE2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=89719fce718091d18a6f30b051ab0bd08e89ce89
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

strongSwan is an OpenSource IPsec implementation for the Linux
operating system. It is based on the discontinued FreeS/WAN project
and the X.509 patch.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |    1 +
 package/strongswan/Config.in     |  115 ++++++++++++++++++++++++++++++++++++++
 package/strongswan/strongswan.mk |   68 ++++++++++++++++++++++
 3 files changed, 184 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 6dfab7b..a653809 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -813,6 +813,7 @@ source "package/spawn-fcgi/Config.in"
 source "package/spice-protocol/Config.in"
 source "package/spice/Config.in"
 source "package/squid/Config.in"
+source "package/strongswan/Config.in"
 source "package/stunnel/Config.in"
 source "package/tcpdump/Config.in"
 source "package/tcpreplay/Config.in"
diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
new file mode 100644
index 0000000..98f8da2
--- /dev/null
+++ b/package/strongswan/Config.in
@@ -0,0 +1,115 @@
+menuconfig BR2_PACKAGE_STRONGSWAN
+	bool "strongswan"
+	depends on BR2_USE_MMU # fork()
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
+	  strongSwan provide many plugins. Only a few are presented here.
+
+	  http://www.strongswan.org/
+
+if BR2_PACKAGE_STRONGSWAN
+
+comment "kernel-netlink and socket-default options require a toolchain with IPV6 support"
+	depends on !BR2_INET_IPV6
+
+choice
+	prompt "Cryptographic backend"
+	default BR2_PACKAGE_STRONGSWAN_GMP
+
+config BR2_PACKAGE_STRONGSWAN_OPENSSL
+	bool "OpenSSL"
+	select BR2_PACKAGE_OPENSSL
+
+config BR2_PACKAGE_STRONGSWAN_GCRYPT
+	bool "libgcrypt"
+	select BR2_PACKAGE_LIBGCRYPT
+
+config BR2_PACKAGE_STRONGSWAN_GMP
+	bool "GNU MP (libgmp)"
+	select BR2_PACKAGE_GMP
+
+endchoice
+
+config BR2_PACKAGE_STRONGSWAN_AF_ALG
+	bool "Enable AF_ALG crypto interface to Linux Crypto API"
+
+config BR2_PACKAGE_STRONGSWAN_CURL
+	bool "Enable CURL fetcher plugin to fetch files via libcurl"
+	select BR2_PACKAGE_LIBCURL
+
+config BR2_PACKAGE_STRONGSWAN_CHARON
+	bool "Enable the IKEv1/IKEv2 keying daemon charon"
+	default y
+
+if BR2_PACKAGE_STRONGSWAN_CHARON
+
+config BR2_PACKAGE_STRONGSWAN_TNCCS_11
+	bool "Enable TNCCS 1.1 protocol module"
+	select BR2_PACKAGE_LIBXML2
+
+config BR2_PACKAGE_STRONGSWAN_TNCCS_20
+	bool "Enable TNCCS 2.0 protocol module"
+
+config BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC
+	bool "Enable dynamic TNCCS protocol discovery module"
+
+config BR2_PACKAGE_STRONGSWAN_EAP
+	bool "Enable EAP protocols"
+	help
+	  Enable various EAP protocols:
+	    - mschapv2
+	    - tls
+	    - ttls
+	    - peap
+	    - sim
+	    - sim-file
+	    - aka
+	    - aka-3gpp2
+	    - simaka-sql
+	    - simaka-pseudonym
+	    - simaka-reauth
+	    - identity
+	    - md5
+	    - gtc
+	    - tnc
+	    - dynamic
+	    - radius
+
+if BR2_PACKAGE_STRONGSWAN_EAP
+
+config BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC
+	bool "Enable EAP-SIM smart card backend"
+	select BR2_PACKAGE_PCSC_LITE
+
+endif
+
+config BR2_PACKAGE_STRONGSWAN_UNITY
+	bool "Enables Cisco Unity extension plugin"
+
+config BR2_PACKAGE_STRONGSWAN_STROKE
+	bool "Enable charons stroke configuration backend"
+	default y
+
+config BR2_PACKAGE_STRONGSWAN_SQL
+	bool "Enable SQL database configuration backend"
+	depends on BR2_PACKAGE_SQLITE || BR2_PACKAGE_MYSQL_CLIENT
+
+endif
+
+config BR2_PACKAGE_STRONGSWAN_TOOLS
+	bool "Enable additional utilities (openac, scepclient and pki)"
+	default y
+
+config BR2_PACKAGE_STRONGSWAN_SCRIPTS
+	bool "Enable additional utilities (found in directory scripts)"
+	default y
+
+endif
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
new file mode 100644
index 0000000..88d6f94
--- /dev/null
+++ b/package/strongswan/strongswan.mk
@@ -0,0 +1,68 @@
+################################################################################
+#
+# strongswan
+#
+################################################################################
+
+STRONGSWAN_VERSION = 5.0.2
+STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
+STRONGSWAN_SITE = http://download.strongswan.org
+STRONGSWAN_LICENSE = GPLv2+
+STRONGSWAN_LICENSE_FILES = COPYING LICENSE
+STRONGSWAN_CONF_OPT +=                                                             \
+      --enable-pkcs11=yes                                                          \
+      --enable-kernel-netlink=$(if $(BR2_INET_IPV6),yes,no)                        \
+      --enable-socket-default=$(if $(BR2_INET_IPV6),yes,no)                        \
+      --enable-openssl=$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),yes,no)              \
+      --enable-gcrypt=$(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),yes,no)                \
+      --enable-gmp=$(if $(BR2_PACKAGE_STRONGSWAN_GMP),yes,no)                      \
+      --enable-af-alg=$(if $(BR2_PACKAGE_STRONGSWAN_AF_ALG),yes,no)                \
+      --enable-curl=$(if $(BR2_PACKAGE_STRONGSWAN_CURL),yes,no)                    \
+      --enable-charon=$(if $(BR2_PACKAGE_STRONGSWAN_CHARON),yes,no)                \
+      --enable-tnccs-11=$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_11),yes,no)            \
+      --enable-tnccs-20=$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_20),yes,no)            \
+      --enable-tnccs-dynamic=$(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC),yes,no)  \
+      --enable-eap-sim-pcsc=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC),yes,no)    \
+      --enable-unity=$(if $(BR2_PACKAGE_STRONGSWAN_UNITY),yes,no)                  \
+      --enable-stroke=$(if $(BR2_PACKAGE_STRONGSWAN_STROKE),yes,no)                \
+      --enable-sql=$(if $(BR2_PACKAGE_STRONGSWAN_SQL),yes,no)                      \
+      --enable-tools=$(if $(BR2_PACKAGE_STRONGSWAN_TOOLS),yes,no)                  \
+      --enable-scripts=$(if $(BR2_PACKAGE_STRONGSWAN_SCRIPTS),yes,no)
+
+ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP),y)
+STRONGSWAN_CONF_OPT +=              \
+      --enable-eap-sim              \
+      --enable-eap-sim-file         \
+      --enable-eap-aka              \
+      --enable-eap-aka-3gpp2        \
+      --enable-eap-simaka-sql       \
+      --enable-eap-simaka-pseudonym \
+      --enable-eap-simaka-reauth    \
+      --enable-eap-identity         \
+      --enable-eap-md5              \
+      --enable-eap-gtc              \
+      --enable-eap-mschapv2         \
+      --enable-eap-tls              \
+      --enable-eap-ttls             \
+      --enable-eap-peap             \
+      --enable-eap-tnc              \
+      --enable-eap-dynamic          \
+      --enable-eap-radius
+STRONGSWAN_DEPENDENCIES += gmp
+endif
+
+STRONGSWAN_DEPENDENCIES +=                               \
+      $(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),openssl)    \
+      $(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),libgcrypt)   \
+      $(if $(BR2_PACKAGE_STRONGSWAN_GMP),gmp)            \
+      $(if $(BR2_PACKAGE_STRONGSWAN_CURL),libcurl)       \
+      $(if $(BR2_PACKAGE_STRONGSWAN_TNCCS_11),libxml2)   \
+      $(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC),pcsc-lite)
+
+ifeq ($(BR2_PACKAGE_STRONGSWAN_SQL),y)
+STRONGSWAN_DEPENDENCIES +=                               \
+      $(if $(BR2_PACKAGE_SQLITE),sqlite)                 \
+      $(if $(BR2_PACKAGE_MYSQL_CLIENT),mysql_client)
+endif
+
+$(eval $(autotools-package))

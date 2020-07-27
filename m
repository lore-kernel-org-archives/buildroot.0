From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 08:43:26 +0200
Subject: [Buildroot] [git commit] package/snmppp: fix SNMPv3 with gcc <= 5
Message-ID: <20200727063916.99F06888CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b435912e54671d55143463cc789ceb9ac7a5ce42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/bfe3faefc007f2e746c9f0af9b7d0926bb72dc9e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/snmppp/Config.in | 4 ++++
 package/snmppp/snmppp.mk | 1 +
 2 files changed, 5 insertions(+)

diff --git a/package/snmppp/Config.in b/package/snmppp/Config.in
index 8d284673bc..de1a09ca4b 100644
--- a/package/snmppp/Config.in
+++ b/package/snmppp/Config.in
@@ -21,10 +21,14 @@ config BR2_PACKAGE_SNMPPP_LOGGING
 config BR2_PACKAGE_SNMPPP_SNMPV3
 	bool "enable SNMPv3"
 	default y
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Enable optional support for SNMP++. This selects OpenSSL.
 
+comment "SNMPv3 needs a toolchain w/ gcc >= 4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 endif
 
 comment "snmp++ needs a toolchain w/ threads, C++, dynamic library"
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 8090a03818..270c41fc4b 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -14,6 +14,7 @@ SNMPPP_LICENSE = SNMP++
 SNMPPP_LICENSE_FILES = src/v3.cpp
 
 ifeq ($(BR2_PACKAGE_SNMPPP_SNMPV3),y)
+SNMPPP_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 SNMPPP_CONF_OPTS += --enable-snmpv3
 SNMPPP_DEPENDENCIES += openssl
 else

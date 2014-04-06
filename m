From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 Apr 2014 00:20:05 +0200
Subject: [Buildroot] [PATCH 4/5] snmppp: add option to disable SNMPv3 support
In-Reply-To: <1396822806-32655-1-git-send-email-luca@lucaceresoli.net>
References: <1396822806-32655-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1396822806-32655-5-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disabling SNMPv3 support also removes the dependency on OpenSSL, which is
pretty large (over 2 MB of uncompressed filesystem size on an ARM926 platform).

BR2_PACKAGE_SNMPPP_SNMPV3 defaults to yes for backward compatibility with
previous Buildroot releases, where SNMPv3 was always enabled.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/snmppp/Config.in | 8 +++++++-
 package/snmppp/snmppp.mk | 9 ++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/snmppp/Config.in b/package/snmppp/Config.in
index 1d5113f..8b69fab 100644
--- a/package/snmppp/Config.in
+++ b/package/snmppp/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_SNMPPP
 	bool "snmp++"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_OPENSSL
 	help
 	  SNMP++v3.x is a C++ API which supports SNMP v1, v2c, and v3.
 
@@ -17,6 +16,13 @@ config BR2_PACKAGE_SNMPPP_LOGGING
 	  According to the SNMP++ documentation, disabling logging "increases
 	  performance drastically and minimizes memory consumption".
 
+config BR2_PACKAGE_SNMPPP_SNMPV3
+	bool "enable SNMPv3"
+	default y
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Enable optional support for SNMP++. This selects OpenSSL.
+
 endif
 
 comment "snmp++ needs a toolchain w/ threads, C++"
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 3f3018d..57c4962 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -7,7 +7,7 @@
 SNMPPP_VERSION = 3.3.4
 SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com
-SNMPPP_DEPENDENCIES = openssl host-pkgconf
+SNMPPP_DEPENDENCIES = host-pkgconf
 SNMPPP_INSTALL_STAGING = YES
 # no configure script in tarball
 SNMPPP_AUTORECONF = YES
@@ -15,4 +15,11 @@ SNMPPP_CONF_OPT = $(if $(BR2_PACKAGE_SNMPPP_LOGGING),--enable-logging,--disable-
 SNMPPP_LICENSE = SNMP++
 SNMPPP_LICENSE_FILES = src/v3.cpp
 
+ifeq ($(BR2_PACKAGE_SNMPPP_SNMPV3),y)
+	SNMPPP_CONF_OPT += --enable-snmpv3
+	SNMPPP_DEPENDENCIES += openssl
+else
+	SNMPPP_CONF_OPT += --disable-snmpv3
+endif
+
 $(eval $(autotools-package))
-- 
1.8.3.2

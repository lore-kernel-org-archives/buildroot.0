From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 31 Jul 2017 08:08:08 -0400
Subject: [Buildroot] [PATCH v2 08/14] snmppp: support libressl
In-Reply-To: <20170731120815.5315-1-aduskett@gmail.com>
References: <20170731120815.5315-1-aduskett@gmail.com>
Message-ID: <20170731120815.5315-8-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - None.

 package/snmppp/Config.in | 2 +-
 package/snmppp/snmppp.mk | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/snmppp/Config.in b/package/snmppp/Config.in
index 8d284673b..fb3119177 100644
--- a/package/snmppp/Config.in
+++ b/package/snmppp/Config.in
@@ -21,7 +21,7 @@ config BR2_PACKAGE_SNMPPP_LOGGING
 config BR2_PACKAGE_SNMPPP_SNMPV3
 	bool "enable SNMPv3"
 	default y
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBRESSL
 	help
 	  Enable optional support for SNMP++. This selects OpenSSL.
 
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 67410d9e4..b333af6e7 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -15,7 +15,12 @@ SNMPPP_LICENSE_FILES = src/v3.cpp
 
 ifeq ($(BR2_PACKAGE_SNMPPP_SNMPV3),y)
 SNMPPP_CONF_OPTS += --enable-snmpv3
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SNMPPP_DEPENDENCIES += openssl
+endif
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+SNMPPP_DEPENDENCIES += libressl
+endif
 else
 SNMPPP_CONF_OPTS += --disable-snmpv3
 endif
-- 
2.13.3

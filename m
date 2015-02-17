From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Tue, 17 Feb 2015 16:43:17 +0100
Subject: [Buildroot] [PATCH] netsnmp: Add option for using minimal internal
	SSL code
Message-ID: <1424187797-620-1-git-send-email-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add option for enabling a minimal internal copy of OpenSSL usable for USM
security. It will not enable the usage of SNMP over (D)TLS.

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 package/netsnmp/Config.in  | 7 +++++++
 package/netsnmp/netsnmp.mk | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index a93a7cc..9bf7c9c 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
@@ -49,4 +49,11 @@ config BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING
 	  support, including the ability to log with DEBUGMSG(),
 	  DEBUGMSGTL() and companion macros.
 
+config BR2_PACKAGE_NETSNMP_OPENSSL_INTERNAL
+	bool "Enable minimal internal OpenSSL code"
+	depends on !BR2_PACKAGE_OPENSSL
+	help
+	  Enable a minimal internal copy of OpenSSL usable for USM
+	  security. It will not enable the usage of SNMP over (D)TLS.
+
 endif
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index b272da2..5619ef3 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -55,8 +55,12 @@ ifeq ($(BR2_STATIC_LIBS),y)
 	NETSNMP_CONF_ENV += LIBS=-lz
 endif
 else
+ifeq ($(BR2_PACKAGE_NETSNMP_OPENSSL_INTERNAL),y)
+	NETSNMP_CONF_OPTS += --with-openssl=internal
+else
 	NETSNMP_CONF_OPTS += --without-openssl
 endif
+endif
 
 ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_MIBS),y)
 	NETSNMP_CONF_OPTS += --disable-mib-loading
-- 
1.9.3

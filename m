From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  1 Dec 2018 21:40:48 +0100
Subject: [Buildroot] [PATCH/next 2/2] quagga: add nhrpd option
In-Reply-To: <20181201204048.7791-1-fontaine.fabrice@gmail.com>
References: <20181201204048.7791-1-fontaine.fabrice@gmail.com>
Message-ID: <20181201204048.7791-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/quagga/Config.in |  6 ++++++
 package/quagga/quagga.mk | 10 ++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index 6c51394db3..1a86586ba3 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -42,6 +42,12 @@ config BR2_PACKAGE_QUAGGA_ISISD
 	help
 	  Enable isisd support in quagga.
 
+config BR2_PACKAGE_QUAGGA_NHRPD
+	bool "NHRPD protocol"
+	select BR2_PACKAGE_C_ARES
+	help
+	  Build Next Hop Routing Protocol daemon.
+
 config BR2_PACKAGE_QUAGGA_OSPFD
 	bool "OSPFv2 protocol"
 	help
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 23ab004050..420d72c79d 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -16,8 +16,7 @@ QUAGGA_LICENSE_FILES = COPYING
 QUAGGA_CONF_OPTS = \
 	--program-transform-name='' \
 	--sysconfdir=/etc/quagga \
-	--localstatedir=/var/run/quagga \
-	--disable-nhrpd
+	--localstatedir=/var/run/quagga
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 QUAGGA_CONF_OPTS += --enable-capabilities
@@ -59,6 +58,13 @@ define QUAGGA_PERMISSIONS
 	/etc/quagga d 755 quagga quagga - - - - -
 endef
 
+ifeq ($(BR2_PACKAGE_QUAGGA_NHRPD),y)
+QUAGGA_CONF_OPTS += --enable-nhrpd
+QUAGGA_DEPENDENCIES += c-ares
+else
+QUAGGA_CONF_OPTS += --disable-nhrpd
+endif
+
 ifeq ($(BR2_PACKAGE_QUAGGA_SNMP),y)
 QUAGGA_CONF_ENV += ac_cv_path_NETSNMP_CONFIG=$(STAGING_DIR)/usr/bin/net-snmp-config
 QUAGGA_CONF_OPTS += --enable-snmp=agentx
-- 
2.17.1

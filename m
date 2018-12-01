From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Dec 2018 22:47:13 +0100
Subject: [Buildroot] [git commit] package/quagga: add nhrpd option
Message-ID: <20181202071602.4B8918131E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ee0e2e17b7774a866e051dea37ef8dd5b7684af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/quagga/Config.in |  6 ++++++
 package/quagga/quagga.mk | 10 ++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index 98b9d3481e..9427475d03 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -38,6 +38,12 @@ config BR2_PACKAGE_QUAGGA_ISISD
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
index 7049e968a9..017f3a82ff 100644
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

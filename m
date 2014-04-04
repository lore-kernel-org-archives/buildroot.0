From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  4 Apr 2014 19:29:46 -0300
Subject: [Buildroot] [PATCH] ptpd2: handle snmp optional dep
Message-ID: <1396650586-19093-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Handle the optional net-snmp dep or be explicit in disabling it since
since it can pick up a distribution net-snmp-config and pollute
everything. Hopefully fixes:
http://autobuild.buildroot.net/results/5bd/5bdfcf544a83e18d12e27c598084c0ad520d6164/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ptpd2/ptpd2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ptpd2/ptpd2.mk b/package/ptpd2/ptpd2.mk
index a5d1aff..3133726 100644
--- a/package/ptpd2/ptpd2.mk
+++ b/package/ptpd2/ptpd2.mk
@@ -13,6 +13,13 @@ PTPD2_AUTORECONF = YES
 PTPD2_LICENSE = BSD-2c
 PTPD2_LICENSE_FILES = COPYRIGHT
 
+ifeq ($(BR2_PACKAGE_NETSNMP),y)
+	PTPD2_CONF_ENV += ac_cv_path_PATH_NET_SNMP_CONFIG=$(STAGING_DIR)/usr/bin/net-snmp-config
+	PTPD2_DEPENDENCIES += netsnmp
+else
+	PTPD2_CONF_OPT += --disable-snmp
+endif
+
 define PTPD2_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/ptpd2/S65ptpd2 \
 		$(TARGET_DIR)/etc/init.d/S65ptpd2
-- 
1.8.3.2

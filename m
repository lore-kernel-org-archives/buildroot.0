From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Apr 2019 21:58:30 +0200
Subject: [Buildroot] [PATCH 3/6] package/lldpd: add optional netsnmp
 dependency
In-Reply-To: <20190407195833.9275-1-fontaine.fabrice@gmail.com>
References: <20190407195833.9275-1-fontaine.fabrice@gmail.com>
Message-ID: <20190407195833.9275-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lldpd/lldpd.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 506b6f136d..4e62f56c5d 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -29,7 +29,6 @@ LLDPD_CONF_ENV = ac_cv_prog_cc_c99=-std=gnu99
 
 LLDPD_CONF_OPTS = \
 	--without-embedded-libevent \
-	--without-snmp \
 	--without-xml \
 	--without-seccomp \
 	--without-libbsd \
@@ -44,6 +43,15 @@ LLDPD_CONF_OPTS = \
 	$(if $(BR2_PACKAGE_LLDPD_DOT3),--enable-dot3,--disable-dot3) \
 	$(if $(BR2_PACKAGE_LLDPD_CUSTOM_TLV),--enable-custom,--disable-custom)
 
+ifeq ($(BR2_PACKAGE_NETSNMP),y)
+LLDPD_CONF_OPTS += --with-snmp
+LLDPD_DEPENDENCIES += netsnmp
+LLDPD_CONF_ENV += \
+	ac_cv_path_NETSNMP_CONFIG=$(STAGING_DIR)/usr/bin/net-snmp-config
+else
+LLDPD_CONF_OPTS += --without-snmp
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 LLDPD_CONF_OPTS += --with-readline
 LLDPD_DEPENDENCIES += readline
-- 
2.20.1

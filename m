From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Aug 2019 14:29:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/collectd: fix netsnmp dependency
 handling
Message-ID: <20190810122904.22400-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a defconfig contains

BR2_PACKAGE_COLLECTD_SNMP is not set
BR2_PACKAGE_NETSNMP=y

collectd was built with snmp support, --with-libnetsnmp should only be
enabled if the collectd-specific option BR2_PACKAGE_COLLECTD_SNMP
is enabled.

Fixes:
http://autobuild.buildroot.net/results/d1c/d1c88b21883d9a6af54cd9a99bc4b0125f08095d/

Please note that this patch does not fix the collectd build with
netsnmp support but the build should only fail for defconfigs with
BR2_PACKAGE_COLLECTD_SNMP enabled ;)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/collectd/collectd.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 8eb7aa2ec0..ff36adaef3 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -182,8 +182,10 @@ endif
 ifeq ($(BR2_PACKAGE_MYSQL),y)
 COLLECTD_CONF_OPTS += --with-libmysql=$(STAGING_DIR)/usr
 endif
-ifeq ($(BR2_PACKAGE_NETSNMP),y)
+ifeq ($(BR2_PACKAGE_COLLECTD_SNMP),y)
 COLLECTD_CONF_OPTS += --with-libnetsnmp=$(STAGING_DIR)/usr
+else
+COLLECTD_CONF_OPTS += --with-libnetsnmp=no
 endif
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
 COLLECTD_CONF_OPTS += --with-libpq=$(STAGING_DIR)/usr/bin/pg_config
-- 
2.20.1

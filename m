From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 10 Mar 2015 23:08:07 +0100
Subject: [Buildroot] [PATCH v1] collectd: add configure hint for pg_config
Message-ID: <1426025287-5166-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1] in case postgresql-devel package is installed on the host:

    libpq . . . . . . . . no (libpq-fe.h not found)
    postgresql  . . . . . no (dependency error)
    configure: error: "Some plugins are missing dependencies - see the summary above for details"

Otherwise fixes the following configure warning:

	configure: WARNING: pg_config returned with status 127

[1] http://autobuild.buildroot.net/results/336/336b3e932be245faa04969af960702af672916dc

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/collectd/collectd.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index d5802d6..a4b91d6 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -139,6 +139,9 @@ endif
 ifeq ($(BR2_PACKAGE_NETSNMP),y)
 	COLLECTD_CONF_OPTS += --with-libnetsnmp=$(STAGING_DIR)/usr/bin/net-snmp-config
 endif
+ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+	COLLECTD_CONF_OPTS += --with-libpq=$(STAGING_DIR)/usr/bin/pg_config
+endif
 ifeq ($(BR2_PACKAGE_YAJL),y)
 	COLLECTD_CONF_OPTS += --with-yajl=$(STAGING_DIR)/usr
 endif
-- 
2.1.4

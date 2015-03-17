From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Mar 2015 22:44:05 +0100
Subject: [Buildroot] [PATCH v1] collectd: fix postgresql library detection
Message-ID: <1426628645-26181-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Explicitly link against -lpthread and -lm.

Fixes ([1]):
   checking for PQconnectdb in -lpq... no
   checking for PQserverVersion in -lpq... no
   postgresql  . . . . . no (dependency error)

[1] http://autobuild.buildroot.org/results/926/926a43b8f635790d7e9abdc977ea803ddaf8a523/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/collectd/collectd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index a4b91d6..4a40faa 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -141,6 +141,7 @@ ifeq ($(BR2_PACKAGE_NETSNMP),y)
 endif
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
 	COLLECTD_CONF_OPTS += --with-libpq=$(STAGING_DIR)/usr/bin/pg_config
+	COLLECTD_CONF_ENV = LIBS="-lpthread -lm"
 endif
 ifeq ($(BR2_PACKAGE_YAJL),y)
 	COLLECTD_CONF_OPTS += --with-yajl=$(STAGING_DIR)/usr
-- 
2.1.4

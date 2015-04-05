From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 19:19:32 +0200
Subject: [Buildroot] [git commit] collectd: fix postgresql library detection
Message-ID: <20150405172123.84EA281941@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f79f48764055b53cd548b8c62c357281aa816e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Explicitly link against -lpthread and -lm.

Fixes ([1]):
   checking for PQconnectdb in -lpq... no
   checking for PQserverVersion in -lpq... no
   postgresql  . . . . . no (dependency error)

[1] http://autobuild.buildroot.org/results/926/926a43b8f635790d7e9abdc977ea803ddaf8a523/

[Thomas:
  - Rebase on top of master
  - Use += instead of =, which will avoid mistakes in the future.]

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/collectd/collectd.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 54a816f..f02be55 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -141,6 +141,7 @@ COLLECTD_CONF_OPTS += --with-libnetsnmp=$(STAGING_DIR)/usr/bin/net-snmp-config
 endif
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
 COLLECTD_CONF_OPTS += --with-libpq=$(STAGING_DIR)/usr/bin/pg_config
+COLLECTD_CONF_ENV += LIBS="-lpthread -lm"
 endif
 ifeq ($(BR2_PACKAGE_YAJL),y)
 COLLECTD_CONF_OPTS += --with-yajl=$(STAGING_DIR)/usr

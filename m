From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Wed, 11 Mar 2020 15:13:11 +0100
Subject: [Buildroot] [PATCH] package/collectd: don't remove
 postgresql_default.conf
Message-ID: <20200311141311.14785-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

$(TARGET_DIR)/usr/share/collectd/postgresql_default.conf
should not be removed when postgresql support is enabled,
as that module tries to load that file by default.

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/collectd/collectd.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 9258977613..14f52d6e6e 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -202,6 +202,8 @@ endif
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
 COLLECTD_CONF_OPTS += --with-libpq=$(STAGING_DIR)/usr/bin/pg_config
 COLLECTD_CONF_ENV += LIBS="-lpthread -lm"
+else
+COLLECTD_POST_INSTALL_TARGET_HOOKS += COLLECTD_REMOVE_UNNEEDED_POSTGRESQL_DEFAULT_CONF
 endif
 ifeq ($(BR2_PACKAGE_YAJL),y)
 COLLECTD_CONF_OPTS += --with-libyajl=$(STAGING_DIR)/usr
@@ -218,6 +220,9 @@ endif
 define COLLECTD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 	rm -f $(TARGET_DIR)/usr/bin/collectd-nagios
+endef
+
+define COLLECTD_REMOVE_UNNEEDED_POSTGRESQL_DEFAULT_CONF
 	rm -f $(TARGET_DIR)/usr/share/collectd/postgresql_default.conf
 endef
 
-- 
2.17.1

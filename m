From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 16:07:15 +0100
Subject: [Buildroot] [git commit] package/collectd: keep
 postgresql_default.conf when needed
Message-ID: <20200322145428.3B1828438B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35e845700fb15b4ab30678c073300b508db4eb95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

$(TARGET_DIR)/usr/share/collectd/postgresql_default.conf
should not be removed when postgresql support is enabled,
as that module tries to load that file by default.

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/collectd/collectd.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 9258977613..65307dce4c 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -218,8 +218,14 @@ endif
 define COLLECTD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 	rm -f $(TARGET_DIR)/usr/bin/collectd-nagios
+endef
+
+ifeq ($(BR2_PACKAGE_COLLECTD_POSTGRESQL),)
+define COLLECTD_REMOVE_UNNEEDED_POSTGRESQL_DEFAULT_CONF
 	rm -f $(TARGET_DIR)/usr/share/collectd/postgresql_default.conf
 endef
+COLLECTD_POST_INSTALL_TARGET_HOOKS += COLLECTD_REMOVE_UNNEEDED_POSTGRESQL_DEFAULT_CONF
+endif
 
 define COLLECTD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/collectd/collectd.service \

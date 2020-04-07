From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Apr 2020 18:07:27 +0200
Subject: [Buildroot] [git commit branch/2019.11.x] package/collectd: keep
 postgresql_default.conf when needed
Message-ID: <20200407155456.C4B9B8D476@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7b4788b66f2c105e339d74c37c74e8a8da07d76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

$(TARGET_DIR)/usr/share/collectd/postgresql_default.conf
should not be removed when postgresql support is enabled,
as that module tries to load that file by default.

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 35e845700fb15b4ab30678c073300b508db4eb95)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/collectd.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 9ff29fcbea..796799b352 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -223,8 +223,14 @@ endif
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

From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 15 Jun 2020 09:20:41 +0200
Subject: [Buildroot] [PATCH v2 01/14] package/systemd: configure nss plugins
 in nsswitch.conf
In-Reply-To: <20200615072055.2083-1-nolange79@gmail.com>
References: <20200615072055.2083-1-nolange79@gmail.com>
Message-ID: <20200615072055.2083-2-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds configuration of the nsswitch.conf file,
it does so by pathing the template provided by systemd.

The template is fully populated, the services that are
not available are removed.

If the plugin nss-compat is not available, the entries
will be replaced with nss-files.

nss-systemd is used for the DynamicUser features,
which is a defacto necessity for systemd.
It handles transient users/groups without
touching the /etc/{passwd,group} files on disk.

nss-myhostname allows resolving the hostname,
again without touching files in /etc.
Enabling this feature requires configuring the plugin.

nss-resolve is part of resolved, and required for
consistent dns lookups.

nss-mymachines adds name resolution from
containers.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e61cec80f0..cf6c0f9576 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -472,7 +472,23 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
 	touch $(TARGET_DIR)/etc/machine-id
 endef
 
+define SYSTEMD_NSSCONFIG_HOOK
+	[ -r "$$(find $(TARGET_DIR)/usr/lib -name libnss_compat.so.*)" ] || \
+		sed 's,\bcompat\b,files,g' -i $(TARGET_DIR)/usr/share/factory/etc/nsswitch.conf
+	[ "$(BR2_PACKAGE_SYSTEMD_RESOLVED)" = "y" ] || \
+		sed -e 's,\bresolve[[:space:]][[:space:]]*\[[^]]*\][[:space:]]*,,g' \
+		-e 's,\bresolve\b[[:space:]]*,,g' -i $(TARGET_DIR)/usr/share/factory/etc/nsswitch.conf
+	[ "$(BR2_PACKAGE_SYSTEMD_MYHOSTNAME)" = "y" ] || \
+		sed -e 's,\bmyhostname[[:space:]][[:space:]]*\[[^]]*\][[:space:]]*,,g' \
+		-e 's,\bmyhostname\b[[:space:]]*,,g' -i $(TARGET_DIR)/usr/share/factory/etc/nsswitch.conf
+	[ "$(BR2_PACKAGE_SYSTEMD_MACHINED)" = "y" ] || \
+		sed -e 's,\bmymachines[[:space:]][[:space:]]*\[[^]]*\][[:space:]]*,,g' \
+		-e 's,\bmymachines\b[[:space:]]*,,g' -i $(TARGET_DIR)/usr/share/factory/etc/nsswitch.conf
+	install -m644 $(TARGET_DIR)/usr/share/factory/etc/nsswitch.conf $(TARGET_DIR)/etc/nsswitch.conf
+endef
+
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
+	SYSTEMD_NSSCONFIG_HOOK \
 	SYSTEMD_INSTALL_INIT_HOOK \
 	SYSTEMD_INSTALL_MACHINEID_HOOK \
 	SYSTEMD_INSTALL_RESOLVCONF_HOOK
-- 
2.27.0

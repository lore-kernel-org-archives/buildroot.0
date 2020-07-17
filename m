From: Norbert Lange <nolange79@gmail.com>
Date: Sat, 18 Jul 2020 01:42:45 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/systemd: add support for
 creating journal catalog DB
Message-ID: <20200717234245.17889-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

journald supports catalog files, or rather a binary database of
those.
Functionality added includes:

-   A config option allows enabling this database.

-   If BR2_ENABLE_LOCALE_PURGE is enabled, the catalogs not in the
    language whitelist are deleted.

-   if the option is enabled, the database is built and moved to
    /usr/share/factory. A symlink is created in /var pointing to
    that file.

-   the service normally used for creating the DB during boot,
    and the source files used as input are deleted.

The move to /usr/share/factory is helpful for having /usr as whole
system distribution.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v1>v2:
-   Moved all logic into systemd.mk
-   solved the LOCALE_PURGE order that way
-   use the factory to store the file
-   option to enable the DB (similar to udev HWDB)
-   cant be anabled with !ROOTFS_RW, tons of issues with that one

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/Config.in  | 14 ++++++++++++++
 package/systemd/systemd.mk | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index f754b9d0cf..bbb77b280d 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -246,6 +246,20 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
 
 	  http://www.freedesktop.org/software/systemd/man/machinectl.html#Image%20Transfer%20Commands
 
+config BR2_PACKAGE_SYSTEMD_CATALOGDB
+	bool "enable journal catalog database installation"
+	depends on BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW # conflicting tmpfiles magic
+	help
+	  Build and install the journal catalog database.
+
+	  catalog files are used to provide extended and potentially localized
+	  messages for the journal.
+
+	  The original catalog files will be built into a DB at
+	  /usr/share/factory/var/lib/systemd/catalog/database.
+
+	  https://www.freedesktop.org/wiki/Software/systemd/catalog/
+
 config BR2_PACKAGE_SYSTEMD_LOCALED
 	bool "enable locale daemon"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1b94ffc67a..60d97ae176 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -593,6 +593,44 @@ define SYSTEMD_INSTALL_INIT_SYSTEMD
 	$(SYSTEMD_INSTALL_NETWORK_CONFS)
 endef
 
+ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
+define SYSTEMD_LOCALE_PURGE_CATALOGS
+	for cfile in $$(find $(TARGET_DIR)/usr/lib/systemd/catalog -name '*.*.catalog'); \
+	do \
+		basename=$${cfile##*/}; \
+		basename=$${basename%.catalog}; \
+		langext=$${basename#*.}; \
+		[ "$$langext" != "$${basename}" ] || continue; \
+		expr >/dev/null $(BR2_ENABLE_LOCALE_WHITELIST) : ".*\b$${langext}\b" || rm -f "$$cfile"; \
+	done
+endef
+
+SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_LOCALE_PURGE_CATALOGS
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD_CATALOGDB),y)
+define SYSTEMD_UPDATE_CATALOGS
+	$(HOST_DIR)/bin/journalctl --root=$(TARGET_DIR) --update-catalog
+	install -D $(TARGET_DIR)/var/lib/systemd/catalog/database \
+		$(TARGET_DIR)/usr/share/factory/var/lib/systemd/catalog/database
+	rm $(TARGET_DIR)/var/lib/systemd/catalog/database
+	ln -sf /usr/share/factory/var/lib/systemd/catalog/database \
+		$(TARGET_DIR)/var/lib/systemd/catalog/database
+	grep -q '^L /var/lib/systemd/catalog/database' $(TARGET_DIR)/usr/lib/tmpfiles.d/var.conf || \
+		printf "\nL /var/lib/systemd/catalog/database\n" >> $(TARGET_DIR)/usr/lib/tmpfiles.d/var.conf
+endef
+
+SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_UPDATE_CATALOGS
+endif
+
+define SYSTEMD_RM_CATALOG_UPDATE_SERVICE
+	rm -rf $(TARGET_DIR)/usr/lib/systemd/catalog \
+		$(TARGET_DIR)/usr/lib/systemd/system/systemd-journal-catalog-update.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/*/systemd-journal-catalog-update.service
+endef
+
+SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_CATALOG_UPDATE_SERVICE
+
 define SYSTEMD_PRESET_ALL
 	$(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset-all
 endef
-- 
2.27.0

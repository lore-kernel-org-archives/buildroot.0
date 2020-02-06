From: Norbert Lange <nolange79@gmail.com>
Date: Thu,  6 Feb 2020 10:36:32 +0100
Subject: [Buildroot] [PATCH 09/10] package/systemd: option to delete all
 catalog files
In-Reply-To: <20200206093633.251413-1-nolange79@gmail.com>
References: <20200206093633.251413-1-nolange79@gmail.com>
Message-ID: <20200206093633.251413-10-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unless you need to rebuild the database, there is
no need for the (source) catalog files.

This option removes the files in a ROOTFS_PRE_CMD_HOOK

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/Config.in  | 12 ++++++++++++
 package/systemd/systemd.mk |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index c727082a1a..c0727db94a 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -224,6 +224,18 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
 
 	  http://www.freedesktop.org/software/systemd/man/machinectl.html#Image%20Transfer%20Commands
 
+config BR2_PACKAGE_SYSTEMD_RETAIN_CATALOGS
+	bool "retain source catalog files"
+	help
+	  catalog files are used to provide extended and potentially localized
+	  messages for the journal.
+	  The files reside in /usr/lib/systemd/catalog, but arent used directly,
+	  instead a binary database will be built using these files.
+
+	  Only if the database needs to be rebuilt later they need to be retained.
+
+	  https://www.freedesktop.org/wiki/Software/systemd/catalog/
+
 config BR2_PACKAGE_SYSTEMD_LOCALED
 	bool "enable locale daemon"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 8db3a1b117..4d6ff0be45 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -401,6 +401,14 @@ ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
 SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
 endif
 
+ifneq ($(BR2_PACKAGE_SYSTEMD_RETAIN_CATALOGS),y)
+define SYSTEMD_RM_SOURCE_CATALOGS_HOOK
+	rm -rf $(TARGET_DIR)/usr/lib/systemd/catalog
+endef
+
+SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_SOURCE_CATALOGS_HOOK
+endif
+
 define SYSTEMD_INSTALL_INIT_HOOK
 	ln -fs multi-user.target \
 		$(TARGET_DIR)/usr/lib/systemd/system/default.target
-- 
2.24.1

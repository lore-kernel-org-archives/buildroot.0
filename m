From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 15 Jun 2020 09:20:48 +0200
Subject: [Buildroot] [PATCH v2 08/14] package/systemd: add hook to update
 journalctl catalogs
In-Reply-To: <20200615072055.2083-1-nolange79@gmail.com>
References: <20200615072055.2083-1-nolange79@gmail.com>
Message-ID: <20200615072055.2083-9-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

journald supports catalog files, or rather a binary database of
those.
This add a hook to create said database from the available
catalog source files (which are not needed afterwards).

One ugly workaround is or ensuring that PURGE_LOCALES is
called before, we do this by adding this hook
(will then run twice during the finalize target step).

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 2c7f35bf25..d3be92b78c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -579,6 +579,16 @@ define SYSTEMD_PRESET_ALL
 endef
 SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
 
+define SYSTEMD_UPDATE_CATALOGS
+	$(HOST_DIR)/bin/journalctl --root=$(TARGET_DIR) --update-catalog
+endef
+
+# SYSTEMD_UPDATE_CATALOGS needs to run after PURGE_LOCALES
+ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
+SYSTEMD_TARGET_FINALIZE_HOOKS += PURGE_LOCALES
+endif
+SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_UPDATE_CATALOGS
+
 SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
 SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
 
-- 
2.27.0

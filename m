From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Fri,  9 Nov 2018 13:35:02 -0600
Subject: [Buildroot] [PATCH v1 1/2] package/proftpd: add tunable buffer size
Message-ID: <20181109193503.7984-1-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enables tunable buffer size as a compile time option

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
 package/proftpd/Config.in  | 8 ++++++++
 package/proftpd/proftpd.mk | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index b615a5ff4c..51c795501e 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -65,4 +65,12 @@ config BR2_PACKAGE_PROFTPD_MOD_QUOTATAB_SQL
 	  Compile mod_quotatab with mod_quotatab_sql table.
 
 endif
+
+config BR2_PACKAGE_PROFTPD_BUFFER_SIZE
+	int "buffer size (0 for default)"
+	default "0"
+	help
+	  Compile ProFTPD with tunable buffer size. Size in
+	  bytes. 0 uses default size.
+
 endif
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 8f3ff5088e..5ff0bc17e5 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -121,4 +121,8 @@ define PROFTPD_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/proftpd.service
 endef
 
+ifneq ($(BR2_PACKAGE_PROFTPD_BUFFER_SIZE),0)
+PROFTPD_CONF_OPTS += --enable-tunable-buffer-size=$(BR2_PACKAGE_PROFTPD_BUFFER_SIZE)
+endif
+
 $(eval $(autotools-package))
-- 
2.18.0

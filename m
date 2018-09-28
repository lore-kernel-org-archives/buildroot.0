From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Fri, 28 Sep 2018 10:23:05 -0500
Subject: [Buildroot] [PATCH v1 1/1] package/proftpd: add mod_{sql,
 quotatab} support
Message-ID: <1538148185-7313-1-git-send-email-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>

 - Enables mod_sql which is required for quotatab
 - Adds options for enabling mod_quotatab and the sub-component
   file/LDAP/RADIUS/SQL modules
 - Copies over ftpasswd and ftpquota scripts if perl is enabled
   (These scripts aren't required and the feature works
    without them installed)

Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
 package/proftpd/Config.in  | 41 +++++++++++++++++++++++++++++++++++++++++
 package/proftpd/proftpd.mk | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index e7e3c13..7b742bf 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -26,4 +26,45 @@ config BR2_PACKAGE_PROFTPD_MOD_SFTP
 	help
 	  Compile ProFTPD with mod_sftp support
 
+config BR2_PACKAGE_PROFTPD_MOD_SQL
+	bool "mod_sql support"
+	help
+	  Compile ProFTPD with mode_sql support.
+
+config BR2_PACKAGE_PROFTPD_MOD_QUOTATAB
+	bool "mod_quotatab support"
+	help
+	  Compile ProFTPD with mode_quotatab support. This module
+	  is required in order to support quota tables:
+	        1. mod_quotatab_file
+	        2. mod_quotatab_ldap
+	        3. mod_quotatab_radius
+	        4. mod_quotatab_sql
+
+if BR2_PACKAGE_PROFTPD_MOD_QUOTATAB
+
+config BR2_PACKAGE_PROFTPD_MOD_QUOTATAB_FILE
+	bool "mod_quotatab_file table support"
+	help
+	  Compile mod_quotatab with mod_quotatab_file table.
+
+config BR2_PACKAGE_PROFTPD_MOD_QUOTATAB_LDAP
+	bool "mod_quotatab_ldap table support"
+	help
+	  Compile mod_quotatab with mod_quotatab_ldap table.
+
+config BR2_PACKAGE_PROFTPD_MOD_QUOTATAB_RADIUS
+	bool "mod_quotatab_radius table support"
+	help
+	  Compile mod_quotatab with mod_quotatab_radius table.
+
+config BR2_PACKAGE_PROFTPD_MOD_QUOTATAB_SQL
+	bool "mod_quotatab_sql table support"
+	depends on BR2_PACKAGE_PROFTPD_MOD_SQL
+	help
+	  Compile mod_quotatab with mod_quotatab_sql table.
+
+comment "mod_quotatab_sql needs mod_sql"
+	depends on !BR2_PACKAGE_PROFTPD_MOD_SQL
+endif
 endif
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index b02320f..1ae874a 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -42,6 +42,30 @@ else
 PROFTPD_CONF_OPTS += --disable-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_PROFTPD_MOD_SQL),y)
+PROFTPD_MODULES += mod_sql
+endif
+
+ifeq ($(BR2_PACKAGE_PROFTPD_MOD_QUOTATAB),y)
+PROFTPD_MODULES += mod_quotatab
+endif
+
+ifeq ($(BR2_PACKAGE_PROFTPD_MOD_QUOTATAB_FILE),y)
+PROFTPD_MODULES += mod_quotatab_file
+endif
+
+ifeq ($(BR2_PACKAGE_PROFTPD_MOD_QUOTATAB_LDAP),y)
+PROFTPD_MODULES += mod_quotatab_ldap
+endif
+
+ifeq ($(BR2_PACKAGE_PROFTPD_MOD_QUOTATAB_RADIUS),y)
+PROFTPD_MODULES += mod_quotatab_radius
+endif
+
+ifeq ($(BR2_PACKAGE_PROFTPD_MOD_QUOTATAB_SQL),y)
+PROFTPD_MODULES += mod_quotatab_sql
+endif
+
 PROFTPD_CONF_OPTS += --with-modules=$(subst $(space),:,$(PROFTPD_MODULES))
 
 # configure script doesn't handle detection of %llu format string
@@ -62,6 +86,15 @@ PROFTPD_POST_CONFIGURE_HOOKS = PROFTPD_MAKENAMES
 
 PROFTPD_MAKE = $(MAKE1)
 
+#Install Perl based scripts in target
+ifeq ($(BR2_PACKAGE_PERL),y)
+define PROFTPD_INSTALL_PERL_BIN
+	$(INSTALL) -D -m 0755 $(@D)/contrib/ftpquota $(TARGET_DIR)/usr/sbin/ftpquota
+	$(INSTALL) -D -m 0755 $(@D)/contrib/ftpasswd $(TARGET_DIR)/usr/sbin/ftpasswd
+endef
+PROFTPD_POST_INSTALL_TARGET_HOOKS = PROFTPD_INSTALL_PERL_BIN
+endif
+
 define PROFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/proftpd $(TARGET_DIR)/usr/sbin/proftpd
 	$(INSTALL) -m 0644 -D $(@D)/sample-configurations/basic.conf $(TARGET_DIR)/etc/proftpd.conf
-- 
1.9.1

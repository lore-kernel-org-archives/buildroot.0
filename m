From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 17:21:36 +0200
Subject: [Buildroot] [git commit] package/proftpd: add mod_{sql,
 quotatab} support
Message-ID: <20181011152038.809A282AB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=863e0fc3bf9743a060c0965b74decef4e6290df9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Enables mod_sql which is required for quotatab_sql
- Adds options for enabling mod_quotatab and the sub-component
  file/LDAP/RADIUS/SQL modules
- Copies over ftpquota script if perl and mod_quotatab are
  enabled (This script isn't required but is an additional tool
  for mod_quotatab)

Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/proftpd/Config.in  | 39 +++++++++++++++++++++++++++++++++++++++
 package/proftpd/proftpd.mk | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index e7e3c13780..b615a5ff4c 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -26,4 +26,43 @@ config BR2_PACKAGE_PROFTPD_MOD_SFTP
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
+	select BR2_PACKAGE_PROFTPD_MOD_SQL
+	help
+	  Compile mod_quotatab with mod_quotatab_sql table.
+
+endif
 endif
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index b02320f4c0..93ee687fab 100644
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
@@ -62,9 +86,19 @@ PROFTPD_POST_CONFIGURE_HOOKS = PROFTPD_MAKENAMES
 
 PROFTPD_MAKE = $(MAKE1)
 
+# install Perl based scripts in target
+ifeq ($(BR2_PACKAGE_PERL),y)
+ifeq ($(BR2_PACKAGE_PROFTPD_MOD_QUOTATAB),y)
+define PROFTPD_INSTALL_FTPQUOTA
+	$(INSTALL) -D -m 0755 $(@D)/contrib/ftpquota $(TARGET_DIR)/usr/sbin/ftpquota
+endef
+endif
+endif
+
 define PROFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/proftpd $(TARGET_DIR)/usr/sbin/proftpd
 	$(INSTALL) -m 0644 -D $(@D)/sample-configurations/basic.conf $(TARGET_DIR)/etc/proftpd.conf
+	$(PROFTPD_INSTALL_FTPQUOTA)
 endef
 
 define PROFTPD_USERS

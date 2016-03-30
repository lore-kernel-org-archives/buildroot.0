From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 30 Mar 2016 16:21:22 +0100
Subject: [Buildroot] [PATCH] tcl: rework logic for databases support
Message-ID: <1459351282-16091-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Always remove the bundled sqlite version.
- Remove the --with-system-sqlite option because it is an option which
  only exists in the bundled sqlite configure script.
- Always build the basic TDBC.
- Build SQLite, MySQL and PostgreSQL TDBC drivers only if these packages
  have been selected in Buildroot. Add them to TCL_DEPENDENCIES
  accordingly.

Fixes:
  http://autobuild.buildroot.net/results/022/02296f8624d3406a63d3a179f53862f245c56dc1/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/tcl/tcl.mk | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 9fd1195..1ec7741 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -14,15 +14,10 @@ TCL_SUBDIR = unix
 TCL_INSTALL_STAGING = YES
 TCL_AUTORECONF = YES
 
-# Note that --with-system-sqlite will only make a difference
-# in the sqlite package (which gets removed if sqlite not
-# configured).  Don't need to worry about conditionally including
-# it in the configure options
 TCL_CONF_OPTS = \
 	--disable-symbols \
 	--disable-langinfo \
-	--disable-framework \
-	--with-system-sqlite
+	--disable-framework
 
 HOST_TCL_CONF_OPTS = \
 	--disable-symbols \
@@ -32,7 +27,7 @@ HOST_TCL_CONF_OPTS = \
 # I haven't found a good way to force pkgs to not build
 # or configure without just removing the entire pkg directory.
 define HOST_TCL_REMOVE_PACKAGES
-	rm -fr $(@D)/pkgs/sqlite[0-9].[0-9].[0-9] \
+	rm -fr $(@D)/pkgs/sqlite[0-9].[0-9][0-9].[0-9] \
 		$(@D)/pkgs/tdbc[0-9].[0-9].[0-9] \
 		$(@D)/pkgs/tdbcmysql[0-9].[0-9].[0-9] \
 		$(@D)/pkgs/tdbcodbc[0-9].[0-9].[0-9] \
@@ -41,11 +36,10 @@ define HOST_TCL_REMOVE_PACKAGES
 endef
 HOST_TCL_PRE_CONFIGURE_HOOKS += HOST_TCL_REMOVE_PACKAGES
 define TCL_REMOVE_PACKAGES
-	rm -fr $(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/sqlite[0-9].[0-9].[0-9]) \
-		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbc[0-9].[0-9].[0-9]) \
-		$(@D)/pkgs/tdbcmysql[0-9].[0-9].[0-9] \
+	rm -fr $(@D)/pkgs/sqlite[0-9].[0-9][0-9].[0-9] \
+		$(if $(BR2_PACKAGE_MYSQL),,$(@D)/pkgs/tdbcmysql[0-9].[0-9].[0-9]) \
 		$(@D)/pkgs/tdbcodbc[0-9].[0-9].[0-9] \
-		$(@D)/pkgs/tdbcpostgres[0-9].[0-9].[0-9] \
+		$(if $(BR2_PACKAGE_POSTGRESQL),,$(@D)/pkgs/tdbcpostgres[0-9].[0-9].[0-9]) \
 		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbcsqlite3-[0-9].[0-9].[0-9])
 endef
 TCL_PRE_CONFIGURE_HOOKS += TCL_REMOVE_PACKAGES
@@ -82,6 +76,8 @@ endef
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_EXTRA
 
 TCL_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite)
+TCL_DEPENDENCIES += $(if $(BR2_PACKAGE_MYSQL),mysql)
+TCL_DEPENDENCIES += $(if $(BR2_PACKAGE_POSTGRESQL),postgresql)
 HOST_TCL_DEPENDENCIES =
 
 $(eval $(autotools-package))
-- 
2.7.3

From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 30 Mar 2016 17:14:09 +0100
Subject: [Buildroot] [PATCH 3/4] tcl: enable mysql support
In-Reply-To: <1459354450-37009-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1459354450-37009-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1459354450-37009-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/tcl/tcl.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 7c2cb47..0ce6b9f 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -35,7 +35,7 @@ HOST_TCL_PRE_CONFIGURE_HOOKS += HOST_TCL_REMOVE_PACKAGES
 # We remove the bundled sqlite as we prefer to not use bundled stuff at all.
 define TCL_REMOVE_PACKAGES
 	rm -fr $(@D)/pkgs/sqlite3* \
-		$(@D)/pkgs/tdbcmysql* \
+		$(if $(BR2_PACKAGE_MYSQL),,$(@D)/pkgs/tdbcmysql*) \
 		$(@D)/pkgs/tdbcodbc* \
 		$(@D)/pkgs/tdbcpostgres* \
 		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbcsqlite3*)
@@ -73,7 +73,8 @@ define TCL_REMOVE_EXTRA
 endef
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_EXTRA
 
-TCL_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite)
+TCL_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite) \
+	$(if $(BR2_PACKAGE_MYSQL),mysql)
 HOST_TCL_DEPENDENCIES =
 
 $(eval $(autotools-package))
-- 
2.7.3

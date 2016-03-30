From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 19:28:54 +0200
Subject: [Buildroot] [git commit] tcl: enable mysql support
Message-ID: <20160330173702.E6351818A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fdc1401f156044c08e2180079623210c3256088
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tcl/tcl.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 817630a..8ac6644 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -34,7 +34,7 @@ HOST_TCL_PRE_CONFIGURE_HOOKS += HOST_TCL_REMOVE_PACKAGES
 # We remove the bundled sqlite as we prefer to not use bundled stuff at all.
 define TCL_REMOVE_PACKAGES
 	rm -fr $(@D)/pkgs/sqlite3* \
-		$(@D)/pkgs/tdbcmysql* \
+		$(if $(BR2_PACKAGE_MYSQL),,$(@D)/pkgs/tdbcmysql*) \
 		$(@D)/pkgs/tdbcodbc* \
 		$(@D)/pkgs/tdbcpostgres* \
 		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbcsqlite3*)
@@ -72,7 +72,8 @@ define TCL_REMOVE_EXTRA
 endef
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_EXTRA
 
-TCL_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite)
+TCL_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite) \
+	$(if $(BR2_PACKAGE_MYSQL),mysql)
 HOST_TCL_DEPENDENCIES =
 
 $(eval $(autotools-package))

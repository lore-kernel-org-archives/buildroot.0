From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 19:26:57 +0200
Subject: [Buildroot] [git commit] tcl: switch to * instead of [0-9]
Message-ID: <20160330173702.CDA2C818A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28ccd4d514e5fe7ceca8a4925c241f649890fa69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Those [0-9] expressions are needlessly complex, and they actually no
longer work now that sqlite3.11.0 is bundled internally (11 is two
digits, which was accounted for).

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tcl/tcl.mk | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 9fd1195..10a37c3 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -32,21 +32,16 @@ HOST_TCL_CONF_OPTS = \
 # I haven't found a good way to force pkgs to not build
 # or configure without just removing the entire pkg directory.
 define HOST_TCL_REMOVE_PACKAGES
-	rm -fr $(@D)/pkgs/sqlite[0-9].[0-9].[0-9] \
-		$(@D)/pkgs/tdbc[0-9].[0-9].[0-9] \
-		$(@D)/pkgs/tdbcmysql[0-9].[0-9].[0-9] \
-		$(@D)/pkgs/tdbcodbc[0-9].[0-9].[0-9] \
-		$(@D)/pkgs/tdbcpostgres[0-9].[0-9].[0-9] \
-		$(@D)/pkgs/tdbcsqlite3-[0-9].[0-9].[0-9]
+	rm -fr $(@D)/pkgs/sqlite3* $(@D)/pkgs/tdbc*
 endef
 HOST_TCL_PRE_CONFIGURE_HOOKS += HOST_TCL_REMOVE_PACKAGES
 define TCL_REMOVE_PACKAGES
-	rm -fr $(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/sqlite[0-9].[0-9].[0-9]) \
-		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbc[0-9].[0-9].[0-9]) \
-		$(@D)/pkgs/tdbcmysql[0-9].[0-9].[0-9] \
-		$(@D)/pkgs/tdbcodbc[0-9].[0-9].[0-9] \
-		$(@D)/pkgs/tdbcpostgres[0-9].[0-9].[0-9] \
-		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbcsqlite3-[0-9].[0-9].[0-9])
+	rm -fr $(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/sqlite3*) \
+		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbc1*) \
+		$(@D)/pkgs/tdbcmysql* \
+		$(@D)/pkgs/tdbcodbc* \
+		$(@D)/pkgs/tdbcpostgres* \
+		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbcsqlite3*)
 endef
 TCL_PRE_CONFIGURE_HOOKS += TCL_REMOVE_PACKAGES
 

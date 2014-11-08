From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Nov 2014 22:12:16 +0100
Subject: [Buildroot] [git commit] tcl: update package disabling
Message-ID: <20141108214404.D77D5B2EC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b067c62672bc382e37bbdff54c6778bd05a971e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update package disabling (removing pkgs subdirectories) after
latest tcl version update:

$ ls tcl8.6.1/pkgs/
 itcl4.0.0
 sqlite3.8.0
 tdbc1.0.0
 tdbcmysql1.0.0
 tdbcodbc1.0.0
 tdbcpostgres1.0.0
 tdbcsqlite3-1.0.0
 thread2.7.0

$ ls tcl8.6.2/pkgs/
 itcl4.0.1
 sqlite3.8.6
 tdbc1.0.1
 tdbcmysql1.0.1
 tdbcodbc1.0.1
 tdbcpostgres1.0.1
 tdbcsqlite3-1.0.1
 thread2.7.1

Fixes:
 http://autobuild.buildroot.net/results/07ae8e42acf62fef99de70c8099ec5a0ca89a817/

Could not reproduce the build failure, but disabling pkgs/sqlite3.8.6 should
prevent all build failures in this directory...

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcl/tcl.mk |   24 ++++++++++++------------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index a242760..2440772 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -32,21 +32,21 @@ HOST_TCL_CONF_OPTS = \
 # I haven't found a good way to force pkgs to not build
 # or configure without just removing the entire pkg directory.
 define HOST_TCL_REMOVE_PACKAGES
-	rm -fr $(@D)/pkgs/sqlite3.8.0 \
-		$(@D)/pkgs/tdbc1.0.0 \
-		$(@D)/pkgs/tdbcmysql1.0.0 \
-		$(@D)/pkgs/tdbcodbc1.0.0 \
-		$(@D)/pkgs/tdbcpostgres1.0.0 \
-		$(@D)/pkgs/tdbcsqlite3-1.0.0
+	rm -fr $(@D)/pkgs/sqlite[0-9].[0-9].[0-9] \
+		$(@D)/pkgs/tdbc[0-9].[0-9].[0-9] \
+		$(@D)/pkgs/tdbcmysql[0-9].[0-9].[0-9] \
+		$(@D)/pkgs/tdbcodbc[0-9].[0-9].[0-9] \
+		$(@D)/pkgs/tdbcpostgres[0-9].[0-9].[0-9] \
+		$(@D)/pkgs/tdbcsqlite3-[0-9].[0-9].[0-9]
 endef
 HOST_TCL_PRE_CONFIGURE_HOOKS += HOST_TCL_REMOVE_PACKAGES
 define TCL_REMOVE_PACKAGES
-	rm -fr $(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/sqlite3.8.0) \
-		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbc1.0.0) \
-		$(@D)/pkgs/tdbcmysql1.0.0 \
-		$(@D)/pkgs/tdbcodbc1.0.0 \
-		$(@D)/pkgs/tdbcpostgres1.0.0 \
-		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbcsqlite3-1.0.0)
+	rm -fr $(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/sqlite[0-9].[0-9].[0-9]) \
+		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbc[0-9].[0-9].[0-9]) \
+		$(@D)/pkgs/tdbcmysql[0-9].[0-9].[0-9] \
+		$(@D)/pkgs/tdbcodbc[0-9].[0-9].[0-9] \
+		$(@D)/pkgs/tdbcpostgres[0-9].[0-9].[0-9] \
+		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbcsqlite3-[0-9].[0-9].[0-9])
 endef
 TCL_PRE_CONFIGURE_HOOKS += TCL_REMOVE_PACKAGES
 

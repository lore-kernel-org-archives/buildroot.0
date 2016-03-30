From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 19:28:32 +0200
Subject: [Buildroot] [git commit] tcl: fix sqlite usage
Message-ID: <20160330173702.DBEE9818A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36e711c85be980bdbac3499bdc0d2a1f063bf1f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove the bundled sqlite unconditionally, as we always want to use
  the external sqlite.
- Remove the --with-system-sqlite option as is only valid for the
  bundled sqlite configure script which we will no longer use.
- Do not remove TDBC when BR2_PACKAGE_SQLITE is not selected as it may
  be used for other TDBC drivers such as MySQL or PostgreSQL.

Fixes:
  http://autobuild.buildroot.net/results/022/02296f8624d3406a63d3a179f53862f245c56dc1/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tcl/tcl.mk | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 10a37c3..817630a 100644
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
@@ -35,9 +30,10 @@ define HOST_TCL_REMOVE_PACKAGES
 	rm -fr $(@D)/pkgs/sqlite3* $(@D)/pkgs/tdbc*
 endef
 HOST_TCL_PRE_CONFIGURE_HOOKS += HOST_TCL_REMOVE_PACKAGES
+
+# We remove the bundled sqlite as we prefer to not use bundled stuff at all.
 define TCL_REMOVE_PACKAGES
-	rm -fr $(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/sqlite3*) \
-		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbc1*) \
+	rm -fr $(@D)/pkgs/sqlite3* \
 		$(@D)/pkgs/tdbcmysql* \
 		$(@D)/pkgs/tdbcodbc* \
 		$(@D)/pkgs/tdbcpostgres* \

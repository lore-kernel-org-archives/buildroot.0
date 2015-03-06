From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 6 Mar 2015 22:30:22 +0000
Subject: [Buildroot] [PATCH 2/2] tcl: rename BR2_PACKAGE_TCL_SHLIB_ONLY to
	be more consistent
In-Reply-To: <1425681022-16612-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1425681022-16612-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1425681022-16612-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_PACKAGE_TCL_SHLIB_ONLY is confusing because someone could think
that only shared libraries would be installed. But, what actually does
is removing the 'tclsh' binary, so better to reword it in order to be
consistent with what actually does.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/tcl/Config.in |    7 +++----
 package/tcl/tcl.mk    |    2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/tcl/Config.in b/package/tcl/Config.in
index c3d0d87..996dc96 100644
--- a/package/tcl/Config.in
+++ b/package/tcl/Config.in
@@ -25,12 +25,11 @@ config BR2_PACKAGE_TCL_DEL_ENCODINGS
 
 	  It saves approx. 1.6 Mb of space.
 
-config BR2_PACKAGE_TCL_SHLIB_ONLY
-	bool "install only shared library"
+config BR2_PACKAGE_TCL_REMOVE_TCLSH
+	bool "do not install tclsh"
 	default y
 	help
-	  Install only TCL shared library and not binary tcl
-	  interpreter (tclsh).
+	  Do not install the tcl interpreter (tclsh).
 
 	  Saves ~14kb.
 
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index ad76e9b..b6c86be 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -72,7 +72,7 @@ endef
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_ENCODINGS
 endif
 
-ifeq ($(BR2_PACKAGE_TCL_SHLIB_ONLY),y)
+ifeq ($(BR2_PACKAGE_TCL_REMOVE_TCLSH),y)
 define TCL_REMOVE_TCLSH
 	rm -f $(TARGET_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)
 endef
-- 
1.7.1

From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 7 Mar 2015 15:18:41 +0000
Subject: [Buildroot] [PATCH V3 2/2] tcl: rename BR2_PACKAGE_TCL_SHLIB_ONLY
	to be more consistent
In-Reply-To: <1425741521-63914-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1425741521-63914-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1425741521-63914-2-git-send-email-Vincent.Riera@imgtec.com>
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
Changes V2 -> V3: change it from a string entry to a bool one
Changes V1 -> V2: add an entry to Config.in.legacy

 Config.in.legacy      |    9 +++++++++
 package/tcl/Config.in |    7 +++----
 package/tcl/tcl.mk    |    2 +-
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 1f57671..bb540fa 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,15 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.05"
 
+config BR2_PACKAGE_TCL_SHLIB_ONLY
+	bool "tcl's 'install only shared library' option has been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_REMOVE_TCLSH
+	help
+	  The option BR2_PACKAGE_TCL_SHLIB_ONLY has been renamed to
+	  BR2_PACKAGE_TCL_REMOVE_TCLSH to be consistent with what it
+	  does.
+
 config BR2_PACKAGE_VALGRIND_PTRCHECK
 	bool "valgrind's PTRCheck was renamed to SGCheck"
 	select BR2_LEGACY
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
index 0c328ee..5d851f3 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -69,7 +69,7 @@ endef
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_ENCODINGS
 endif
 
-ifeq ($(BR2_PACKAGE_TCL_SHLIB_ONLY),y)
+ifeq ($(BR2_PACKAGE_TCL_REMOVE_TCLSH),y)
 define TCL_REMOVE_TCLSH
 	rm -f $(TARGET_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)
 endef
-- 
1.7.1

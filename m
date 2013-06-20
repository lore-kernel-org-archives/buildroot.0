From: Richard Genoud <richard.genoud@gmail.com>
Date: Thu, 20 Jun 2013 17:53:27 +0200
Subject: [Buildroot] [PATCH 1/4] TCL: change BR2_PACKAGE_TCL_SHLIB_ONLY
	option
In-Reply-To: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
References: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
Message-ID: <1371743610-17810-2-git-send-email-richard.genoud@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's not convenient to have an option (defaulted to yes) that removes a
software.
For instance, usb_modeswitching_data needs the tclsh interpreter, so it
would have to un-select this option, but select TCL.

Having an option that adds the tclsh binary (defaulted to no to keep the
same behaviour) is way more convenient.
Moreover, it seems that it was intended liked that at the begining
because usb_modeswitching_data already selects BR2_PACKAGE_TCL_TCLSH
which wasn't declared anywhere

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/tcl/Config.in |   11 +++++------
 package/tcl/tcl.mk    |    2 +-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/tcl/Config.in b/package/tcl/Config.in
index 7a4d887..8af7980 100644
--- a/package/tcl/Config.in
+++ b/package/tcl/Config.in
@@ -16,12 +16,11 @@ config BR2_PACKAGE_TCL_DEL_ENCODINGS
 
 	  It saves approx. 1.4 Mb of space.
 
-config BR2_PACKAGE_TCL_SHLIB_ONLY
-	bool "install only shared library"
-	default y
+config BR2_PACKAGE_TCL_TCLSH
+	bool "Install also tclsh binary, not only the shared library"
+	default n
 	depends on BR2_PACKAGE_TCL
 	help
-	  Install only TCL shared library and not binary tcl
-	  interpreter(tclsh8.4).
+	  Install the TCL interpreter binary file(tclsh8.4).
 
-	  Saves ~14kb.
+	  Adds ~14kb.
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 144fefe..1c23420 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -26,7 +26,7 @@ define TCL_POST_INSTALL_CLEANUP
 	-if [ "$(BR2_PACKAGE_TCL_DEL_ENCODINGS)" = "y" ]; then \
 	rm -Rf $(TARGET_DIR)/usr/lib/tcl$(TCL_VERSION_MAJOR)/encoding/*; \
 	fi
-	-if [ "$(BR2_PACKAGE_TCL_SHLIB_ONLY)" = "y" ]; then \
+	-if [ "$(BR2_PACKAGE_TCL_TCLSH)" != "y" ]; then \
 	rm -f $(TARGET_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR); \
 	fi
 endef
-- 
1.7.10.4

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 Jan 2012 14:59:26 +0100
Subject: [Buildroot] [git commit] tcl: add _VERSION_MAJOR / _VERSION_MINOR
	and use instead of hardcoded 8.4
Message-ID: <20120124140017.7BDC19039E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=16b17c9a15509f926579ced17285e9b38952b548
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sqlcipher/sqlcipher.mk |    2 +-
 package/tcl/tcl.mk             |    8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 9ad3e55..3e69a96 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -12,7 +12,7 @@ SQLCIPHER_INSTALL_STAGING = YES
 SQLCIPHER_CONF_ENV = \
 	CFLAGS+=" $(SQLCIPHER_CFLAGS)" \
 	LDFLAGS+=" $(SQLCIPHER_LDFLAGS)" \
-	TCLSH_CMD=$(HOST_DIR)/usr/bin/tclsh8.4
+	TCLSH_CMD=$(HOST_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)
 
 SQLCIPHER_CONF_OPT = \
 	--enable-threadsafe \
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 7bde8c7..8ed81ab 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -3,7 +3,9 @@
 # TCL8.4
 #
 #############################################################
-TCL_VERSION = 8.4.19
+TCL_VERSION_MAJOR = 8.4
+TCL_VERSION_MINOR = 19
+TCL_VERSION = $(TCL_VERSION_MAJOR).$(TCL_VERSION_MINOR)
 TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
 TCL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tcl
 TCL_SUBDIR = unix
@@ -20,10 +22,10 @@ HOST_TCL_CONF_OPT = \
 define TCL_POST_INSTALL_CLEANUP
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libtcl8.4.so
 	-if [ "$(BR2_PACKAGE_TCL_DEL_ENCODINGS)" = "y" ]; then \
-	rm -Rf $(TARGET_DIR)/usr/lib/tcl8.4/encoding/*; \
+	rm -Rf $(TARGET_DIR)/usr/lib/tcl$(TCL_VERSION_MAJOR)/encoding/*; \
 	fi
 	-if [ "$(BR2_PACKAGE_TCL_SHLIB_ONLY)" = "y" ]; then \
-	rm -f $(TARGET_DIR)/usr/bin/tclsh8.4; \
+	rm -f $(TARGET_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR); \
 	fi
 endef
 

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Jul 2012 23:21:02 +0200
Subject: [Buildroot] [PATCH 3/5] gettext: remove libintl handling
In-Reply-To: <cover.1342732829.git.thomas.petazzoni@free-electrons.com>
References: <cover.1342732829.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7baa3f68f46df9cb2c70c264cc0d550f349e2fdc.1342732829.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now, the gettext package always:

 * install everything to the staging directory
 * install the libraries to the target directory

Note that this commit removes BR2_PACKAGE_LIBINTL without updating the
packages, it is done in a separate commit to ease the review process.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gettext/Config.in  |   14 ++++----------
 package/gettext/gettext.mk |    7 +------
 2 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index 0ee4065..de19410 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -7,17 +7,11 @@ config BR2_PACKAGE_GETTEXT
 	  framework to help other GNU packages produce multi-lingual
 	  messages.
 
+	  Only the gettext libraries will be installed in the
+	  target. The full gettext suite, including tools, will be
+	  installed in the staging directory.
+
 	  http://www.gnu.org/software/gettext/
 
 comment "gettext requires a toolchain with WCHAR support"
 	depends on BR2_NEEDS_GETTEXT && !BR2_USE_WCHAR
-
-config BR2_PACKAGE_LIBINTL
-	bool "libintl"
-	depends on BR2_NEEDS_GETTEXT
-	depends on BR2_USE_WCHAR
-	help
-	  Selecting this package installs all of gettext in the staging
-	  directory and the shared library for it's use in the target.
-
-	  http://www.gnu.org/software/gettext/
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 6b2c336..4dff941 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -112,7 +112,7 @@ $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY): $(GETTEXT_DIR)/$(GETTEXT_BINARY)
 gettext-legal-info:
 	@$(call legal-warning-pkg,gettext,legal-info not yet implemented)
 
-gettext: host-pkg-config $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
+gettext: host-pkg-config $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY) $(TARGET_DIR)/$(LIBINTL_TARGET_BINARY)
 
 gettext-unpacked: $(GETTEXT_DIR)/.unpacked
 
@@ -139,16 +139,11 @@ $(TARGET_DIR)/usr/lib/libintl.so: $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
 		libgettext*.so*.la libintl*.so*.la)
 	touch -c $@
 
-libintl: $(TARGET_DIR)/$(LIBINTL_TARGET_BINARY)
-
 #############################################################
 #
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(BR2_PACKAGE_LIBINTL),y)
-TARGETS+=libintl
-endif
 ifeq ($(BR2_PACKAGE_GETTEXT),y)
 TARGETS+=gettext
 endif
-- 
1.7.9.5

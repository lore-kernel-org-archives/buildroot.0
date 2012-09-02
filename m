From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Sep 2012 17:43:46 +0200
Subject: [Buildroot] [PATCH 03/12] gettext: remove libintl handling
In-Reply-To: <1346600635-30946-1-git-send-email-yann.morin.1998@free.fr>
References: <1346600635-30946-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1346600635-30946-4-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Now, the gettext package always:

 * install everything to the staging directory
 * install the libraries to the target directory

Note that this commit removes BR2_PACKAGE_LIBINTL without updating the
packages, it is done in a separate commit to ease the review process.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[yann.morin.1998 at free.fr: keep BR2_PACKAGE_LIBINTL as blind option]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/gettext/Config.in  |   14 ++++++--------
 package/gettext/gettext.mk |    7 +------
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index 0ee4065..04f7de6 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -7,17 +7,15 @@ config BR2_PACKAGE_GETTEXT
 	  framework to help other GNU packages produce multi-lingual
 	  messages.
 
+	  Only the gettext libraries will be installed in the
+	  target. The full gettext suite, including tools, will be
+	  installed in the staging directory.
+
 	  http://www.gnu.org/software/gettext/
 
 comment "gettext requires a toolchain with WCHAR support"
 	depends on BR2_NEEDS_GETTEXT && !BR2_USE_WCHAR
 
 config BR2_PACKAGE_LIBINTL
-	bool "libintl"
-	depends on BR2_NEEDS_GETTEXT
-	depends on BR2_USE_WCHAR
-	help
-	  Selecting this package installs all of gettext in the staging
-	  directory and the shared library for it's use in the target.
-
-	  http://www.gnu.org/software/gettext/
+	bool
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
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
1.7.2.5

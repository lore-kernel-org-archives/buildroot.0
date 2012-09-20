From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Sep 2012 21:27:40 +0200
Subject: [Buildroot] [git commit] gettext: remove libintl handling
Message-ID: <20120920195432.744C49728D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a07346054e6e5e8e8bee0d16eabaaee9ba97bd3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now, the gettext package always:

 * install everything to the staging directory
 * install the libraries to the target directory

Note that this commit removes BR2_PACKAGE_LIBINTL without updating the
packages, it is done in a separate commit to ease the review process.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr: keep BR2_PACKAGE_LIBINTL as blind option]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
CC: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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

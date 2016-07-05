From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 15:53:05 +0200
Subject: [Buildroot] [git commit] packages: use the
	<PKG>_TARGET_FINALIZE_HOOKS
Message-ID: <20160705135614.36EDC8213C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50adab522c0fbf1c99b904b8513200b114eb4a0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Register package-specific target-finalize hooks with the
newly-introduced <PKG>_TARGET_FINALIZE_HOOKS.

This incidentally fixes luarocks, which was registering target-finalize
hooks even when it was not enabled.

To be noted, the skeleton package is not converted, because it is not
optional, we always have it; so its hooks would always be registered
anyway. Besides, the followup patches would render this conversion moot
anyway, since those hooks would be spread across the various skeleton
packages.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/google-breakpad/google-breakpad.mk |  6 ++----
 package/libglib2/libglib2.mk               |  6 ++----
 package/libgtk3/libgtk3.mk                 |  4 +---
 package/luarocks/luarocks.mk               |  3 +--
 package/perl/perl.mk                       |  4 +---
 package/python/python.mk                   | 10 ++++------
 package/python3/python3.mk                 | 10 ++++------
 7 files changed, 15 insertions(+), 28 deletions(-)

diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
index 1bbe4da..7a88c76 100644
--- a/package/google-breakpad/google-breakpad.mk
+++ b/package/google-breakpad/google-breakpad.mk
@@ -13,15 +13,13 @@ GOOGLE_BREAKPAD_INSTALL_TARGET = NO
 GOOGLE_BREAKPAD_INSTALL_STAGING = YES
 GOOGLE_BREAKPAD_LICENSE = BSD-3c
 GOOGLE_BREAKPAD_LICENSE_FILES = LICENSE
-
-ifeq ($(BR2_PACKAGE_GOOGLE_BREAKPAD),y)
 GOOGLE_BREAKPAD_DEPENDENCIES = host-google-breakpad
+
 define GOOGLE_BREAKPAD_EXTRACT_SYMBOLS
 	$(EXTRA_ENV) package/google-breakpad/gen-syms.sh $(STAGING_DIR) \
 		$(TARGET_DIR) $(call qstrip,$(BR2_GOOGLE_BREAKPAD_INCLUDE_FILES))
 endef
-TARGET_FINALIZE_HOOKS += GOOGLE_BREAKPAD_EXTRACT_SYMBOLS
-endif
+GOOGLE_BREAKPAD_TARGET_FINALIZE_HOOKS += GOOGLE_BREAKPAD_EXTRACT_SYMBOLS
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index b479bae..e2bff6d 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -160,10 +160,8 @@ define LIBGLIB2_COMPILE_SCHEMAS
 		--targetdir=$(TARGET_DIR)/usr/share/glib-2.0/schemas
 endef
 
-ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-TARGET_FINALIZE_HOOKS += LIBGLIB2_REMOVE_TARGET_SCHEMAS
-TARGET_FINALIZE_HOOKS += LIBGLIB2_COMPILE_SCHEMAS
-endif
+LIBGLIB2_TARGET_FINALIZE_HOOKS += LIBGLIB2_REMOVE_TARGET_SCHEMAS
+LIBGLIB2_TARGET_FINALIZE_HOOKS += LIBGLIB2_COMPILE_SCHEMAS
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index f447e7a..08d172f 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -182,13 +182,11 @@ endef
 
 # Create icon-theme.cache for each of the icon directories/themes
 # It's not strictly necessary but speeds up lookups
-ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 define LIBGTK3_UPDATE_ICON_CACHE
 	find $(TARGET_DIR)/usr/share/icons -maxdepth 1 -mindepth 1 -type d \
 		-exec $(HOST_DIR)/usr/bin/gtk-update-icon-cache {} \;
 endef
-TARGET_FINALIZE_HOOKS += LIBGTK3_UPDATE_ICON_CACHE
-endif
+LIBGTK3_TARGET_FINALIZE_HOOKS += LIBGTK3_UPDATE_ICON_CACHE
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 656b832..eddd435 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -60,5 +60,4 @@ define LUAROCKS_FINALIZE_TARGET
 	rm -rf $(TARGET_DIR)/usr/lib/luarocks
 endef
 
-TARGET_FINALIZE_HOOKS += LUAROCKS_FINALIZE_TARGET
-
+LUAROCKS_TARGET_FINALIZE_HOOKS += LUAROCKS_FINALIZE_TARGET
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 38f30ab..29b4455 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -111,7 +111,6 @@ endef
 $(eval $(generic-package))
 $(eval $(host-generic-package))
 
-ifeq ($(BR2_PACKAGE_PERL),y)
 define PERL_FINALIZE_TARGET
 	rm -rf $(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/pod
 	rm -rf $(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE
@@ -119,5 +118,4 @@ define PERL_FINALIZE_TARGET
 	find $(TARGET_DIR)/usr/lib/perl5/ -name '*.bs' -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/usr/lib/perl5/ -name '.packlist' -print0 | xargs -0 rm -f
 endef
-TARGET_FINALIZE_HOOKS += PERL_FINALIZE_TARGET
-endif
+PERL_TARGET_FINALIZE_HOOKS += PERL_FINALIZE_TARGET
diff --git a/package/python/python.mk b/package/python/python.mk
index 6117a6d..9026703 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -226,7 +226,7 @@ define PYTHON_CREATE_PYC_FILES
 endef
 
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON_PY_PYC),y)
-TARGET_FINALIZE_HOOKS += PYTHON_CREATE_PYC_FILES
+PYTHON_TARGET_FINALIZE_HOOKS += PYTHON_CREATE_PYC_FILES
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
@@ -234,7 +234,7 @@ define PYTHON_REMOVE_PY_FILES
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' -print0 | \
 		xargs -0 --no-run-if-empty rm -f
 endef
-TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PY_FILES
+PYTHON_TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PY_FILES
 endif
 
 # Normally, *.pyc files should not have been compiled, but just in
@@ -244,14 +244,12 @@ define PYTHON_REMOVE_PYC_FILES
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.pyc' -print0 | \
 		xargs -0 --no-run-if-empty rm -f
 endef
-TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PYC_FILES
+PYTHON_TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PYC_FILES
 endif
 
 # In all cases, we don't want to keep the optimized .pyo files
-ifeq ($(BR2_PACKAGE_PYTHON),y)
 define PYTHON_REMOVE_PYO_FILES
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.pyo' -print0 | \
 		xargs -0 --no-run-if-empty rm -f
 endef
-TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PYO_FILES
-endif
+PYTHON_TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PYO_FILES
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index f33b337..34e1297 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -217,7 +217,7 @@ define PYTHON3_CREATE_PYC_FILES
 endef
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY)$(BR2_PACKAGE_PYTHON3_PY_PYC),y)
-TARGET_FINALIZE_HOOKS += PYTHON3_CREATE_PYC_FILES
+PYTHON3_TARGET_FINALIZE_HOOKS += PYTHON3_CREATE_PYC_FILES
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
@@ -225,7 +225,7 @@ define PYTHON3_REMOVE_PY_FILES
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.py' -print0 | \
 		xargs -0 --no-run-if-empty rm -f
 endef
-TARGET_FINALIZE_HOOKS += PYTHON3_REMOVE_PY_FILES
+PYTHON3_TARGET_FINALIZE_HOOKS += PYTHON3_REMOVE_PY_FILES
 endif
 
 # Normally, *.pyc files should not have been compiled, but just in
@@ -235,16 +235,14 @@ define PYTHON3_REMOVE_PYC_FILES
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.pyc' -print0 | \
 		xargs -0 --no-run-if-empty rm -f
 endef
-TARGET_FINALIZE_HOOKS += PYTHON3_REMOVE_PYC_FILES
+PYTHON3_TARGET_FINALIZE_HOOKS += PYTHON3_REMOVE_PYC_FILES
 endif
 
 # In all cases, we don't want to keep the optimized .opt-1.pyc and
 # .opt-2.pyc files, since they can't work without their non-optimized
 # variant.
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
 define PYTHON3_REMOVE_OPTIMIZED_PYC_FILES
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.opt-1.pyc' -print0 -o -name '*.opt-2.pyc' -print0 | \
 		xargs -0 --no-run-if-empty rm -f
 endef
-TARGET_FINALIZE_HOOKS += PYTHON3_REMOVE_OPTIMIZED_PYC_FILES
-endif
+PYTHON3_TARGET_FINALIZE_HOOKS += PYTHON3_REMOVE_OPTIMIZED_PYC_FILES

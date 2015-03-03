From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:35 +0100
Subject: [Buildroot] [RFC v3 30/30] pkg-generic: add support for per-package
	staging directory
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-31-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 Makefile               |  2 +-
 package/Makefile.in    |  1 +
 package/pkg-generic.mk | 54 ++++++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 3723abc..6619bad 100644
--- a/Makefile
+++ b/Makefile
@@ -832,7 +832,7 @@ printvars:
 
 clean:
 	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
-		$(BUILD_DIR) $(BASE_DIR)/staging \
+		$(BUILD_DIR) $(BASE_DIR)/staging $(STAGINGPKG_DIR) \
 		$(LEGAL_INFO_DIR)
 
 distclean: clean
diff --git a/package/Makefile.in b/package/Makefile.in
index 6cfe3ed..2a21c9d 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -109,6 +109,7 @@ endif
 STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
 STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)
 STAGINGNOPKG_DIR := $(STAGING_DIR)
+STAGINGPKG_DIR = $(BASE_DIR)/stagingpkg
 
 TARGET_OPTIMIZATION := $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 43289d0..c35f801 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -208,7 +208,7 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 		$(call MESSAGE,"Fixing package configuration files") ;\
 			$(SED)  "s,$(BASE_DIR), at BASE_DIR@,g" \
 				-e "s,$(STAGING_DIR), at STAGING_DIR@,g" \
-				-e "s,^\(exec_\)\?prefix=.*,\1prefix=@STAGING_DIR@/usr,g" \
+				-e 's,^\(exec_\)\?prefix=.*,\1prefix=`echo $$0 | sed '"'"'s_/[^/]*/[^/]*$$__'"'"'`,g' \
 				-e "s,-I/usr/,-I at STAGING_DIR@/usr/,g" \
 				-e "s,-L/usr/,-L at STAGING_DIR@/usr/,g" \
 				-e "s, at STAGING_DIR@,$(STAGING_DIR),g" \
@@ -247,7 +247,7 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 
 # Remove package sources
 $(BUILD_DIR)/%/.stamp_dircleaned:
-	rm -Rf $(@D)
+	rm -Rf $(@D) $(STAGINGPKG_DIR)/$(call LOWERCASE,$(PKG))
 
 ################################################################################
 # virt-provides-single -- check that provider-pkg is the declared provider for
@@ -431,6 +431,38 @@ endif
 # Eliminate duplicates in dependencies
 $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
 
+ifeq ($$($(2)_ADD_TOOLCHAIN_DEPENDENCY),YES)
+ $(2)_STAGING_DIR = $$(STAGINGPKG_DIR)/$(1)
+ $(2)_TARGET_CPPFLAGS = $$(strip $$(TARGET_CPPFLAGS) -I$$($(2)_STAGING_DIR)/usr/include)
+ $(2)_TARGET_LDFLAGS = $$(TARGET_LDFLAGS) -L$$($(2)_STAGING_DIR)/usr/lib -Wl,-rpath,$$($(2)_STAGING_DIR)/usr/lib
+ $(2)_TARGET_CONFIGURE_OPTS = \
+	$$(TARGET_CONFIGURE_OPTS) \
+	PKG_CONFIG_SYSROOT_DIR="$$($(2)_STAGING_DIR)" \
+	PKG_CONFIG_PATH="$$($(2)_STAGING_DIR)/usr/lib/pkgconfig"
+ $(2)_TARGET_MAKE_ENV = \
+	$$(TARGET_MAKE_ENV) \
+	PKG_CONFIG_SYSROOT_DIR="$$($(2)_STAGING_DIR)" \
+	PKG_CONFIG_PATH="$$($(2)_STAGING_DIR)/usr/lib/pkgconfig"
+else
+ $(2)_STAGING_DIR = $$(STAGING_DIR)
+ $(2)_TARGET_CONFIGURE_OPTS = $$(TARGET_CONFIGURE_OPTS)
+ $(2)_TARGET_MAKE_ENV = $$(TARGET_MAKE_ENV)
+endif
+
+ifeq ($$($(2)_ADD_TOOLCHAIN_DEPENDENCY),YES)
+ $(2)_STAGING_DIRS = $$(wildcard $$(foreach dep,\
+	$$(filter-out host-% toolchain,$$($(2)_FINAL_DEPENDENCIES)),\
+	$$($$(call UPPERCASE,$$(dep))_STAGING_DIR)))
+
+ define $(2)_PREPARE_STAGING_DIR
+	mkdir -p $$(STAGING_DIR)/usr/include $$(STAGING_DIR)/usr/lib
+	$$(if $$($(2)_STAGING_DIRS),
+		cp -rdpf $$(addsuffix /*,$$($(2)_STAGING_DIRS)) \
+			$$($(2)_STAGING_DIR))
+ endef
+ $(2)_PRE_CONFIGURE_HOOKS := $(2)_PREPARE_STAGING_DIR $$($(2)_PRE_CONFIGURE_HOOKS)
+endif
+
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
 $(2)_INSTALL_TARGET		?= YES
@@ -604,11 +636,29 @@ $(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
 # define the PKG variable for all targets, containing the
 # uppercase package variable prefix
 $$($(2)_TARGET_INSTALL_TARGET):		PKG=$(2)
+$$($(2)_TARGET_INSTALL_TARGET):		STAGING_DIR:=$$($(2)_STAGING_DIR)
+$$($(2)_TARGET_INSTALL_TARGET):		TARGET_CPPFLAGS:=$$($(2)_TARGET_CPPFLAGS)
+$$($(2)_TARGET_INSTALL_TARGET):		TARGET_LDFLAGS:=$$($(2)_TARGET_LDFLAGS)
+$$($(2)_TARGET_INSTALL_TARGET):		TARGET_CONFIGURE_OPTS:=$$($(2)_TARGET_CONFIGURE_OPTS)
 $$($(2)_TARGET_INSTALL_STAGING):	PKG=$(2)
+$$($(2)_TARGET_INSTALL_STAGING):	STAGING_DIR:=$$($(2)_STAGING_DIR)
+$$($(2)_TARGET_INSTALL_STAGING):	TARGET_CPPFLAGS:=$$($(2)_TARGET_CPPFLAGS)
+$$($(2)_TARGET_INSTALL_STAGING):	TARGET_LDFLAGS:=$$($(2)_TARGET_LDFLAGS)
+$$($(2)_TARGET_INSTALL_STAGING):	TARGET_CONFIGURE_OPTS:=$$($(2)_TARGET_CONFIGURE_OPTS)
 $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_HOST):           PKG=$(2)
+$$($(2)_TARGET_INSTALL_HOST):		STAGING_DIR:=$$($(2)_STAGING_DIR)
 $$($(2)_TARGET_BUILD):			PKG=$(2)
+$$($(2)_TARGET_BUILD):			STAGING_DIR:=$$($(2)_STAGING_DIR)
+$$($(2)_TARGET_BUILD):			TARGET_CPPFLAGS:=$$($(2)_TARGET_CPPFLAGS)
+$$($(2)_TARGET_BUILD):			TARGET_LDFLAGS:=$$($(2)_TARGET_LDFLAGS)
+$$($(2)_TARGET_BUILD):			TARGET_CONFIGURE_OPTS:=$$($(2)_TARGET_CONFIGURE_OPTS)
+$$($(2)_TARGET_BUILD):			TARGET_MAKE_ENV:=$$($(2)_TARGET_MAKE_ENV)
 $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
+$$($(2)_TARGET_CONFIGURE):		STAGING_DIR:=$$($(2)_STAGING_DIR)
+$$($(2)_TARGET_CONFIGURE):		TARGET_CPPFLAGS:=$$($(2)_TARGET_CPPFLAGS)
+$$($(2)_TARGET_CONFIGURE):		TARGET_LDFLAGS:=$$($(2)_TARGET_LDFLAGS)
+$$($(2)_TARGET_CONFIGURE):		TARGET_CONFIGURE_OPTS:=$$($(2)_TARGET_CONFIGURE_OPTS)
 $$($(2)_TARGET_RSYNC):                  SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
 $$($(2)_TARGET_RSYNC):                  PKG=$(2)
 $$($(2)_TARGET_RSYNC_SOURCE):		SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
-- 
2.3.1

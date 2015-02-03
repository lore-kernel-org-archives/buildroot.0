From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Feb 2015 12:18:08 +0100
Subject: [Buildroot] [RFC v2] pkg-generic: add per-package staging directory
Message-ID: <1422962288-30985-1-git-send-email-Fabio.Porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit add a per-package staging directory under output/stagingpkg/
to improve build reproducibility, because it prevents that a unspecified
dependency affects the build.

Also fixing the problem of unspecified dependencies is useful for
top-level parallel make.

Signed-off-by: Fabio Porcedda <Fabio.Porcedda@gmail.com>
---

Notes:
    v2:
     - create a per-package directory by copying the staging directory of
       every dependency (Thomas P.)
    
    TODO:
    - add support for pkgconfig
    - further testing

 Makefile               |  2 +-
 package/Makefile.in    |  1 +
 package/pkg-generic.mk | 28 ++++++++++++++++++++++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a731d6b..9dc7fd5 100644
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
index 2055f00..ed13c63 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -108,6 +108,7 @@ endif
 
 STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
 STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)
+STAGINGPKG_DIR  = $(BASE_DIR)/stagingpkg
 
 TARGET_OPTIMIZATION := $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 38ef581..957ac2f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -428,6 +428,25 @@ endif
 # Eliminate duplicates in dependencies
 $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
 
+$(2)_STAGING_DIR = $$(STAGINGPKG_DIR)/$(1)
+$(2)_TARGET_CPPFLAGS += -I$$($(2)_STAGING_DIR)/usr/include
+$(2)_TARGET_LDFLAGS += -L$$($(2)_STAGING_DIR)/usr/lib
+ifeq ($(4),target)
+ ifeq ($$($(2)_ADD_TOOLCHAIN_DEPENDENCY),YES)
+  $(2)_STAGING_DIRS = $$(foreach dep,\
+	$$(filter-out host-% toolchain,$$($(2)_DEPENDENCIES)),\
+	$$($$(call UPPERCASE,$$(dep))_STAGING_DIR))
+
+  define $(2)_PREPARE_STAGING_DIR
+	$$(if $$($(2)_STAGING_DIRS),
+		mkdir -p $$(STAGING_DIR)
+		cp -rdpfl $$(addsuffix /*,$$($(2)_STAGING_DIRS)) \
+			$$(STAGING_DIR))
+  endef
+  $(2)_PRE_CONFIGURE_HOOKS += $(2)_PREPARE_STAGING_DIR
+ endif
+endif
+
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
 $(2)_INSTALL_TARGET		?= YES
@@ -598,10 +617,19 @@ $(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
 # uppercase package variable prefix
 $$($(2)_TARGET_INSTALL_TARGET):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_STAGING):	PKG=$(2)
+ifeq ($$($(2)_ADD_TOOLCHAIN_DEPENDENCY),YES)
+ $$($(2)_TARGET_INSTALL_STAGING):	STAGING_DIR=$$($(2)_STAGING_DIR)
+else
+ $$($(2)_TARGET_INSTALL_STAGING):	STAGING_DIR:=$$(STAGING_DIR)
+endif
 $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_HOST):           PKG=$(2)
 $$($(2)_TARGET_BUILD):			PKG=$(2)
+$$($(2)_TARGET_BUILD):			TARGET_CPPFLAGS=$$($(2)_TARGET_CPPFLAGS)
+$$($(2)_TARGET_BUILD):			TARGET_LDFLAGS=$$($(2)_TARGET_LDFLAGS)
 $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
+$$($(2)_TARGET_CONFIGURE):		TARGET_CPPFLAGS=$$($(2)_TARGET_CPPFLAGS)
+$$($(2)_TARGET_CONFIGURE):		TARGET_LDFLAGS=$$($(2)_TARGET_LDFLAGS)
 $$($(2)_TARGET_RSYNC):                  SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
 $$($(2)_TARGET_RSYNC):                  PKG=$(2)
 $$($(2)_TARGET_RSYNC_SOURCE):		SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
-- 
2.1.0

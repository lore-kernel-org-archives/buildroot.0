From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 30 Jan 2015 08:17:44 +0100
Subject: [Buildroot] [RFC] pkg-generic: add per-package staging directory
Message-ID: <1422602264-4725-1-git-send-email-Fabio.Porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit add a per-package staging directory under output/stagingof/
to improve build reproducibility, because it prevents that a unspecified
dependency affects the build.

It also help to enable default top-level parallel make.

TODO: Do more testing like testing "allyespackageconfig".
---
 Makefile               |  2 +-
 package/Makefile.in    |  1 +
 package/pkg-generic.mk | 16 ++++++++++++++++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index daf341c..c61e3c3 100644
--- a/Makefile
+++ b/Makefile
@@ -829,7 +829,7 @@ printvars:
 
 clean:
 	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
-		$(BUILD_DIR) $(BASE_DIR)/staging \
+		$(BUILD_DIR) $(BASE_DIR)/staging $(STAGINGOF_DIR) \
 		$(LEGAL_INFO_DIR)
 
 distclean: clean
diff --git a/package/Makefile.in b/package/Makefile.in
index 2055f00..634dc54 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -108,6 +108,7 @@ endif
 
 STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
 STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)
+STAGINGOF_DIR  = $(BASE_DIR)/stagingof
 
 TARGET_OPTIMIZATION := $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9643a30..e17620e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -428,6 +428,13 @@ endif
 # Eliminate duplicates in dependencies
 $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
 
+$(2)_TARGET_CPPFLAGS += $(foreach dep,$($(2)_DEPENDENCIES),\
+	-I$(STAGINGOF_DIR)/$(dep)/usr/include)
+
+$(2)_TARGET_LDFLAGS += $(foreach dep,$($(2)_DEPENDENCIES),\
+	-L$(STAGINGOF_DIR)/$(dep)/usr/lib \
+	$($(call UPPERCASE,$(dep))_TARGET_LDFLAGS))
+
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
 $(2)_INSTALL_TARGET		?= YES
@@ -598,10 +605,19 @@ $(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
 # uppercase package variable prefix
 $$($(2)_TARGET_INSTALL_TARGET):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_STAGING):	PKG=$(2)
+ifeq ($$($(2)_ADD_TOOLCHAIN_DEPENDENCY),YES)
+$$($(2)_TARGET_INSTALL_STAGING):	STAGING_DIR=$$(STAGINGOF_DIR)/$(1)
+else
+$$($(2)_TARGET_INSTALL_STAGING):	STAGING_DIR:=$$(STAGING_DIR)
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

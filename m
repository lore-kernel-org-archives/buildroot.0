From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 22:12:01 +0100
Subject: [Buildroot] [git commit] toolchain/gcc: sprinkle with some calls to
	MESSAGE
Message-ID: <20130120211456.AB7279A450@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff5c89861b4bf7cbdca61b659bbe6f5e768d1a2a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thus, the failing step can be easily extracted by autobuilders,
to ease with post-mortem analysis.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index b0d741b..bdc38cd 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -243,10 +243,12 @@ endif
 
 $(DL_DIR)/$(GCC_SOURCE):
 	mkdir -p $(DL_DIR)
+	$(call MESSAGE,"Downloading gcc")
 	$(call DOWNLOAD,$(GCC_SITE)/$(GCC_SOURCE))
 
 gcc-unpacked: $(GCC_DIR)/.patched
 $(GCC_DIR)/.unpacked: $(DL_DIR)/$(GCC_SOURCE)
+	$(Q)$(call MESSAGE,"Extracting gcc")
 	mkdir -p $(TOOLCHAIN_DIR)
 	rm -rf $(GCC_DIR)
 	$(GCC_CAT) $(DL_DIR)/$(GCC_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
@@ -259,6 +261,7 @@ endif
 
 gcc-patched: $(GCC_DIR)/.patched
 $(GCC_DIR)/.patched: $(GCC_DIR)/.unpacked
+	$(Q)$(call MESSAGE,"Patching gcc")
 	# Apply any files named gcc-*.patch from the source directory to gcc
 ifneq ($(wildcard $(GCC_PATCH_DIR)),)
 	support/scripts/apply-patches.sh $(GCC_DIR) $(GCC_PATCH_DIR) \*.patch
@@ -279,6 +282,7 @@ endif
 GCC_BUILD_DIR1:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-initial
 
 $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
+	$(Q)$(call MESSAGE,"Configuring gcc pass-1")
 	mkdir -p $(GCC_BUILD_DIR1)
 	(cd $(GCC_BUILD_DIR1); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
@@ -314,6 +318,7 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 	touch $@
 
 $(GCC_BUILD_DIR1)/.compiled: $(GCC_BUILD_DIR1)/.configured
+	$(Q)$(call MESSAGE,"Building gcc pass-1")
 ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
 	$(GCC_CONF_ENV) $(MAKE) -C $(GCC_BUILD_DIR1) all-gcc
 else
@@ -323,6 +328,7 @@ endif
 
 gcc_initial=$(GCC_BUILD_DIR1)/.installed
 $(gcc_initial) $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc: $(GCC_BUILD_DIR1)/.compiled
+	$(Q)$(call MESSAGE,"Installing gcc pass-1")
 	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) install-gcc
 	touch $(gcc_initial)
 
@@ -346,6 +352,7 @@ GCC_BUILD_DIR2:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-intermediate
 # the step or libgcc will not build...
 
 $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
+	$(Q)$(call MESSAGE,"Configuring gcc pass-2")
 	mkdir -p $(GCC_BUILD_DIR2)
 	(cd $(GCC_BUILD_DIR2); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
@@ -380,6 +387,7 @@ $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
 	touch $@
 
 $(GCC_BUILD_DIR2)/.compiled: $(GCC_BUILD_DIR2)/.configured
+	$(Q)$(call MESSAGE,"Building gcc pass-2")
 	# gcc >= 4.3.0 have to also build all-target-libgcc
 ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
 	$(GCC_CONF_ENV) $(MAKE) -C $(GCC_BUILD_DIR2) all-gcc all-target-libgcc
@@ -390,6 +398,7 @@ endif
 
 gcc_intermediate=$(GCC_BUILD_DIR2)/.installed
 $(gcc_intermediate): $(GCC_BUILD_DIR2)/.compiled
+	$(Q)$(call MESSAGE,"Installing gcc pass-2")
 	# gcc >= 4.3.0 have to also install install-target-libgcc
 ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
 	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR2) install-gcc install-target-libgcc
@@ -421,6 +430,7 @@ gcc_intermediate-dirclean:
 
 GCC_BUILD_DIR3:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-final
 $(GCC_BUILD_DIR3)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
+	$(Q)$(call MESSAGE,"Configuring gcc final")
 	mkdir -p $(GCC_BUILD_DIR3)
 	# Important! Required for limits.h to be fixed.
 	ln -snf ../include/ $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/sys-include
@@ -457,10 +467,12 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 	touch $@
 
 $(GCC_BUILD_DIR3)/.compiled: $(GCC_BUILD_DIR3)/.configured
+	$(Q)$(call MESSAGE,"Building gcc final")
 	$(GCC_CONF_ENV) $(MAKE) -C $(GCC_BUILD_DIR3) all
 	touch $@
 
 $(GCC_BUILD_DIR3)/.installed: $(GCC_BUILD_DIR3)/.compiled
+	$(Q)$(call MESSAGE,"Installing gcc final")
 	PATH=$(TARGET_PATH) $(MAKE) \
 		-C $(GCC_BUILD_DIR3) install
 	if [ -d "$(STAGING_DIR)/lib64" ]; then \
@@ -492,6 +504,7 @@ endif
 	touch $@
 
 $(STAMP_DIR)/gcc_libs_target_installed: $(GCC_BUILD_DIR3)/.installed
+	$(Q)$(call MESSAGE,"Installing gcc final libraries to staging and target")
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	# These go in /lib, so...
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
@@ -548,6 +561,7 @@ $(GCC_BUILD_DIR4)/.prepared: $(STAMP_DIR)/gcc_libs_target_installed
 	touch $@
 
 $(GCC_BUILD_DIR4)/.configured: $(GCC_BUILD_DIR4)/.prepared
+	$(Q)$(call MESSAGE,"Configuring gcc on target")
 	(cd $(GCC_BUILD_DIR4); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
@@ -586,6 +600,7 @@ $(GCC_BUILD_DIR4)/.configured: $(GCC_BUILD_DIR4)/.prepared
 	touch $@
 
 $(GCC_BUILD_DIR4)/.compiled: $(GCC_BUILD_DIR4)/.configured
+	$(Q)$(call MESSAGE,"Building gcc on target")
 	PATH=$(TARGET_PATH) \
 	$(MAKE) -C $(GCC_BUILD_DIR4) all
 	touch $@
@@ -598,6 +613,7 @@ GCC_INCLUDE_DIR:=include-fixed
 endif
 
 $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR4)/.compiled
+	$(Q)$(call MESSAGE,"Installing gcc on target")
 	PATH=$(TARGET_PATH) DESTDIR=$(TARGET_DIR) \
 		$(MAKE1) -C $(GCC_BUILD_DIR4) install
 	# Remove broken specs file (cross compile flag is set).

From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Thu,  2 May 2013 21:51:22 +0200
Subject: [Buildroot] [PATCH v4 01/12] toolchain/gcc: Add host-{flex,
	bison} dependencies for GCC 4.2, 4.3, 4.4
In-Reply-To: <1367524293-32081-1-git-send-email-mjonker@synopsys.com>
References: <1367524293-32081-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1367524293-32081-2-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Note that gcc doesn't use the package infrastructure, and needs proper
$(HOST_MAKE_ENV) and $(TARGET_MAKE_ENV) to be able to find host-flex/
host-bison.

Original patch by Thomas Petazzoni.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |   32 ++++++++++++++++++++------------
 1 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index fc11ad4..0a96211 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -170,6 +170,14 @@ endif
 GCC_HOST_PREREQ += host-mpc
 endif
 
+ifneq ($(findstring x4.2.,x$(GCC_VERSION)),x4.2.)
+ifneq ($(findstring x4.3.,x$(GCC_VERSION)),x4.3.)
+ifneq ($(findstring x4.4.,x$(GCC_VERSION)),x4.4.)
+GCC_HOST_PREREQ = host-flex host-bison
+endif
+endif
+endif
+
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 GCC_SHARED_LIBGCC:=--enable-shared
 else
@@ -289,16 +297,16 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 $(GCC_BUILD_DIR1)/.compiled: $(GCC_BUILD_DIR1)/.configured
 	$(Q)$(call MESSAGE,"Building gcc pass-1")
 ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
-	$(GCC_CONF_ENV) $(MAKE) -C $(GCC_BUILD_DIR1) all-gcc
+	$(GCC_CONF_ENV) $(HOST_MAKE_ENV) $(MAKE) -C $(GCC_BUILD_DIR1) all-gcc
 else
-	$(MAKE) -C $(GCC_BUILD_DIR1) all-gcc
+	$(HOST_MAKE_ENV) $(MAKE) -C $(GCC_BUILD_DIR1) all-gcc
 endif
 	touch $@
 
 gcc_initial=$(GCC_BUILD_DIR1)/.installed
 $(gcc_initial) $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc: $(GCC_BUILD_DIR1)/.compiled
 	$(Q)$(call MESSAGE,"Installing gcc pass-1")
-	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) install-gcc
+	$(HOST_MAKE_ENV) $(MAKE) -C $(GCC_BUILD_DIR1) install-gcc
 	touch $(gcc_initial)
 
 gcc_initial: $(GCC_HOST_PREREQ) host-binutils $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc
@@ -360,9 +368,9 @@ $(GCC_BUILD_DIR2)/.compiled: $(GCC_BUILD_DIR2)/.configured
 	$(Q)$(call MESSAGE,"Building gcc pass-2")
 	# gcc >= 4.3.0 have to also build all-target-libgcc
 ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
-	$(GCC_CONF_ENV) $(MAKE) -C $(GCC_BUILD_DIR2) all-gcc all-target-libgcc
+	$(GCC_CONF_ENV) $(HOST_MAKE_ENV) $(MAKE) -C $(GCC_BUILD_DIR2) all-gcc all-target-libgcc
 else
-	$(MAKE) -C $(GCC_BUILD_DIR2) all-gcc
+	$(HOST_MAKE_ENV) $(MAKE) -C $(GCC_BUILD_DIR2) all-gcc
 endif
 	touch $@
 
@@ -371,9 +379,9 @@ $(gcc_intermediate): $(GCC_BUILD_DIR2)/.compiled
 	$(Q)$(call MESSAGE,"Installing gcc pass-2")
 	# gcc >= 4.3.0 have to also install install-target-libgcc
 ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
-	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR2) install-gcc install-target-libgcc
+	$(HOST_MAKE_ENV) $(MAKE) -C $(GCC_BUILD_DIR2) install-gcc install-target-libgcc
 else
-	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR2) install-gcc
+	$(HOST_MAKE_ENV) $(MAKE) -C $(GCC_BUILD_DIR2) install-gcc
 endif
 	touch $(gcc_intermediate)
 
@@ -439,12 +447,12 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 
 $(GCC_BUILD_DIR3)/.compiled: $(GCC_BUILD_DIR3)/.configured
 	$(Q)$(call MESSAGE,"Building gcc final")
-	$(GCC_CONF_ENV) $(MAKE) -C $(GCC_BUILD_DIR3) all
+	$(GCC_CONF_ENV) $(HOST_MAKE_ENV) $(MAKE) -C $(GCC_BUILD_DIR3) all
 	touch $@
 
 $(GCC_BUILD_DIR3)/.installed: $(GCC_BUILD_DIR3)/.compiled
 	$(Q)$(call MESSAGE,"Installing gcc final")
-	PATH=$(TARGET_PATH) $(MAKE) \
+	$(HOST_MAKE_ENV) $(MAKE) \
 		-C $(GCC_BUILD_DIR3) install
 	if [ -d "$(STAGING_DIR)/lib64" ]; then \
 		if [ ! -e "$(STAGING_DIR)/lib" ]; then \
@@ -572,8 +580,8 @@ $(GCC_BUILD_DIR4)/.configured: $(GCC_BUILD_DIR4)/.prepared
 
 $(GCC_BUILD_DIR4)/.compiled: $(GCC_BUILD_DIR4)/.configured
 	$(Q)$(call MESSAGE,"Building gcc on target")
-	PATH=$(TARGET_PATH) \
-	$(MAKE) -C $(GCC_BUILD_DIR4) all
+	$(TARGET_MAKE_ENV) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(GCC_BUILD_DIR4) all
 	touch $@
 
 GCC_LIB_SUBDIR=lib/gcc/$(GNU_TARGET_NAME)/$(GCC_VERSION)
@@ -585,7 +593,7 @@ endif
 
 $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR4)/.compiled
 	$(Q)$(call MESSAGE,"Installing gcc on target")
-	PATH=$(TARGET_PATH) DESTDIR=$(TARGET_DIR) \
+	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) \
 		$(MAKE1) -C $(GCC_BUILD_DIR4) install
 	# Remove broken specs file (cross compile flag is set).
 	rm -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/specs
-- 
1.7.0.4

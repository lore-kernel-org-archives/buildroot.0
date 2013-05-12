From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 22:22:00 +0200
Subject: [Buildroot] [git commit] toolchain/gcc: make sure to pass
	$(HOST_DIR)/usr/bin in the PATH
Message-ID: <20130512202410.A43D19A164@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=671bd0468516224bf8c1bb56e35bed9b3cb0c8d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since gcc doesn't use the package infrastructure, it doesn't get all
the good generic environment variables, and forgets to get
$(HOST_DIR)/usr/bin in its PATH. This prevents gcc from finding and
using host tools built by Buildroot.

This patch therefore ensures that $(HOST_MAKE_ENV) or
$(TARGET_MAKE_ENV) are passed at the appropriate locations. It will be
useful for a later patch that makes gcc depend on host-flex/host-bison
in some situations.

Original patch by Thomas Petazzoni.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |   24 ++++++++++++------------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 959568f..8cacc32 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -299,16 +299,16 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
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
@@ -370,9 +370,9 @@ $(GCC_BUILD_DIR2)/.compiled: $(GCC_BUILD_DIR2)/.configured
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
 
@@ -381,9 +381,9 @@ $(gcc_intermediate): $(GCC_BUILD_DIR2)/.compiled
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
 
@@ -449,12 +449,12 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 
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
@@ -582,8 +582,8 @@ $(GCC_BUILD_DIR4)/.configured: $(GCC_BUILD_DIR4)/.prepared
 
 $(GCC_BUILD_DIR4)/.compiled: $(GCC_BUILD_DIR4)/.configured
 	$(Q)$(call MESSAGE,"Building gcc on target")
-	PATH=$(TARGET_PATH) \
-	$(MAKE) -C $(GCC_BUILD_DIR4) all
+	$(TARGET_MAKE_ENV) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(GCC_BUILD_DIR4) all
 	touch $@
 
 GCC_LIB_SUBDIR=lib/gcc/$(GNU_TARGET_NAME)/$(GCC_VERSION)
@@ -595,7 +595,7 @@ endif
 
 $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR4)/.compiled
 	$(Q)$(call MESSAGE,"Installing gcc on target")
-	PATH=$(TARGET_PATH) DESTDIR=$(TARGET_DIR) \
+	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) \
 		$(MAKE1) -C $(GCC_BUILD_DIR4) install
 	# Remove broken specs file (cross compile flag is set).
 	rm -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/specs

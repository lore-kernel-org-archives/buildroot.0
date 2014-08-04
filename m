From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 09:54:22 +0200
Subject: [Buildroot] [git commit] uclibc: convert to kconfig-package
	infrastructure
Message-ID: <20140804075840.42AB59D11C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c8d8e8a53699b3863956568c3423110cc855aba7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch converts the uclibc package to the new kconfig-package
infrastructure, thus removing code duplication and ensuring a consistent
behavior of kconfig packages.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk |   34 ++++++++++------------------------
 1 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 80a88a4..c7203cc 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -37,6 +37,14 @@ ifndef UCLIBC_CONFIG_FILE
 UCLIBC_CONFIG_FILE = $(call qstrip,$(BR2_UCLIBC_CONFIG))
 endif
 
+UCLIBC_KCONFIG_FILE = $(UCLIBC_CONFIG_FILE)
+
+UCLIBC_KCONFIG_OPT = \
+		$(UCLIBC_MAKE_FLAGS) \
+		PREFIX=$(STAGING_DIR) \
+		DEVEL_PREFIX=/usr/ \
+		RUNTIME_PREFIX=$(STAGING_DIR)/ \
+
 UCLIBC_TARGET_ARCH = $(call qstrip,$(BR2_UCLIBC_TARGET_ARCH))
 
 ifeq ($(GENERATE_LOCALE),)
@@ -393,7 +401,7 @@ UCLIBC_MAKE_FLAGS = \
 	UCLIBC_EXTRA_CFLAGS="$(UCLIBC_EXTRA_CFLAGS) $(TARGET_ABI)" \
 	HOSTCC="$(HOSTCC)"
 
-define UCLIBC_FIXUP_DOT_CONFIG
+define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(call KCONFIG_SET_OPT,CROSS_COMPILER_PREFIX,"$(TARGET_CROSS)",$(@D)/.config)
 	$(call KCONFIG_ENABLE_OPT,TARGET_$(UCLIBC_TARGET_ARCH),$(@D)/.config)
 	$(call KCONFIG_SET_OPT,TARGET_ARCH,"$(UCLIBC_TARGET_ARCH)",$(@D)/.config)
@@ -531,29 +539,7 @@ define UCLIBC_INSTALL_STAGING_CMDS
 	$(UCLIBC_INSTALL_UTILS_STAGING)
 endef
 
-$(eval $(generic-package))
-
-$(UCLIBC_DIR)/.config: $(UCLIBC_CONFIG_FILE) | uclibc-patch
-	$(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.config
-
-$(UCLIBC_DIR)/.stamp_config_fixup_done: $(UCLIBC_DIR)/.config
-	$(UCLIBC_FIXUP_DOT_CONFIG)
-	$(Q)touch $@
-
-$(UCLIBC_TARGET_CONFIGURE): $(UCLIBC_DIR)/.stamp_config_fixup_done
-
-uclibc-menuconfig: $(UCLIBC_DIR)/.stamp_config_fixup_done
-	$(MAKE) -C $(UCLIBC_DIR) \
-		$(UCLIBC_MAKE_FLAGS) \
-		PREFIX=$(STAGING_DIR) \
-		DEVEL_PREFIX=/usr/ \
-		RUNTIME_PREFIX=$(STAGING_DIR)/ \
-		menuconfig
-	rm -f $(UCLIBC_DIR)/.stamp_{config_fixup_done,configured,built}
-	rm -f $(UCLIBC_DIR)/.stamp_{target,staging}_installed
-
-uclibc-update-config: $(UCLIBC_DIR)/.stamp_config_fixup_done
-	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
+$(eval $(kconfig-package))
 
 # Before uClibc is built, we must have the second stage cross-compiler
 $(UCLIBC_TARGET_BUILD): | host-gcc-intermediate

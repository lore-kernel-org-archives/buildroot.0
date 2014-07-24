From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 24 Jul 2014 19:49:30 +0200
Subject: [Buildroot] [PATCH 3 of 7] uclibc: convert to kconfig-package
	infrastructure
In-Reply-To: <patchbomb.1406224167@localhost>
References: <patchbomb.1406224167@localhost>
Message-ID: <ec98df5449b08309c4e8.1406224170@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch converts the uclibc package to the new kconfig-package
infrastructure, thus removing code duplication and ensuring a consistent
behavior of kconfig packages.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/uclibc/uclibc.mk |  21 ++++-----------------
 1 files changed, 4 insertions(+), 17 deletions(-)

diff -r 7c00a2ad3724 -r ec98df5449b0 package/uclibc/uclibc.mk
--- a/package/uclibc/uclibc.mk	Wed Jul 23 21:12:48 2014 +0200
+++ b/package/uclibc/uclibc.mk	Tue Jul 22 20:35:36 2014 +0200
@@ -393,7 +393,7 @@
 	UCLIBC_EXTRA_CFLAGS="$(UCLIBC_EXTRA_CFLAGS) $(TARGET_ABI)" \
 	HOSTCC="$(HOSTCC)"
 
-define UCLIBC_FIXUP_DOT_CONFIG
+define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(call KCONFIG_SET_OPT,CROSS_COMPILER_PREFIX,"$(TARGET_CROSS)",$(@D)/.config)
 	$(call KCONFIG_ENABLE_OPT,TARGET_$(UCLIBC_TARGET_ARCH),$(@D)/.config)
 	$(call KCONFIG_SET_OPT,TARGET_ARCH,"$(UCLIBC_TARGET_ARCH)",$(@D)/.config)
@@ -533,27 +533,14 @@
 
 $(eval $(generic-package))
 
-$(UCLIBC_DIR)/.config: $(UCLIBC_CONFIG_FILE) | uclibc-patch
-	$(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.config
-
-$(UCLIBC_DIR)/.stamp_config_fixup_done: $(UCLIBC_DIR)/.config
-	$(UCLIBC_FIXUP_DOT_CONFIG)
-	$(Q)touch $@
-
-$(UCLIBC_TARGET_CONFIGURE): $(UCLIBC_DIR)/.stamp_config_fixup_done
-
-uclibc-menuconfig: $(UCLIBC_DIR)/.config
-	$(MAKE) -C $(UCLIBC_DIR) \
+UCLIBC_KCONFIG_FILE = $(UCLIBC_CONFIG_FILE)
+UCLIBC_KCONFIG_OPT = \
 		$(UCLIBC_MAKE_FLAGS) \
 		PREFIX=$(STAGING_DIR) \
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(STAGING_DIR)/ \
-		menuconfig
-	rm -f $(UCLIBC_DIR)/.stamp_{config_fixup_done,configured,built}
-	rm -f $(UCLIBC_DIR)/.stamp_{target,staging}_installed
 
-uclibc-update-config: $(UCLIBC_DIR)/.stamp_config_fixup_done
-	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
+$(eval $(kconfig-package))
 
 # Before uClibc is built, we must have the second stage cross-compiler
 $(UCLIBC_TARGET_BUILD): | host-gcc-intermediate

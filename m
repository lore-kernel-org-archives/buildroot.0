From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 18 Jul 2014 20:54:55 +0200
Subject: [Buildroot] [PATCH 2 of 3 v3] uclibc: menuconfig: take into account
 initial settings from config file
In-Reply-To: <patchbomb.1405709693@localhost>
References: <patchbomb.1405709693@localhost>
Message-ID: <29ba03b43b12987891fb.1405709695@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When executing the sequence 'make clean uclibc-menuconfig', the configured
config file is not taken into account and one starts from the default
settings.

This patch adds an explicit target for the config file and lets the
configure and menuconfig steps depend on it, fixing the problem.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v3: no changes
v2:
- use UCLIBC_TARGET_CONFIGURE instead of specifying the stamp path in full
  (Arnout)
rfc->patch:
- add target for .config to avoid menuconfig copying the config file
  every time (ThomasP, Arnout)
- move dependency on patch step from menuconfig to the .config target

 package/uclibc/uclibc.mk |  12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff -r 282d34c926c8 -r 29ba03b43b12 package/uclibc/uclibc.mk
--- a/package/uclibc/uclibc.mk	Wed Jul 02 21:31:07 2014 +0200
+++ b/package/uclibc/uclibc.mk	Sun Jun 22 10:37:22 2014 +0200
@@ -394,7 +394,6 @@
 	HOSTCC="$(HOSTCC)"
 
 define UCLIBC_FIXUP_DOT_CONFIG
-	$(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(@D)/.config
 	$(call KCONFIG_SET_OPT,CROSS_COMPILER_PREFIX,"$(TARGET_CROSS)",$(@D)/.config)
 	$(call KCONFIG_ENABLE_OPT,TARGET_$(UCLIBC_TARGET_ARCH),$(@D)/.config)
 	$(call KCONFIG_SET_OPT,TARGET_ARCH,"$(UCLIBC_TARGET_ARCH)",$(@D)/.config)
@@ -533,7 +532,14 @@
 	$(UCLIBC_INSTALL_UTILS_STAGING)
 endef
 
-uclibc-menuconfig: uclibc-patch
+$(eval $(generic-package))
+
+$(UCLIBC_DIR)/.config: $(UCLIBC_CONFIG_FILE) | uclibc-patch
+	$(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.config
+
+$(UCLIBC_TARGET_CONFIGURE): $(UCLIBC_DIR)/.config
+
+uclibc-menuconfig: $(UCLIBC_DIR)/.config
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		$(UCLIBC_MAKE_FLAGS) \
 		PREFIX=$(STAGING_DIR) \
@@ -542,8 +548,6 @@
 		menuconfig
 	rm -f $(UCLIBC_DIR)/.stamp_{configured,built,target_installed,staging_installed}
 
-$(eval $(generic-package))
-
 uclibc-update-config: $(UCLIBC_DIR)/.stamp_configured
 	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
 

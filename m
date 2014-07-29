From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 23:43:04 +0200
Subject: [Buildroot] [git commit] uclibc: menuconfig: take into account
	initial settings from config file
Message-ID: <20140729214349.B9A599CDCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c7b312ff41656ca7bd294f286f3e65b3241f0696
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When executing the sequence 'make clean uclibc-menuconfig', the configured
config file is not taken into account and one starts from the default
settings.

This patch adds an explicit target for the config file and lets the
configure and menuconfig steps depend on it, fixing the problem.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index ab2e57c..83f68c3 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -394,7 +394,6 @@ UCLIBC_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC)"
 
 define UCLIBC_FIXUP_DOT_CONFIG
-	$(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(@D)/.config
 	$(call KCONFIG_SET_OPT,CROSS_COMPILER_PREFIX,"$(TARGET_CROSS)",$(@D)/.config)
 	$(call KCONFIG_ENABLE_OPT,TARGET_$(UCLIBC_TARGET_ARCH),$(@D)/.config)
 	$(call KCONFIG_SET_OPT,TARGET_ARCH,"$(UCLIBC_TARGET_ARCH)",$(@D)/.config)
@@ -533,7 +532,14 @@ define UCLIBC_INSTALL_STAGING_CMDS
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
@@ -542,8 +548,6 @@ uclibc-menuconfig: uclibc-patch
 		menuconfig
 	rm -f $(UCLIBC_DIR)/.stamp_{configured,built,target_installed,staging_installed}
 
-$(eval $(generic-package))
-
 uclibc-update-config: $(UCLIBC_DIR)/.stamp_configured
 	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
 

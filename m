From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 May 2015 01:42:04 +0200
Subject: [Buildroot] [PATCH 09/21 RFC] core: introduce a generated kconfig
	snippet
In-Reply-To: <cover.1432681414.git.yann.morin.1998@free.fr>
References: <cover.1432681414.git.yann.morin.1998@free.fr>
Message-ID: <9fcf4ff8201770f13a6fc061c15868d9c5f84b96.1432681414.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the infrastructure for adding generated kconfig snippet in the
menuconfig.

For now, the kconfig snippet is generated empty, the recipe for filling
it in will be introduced in sub-sequent patches.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 Config.in             | 6 ++++++
 Makefile              | 7 ++++++-
 docs/manual/manual.mk | 3 +++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index 2b39d6a..7c2575e 100644
--- a/Config.in
+++ b/Config.in
@@ -18,6 +18,10 @@ config BR2_EXTERNAL
 	string
 	option env="BR2_EXTERNAL"
 
+config BR2_BUILD_DIR
+	string
+	option env="BUILD_DIR"
+
 # Hidden boolean selected by packages in need of Java in order to build
 # (example: xbmc)
 config BR2_NEEDS_HOST_JAVA
@@ -637,3 +641,5 @@ menu "User-provided options"
 source "$BR2_EXTERNAL/Config.in"
 
 endmenu
+
+source "$BR2_BUILD_DIR/.br2-external.in"
diff --git a/Makefile b/Makefile
index b2d8a5a..4ddef1b 100644
--- a/Makefile
+++ b/Makefile
@@ -678,7 +678,7 @@ endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 HOSTCFLAGS = $(CFLAGS_FOR_BUILD)
 export HOSTCFLAGS
 
-prepare-kconfig: outputmakefile
+prepare-kconfig: outputmakefile $(BUILD_DIR)/.br2-external.in
 
 $(BUILD_DIR)/buildroot-config/%onf:
 	mkdir -p $(@D)/lxdialog
@@ -696,6 +696,7 @@ COMMON_CONFIG_ENV = \
 	KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
 	BR2_CONFIG=$(BR2_CONFIG) \
 	BR2_EXTERNAL=$(BR2_EXTERNAL) \
+	BUILD_DIR=$(BUILD_DIR) \
 	SKIP_LEGACY=
 
 xconfig: $(BUILD_DIR)/buildroot-config/qconf prepare-kconfig
@@ -795,6 +796,10 @@ ifeq ($(NEED_WRAPPER),y)
 	$(Q)$(TOPDIR)/support/scripts/mkmakefile $(TOPDIR) $(O)
 endif
 
+.PHONY: $(BUILD_DIR)/.br2-external.in
+$(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
+	@touch $@
+
 # printvars prints all the variables currently defined in our Makefiles
 printvars:
 	@$(foreach V, \
diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index caf080a..b26f912 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -7,6 +7,9 @@
 MANUAL_SOURCES = $(sort $(wildcard docs/manual/*.txt) $(wildcard docs/images/*))
 MANUAL_RESOURCES = $(TOPDIR)/docs/images
 
+# Ensure the kconfig snippet is generated (for MANUAL_GEN_LISTS, below):
+MANUAL_DEPENDENCIES += prepare-kconfig
+
 # Our manual needs to generate lists
 define MANUAL_GEN_LISTS
 	$(Q)$(call MESSAGE,"Updating the manual lists...")
-- 
1.9.1

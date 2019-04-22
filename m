From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Apr 2019 21:23:58 +0200
Subject: [Buildroot] [PATCH 02/12] core: move generated .br2-external
 kconfig file to $(BASE_DIR)
In-Reply-To: <cover.1555960978.git.yann.morin.1998@free.fr>
References: <cover.1555960978.git.yann.morin.1998@free.fr>
Message-ID: <165e2a5f4a4ecec8ba425c7594d35b9e3042d0d3.1555960978.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, that file is generated rather late in the configuration
process, so BUILD_DIR is known (and exists) by then.

We're soon to generate that file much earlier, at a point where
BUILD_DIR is not yet known, so we have two options:
 1- declare BUILD_DIR earlier;
 2- generate the file in an already-known location.

We go with the second solution, as we're already generating a
br2-external related file in BASE_DIR, so we can as well generate all
br2-external files in the same place.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in |  6 +++---
 Makefile  | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Config.in b/Config.in
index 757ad1ca40..c611bb7dec 100644
--- a/Config.in
+++ b/Config.in
@@ -14,9 +14,9 @@ config BR2_HOSTARCH
 	string
 	option env="HOSTARCH"
 
-config BR2_BUILD_DIR
+config BR2_BASE_DIR
 	string
-	option env="BUILD_DIR"
+	option env="BASE_DIR"
 
 # Hidden config symbols for packages to check system gcc version
 config BR2_HOST_GCC_VERSION
@@ -865,4 +865,4 @@ source "package/Config.in.host"
 
 source "Config.in.legacy"
 
-source "$BR2_BUILD_DIR/.br2-external.in"
+source "$BR2_BASE_DIR/.br2-external.in"
diff --git a/Makefile b/Makefile
index 86e444da98..0498b28def 100644
--- a/Makefile
+++ b/Makefile
@@ -939,7 +939,7 @@ HOSTCFLAGS = $(CFLAGS_FOR_BUILD)
 export HOSTCFLAGS
 
 .PHONY: prepare-kconfig
-prepare-kconfig: outputmakefile $(BUILD_DIR)/.br2-external.in
+prepare-kconfig: outputmakefile $(BASE_DIR)/.br2-external.in
 
 $(BUILD_DIR)/buildroot-config/%onf:
 	mkdir -p $(@D)/lxdialog
@@ -957,7 +957,7 @@ COMMON_CONFIG_ENV = \
 	KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
 	BR2_CONFIG=$(BR2_CONFIG) \
 	HOST_GCC_VERSION="$(HOSTCC_VERSION)" \
-	BUILD_DIR=$(BUILD_DIR) \
+	BASE_DIR=$(BASE_DIR) \
 	SKIP_LEGACY=
 
 xconfig: $(BUILD_DIR)/buildroot-config/qconf prepare-kconfig
@@ -1039,8 +1039,8 @@ endif
 # Even though the target is a real file, we mark it as PHONY as we
 # want it to be re-generated each time make is invoked, in case the
 # value of BR2_EXTERNAL is changed.
-.PHONY: $(BUILD_DIR)/.br2-external.in
-$(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
+.PHONY: $(BASE_DIR)/.br2-external.in
+$(BASE_DIR)/.br2-external.in: $(BUILD_DIR)
 	$(Q)support/scripts/br2-external -k -o "$(@)" $(BR2_EXTERNAL)
 
 # printvars prints all the variables currently defined in our
@@ -1071,7 +1071,7 @@ ifeq ($(O),$(CURDIR)/output)
 	rm -rf $(O)
 endif
 	rm -rf $(TOPDIR)/dl $(BR2_CONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/..config.tmp \
-		$(CONFIG_DIR)/.auto.deps $(BR2_EXTERNAL_FILE)
+		$(CONFIG_DIR)/.auto.deps $(BR2_EXTERNAL_FILE) $(BASE_DIR)/.br2-external.in
 
 .PHONY: help
 help:
-- 
2.14.1

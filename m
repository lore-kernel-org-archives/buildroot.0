From: kostap at marvell.com <kostap@marvell.com>
Date: Mon, 4 Feb 2019 16:31:36 +0200
Subject: [Buildroot] [PATCH 2/3] boot: a3700-utils-marvell: Add Armada-3700
 utilities
In-Reply-To: <20190204143137.32224-1-kostap@marvell.com>
References: <20190204143137.32224-1-kostap@marvell.com>
Message-ID: <20190204143137.32224-3-kostap@marvell.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Konstantin Porotchkin <kostap@marvell.com>

Marvell Armada 37xx firmware code and utilities are kept in
a separate repository. This code is needed as a dependency
to build ATF firmware for Marvell Armada 37xx SoCs.

Signed-off-by: Konstantin Porotchkin <kostap@marvell.com>
---
 boot/Config.in                                |  1 +
 boot/a3700-utils-marvell/Config.in            | 46 +++++++++++++++++++
 .../a3700-utils-marvell.hash                  |  2 +
 .../a3700-utils-marvell.mk                    | 28 +++++++++++
 4 files changed, 77 insertions(+)
 create mode 100644 boot/a3700-utils-marvell/Config.in
 create mode 100644 boot/a3700-utils-marvell/a3700-utils-marvell.hash
 create mode 100644 boot/a3700-utils-marvell/a3700-utils-marvell.mk

diff --git a/boot/Config.in b/boot/Config.in
index 8e0c8e5df4..4acde0e764 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -19,5 +19,6 @@ source "boot/syslinux/Config.in"
 source "boot/ts4800-mbrboot/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
+source "boot/a3700-utils-marvell/Config.in"
 
 endmenu
diff --git a/boot/a3700-utils-marvell/Config.in b/boot/a3700-utils-marvell/Config.in
new file mode 100644
index 0000000000..1fff8555a9
--- /dev/null
+++ b/boot/a3700-utils-marvell/Config.in
@@ -0,0 +1,46 @@
+config BR2_TARGET_A3700_UTILS_MARVELL
+	bool "a3700-utils-marvell"
+	depends on BR2_aarch64
+	help
+	  Marvell Armada 37xx firmware code and utilities are kept in
+	  a separate repository. This code is needed as a dependency
+	  to build ATF firmware for Marvell Armada 37xx SoCs.
+
+	  https://github.com/MarvellEmbeddedProcessors/A3700-utils-marvell/
+
+choice
+	bool "a3700-utils-marvell-version"
+
+config BR2_TARGET_A3700_UTILS_MARVELL_CUSTOM_GIT
+	bool "Custom Git repository"
+	help
+	  Allows to specify custom repository for the component
+	  Useful for developers building out of bleeding edge sources
+
+config BR2_TARGET_A3700_UTILS_MARVELL_RELEASE
+	bool "Release repository on Github"
+	help
+	  Use the package sources specified in this buildroot release
+
+config BR2_TARGET_A3700_UTILS_MARVELL_CUSTOM_TARBALL
+	bool "Release sources supplied as archives"
+	help
+	  Use the package sources from local archive
+
+endchoice
+
+if BR2_TARGET_A3700_UTILS_MARVELL_CUSTOM_GIT
+
+config BR2_TARGET_A3700_UTILS_MARVELL_CUSTOM_REPO_URL
+	string "URL of custom repository"
+
+config BR2_TARGET_A3700_UTILS_MARVELL_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	help
+	  Revision to use in the typical format used by Git
+	  E.G. a sha id, a tag, branch, ..
+
+endif
+
+config BR2_TARGET_A3700_UTILS_MARVELL_CUSTOM_TARBALL_LOCATION
+	string "Name of local archive file with release"
diff --git a/boot/a3700-utils-marvell/a3700-utils-marvell.hash b/boot/a3700-utils-marvell/a3700-utils-marvell.hash
new file mode 100644
index 0000000000..b4f4cd70e9
--- /dev/null
+++ b/boot/a3700-utils-marvell/a3700-utils-marvell.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 5a8dd5ae9322d19a61a8ca9ca9235c0a24dee889e6a0b2f848fc8d9e1494505d a3700-utils-marvell-a0a1cb88327afa91415c59822fa9c5894d9ec3d7.tar.gz
diff --git a/boot/a3700-utils-marvell/a3700-utils-marvell.mk b/boot/a3700-utils-marvell/a3700-utils-marvell.mk
new file mode 100644
index 0000000000..c4fb29d73a
--- /dev/null
+++ b/boot/a3700-utils-marvell/a3700-utils-marvell.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# a3700-utils-marvell
+#
+################################################################################
+
+ifeq ($(BR2_TARGET_A3700_UTILS_MARVELL_CUSTOM_GIT),y)
+A3700_UTILS_MARVELL_VERSION = $(call qstrip,$(BR2_TARGET_A3700_UTILS_MARVELL_CUSTOM_REPO_VERSION))
+A3700_UTILS_MARVELL_SITE = $(call qstrip,$(BR2_TARGET_A3700_UTILS_MARVELL_CUSTOM_REPO_URL))
+A3700_UTILS_MARVELL_SITE_METHOD = git
+BR_NO_CHECK_HASH_FOR += $(A3700_UTILS_MARVELL_SOURCE)
+else
+ifeq ($(BR2_TARGET_A3700_UTILS_MARVELL_CUSTOM_TARBALL),y)
+A3700_UTILS_MARVELL_TARBALL = $(call qstrip,$(BR2_TARGET_A3700_UTILS_MARVELL_CUSTOM_TARBALL_LOCATION))
+A3700_UTILS_MARVELL_SITE = $(patsubst %/,%,$(dir $(A3700_UTILS_MARVELL_TARBALL)))
+A3700_UTILS_MARVELL_SITE_METHOD = file
+A3700_UTILS_MARVELL_SOURCE = $(notdir $(A3700_UTILS_MARVELL_TARBALL))
+BR_NO_CHECK_HASH_FOR += $(A3700_UTILS_MARVELL_SOURCE)
+else
+# This is the commit for A3700-utils-armada-18.12.0
+A3700_UTILS_MARVELL_VERSION = a0a1cb88327afa91415c59822fa9c5894d9ec3d7
+A3700_UTILS_MARVELL_SITE = $(call github,MarvellEmbeddedProcessors,A3700-utils-marvell,$(A3700_UTILS_MARVELL_VERSION))
+endif
+endif
+A3700_UTILS_MARVELL_LICENSE = GPL-2.0+ or LGPL-2.1 with freertos-exception-2.0, BSD-3-Clause, Marvell Commercial
+A3700_UTILS_MARVELL_LICENSE_FILES = wtptp/src/TBB_Linux/readme.txt
+
+$(eval $(generic-package))
-- 
2.17.1

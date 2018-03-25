From: Calin Crisan <ccrisan@gmail.com>
Date: Sun, 25 Mar 2018 13:18:55 +0300
Subject: [Buildroot] [PATCH v3 1/1] toolchain-external-custom: allow
 specifying relative path to binaries
Message-ID: <20180325101855.21851-1-ccrisan@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are cases where a downloaded toolchain doesn't have its binaries
placed directly in a "bin" subfolder (where BuildRoot currently looks
for them).

A common example is the official Raspberry Pi Toolchain
(https://github.com/raspberrypi/tools), which has its binaries in
"arm-bcm2708/arm-linux-gnueabihf/bin".

This commit introduces BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH that defaults
to "bin" and can be changed as needed.

Signed-off-by: Calin Crisan <ccrisan@gmail.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk            | 7 ++++++-
 .../toolchain-external-custom/Config.in.options                   | 8 ++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 3bf9fac412..405f2e1698 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -71,13 +71,18 @@ else
 TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
 endif
 
+# If binary path unset (known, supported external toolchains), use "bin".
+TOOLCHAIN_EXTERNAL_REL_BIN_PATH = $(or \
+	$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH)), \
+	bin)
+
 ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
 ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
 # if no path set, figure it out from path
 TOOLCHAIN_EXTERNAL_BIN := $(dir $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
 endif
 else
-TOOLCHAIN_EXTERNAL_BIN = $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
+TOOLCHAIN_EXTERNAL_BIN = $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/$(TOOLCHAIN_EXTERNAL_REL_BIN_PATH)
 endif
 
 # If this is a buildroot toolchain, it already has a wrapper which we want to
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 70c7d8e3c3..b711d9b81f 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -12,6 +12,14 @@ config BR2_TOOLCHAIN_EXTERNAL_URL
 	help
 	  URL of the custom toolchain tarball to download and install.
 
+config BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH
+	string "Toolchain relative bin path"
+	default "bin"
+	depends on BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
+	help
+	  Path to where the binaries (e.g. the compiler) can be found,
+	  relative to the downloaded toolchain root directory.
+
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 	string "Toolchain prefix"
 	default "$(ARCH)-linux"
-- 
2.16.2

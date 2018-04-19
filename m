From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Apr 2018 23:04:44 +0200
Subject: [Buildroot] [git commit] toolchain-external-custom: allow
 specifying relative path to binaries
Message-ID: <20180419210741.A89698882B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=928c9289d25c47167c7e895f1a5f487067539b2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are cases where a downloaded toolchain doesn't have its binaries
placed directly in a "bin" subfolder (where BuildRoot currently looks
for them).

A common example is the official Raspberry Pi Toolchain
(https://github.com/raspberrypi/tools), which has its binaries in
"arm-bcm2708/arm-linux-gnueabihf/bin".

This commit introduces BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH that defaults
to "bin" and can be changed as needed.

Signed-off-by: Calin Crisan <ccrisan@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: rework a bit how TOOLCHAIN_EXTERNAL_REL_BIN_PATH is defined.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk           | 6 +++++-
 .../toolchain-external-custom/Config.in.options                  | 9 +++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 3bf9fac412..8b2c283654 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -77,7 +77,11 @@ ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
 TOOLCHAIN_EXTERNAL_BIN := $(dir $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
 endif
 else
-TOOLCHAIN_EXTERNAL_BIN = $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
+TOOLCHAIN_EXTERNAL_REL_BIN_PATH = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH))
+ifeq ($(TOOLCHAIN_EXTERNAL_REL_BIN_PATH),)
+TOOLCHAIN_EXTERNAL_REL_BIN_PATH = bin
+endif
+TOOLCHAIN_EXTERNAL_BIN = $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/$(TOOLCHAIN_EXTERNAL_REL_BIN_PATH)
 endif
 
 # If this is a buildroot toolchain, it already has a wrapper which we want to
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 8cc9db6841..65d94d0adf 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -12,6 +12,15 @@ config BR2_TOOLCHAIN_EXTERNAL_URL
 	help
 	  URL of the custom toolchain tarball to download and install.
 
+config BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH
+	string "Toolchain relative binary path"
+	default "bin"
+	depends on BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
+	help
+	  Path to where the binaries (e.g. the compiler) can be found,
+	  relative to the downloaded toolchain root directory. The
+	  default is "bin" and is correct for most toolchains.
+
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 	string "Toolchain prefix"
 	default "$(ARCH)-linux"

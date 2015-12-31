From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 31 Dec 2015 01:34:13 +0100
Subject: [Buildroot] [PATCH] Config.in: add symbols for
	BR2_HOST_GCC_AT_LEAST_X_Y
Message-ID: <1451522053-2797-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle <arnout@mind.be>

Some host packages need a recent gcc version. Add symbols to Config.in
to specify the HOSTCC version. The values are passed through the
environment, and this environment is generated in a new support script.

Also update the documentation to mention the new symbols.

[Thomas: simplify by using only make logic instead of an external
shell script.]

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
v4: Further simplification by Arnout: no post-processing is needed for
    4.X versions if we keep the space in "4 9". Also use extended regex
    to simplify the sed script a little.
v3: Alternative version by Thomas that removes the external shell
    script.
v2: Use a single environment variable and select statements (Yann)
    This makes the shell script ridiculously simple. I've tried to move
    it to the Makefile, but then all the additional quoting etc. makes
    it complicated again.
---
 Config.in                                 | 24 ++++++++++++++++++++++++
 Makefile                                  |  9 +++++++++
 docs/manual/adding-packages-directory.txt |  7 +++++++
 3 files changed, 40 insertions(+)

diff --git a/Config.in b/Config.in
index 9513cc1..f6f9b85 100644
--- a/Config.in
+++ b/Config.in
@@ -18,6 +18,30 @@ config BR2_EXTERNAL
 	string
 	option env="BR2_EXTERNAL"
 
+# Hidden config symbols for packages to check system gcc version
+config BR2_HOST_GCC_VERSION
+	string
+	option env="HOST_GCC_VERSION"
+
+config BR2_HOST_GCC_AT_LEAST_4_7
+	bool
+	default y if BR2_HOST_GCC_VERSION = "4 7"
+
+config BR2_HOST_GCC_AT_LEAST_4_8
+	bool
+	default y if BR2_HOST_GCC_VERSION = "4 8"
+	select BR2_HOST_GCC_AT_LEAST_4_7
+
+config BR2_HOST_GCC_AT_LEAST_4_9
+	bool
+	default y if BR2_HOST_GCC_VERSION = "4 9"
+	select BR2_HOST_GCC_AT_LEAST_4_8
+
+config BR2_HOST_GCC_AT_LEAST_5
+	bool
+	default y if BR2_HOST_GCC_VERSION = "5"
+	select BR2_HOST_GCC_AT_LEAST_4_9
+
 # Hidden boolean selected by packages in need of Java in order to build
 # (example: xbmc)
 config BR2_NEEDS_HOST_JAVA
diff --git a/Makefile b/Makefile
index 1d69192..80e94a2 100644
--- a/Makefile
+++ b/Makefile
@@ -293,6 +293,14 @@ HOSTRANLIB := $(shell which $(HOSTRANLIB) || type -p $(HOSTRANLIB) || echo ranli
 export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTLD
 export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
 
+HOSTCC_VERSION := $(shell $(HOSTCC_NOCCACHE) --version | \
+	sed -n -r 's/^.* ([0-9]*)\.([0-9]*)\.([0-9]*)[ ]*.*/\1 \2/p')
+
+# For gcc >= 5.x, we only need the major version.
+ifneq ($(firstword $(HOSTCC_VERSION)),4)
+HOSTCC_VERSION := $(firstword $(HOSTCC_VERSION))
+endif
+
 # Make sure pkg-config doesn't look outside the buildroot tree
 HOST_PKG_CONFIG_PATH := $(PKG_CONFIG_PATH)
 unexport PKG_CONFIG_PATH
@@ -724,6 +732,7 @@ COMMON_CONFIG_ENV = \
 	KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
 	BR2_CONFIG=$(BR2_CONFIG) \
 	BR2_EXTERNAL=$(BR2_EXTERNAL) \
+	HOST_GCC_VERSION="$(HOSTCC_VERSION)" \
 	SKIP_LEGACY=
 
 xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 139123e..c2d9f75 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -283,6 +283,13 @@ use in the comment.
 ** Comment string: +gcc >= X.Y+ and/or `gcc <= X.Y` (replace
    +X.Y+ with the proper version)
 
+* Host GCC version
+** Dependency symbol: +BR2_HOST_GCC_AT_LEAST_X_Y+, (replace
+   +X_Y+ with the proper version, see +Config.in+)
+** Comment string: no comment to be added
+** Note that it is usually not the package itself that has a minimum
+   host GCC version, but rather a host-package on which it depends.
+
 * C library
 ** Dependency symbol: +BR2_TOOLCHAIN_USES_GLIBC+,
    +BR2_TOOLCHAIN_USES_MUSL+, +BR2_TOOLCHAIN_USES_UCLIBC+
-- 
2.6.4

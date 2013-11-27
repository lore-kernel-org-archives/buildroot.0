From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Nov 2013 23:31:44 +0100
Subject: [Buildroot] [PATCHv3 1/5] core: introduce the BR2_EXTERNAL variable
In-Reply-To: <1385591508-4174-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1385591508-4174-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1385591508-4174-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit introduces the BR2_EXTERNAL environment variable, which
will allow to keep Buildroot customization (board-specific
configuration files or root filesystem overlays, package Config.in and
makefiles, as well as defconfigs) outside of the Buildroot tree.

This commit only introduces the variable itself, and ensures that it
is available within Config.in options, so that string options used to
specify paths to directories or files can use $BR2_EXTERNAL as a
reference. For example, one can use
$BR2_EXTERNAL/board/<someboard>/kernel.config as the
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE value.

Following patches extend the usage of BR2_EXTERNAL to other areas
(packages and defconfigs).

In details, this commit:

 * Introduces the BR2_EXTERNAL Kconfig option. This option has no
   prompt, and is therefore not visible to the user and also not
   stored in the .config file. It is automatically set to the value of
   the BR2_EXTERNAL environment variable. The only purpose of this
   BR2_EXTERNAL Kconfig option is to allow $BR2_EXTERNAL to be
   properly expanded when used inside Kconfig option values.

 * Calculates the BR2_EXTERNAL value to use. If passed on the command
   line, then this value is taken in priority, and saved to a
   .br-external hidden file in the output directory. If not passed on
   the command line, then we read the .br-external file from the
   output directory. This allows the user to not pass the BR2_EXTERNAL
   value at each make invocation. If no BR2_EXTERNAL value is passed,
   we define it to support/dummy-external/, so that the kconfig code
   finds an existing $(BR2_EXTERNAL)/package/Config.in file to
   include.

 * Passes the BR2_EXTERNAL into the *config environment, so that its
   value is found when parsing/evaluating Config.in files and .config
   values.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in |  4 ++++
 Makefile  | 42 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index d87e0f0..98726ab 100644
--- a/Config.in
+++ b/Config.in
@@ -14,6 +14,10 @@ config BR2_HOSTARCH
 	string
 	option env="HOSTARCH"
 
+config BR2_EXTERNAL
+	string
+	option env="BR2_EXTERNAL"
+
 # Hidden boolean selected by pre-built packages for x86, when they
 # need to run on x86-64 machines (example: pre-built external
 # toolchains, binary tools like SAM-BA, etc.).
diff --git a/Makefile b/Makefile
index b5368a3..a46418e 100644
--- a/Makefile
+++ b/Makefile
@@ -99,6 +99,45 @@ export CDPATH:=
 BASE_DIR := $(shell mkdir -p $(O) && cd $(O) >/dev/null && pwd)
 $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 
+
+# Handling of BR2_EXTERNAL. We are handling three cases here:
+#
+#  (Case 1) BR2_EXTERNAL is defined in the command line, but has an
+#           empty value. That's an indication that the user wants to
+#           remove the BR2_EXTERNAL value. So we use the
+#           dummy-external directory as BR2_EXTERNAL and remove the
+#           .br-external file.
+#  (Case 2) BR2_EXTERNAL is defined in the command line, and has a
+#           non-empty value. That's an indication that the user wants
+#           to use the provided location as the BR2_EXTERNAL. We
+#           verify that the location exists, and if it's the case,
+#           store it in .br-external.
+#  (Case 3) BR2_EXTERNAL isn't defined in the command line. We load
+#           the value from .br-external, verify that it exists and
+#           then use it.
+
+BR2_EXTERNAL_FILE = $(BASE_DIR)/.br-external
+
+ifeq ($(origin BR2_EXTERNAL),command line)
+ifeq ($(BR2_EXTERNAL),) # Case 1
+override BR2_EXTERNAL := $(TOPDIR)/support/dummy-external/
+$(shell rm -f $(BR2_EXTERNAL_FILE))
+else # Case 2
+ifeq ($(wildcard $(BR2_EXTERNAL)),)
+$(error "The specified BR2_EXTERNAL '$(BR2_EXTERNAL)' location doesn't exist")
+endif
+override BR2_EXTERNAL := $(realpath $(BR2_EXTERNAL))
+BR2_EXTERNAL_USED = y
+$(shell echo $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
+endif
+else # Case 3
+override BR2_EXTERNAL := $(shell test -f $(BR2_EXTERNAL_FILE) && cat $(BR2_EXTERNAL_FILE))
+ifeq ($(wildcard $(BR2_EXTERNAL)),)
+$(error "The specified BR2_EXTERNAL '$(BR2_EXTERNAL)' location doesn't exist")
+endif
+BR2_EXTERNAL_USED = y
+endif
+
 BUILD_DIR:=$(BASE_DIR)/build
 STAMP_DIR:=$(BASE_DIR)/stamps
 BINARIES_DIR:=$(BASE_DIR)/images
@@ -619,7 +658,8 @@ COMMON_CONFIG_ENV = \
 	KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 	KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
 	KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
-	BUILDROOT_CONFIG=$(BUILDROOT_CONFIG)
+	BUILDROOT_CONFIG=$(BUILDROOT_CONFIG) \
+	BR2_EXTERNAL=$(BR2_EXTERNAL)
 
 xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-- 
1.8.1.2

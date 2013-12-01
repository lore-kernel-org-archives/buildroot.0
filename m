From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun,  1 Dec 2013 01:20:27 +0100
Subject: [Buildroot] [PATCH v5] core: introduce the BR2_EXTERNAL variable
In-Reply-To: <529A8032.10606@mind.be>
References: <529A8032.10606@mind.be>
Message-ID: <1385857227-677-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit introduces the BR2_EXTERNAL environment variable, which
will allow to keep Buildroot customization (board-specific
configuration files or root filesystem overlays, package Config.in and
makefiles, as well as defconfigs) outside of the Buildroot tree.

This commit only introduces the variable itself, and ensures that it
is available within Config.in options. This allows us to use
$BR2_EXTERNAL in a 'source' statement in Config.in.

Following patches extend the usage of BR2_EXTERNAL to other areas
(packages and defconfigs).

In details, this commit:

 * Introduces the BR2_EXTERNAL Kconfig option. This option has no
   prompt, and is therefore not visible to the user and also not
   stored in the .config file. It is automatically set to the value of
   the BR2_EXTERNAL environment variable. The only purpose of this
   BR2_EXTERNAL Kconfig option is to allow $BR2_EXTERNAL to be
   properly expanded when used inside Kconfig source statements.

 * Calculates the BR2_EXTERNAL value to use. If passed on the command
   line, then this value is taken in priority, and saved to a
   .br-external hidden file in the output directory. If not passed on
   the command line, then we read the .br-external file from the
   output directory. This allows the user to not pass the BR2_EXTERNAL
   value at each make invocation. If no BR2_EXTERNAL value is passed,
   we define it to support/dummy-external, so that the kconfig code
   finds an existing $(BR2_EXTERNAL)/package/Config.in file to
   include.

 * Passes the BR2_EXTERNAL into the *config environment, so that its
   value is found when parsing/evaluating Config.in files and .config
   values.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in |  4 ++++
 Makefile  | 27 ++++++++++++++++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)

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
index 0480a42..ae0bc10 100644
--- a/Makefile
+++ b/Makefile
@@ -99,6 +99,30 @@ export CDPATH:=
 BASE_DIR := $(shell mkdir -p $(O) && cd $(O) >/dev/null && pwd)
 $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 
+
+# Handling of BR2_EXTERNAL.
+#
+# The value of BR2_EXTERNAL is stored in .br-external in the output directory.
+# On subsequent invocations of make, it is read in. It can still be overridden
+# on the command line, therefore the file is re-created every time make is run.
+#
+# When BR2_EXTERNAL is not set, the .br-external file is removed and we point 
+# to support/dummy-external. This makes sure we can unconditionally include the
+# Config.in and external.mk from the BR2_EXTERNAL directory. In this case,
+# override is necessary so the user can clear BR2_EXTERNAL from the command 
+# line, but the dummy path is still used internally.
+
+BR2_EXTERNAL_FILE = $(BASE_DIR)/.br-external
+-include $(BR2_EXTERNAL_FILE)
+ifeq ($(BR2_EXTERNAL),)
+  override BR2_EXTERNAL = support/dummy-external
+  $(shell rm -f $(BR2_EXTERNAL_FILE))
+else
+  BR2_EXTERNAL_USED = y
+  $(shell echo BR2_EXTERNAL ?= $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
+endif
+
+
 BUILD_DIR:=$(BASE_DIR)/build
 STAMP_DIR:=$(BASE_DIR)/stamps
 BINARIES_DIR:=$(BASE_DIR)/images
@@ -619,7 +643,8 @@ COMMON_CONFIG_ENV = \
 	KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 	KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
 	KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
-	BUILDROOT_CONFIG=$(BUILDROOT_CONFIG)
+	BUILDROOT_CONFIG=$(BUILDROOT_CONFIG) \
+	BR2_EXTERNAL=$(BR2_EXTERNAL)
 
 xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-- 
1.8.4.4

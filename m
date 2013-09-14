From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Sep 2013 21:03:50 +0200
Subject: [Buildroot] [PATCHv2 1/4] core: introduce the BR2_EXTERNAL variable
In-Reply-To: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1379185433-8770-2-git-send-email-thomas.petazzoni@free-electrons.com>
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

 * Ensures that the path given in BR2_EXTERNAL is an absolute path, or
   if not path is given, ensures that BR2_EXTERNAL points to a dummy
   implementation in $(TOPDIR)/support/dummy-external/. This last part
   is not directly useful in this commit, but is needed to properly
   support Config.in options declared in BR2_EXTERNAL (next commit).

 * Passes the BR2_EXTERNAL into the *config environment, so that its
   value is found when parsing/evaluating Config.in files and .config
   values.

 * Encodes the BR2_EXTERNAL value into the Makefile wrapper (only if
   BR2_EXTERNAL is specified by the user, not if the dummy internal
   value is used).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                  |  4 ++++
 Makefile                   | 13 +++++++++++--
 support/scripts/mkmakefile |  3 ++-
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
index 65c29b4..522eaf8 100644
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
index 8610592..13ad342 100644
--- a/Makefile
+++ b/Makefile
@@ -51,6 +51,14 @@ CONFIG_CONFIG_IN=Config.in
 CONFIG=support/kconfig
 DATE:=$(shell date +%Y%m%d)
 
+# Turn BR2_EXTERNAL into an absolute path
+ifneq ($(BR2_EXTERNAL),)
+override BR2_EXTERNAL := $(realpath $(BR2_EXTERNAL))
+BR2_EXTERNAL_USED = y
+else
+BR2_EXTERNAL = $(TOPDIR)/support/dummy-external/
+endif
+
 # Compute the full local version string so packages can use it as-is
 # Need to export it, so it can be got from environment in children (eg. mconf)
 export BR2_VERSION_FULL:=$(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlocalversion)
@@ -632,7 +640,8 @@ COMMON_CONFIG_ENV = \
 	KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 	KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
 	KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
-	BUILDROOT_CONFIG=$(BUILDROOT_CONFIG)
+	BUILDROOT_CONFIG=$(BUILDROOT_CONFIG) \
+	BR2_EXTERNAL=$(BR2_EXTERNAL)
 
 xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
@@ -739,7 +748,7 @@ source-check:
 # output directory.
 outputmakefile:
 ifeq ($(NEED_WRAPPER),y)
-	$(Q)$(TOPDIR)/support/scripts/mkmakefile $(TOPDIR) $(O)
+	$(Q)$(TOPDIR)/support/scripts/mkmakefile $(TOPDIR) $(O) $(if $(BR2_EXTERNAL_USED),$(BR2_EXTERNAL))
 endif
 
 # printvars prints all the variables currently defined in our Makefiles
diff --git a/support/scripts/mkmakefile b/support/scripts/mkmakefile
index cef2ec7..e7c1bd0 100755
--- a/support/scripts/mkmakefile
+++ b/support/scripts/mkmakefile
@@ -6,7 +6,7 @@
 # Usage
 # $1 - Kernel src directory
 # $2 - Output directory
-
+# $3 - BR2_EXTERNAL directory
 
 test ! -r $2/Makefile -o -O $2/Makefile || exit 0
 # Only overwrite automatically generated Makefiles
@@ -27,6 +27,7 @@ makedir := \$(dir \$(call lastword,\$(MAKEFILE_LIST)))
 
 MAKEARGS := -C $1
 MAKEARGS += O=\$(if \$(patsubst /%,,\$(makedir)),\$(CURDIR)/)\$(patsubst %/,%,\$(makedir))
+MAKEARGS += BR2_EXTERNAL=$3
 
 MAKEFLAGS += --no-print-directory
 
-- 
1.8.1.2

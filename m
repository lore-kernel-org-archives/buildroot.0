From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Feb 2014 17:00:13 +0100
Subject: [Buildroot] [git commit] infra: replace BUILDROOT_CONFIG with
	BR2_CONFIG
Message-ID: <20140209160103.4BE0E9C912@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4113b3c3bdb9c7943e011827982000403f66dc61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To make the naming consistent (all user-visible options should be
prefixed with BR2_).

An entry is added to Makefile.legacy to warn users who have set
BUILDROOT_CONFIG but not BR2_CONFIG.

Still export BUILDROOT_CONFIG but pointing to some phony value, to
make sure that scripts that still use it fail in a predictable way.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: J??r??my Rosen <jeremy.rosen@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                                           |   20 ++++++++++----------
 Makefile.legacy                                    |   12 ++++++++++++
 docs/manual/customize-rootfs.txt                   |    4 ++--
 docs/manual/debugging-buildroot.txt                |    2 +-
 support/dependencies/dependencies.sh               |   10 +++++-----
 support/kconfig/confdata.c                         |    2 +-
 .../patches/01-kconfig-kernel-to-buildroot.patch   |    2 +-
 support/scripts/mkusers                            |    4 ++--
 8 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/Makefile b/Makefile
index 563fbfd..72b11b8 100644
--- a/Makefile
+++ b/Makefile
@@ -152,11 +152,11 @@ LEGAL_LICENSES_TXT_HOST=$(LEGAL_INFO_DIR)/host-licenses.txt
 LEGAL_WARNINGS=$(LEGAL_INFO_DIR)/.warnings
 LEGAL_REPORT=$(LEGAL_INFO_DIR)/README
 
-BUILDROOT_CONFIG=$(CONFIG_DIR)/.config
+BR2_CONFIG=$(CONFIG_DIR)/.config
 
 # Pull in the user's configuration file
 ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
--include $(BUILDROOT_CONFIG)
+-include $(BR2_CONFIG)
 endif
 
 # To put more focus on warnings, be less verbose as default
@@ -331,7 +331,7 @@ endif
 
 # Scripts in support/ or post-build scripts may need to reference
 # these locations, so export them so it is easier to use
-export BUILDROOT_CONFIG
+export BR2_CONFIG
 export TARGET_DIR
 export STAGING_DIR
 export HOST_DIR
@@ -428,7 +428,7 @@ $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
-$(BUILD_DIR)/buildroot-config/auto.conf: $(BUILDROOT_CONFIG)
+$(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 	$(MAKE1) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
 
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
@@ -626,7 +626,7 @@ legal-info-prepare: $(LEGAL_INFO_DIR)
 	@$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPLv2+,COPYING,not saved,HOST)
 	@$(call legal-warning,the Buildroot source code has not been saved)
 	@$(call legal-warning,the toolchain has not been saved)
-	@cp $(BUILDROOT_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
+	@cp $(BR2_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
 
 legal-info: dirs legal-info-clean legal-info-prepare $(TARGETS_LEGAL_INFO) \
 		$(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST)
@@ -683,7 +683,7 @@ COMMON_CONFIG_ENV = \
 	KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 	KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
 	KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
-	BUILDROOT_CONFIG=$(BUILDROOT_CONFIG) \
+	BR2_CONFIG=$(BR2_CONFIG) \
 	BR2_EXTERNAL=$(BR2_EXTERNAL)
 
 xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
@@ -724,7 +724,7 @@ allnoconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@grep -v BR2_PACKAGE_ $(BUILDROOT_CONFIG) > $(CONFIG_DIR)/.config.nopkg
+	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
 	@grep '^config BR2_PACKAGE_' Config.in.legacy | \
 		while read config pkg; do \
 		echo "# $$pkg is not set" >> $(CONFIG_DIR)/.config.nopkg; done
@@ -735,7 +735,7 @@ randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@grep -v BR2_PACKAGE_ $(BUILDROOT_CONFIG) > $(CONFIG_DIR)/.config.nopkg
+	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
 	@grep '^config BR2_PACKAGE_' Config.in.legacy | \
 		while read config pkg; do \
 		echo "# $$pkg is not set" >> $(CONFIG_DIR)/.config.nopkg; done
@@ -746,7 +746,7 @@ allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@grep -v BR2_PACKAGE_ $(BUILDROOT_CONFIG) > $(CONFIG_DIR)/.config.nopkg
+	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
 	@$(COMMON_CONFIG_ENV) \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
 		$< --allnoconfig $(CONFIG_CONFIG_IN)
@@ -818,7 +818,7 @@ endif
 ifeq ($(O),output)
 	rm -rf $(O)
 endif
-	rm -rf $(BUILDROOT_CONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/.auto.deps
+	rm -rf $(BR2_CONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/.auto.deps
 
 help:
 	@echo 'Cleaning:'
diff --git a/Makefile.legacy b/Makefile.legacy
index 4954398..ea18bc6 100644
--- a/Makefile.legacy
+++ b/Makefile.legacy
@@ -28,6 +28,18 @@ $(error "The BUILDROOT_DL_DIR environment variable was renamed to BR2_DL_DIR.")
 endif
 endif
 
+# Similar to above for BUILDROOT_CONFIG, but here we have no .config equivalent.
+ifneq ($(BUILDROOT_CONFIG),)
+ifneq ($(BUILDROOT_CONFIG),$(BR2_CONFIG))
+$(error "The BUILDROOT_CONFIG environment variable was renamed to BR2_CONFIG.")
+endif
+endif
+
+# If a script is using the deprecated BUILDROOT_CONFIG, make sure it fails.
+# Add some directories in front just in case someone used dirname on it.
+BUILDROOT_CONFIG = /tmp/deprecated/The-BUILDROOT_CONFIG-environment-variable-was-renamed-to-BR2_CONFIG
+export BUILDROOT_CONFIG
+
 #
 # Legacy options from 2012.08
 #
diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index 450b3d5..2cbae99 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -38,7 +38,7 @@ there are a few ways to customize the resulting target filesystem.
   files, you should fix that package rather than work around it with some
   post-build cleanup scripts.
   You may also use these variables in your post-build script:
-    - +BUILDROOT_CONFIG+: the path to the Buildroot .config file
+    - +BR2_CONFIG+: the path to the Buildroot .config file
     - +HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+: see
       xref:generic-package-reference[]
     - +BUILD_DIR+: the directory where packages are extracted and built
@@ -79,7 +79,7 @@ in one of these _post-image scripts_ will require special handling
 
 Just like for the _post-build scripts_ mentioned above, you also have
 access to the following environment variables from your _post-image
-scripts_: +BUILDROOT_CONFIG+, +BUILD_DIR+, +HOST_DIR+, +STAGING_DIR+,
+scripts_: +BR2_CONFIG+, +BUILD_DIR+, +HOST_DIR+, +STAGING_DIR+,
 +TARGET_DIR+, +BINARIES_DIR+ and +BASE_DIR+.
 
 Additionally, each of the +BR2_ROOTFS_POST_BUILD_SCRIPT+ and
diff --git a/docs/manual/debugging-buildroot.txt b/docs/manual/debugging-buildroot.txt
index 5fa05b0..e558fcf 100644
--- a/docs/manual/debugging-buildroot.txt
+++ b/docs/manual/debugging-buildroot.txt
@@ -24,7 +24,7 @@ make BR2_INSTRUMENTATION_SCRIPTS="/path/to/my/script1 /path/to/my/script2"
 
 That script has access to the following variables:
 
-  - +BUILDROOT_CONFIG+: the path to the Buildroot .config file
+  - +BR2_CONFIG+: the path to the Buildroot .config file
   - +HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+: see
     xref:generic-package-reference[]
   - +BUILD_DIR+: the directory where packages are extracted and built
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 5739ee0..0e7e1fa 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -167,8 +167,8 @@ if test "${missing_progs}" = "yes" ; then
 	exit 1
 fi
 
-if grep ^BR2_TOOLCHAIN_BUILDROOT=y $BUILDROOT_CONFIG > /dev/null && \
-	grep ^BR2_ENABLE_LOCALE=y       $BUILDROOT_CONFIG > /dev/null ; then
+if grep ^BR2_TOOLCHAIN_BUILDROOT=y $BR2_CONFIG > /dev/null && \
+	grep ^BR2_ENABLE_LOCALE=y       $BR2_CONFIG > /dev/null ; then
 	if ! which locale > /dev/null ; then
 		echo
 		echo "You need locale support on your build machine to build a toolchain supporting locales"
@@ -181,7 +181,7 @@ if grep ^BR2_TOOLCHAIN_BUILDROOT=y $BUILDROOT_CONFIG > /dev/null && \
 	fi
 fi
 
-if grep -q ^BR2_PACKAGE_CLASSPATH=y $BUILDROOT_CONFIG ; then
+if grep -q ^BR2_PACKAGE_CLASSPATH=y $BR2_CONFIG ; then
 	for prog in javac jar; do
 		if ! which $prog > /dev/null ; then
 			echo >&2
@@ -191,7 +191,7 @@ if grep -q ^BR2_PACKAGE_CLASSPATH=y $BUILDROOT_CONFIG ; then
 	done
 fi
 
-if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BUILDROOT_CONFIG ; then
+if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BR2_CONFIG ; then
 	if test ! -f /lib/ld-linux.so.2 ; then
 		echo
 		echo "Your Buildroot configuration uses pre-built tools for the x86 architecture,"
@@ -205,7 +205,7 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BUILDROOT_CONFIG ; then
 	fi
 fi
 
-if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y $BUILDROOT_CONFIG ; then
+if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y $BR2_CONFIG ; then
 	if ! echo "int main(void) {}" | gcc -m32 -x c - -o /dev/null ; then
 		echo
 		echo "Your Buildroot configuration needs a compiler capable of building 32 bits binaries."
diff --git a/support/kconfig/confdata.c b/support/kconfig/confdata.c
index 4b41fe6..2371fa8 100644
--- a/support/kconfig/confdata.c
+++ b/support/kconfig/confdata.c
@@ -64,7 +64,7 @@ static void conf_message(const char *fmt, ...)
 
 const char *conf_get_configname(void)
 {
-	char *name = getenv("BUILDROOT_CONFIG");
+	char *name = getenv("BR2_CONFIG");
 
 	return name ? name : ".config";
 }
diff --git a/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch b/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
index 6f545e2..ecfe76b 100644
--- a/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
+++ b/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
@@ -88,7 +88,7 @@ Index: kconfig/confdata.c
  const char *conf_get_configname(void)
  {
 -	char *name = getenv("KCONFIG_CONFIG");
-+	char *name = getenv("BUILDROOT_CONFIG");
++	char *name = getenv("BR2_CONFIG");
  
  	return name ? name : ".config";
  }
diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index 3b287b8..a67356a 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -39,7 +39,7 @@ GROUP="${TARGET_DIR}/etc/group"
 # with /etc/group, so any use of gshadow must be conditional.
 GSHADOW="${TARGET_DIR}/etc/gshadow"
 
-# We can't simply source ${BUILDROOT_CONFIG} as it may contains constructs
+# We can't simply source ${BR2_CONFIG} as it may contains constructs
 # such as:
 #    BR2_DEFCONFIG="$(CONFIG_DIR)/defconfig"
 # which when sourced from a shell script will eventually try to execute
@@ -48,7 +48,7 @@ GSHADOW="${TARGET_DIR}/etc/gshadow"
 # So, we have to scan that file instead. Sigh... :-(
 PASSWD_METHOD="$( sed -r -e '/^BR2_TARGET_GENERIC_PASSWD_METHOD="(.*)"$/!d;'    \
                          -e 's//\1/;'                                           \
-                         "${BUILDROOT_CONFIG}"                                  \
+                         "${BR2_CONFIG}"                                        \
                 )"
 
 #----------------------------------------------------------------------------

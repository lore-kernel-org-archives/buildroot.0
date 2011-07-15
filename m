From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 15 Jul 2011 22:58:38 +0200
Subject: [Buildroot] [git commit] toolchain/crosstool-NG: use the package
	infrastructure
Message-ID: <20110715223019.EDC8A8A5BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bef98b7c10a9969bc3f8b977dd9e0bdafba684a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move crosstool-NG to package/ and make it an autotarget package.
This requires a new patch (now upstream).

Now, the crosstool-NG toolchain backend only contains enough to build
the toolchain, there's no more reference to building crosstool-NG as
a package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../crosstool-ng/crosstool-ng-001-no-cvs.patch     |    0
 ...-break-on-existing-symlinks-and-build.log.patch |    0
 .../crosstool-ng-003-autostuf-compat.patch         |   10 ++++
 package/crosstool-ng/crosstool-ng.mk               |    9 +++
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |   57 ++++----------------
 5 files changed, 30 insertions(+), 46 deletions(-)
 rename toolchain/toolchain-crosstool-ng/001-no-cvs.patch => package/crosstool-ng/crosstool-ng-001-no-cvs.patch (100%)
 rename toolchain/toolchain-crosstool-ng/002-dont-break-on-existing-symlinks-and-build.log.patch => package/crosstool-ng/crosstool-ng-002-dont-break-on-existing-symlinks-and-build.log.patch (100%)
 create mode 100644 package/crosstool-ng/crosstool-ng-003-autostuf-compat.patch
 create mode 100644 package/crosstool-ng/crosstool-ng.mk

diff --git a/toolchain/toolchain-crosstool-ng/001-no-cvs.patch b/package/crosstool-ng/crosstool-ng-001-no-cvs.patch
similarity index 100%
rename from toolchain/toolchain-crosstool-ng/001-no-cvs.patch
rename to package/crosstool-ng/crosstool-ng-001-no-cvs.patch
diff --git a/toolchain/toolchain-crosstool-ng/002-dont-break-on-existing-symlinks-and-build.log.patch b/package/crosstool-ng/crosstool-ng-002-dont-break-on-existing-symlinks-and-build.log.patch
similarity index 100%
rename from toolchain/toolchain-crosstool-ng/002-dont-break-on-existing-symlinks-and-build.log.patch
rename to package/crosstool-ng/crosstool-ng-002-dont-break-on-existing-symlinks-and-build.log.patch
diff --git a/package/crosstool-ng/crosstool-ng-003-autostuf-compat.patch b/package/crosstool-ng/crosstool-ng-003-autostuf-compat.patch
new file mode 100644
index 0000000..d79e62b
--- /dev/null
+++ b/package/crosstool-ng/crosstool-ng-003-autostuf-compat.patch
@@ -0,0 +1,10 @@
+--- crosstool-ng-1.11.3/configure	2011-05-21 01:10:10.000000000 +0200
++++ host-crosstool-ng-1.11.3/configure	2011-07-14 17:35:25.830403914 +0200
+@@ -260,6 +260,7 @@
+         # Skip, auto-stuff compatibility
+         --build=*|--host=*|--infodir=*|--datadir=*|--sysconfdir=*|--localstatedir=*) shift;;
+         --build|--host|--infodir|--datadir|--sysconfdir|--localstatedir)             shift 2;;
++        --enable-shared|--disable-shared|--enable-static|--disable-static)           shift;;
+         *)          printf "Unrecognised option: '${1}'\n"; do_help; exit 1;;
+     esac
+ done
diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
new file mode 100644
index 0000000..b40cf35
--- /dev/null
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -0,0 +1,9 @@
+CROSSTOOL_NG_VERSION           = 1.11.3
+CROSSTOOL_NG_SOURCE            = crosstool-ng-$(CROSSTOOL_NG_VERSION).tar.bz2
+CROSSTOOL_NG_SITE              = http://crosstool-ng.org/download/crosstool-ng/
+CROSSTOOL_NG_INSTALL_STAGING   = NO
+CROSSTOOL_NG_INSTALL_TARGET    = NO
+CROSSTOOL_NG_MAKE              = $(MAKE1)
+HOST_CROSSTOOL_NG_DEPENDENCIES = host-gawk host-automake $(if $(BR2_CCACHE),host-ccache)
+
+$(eval $(call AUTOTARGETS,package,crosstool-ng,host))
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index d3fcc65..ec6e188 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -8,15 +8,9 @@
 #-----------------------------------------------------------------------------
 # Internal variables
 
-# Crostool-NG hard-coded configuration options
-CTNG_VERSION:=1.11.3
-CTNG_SITE:=http://crosstool-ng.org/download/crosstool-ng/
-CTNG_SOURCE:=crosstool-ng-$(CTNG_VERSION).tar.bz2
-CTNG_DIR:=$(BUILD_DIR)/crosstool-ng-$(CTNG_VERSION)
-CTNG_CAT:=bzcat
-CTNG_PATCH_DIR:=toolchain/toolchain-crosstool-ng
-CTNG_UCLIBC_CONFIG_FILE := $(TOPDIR)/toolchain/toolchain-crosstool-ng/uClibc.config
+CTNG_DIR := $(BUILD_DIR)/build-toolchain
 
+CTNG_UCLIBC_CONFIG_FILE := $(TOPDIR)/toolchain/toolchain-crosstool-ng/uClibc.config
 CTNG_CONFIG_FILE:=$(call qstrip,$(BR2_TOOLCHAIN_CTNG_CONFIG))
 
 # Hack! ct-ng is in fact a Makefile script. As such, it accepts all
@@ -24,7 +18,7 @@ CTNG_CONFIG_FILE:=$(call qstrip,$(BR2_TOOLCHAIN_CTNG_CONFIG))
 # to calling ct-ng.
 # $1: the set of arguments to pass to ct-ng
 define ctng
-PATH=$(HOST_PATH) $(CTNG_DIR)/ct-ng -C $(CTNG_DIR) --no-print-directory $(1)
+PATH=$(HOST_PATH) ct-ng -C $(CTNG_DIR) --no-print-directory $(1)
 endef
 
 #-----------------------------------------------------------------------------
@@ -366,6 +360,11 @@ define ctng-oldconfig
 	$(call ctng-fix-dot-config,$(1),$(CTNG_FIX_DOT_CONFIG_PATHS_SED))
 endef
 
+# We need the host crosstool-NG before we can even begin working
+# on the toolchain. Using order-only dependency, as we do not want
+# to rebuild the toolchain for every run...
+$(CTNG_DIR)/.config: | host-crosstool-ng
+
 # Default configuration
 # Depends on top-level .config because it has options we have to shoe-horn
 # into crosstool-NG's .config
@@ -375,8 +374,10 @@ endef
 # are correctly set ( eg. if an option is new, then the initial sed
 # can't do anything about it ) Ideally, this should go in oldconfig
 # itself, but it's much easier to handle here.
-$(CTNG_DIR)/.config: $(CTNG_CONFIG_FILE) $(CTNG_DIR)/ct-ng $(CONFIG_DIR)/.config
+
+$(CTNG_DIR)/.config: $(CTNG_CONFIG_FILE) $(CONFIG_DIR)/.config
 	$(Q)if [ ! -f $@ ]; then                                                        \
+	        mkdir -p "$(CTNG_DIR)";                                                 \
 	        libc="$$(awk -F '"' '$$1=="CT_LIBC=" { print $$2; }' "$<")";            \
 	        if [ "$${libc}" != "$(BR2_TOOLCHAIN_CTNG_LIBC)" ]; then                 \
 	            echo "* Inconsistency in crosstool-NG config file '$<'";            \
@@ -403,39 +404,3 @@ ctng-menuconfig: $(CTNG_DIR)/.config
 	$(call ctng-oldconfig,$<)
 	$(call ctng-check-config-changed,$<,$<.timestamp)
 	$(Q)rm -f $<.timestamp
-
-#-----------------------------------------------------------------------------
-# Retrieving, configuring and building crosstool-NG (as a package)
-
-$(DL_DIR)/$(CTNG_SOURCE):
-	$(Q)$(call DOWNLOAD,$(CTNG_SITE),$(CTNG_SOURCE))
-
-$(CTNG_DIR)/.unpacked: $(DL_DIR)/$(CTNG_SOURCE)
-	$(Q)rm -rf $(CTNG_DIR)
-	$(Q)mkdir -p $(BUILD_DIR)
-	$(Q)$(CTNG_CAT) $(DL_DIR)/$(CTNG_SOURCE) |tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(Q)touch $@
-
-$(CTNG_DIR)/.patched: $(CTNG_DIR)/.unpacked
-	$(Q)toolchain/patch-kernel.sh $(CTNG_DIR)       \
-	                              $(CTNG_PATCH_DIR) \
-	                              \*.patch          \
-	                              \*.patch.$(ARCH)
-	$(Q)touch $@
-
-# Use order-only dependencies on host-* as they
-# are virtual targets with no rules, and so are
-# considered always remade. But we do not want
-# to reconfigure and rebuild ct-ng every time
-# we need to run it...
-$(CTNG_DIR)/.configured: | $(if $(BR2_CCACHE),host-ccache) \
-                           host-gawk        \
-                           host-automake
-
-$(CTNG_DIR)/.configured: $(CTNG_DIR)/.patched
-	$(Q)cd $(CTNG_DIR) && PATH=$(HOST_PATH) ./configure --local
-	$(Q)touch $@
-
-$(CTNG_DIR)/ct-ng: $(CTNG_DIR)/.configured
-	$(Q)$(MAKE) -C $(CTNG_DIR) --no-print-directory
-	$(Q)touch $@
-- 
1.7.3.4

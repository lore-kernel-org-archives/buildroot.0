From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Thu,  3 May 2018 16:31:46 +0200
Subject: [Buildroot] [RFC PATCH 1/2] annobin: New package
In-Reply-To: <20180503143147.5301-1-stefan.sorensen@spectralink.com>
References: <20180503143147.5301-1-stefan.sorensen@spectralink.com>
Message-ID: <20180503143147.5301-2-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 ...1-Only-issue-warning-for-PIC-PIE-mix.patch | 47 +++++++++++++++++++
 package/annobin/Config.in                     | 12 +++++
 package/annobin/annobin.hash                  |  2 +
 package/annobin/annobin.mk                    | 44 +++++++++++++++++
 package/gcc/gcc-final/gcc-final.mk            |  3 ++
 toolchain/Config.in                           |  2 +
 .../pkg-toolchain-external.mk                 |  3 ++
 toolchain/toolchain-wrapper.c                 |  3 ++
 toolchain/toolchain/toolchain.mk              |  4 ++
 9 files changed, 120 insertions(+)
 create mode 100644 package/annobin/0001-Only-issue-warning-for-PIC-PIE-mix.patch
 create mode 100644 package/annobin/Config.in
 create mode 100644 package/annobin/annobin.hash
 create mode 100644 package/annobin/annobin.mk

diff --git a/package/annobin/0001-Only-issue-warning-for-PIC-PIE-mix.patch b/package/annobin/0001-Only-issue-warning-for-PIC-PIE-mix.patch
new file mode 100644
index 0000000000..21d5d8f01f
--- /dev/null
+++ b/package/annobin/0001-Only-issue-warning-for-PIC-PIE-mix.patch
@@ -0,0 +1,47 @@
+From dcd48f47e73e7d03e42d4de8449edc0b31afb812 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
+Date: Thu, 3 May 2018 12:21:25 +0200
+Subject: [PATCH] Only issue warning for PIC/PIE mix
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+A lot of packages build with a mix of -fPIC and -fPIE, so bump this
+down from a failure to just issuing a warning.
+
+Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
+---
+ scripts/hardened.sh | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/scripts/hardened.sh b/scripts/hardened.sh
+index b12574e..cc7cc8f 100755
+--- a/scripts/hardened.sh
++++ b/scripts/hardened.sh
+@@ -173,6 +173,14 @@ fail ()
+     vulnerable=1
+ }
+ 
++warn ()
++{
++    if [ $report -gt 1 ]
++    then
++        report "$file: WARN:" ${1+"$@"}
++    fi
++}
++
+ pass ()
+ {
+     if [ $report -gt 2 ]
+@@ -708,7 +716,7 @@ check_for_pie_or_pic ()
+     else
+ 	if [ ${#hard[*]} -gt 1 ];
+ 	then
+-	    fail "multiple, different, settings of -fpic/-fpie used"
++	    warn "multiple, different, settings of -fpic/-fpie used"
+ 	else
+ 	    if [[ $filetype = lib || ( $filetype = auto && $file == *.so ) ]] ;
+ 	    then
+-- 
+2.17.0
+
diff --git a/package/annobin/Config.in b/package/annobin/Config.in
new file mode 100644
index 0000000000..64f1ff6963
--- /dev/null
+++ b/package/annobin/Config.in
@@ -0,0 +1,12 @@
+config BR2_TOOLCHAIN_ANNOBIN_GCC_PLUGIN
+	bool "annobin"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
+	help
+	  A plugin for GCC that records extra information in the files
+	  that it compiles, and a set of scripts that analyze the
+	  recorded information.  These scripts can determine things
+	  ABI clashes in compiled binaries, or the absence of required
+	  hardening options
+
+	  Enabling this will slightly (1-2%) increase the size of
+	  built binaries.
diff --git a/package/annobin/annobin.hash b/package/annobin/annobin.hash
new file mode 100644
index 0000000000..0340e55291
--- /dev/null
+++ b/package/annobin/annobin.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	176a8588088af40361f14415c2a1dfaae0723c46cd6df7765605090d6c4cea49  annobin-5.6.tar.xz
diff --git a/package/annobin/annobin.mk b/package/annobin/annobin.mk
new file mode 100644
index 0000000000..5923947bc1
--- /dev/null
+++ b/package/annobin/annobin.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# annobin
+#
+################################################################################
+
+ANNOBIN_VERSION = 5.6
+ANNOBIN_SOURCE = annobin-$(ANNOBIN_VERSION).tar.xz
+ANNOBIN_SITE = https://nickc.fedorapeople.org
+
+# toolchain depends on host-annobin, so shortcircuit the reverse
+# dependency to avoid a circular dependency
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+HOST_ANNOBIN_DEPENDENCIES += toolchain-buildroot
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+HOST_ANNOBIN_DEPENDENCIES += toolchain-external
+endif
+
+# The plugin has to be configured with the same arcane configure
+# scripts used by gcc, this prevents regeneration of the scripts.
+define ANNOBIN_PRE_CONFIGURE_FIXUP
+	(cd $(@D); touch aclocal.m4 plugin/config.h.in configure */configure \
+		Makefile.in */Makefile.in)
+endef
+
+HOST_ANNOBIN_PRE_CONFIGURE_HOOKS += ANNOBIN_PRE_CONFIGURE_FIXUP
+
+# If using an external toolchain, we cannot install the plugin in the standard
+# location, so provide our own and put the includes from the standard location in
+# CXX_FLAGS.
+ANNOBIN_PLUGIN_DIR = $(HOST_DIR)/libexec/annobin
+ANNOBIN_CXXFLAGS = $(HOST_CXXFLAGS) -I$(shell $(TARGET_CC) --print-file-name=plugin)/include
+
+# The host and target options are mixed up, so override the defaults
+HOST_ANNOBIN_CONF_OPTS = \
+	--build=$(GNU_HOST_NAME) \
+	--host=$(GNU_TARGET_NAME) \
+	--with-gcc-plugin-dir=$(ANNOBIN_PLUGIN_DIR) \
+	CXXFLAGS="$(ANNOBIN_CXXFLAGS)"
+
+ANNOBIN_GCC_PLUGIN=$(ANNOBIN_PLUGIN_DIR)/annobin.so
+HARDENED_SH=$(HOST_DIR)/bin/hardened.sh
+
+$(eval $(host-autotools-package))
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 9897d18682..9e739bccf6 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -116,6 +116,9 @@ endef
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_CREATE_CC_SYMLINKS
 
 HOST_GCC_FINAL_TOOLCHAIN_WRAPPER_ARGS += $(HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS)
+ifeq ($(BR2_TOOLCHAIN_ANNOBIN_GCC_PLUGIN),y)
+HOST_GCC_FINAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ANNOBIN_GCC_PLUGIN='"$(ANNOBIN_GCC_PLUGIN)"'
+endif
 HOST_GCC_FINAL_POST_BUILD_HOOKS += TOOLCHAIN_WRAPPER_BUILD
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += TOOLCHAIN_WRAPPER_INSTALL
 # Note: this must be done after CREATE_CC_SYMLINKS, otherwise the
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 121ddb4fa4..dc3f1d8cc6 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -533,4 +533,6 @@ config BR2_TOOLCHAIN_HAS_LIBQUADMATH
 	bool
 	default y if BR2_i386 || BR2_x86_64
 
+source "package/annobin/Config.in"
+
 endmenu
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 8b2c283654..457c23ddf6 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -241,6 +241,9 @@ TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += \
 	-DBR_CROSS_PATH_REL='"$(TOOLCHAIN_EXTERNAL_BIN:$(HOST_DIR)/%=%)"'
 endif
 
+ifeq ($(BR2_TOOLCHAIN_ANNOBIN_GCC_PLUGIN),y)
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ANNOBIN_GCC_PLUGIN='"$(ANNOBIN_GCC_PLUGIN)"'
+endif
 
 #
 # The following functions creates the symbolic links needed to get the
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index c5eb813dd0..d45c9d4f59 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -94,6 +94,9 @@ static char *predef_args[] = {
 #if defined(BR_MIPS_TARGET_BIG_ENDIAN) || defined(BR_ARC_TARGET_BIG_ENDIAN)
 	"-EB",
 #endif
+#ifdef BR_ANNOBIN_GCC_PLUGIN
+        "-fplugin=" BR_ANNOBIN_GCC_PLUGIN,
+#endif
 #ifdef BR_ADDITIONAL_CFLAGS
 	BR_ADDITIONAL_CFLAGS
 #endif
diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index 91c9ca2eff..2b7ef05703 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -10,6 +10,10 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 TOOLCHAIN_DEPENDENCIES += toolchain-external
 endif
 
+ifeq ($(BR2_TOOLCHAIN_ANNOBIN_GCC_PLUGIN),y)
+TOOLCHAIN_DEPENDENCIES += host-annobin
+endif
+
 TOOLCHAIN_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 # Apply a hack that Rick Felker suggested[1] to avoid conflicts between libc
-- 
2.17.0

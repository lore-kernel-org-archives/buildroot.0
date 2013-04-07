From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Apr 2013 12:04:33 +0200
Subject: [Buildroot] [PATCHv4 1/4] gdb: convert to the package infrastructure
In-Reply-To: <1365329076-19853-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1365329076-19853-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1365329076-19853-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit converts gdb to the package infrastructure, and therefore
moves it from toolchain/gdb to package/gdb.

The target package is now visible in "Package selection for the
target" => "Debugging, profiling and benchmark". The main option,
"gdb", forcefully selects the "gdbserver" sub-option by
default. Another sub-option, "full debugger" allows to install the
complete gdb on the target. When this option is enabled, then
"gdbserver" is no longer forcefully selected. This ensures that at
least gdbserver or the full debugger gets built/installed, so that the
package is not a no-op.

The host debugger is still enabled through a configuration option in
"Toolchain". It is now visible regardless of the toolchain type (it
used to be hidden for External Toolchains). The configuration options
relative to the host debugger are now in package/gdb/Config.in.host,
similar to how we have package/binutils/Config.in.host.

Since gdb is now a proper package, it is no longer allowed to 'select
BR2_PTHREADS_DEBUG' to ensure thread debugging is available when
needed. Instead, it now 'depends on
BR2_TOOLCHAIN_HAS_THREADS_DEBUG'. This option, in turn, is selected by
the different toolchain backends when appropriate. The
'BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED' option is removed, since
we no longer need to know when it is allowed to 'select
BR2_PTHREADS_DEBUG'. Also, the 'BR2_PTHREADS_DEBUG' option is moved to
appear right below the thread implementation selection (in the case of
the Buildroot toolchain backend).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes from v3 to v4:

 * Fixed the dependency logic to require thread support, because it is
   actually required in all cases for gdb 7.x.

Changes from v2 to v3:

 * Fixed the dependency logic to ensure that thread debugging support
   is available when building gdbserver on a toolchain that has thread
   support. Spotted by Gustavo's testing, and by Peter's review.

   Strictly speaking, this is only needed for 7.x gdb versions, but
   6.x versions are now only used on bfin and avr32. And while the
   only bfin version selectable is 6.6, avr32 is not restricted to its
   default 6.7 version, so we can't really on the architecture
   selection to decide whether we're building a 6.x or a 7.x gdb
   version.

Changes from v1 to v2:

 * Fixup the help text of BR2_PACKAGE_GDB to mention in which menu the
   cross-gdb can be enable, and the fact that external toolchains
   often provide their own pre-built versions of cross-gdb and
   gdbserver. Suggested by Arnout.

 * No longer 'select BR2_PTHREAD_DEBUG' from the gdb package. As
   Arnout noticed, now that gdb is a normal package, it should not
   forcefully select a toolchain configuration option. Instead, it
   should depend on it being available. This allows to remove the
   BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED option: we now only have
   the BR2_TOOLCHAIN_HAS_THREADS_DEBUG, which gets selected by the
   various toolchain backends when appropriate, and the gdb package
   depends on it.

 * Factorize the definition of GDB_SITE. Suggested by Arnout.

 * Add a small comment that explains why we remove /usr/share/gdb from
   the target. Suggested by Arnout.
---
 Config.in.legacy                                   |    9 +
 package/Config.in                                  |    1 +
 .../gdb/6.6a/100-uclibc-conf.patch                 |    0
 .../gdb/6.6a/600-fix-compile-flag-mismatch.patch   |    0
 .../gdb/6.6a/gdb-6.6-bfin-gdbserver.patch          |    0
 .../gdb/7.4.1/00_all_ptrace_setsiginfo.patch       |    0
 .../gdb/7.4.1/05_all_readline-headers.patch        |    0
 .../gdb/7.4.1/xtensa-asm-ptrace-h.patch            |    0
 .../gdb/7.4.1/xtensa-gdb-regsize.patch             |    0
 package/gdb/Config.in                              |   41 ++++
 package/gdb/Config.in.host                         |   56 +++++
 package/gdb/gdb.mk                                 |  101 +++++++++
 toolchain/Config.in                                |    2 -
 toolchain/gdb/Config.in                            |   99 ---------
 toolchain/gdb/gdb.mk                               |  234 --------------------
 toolchain/toolchain-buildroot.mk                   |    1 -
 toolchain/toolchain-buildroot/Config.in.2          |    7 +
 toolchain/toolchain-common.in                      |    7 +-
 toolchain/toolchain-crosstool-ng.mk                |    1 -
 toolchain/toolchain-crosstool-ng/Config.in         |    3 +
 toolchain/toolchain-external.mk                    |    1 -
 toolchain/toolchain-external/Config.in             |    7 +
 toolchain/uClibc/Config.in                         |    6 -
 23 files changed, 226 insertions(+), 350 deletions(-)
 rename {toolchain => package}/gdb/6.6a/100-uclibc-conf.patch (100%)
 rename {toolchain => package}/gdb/6.6a/600-fix-compile-flag-mismatch.patch (100%)
 rename {toolchain => package}/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch (100%)
 rename {toolchain => package}/gdb/7.4.1/00_all_ptrace_setsiginfo.patch (100%)
 rename {toolchain => package}/gdb/7.4.1/05_all_readline-headers.patch (100%)
 rename {toolchain => package}/gdb/7.4.1/xtensa-asm-ptrace-h.patch (100%)
 rename {toolchain => package}/gdb/7.4.1/xtensa-gdb-regsize.patch (100%)
 create mode 100644 package/gdb/Config.in
 create mode 100644 package/gdb/Config.in.host
 create mode 100644 package/gdb/gdb.mk
 delete mode 100644 toolchain/gdb/Config.in
 delete mode 100644 toolchain/gdb/gdb.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 43e2afe..2bdef1f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -67,6 +67,15 @@ config BR2_PACKAGE_GDISK_SGDISK
 	help
 	  The option has been renamed BR2_PACKAGE_GPTFDISK_SGDISK.
 
+config BR2_PACKAGE_GDB_HOST
+	bool "gdb for the host option has been renamed"
+	select BR2_PACKAGE_HOST_GDB
+	select BR2_LEGACY
+	help
+	  Due to the conversion of gdb to the package infrastructure,
+	  the BR2_PACKAGE_GDB_HOST option has been renamed
+	  BR2_PACKAGE_HOST_GDB.
+
 #
 # Legacy options since 2012.11
 #
diff --git a/package/Config.in b/package/Config.in
index 69d87f0..97ba790 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -22,6 +22,7 @@ source "package/cache-calibrator/Config.in"
 source "package/dhrystone/Config.in"
 source "package/dstat/Config.in"
 source "package/dmalloc/Config.in"
+source "package/gdb/Config.in"
 source "package/kexec/Config.in"
 source "package/latencytop/Config.in"
 source "package/lmbench/Config.in"
diff --git a/toolchain/gdb/6.6a/100-uclibc-conf.patch b/package/gdb/6.6a/100-uclibc-conf.patch
similarity index 100%
rename from toolchain/gdb/6.6a/100-uclibc-conf.patch
rename to package/gdb/6.6a/100-uclibc-conf.patch
diff --git a/toolchain/gdb/6.6a/600-fix-compile-flag-mismatch.patch b/package/gdb/6.6a/600-fix-compile-flag-mismatch.patch
similarity index 100%
rename from toolchain/gdb/6.6a/600-fix-compile-flag-mismatch.patch
rename to package/gdb/6.6a/600-fix-compile-flag-mismatch.patch
diff --git a/toolchain/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch b/package/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch
similarity index 100%
rename from toolchain/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch
rename to package/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch
diff --git a/toolchain/gdb/7.4.1/00_all_ptrace_setsiginfo.patch b/package/gdb/7.4.1/00_all_ptrace_setsiginfo.patch
similarity index 100%
rename from toolchain/gdb/7.4.1/00_all_ptrace_setsiginfo.patch
rename to package/gdb/7.4.1/00_all_ptrace_setsiginfo.patch
diff --git a/toolchain/gdb/7.4.1/05_all_readline-headers.patch b/package/gdb/7.4.1/05_all_readline-headers.patch
similarity index 100%
rename from toolchain/gdb/7.4.1/05_all_readline-headers.patch
rename to package/gdb/7.4.1/05_all_readline-headers.patch
diff --git a/toolchain/gdb/7.4.1/xtensa-asm-ptrace-h.patch b/package/gdb/7.4.1/xtensa-asm-ptrace-h.patch
similarity index 100%
rename from toolchain/gdb/7.4.1/xtensa-asm-ptrace-h.patch
rename to package/gdb/7.4.1/xtensa-asm-ptrace-h.patch
diff --git a/toolchain/gdb/7.4.1/xtensa-gdb-regsize.patch b/package/gdb/7.4.1/xtensa-gdb-regsize.patch
similarity index 100%
rename from toolchain/gdb/7.4.1/xtensa-gdb-regsize.patch
rename to package/gdb/7.4.1/xtensa-gdb-regsize.patch
diff --git a/package/gdb/Config.in b/package/gdb/Config.in
new file mode 100644
index 0000000..6eb29d5
--- /dev/null
+++ b/package/gdb/Config.in
@@ -0,0 +1,41 @@
+comment "gdb/gdbserver require a toolchain with thread and thread debug support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+
+config BR2_PACKAGE_GDB
+	bool "gdb"
+	select BR2_PACKAGE_GDB_SERVER if !BR2_PACKAGE_GDB_DEBUGGER
+	depends on BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	help
+	  GDB, the GNU Project debugger, allows you to see what is
+	  going on `inside' another program while it executes -- or
+	  what another program was doing at the moment it crashed.
+
+	  This option allows to build gdbserver and/or the gdb
+	  debugger for the target.
+
+	  For embedded development, the most common solution is to
+	  build only 'gdbserver' for the target, and use a cross-gdb
+	  on the host. See BR2_PACKAGE_HOST_GDB in the Toolchain menu
+	  to enable one. Notice that external toolchains often provide
+	  their own pre-built cross-gdb and gdbserver binaries.
+
+	  http://www.gnu.org/software/gdb/
+
+if BR2_PACKAGE_GDB
+
+config BR2_PACKAGE_GDB_SERVER
+	bool "gdbserver"
+	help
+	  Build the gdbserver stub to run on the target.
+	  A full gdb is needed to debug the progam.
+
+config BR2_PACKAGE_GDB_DEBUGGER
+	bool "full debugger"
+	select BR2_PACKAGE_NCURSES
+	depends on BR2_USE_WCHAR
+	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32 && !BR2_microblaze && !BR2_bfin && !BR2_aarch64
+
+comment "full gdb on target needs WCHAR support in toolchain"
+	depends on !BR2_USE_WCHAR
+
+endif
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
new file mode 100644
index 0000000..223c426
--- /dev/null
+++ b/package/gdb/Config.in.host
@@ -0,0 +1,56 @@
+config BR2_PACKAGE_HOST_GDB
+	bool "Build cross gdb for the host"
+	help
+	  Build a cross gdb that runs on the host machine and debugs
+	  programs running on the target. It requires 'gdbserver'
+	  installed on the target, see BR2_PACKAGE_GDB_SERVER to
+	  enable it.
+
+if BR2_PACKAGE_HOST_GDB
+
+choice
+	prompt "GDB debugger Version"
+	default BR2_GDB_VERSION_6_6 if BR2_bfin
+	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
+	default BR2_GDB_VERSION_7_5
+	help
+	  Select the version of gdb you wish to use.
+
+	config BR2_GDB_VERSION_6_6
+		bool "gdb 6.6"
+		depends on BR2_bfin
+
+	config BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
+		depends on BR2_avr32
+		bool "gdb 6.7.1-avr32-2.1.5"
+
+	config BR2_GDB_VERSION_7_2
+		bool "gdb 7.2.x"
+		depends on !BR2_bfin
+		depends on BR2_DEPRECATED
+
+	config BR2_GDB_VERSION_7_3
+		bool "gdb 7.3.x"
+		depends on !BR2_bfin
+		depends on BR2_DEPRECATED
+
+	config BR2_GDB_VERSION_7_4
+		bool "gdb 7.4.x"
+		depends on !BR2_bfin
+
+	config BR2_GDB_VERSION_7_5
+		bool "gdb 7.5.x"
+		depends on !BR2_bfin
+
+endchoice
+
+config BR2_GDB_VERSION
+	string
+	default "6.6a"     if BR2_GDB_VERSION_6_6
+	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
+	default "7.2a"     if BR2_GDB_VERSION_7_2
+	default "7.3.1"    if BR2_GDB_VERSION_7_3
+	default "7.4.1"    if BR2_GDB_VERSION_7_4
+	default "7.5.1"    if BR2_GDB_VERSION_7_5
+
+endif
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
new file mode 100644
index 0000000..24ce9bf
--- /dev/null
+++ b/package/gdb/gdb.mk
@@ -0,0 +1,101 @@
+#############################################################
+#
+# gdb
+#
+#############################################################
+
+GDB_VERSION = $(call qstrip,$(BR2_GDB_VERSION))
+GDB_SITE    = $(BR2_GNU_MIRROR)/gdb
+
+# When no version is defined, it means that cross-gdb for the host has
+# not been enabled, and we will only build gdbserver or gdb for the
+# target. In this case, use the latest available version
+# automatically.
+ifeq ($(GDB_VERSION),)
+ifeq ($(BR2_bfin),y)
+GDB_VERSION = 6.6a
+else ifeq ($(BR2_avr32),y)
+GDB_VERSION = 6.7.1-avr32-2.1.5
+GDB_SITE    = ftp://www.at91.com/pub/buildroot/
+else
+GDB_VERSION = 7.5.1
+endif
+endif
+
+GDB_SOURCE = gdb-$(GDB_VERSION).tar.bz2
+GDB_LICENSE = GPLv2+ LGPLv2+ GPLv3+ LGPLv3+
+GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
+
+# We only want gdbserver and not the entire debugger.
+ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),)
+GDB_SUBDIR = gdb/gdbserver
+HOST_GDB_SUBDIR = .
+else
+GDB_DEPENDENCIES = ncurses
+endif
+
+# For the host variant, we really want to build with XML support,
+# which is needed to read XML descriptions of target architectures.
+HOST_GDB_DEPENDENCIES = host-expat
+
+# Apply the Xtensa specific patches
+XTENSA_CORE_NAME = $(call qstrip, $(BR2_XTENSA_CORE_NAME))
+ifneq ($(XTENSA_CORE_NAME),)
+define GDB_XTENSA_PRE_PATCH
+	tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(XTENSA_CORE_NAME).tar \
+		-C $(@D) --strip-components=1 gdb
+endef
+HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
+endif
+
+GDB_CONF_ENV = \
+	ac_cv_type_uintptr_t=yes \
+	gt_cv_func_gettext_libintl=yes \
+	ac_cv_func_dcgettext=yes \
+	gdb_cv_func_sigsetjmp=yes \
+	bash_cv_func_strcoll_broken=no \
+	bash_cv_must_reinstall_sighandlers=no \
+	bash_cv_func_sigsetjmp=present \
+	bash_cv_have_mbstate_t=yes \
+	gdb_cv_func_sigsetjmp=yes
+
+GDB_CONF_OPT = \
+	--without-uiout \
+	--disable-tui \
+	--disable-gdbtk \
+	--without-x \
+	--disable-sim \
+	$(if $(BR2_PACKAGE_GDB_SERVER),--enable-gdbserver) \
+	--with-curses \
+	--without-included-gettext \
+	--disable-werror
+
+# This removes some unneeded Python scripts and XML target description
+# files that are not useful for a normal usage of the debugger.
+define GDB_REMOVE_UNNEEDED_FILES
+	$(RM) -rf $(TARGET_DIR)/usr/share/gdb
+endef
+
+GDB_POST_INSTALL_TARGET_HOOKS += GDB_REMOVE_UNNEEDED_FILES
+
+# A few notes:
+#  * --target, because we're doing a cross build rather than a real
+#    host build.
+#  * --enable-static because gdb really wants to use libbfd.a
+#  * --disable-shared, otherwise the old 6.7 version specific to AVR32
+#    doesn't build because it wants to link a shared libbfd.so against
+#    non-PIC liberty.a.
+HOST_GDB_CONF_OPT = \
+	--target=$(GNU_TARGET_NAME) \
+	--enable-static --disable-shared \
+	--without-uiout \
+	--disable-tui \
+	--disable-gdbtk \
+	--without-x \
+	--enable-threads \
+	--disable-werror \
+	--without-included-gettext \
+	--disable-sim
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/toolchain/Config.in b/toolchain/Config.in
index f1cca14..fa78cf4 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -12,7 +12,6 @@ config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
 	depends on !BR2_microblaze && !BR2_aarch64
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
 
 config BR2_TOOLCHAIN_EXTERNAL
 	bool "External toolchain"
@@ -25,7 +24,6 @@ config BR2_TOOLCHAIN_CTNG
 	bool "Crosstool-NG toolchain"
 	depends on !BR2_microblaze && !BR2_aarch64 && !BR2_xtensa
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
 	help
 	  Say 'y' if you want to generate the toolchain with crosstool-NG
 	  (http://crosstool-ng.org).
diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
deleted file mode 100644
index 69f7915..0000000
--- a/toolchain/gdb/Config.in
+++ /dev/null
@@ -1,99 +0,0 @@
-comment "Gdb Options"
-
-config BR2_PACKAGE_GDB
-	bool "Build gdb debugger for the Target"
-	select BR2_PACKAGE_NCURSES
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32 && !BR2_microblaze && !BR2_bfin && !BR2_aarch64
-	# The newest versions of gdb require thread debugging in the
-	# toolchain. The only cases for which this is not needed is if
-	# we use gdb 6.8 (marked deprecated)
-	depends on \
-		BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED || \
-		BR2_DEPRECATED || \
-		BR2_bfin
-	help
-	    Build the full gdb debugger to run on the target.
-
-comment "Gdb for the target needs WCHAR and threads support in toolchain"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
-config BR2_PACKAGE_GDB_SERVER
-	bool "Build gdb server for the Target"
-	depends on !BR2_TOOLCHAIN_EXTERNAL
-	help
-	    Build the gdbserver stub to run on the target.
-	    A full gdb is needed to debug the progam.
-
-config BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
-	bool "Copy gdb server to the Target"
-	depends on BR2_TOOLCHAIN_EXTERNAL
-	help
-	  Copy the gdbserver provided by the external toolchain to the
-	  target.
-
-config BR2_PACKAGE_GDB_HOST
-	bool "Build gdb for the Host"
-	# cross-gdb is supposed to be part of the external
-	# toolchain. And the build currently fails.
-	depends on !BR2_TOOLCHAIN_EXTERNAL
-	help
-	    Build gdb to run on the host to debug programs run on the target.
-
-choice
-	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_6_6 if BR2_bfin
-	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
-	default BR2_GDB_VERSION_7_5
-	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_GDB_SERVER || BR2_PACKAGE_GDB_HOST
-	help
-	  Select the version of gdb you wish to use.
-
-	config BR2_GDB_VERSION_6_6
-		bool "gdb 6.6"
-		depends on BR2_bfin
-
-	config BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
-		depends on BR2_avr32
-		bool "gdb 6.7.1-avr32-2.1.5"
-
-	config BR2_GDB_VERSION_7_2
-		bool "gdb 7.2.x"
-		depends on !BR2_bfin
-		depends on BR2_DEPRECATED
-		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
-		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
-
-	config BR2_GDB_VERSION_7_3
-		bool "gdb 7.3.x"
-		depends on !BR2_bfin
-		depends on BR2_DEPRECATED
-		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
-		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
-
-	config BR2_GDB_VERSION_7_4
-		bool "gdb 7.4.x"
-		depends on !BR2_bfin
-		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
-		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
-
-	config BR2_GDB_VERSION_7_5
-		bool "gdb 7.5.x"
-		depends on !BR2_bfin
-		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
-		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
-
-endchoice
-
-comment "gdb support needs pthread debug support in toolchain"
-	depends on !BR2_DEPRECATED && !BR2_bfin && !BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
-
-config BR2_GDB_VERSION
-	string
-	default "6.6a"     if BR2_GDB_VERSION_6_6
-	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
-	default "7.2a"     if BR2_GDB_VERSION_7_2
-	default "7.3.1"    if BR2_GDB_VERSION_7_3
-	default "7.4.1"    if BR2_GDB_VERSION_7_4
-	default "7.5.1"    if BR2_GDB_VERSION_7_5
diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
deleted file mode 100644
index a932b1f..0000000
--- a/toolchain/gdb/gdb.mk
+++ /dev/null
@@ -1,234 +0,0 @@
-######################################################################
-#
-# gdb
-#
-######################################################################
-GDB_VERSION:=$(call qstrip,$(BR2_GDB_VERSION))
-
-GDB_SOURCE:=gdb-$(GDB_VERSION).tar.bz2
-GDB_CAT:=$(BZCAT)
-
-ifeq ($(findstring avr32,$(GDB_VERSION)),avr32)
- GDB_SITE:=ftp://www.at91.com/pub/buildroot/
- GDB_PATCH_DIR:=toolchain/gdb/$(GDB_VERSION)
-else
- GDB_SITE:=$(BR2_GNU_MIRROR)/gdb
- GDB_PATCH_DIR:=toolchain/gdb/$(GDB_VERSION)
-endif
-
-GDB_DIR:=$(TOOLCHAIN_DIR)/gdb-$(GDB_VERSION)
-
-$(DL_DIR)/$(GDB_SOURCE):
-	$(call DOWNLOAD,$(GDB_SITE)/$(GDB_SOURCE))
-
-gdb-unpacked: $(GDB_DIR)/.unpacked
-$(GDB_DIR)/.unpacked: $(DL_DIR)/$(GDB_SOURCE)
-	mkdir -p $(GDB_DIR)
-	$(GDB_CAT) $(DL_DIR)/$(GDB_SOURCE) | tar -C $(GDB_DIR) $(TAR_STRIP_COMPONENTS)=1 $(TAR_OPTIONS) -
-ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
-	tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(call qstrip, \
-		$(BR2_XTENSA_CORE_NAME)).tar -C $(@D) --strip-components=1 gdb
-endif
-ifneq ($(wildcard $(GDB_PATCH_DIR)),)
-	support/scripts/apply-patches.sh $(GDB_DIR) $(GDB_PATCH_DIR) \*.patch
-endif
-	$(call CONFIG_UPDATE,$(@D))
-	touch $@
-
-gdb-patched: $(GDB_DIR)/.unpacked
-
-gdb-source: $(DL_DIR)/$(GDB_SOURCE)
-gdb-dirclean:
-	rm -rf $(GDB_DIR)
-
-######################################################################
-#
-# gdb target
-#
-######################################################################
-
-GDB_TARGET_DIR:=$(BUILD_DIR)/gdb-$(GDB_VERSION)-target
-
-GDB_TARGET_CONFIGURE_VARS:= \
-	ac_cv_type_uintptr_t=yes \
-	gt_cv_func_gettext_libintl=yes \
-	ac_cv_func_dcgettext=yes \
-	gdb_cv_func_sigsetjmp=yes \
-	bash_cv_func_strcoll_broken=no \
-	bash_cv_must_reinstall_sighandlers=no \
-	bash_cv_func_sigsetjmp=present \
-	bash_cv_have_mbstate_t=yes
-
-$(GDB_TARGET_DIR)/.configured: $(GDB_DIR)/.unpacked
-	mkdir -p $(GDB_TARGET_DIR)
-	(cd $(GDB_TARGET_DIR); \
-		gdb_cv_func_sigsetjmp=yes \
-		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS_FOR_TARGET="$(TARGET_CFLAGS) $(TARGET_LDFLAGS) -Wno-error" \
-		CFLAGS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS) -Wno-error" \
-		$(GDB_TARGET_CONFIGURE_VARS) \
-		$(GDB_DIR)/configure $(QUIET) \
-		--cache-file=/dev/null \
-		--build=$(GNU_HOST_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--target=$(GNU_TARGET_NAME) \
-		--prefix=/usr \
-		$(DISABLE_NLS) \
-		--without-uiout $(DISABLE_GDBMI) \
-		--disable-tui --disable-gdbtk --without-x \
-		--disable-sim --enable-gdbserver \
-		--without-included-gettext \
-		--disable-werror \
-		$(QUIET) \
-	)
-ifeq ($(BR2_ENABLE_LOCALE),y)
-	-$(SED) "s,^INTL *=.*,INTL = -lintl,g;" $(GDB_DIR)/gdb/Makefile
-endif
-	touch $@
-
-$(GDB_TARGET_DIR)/gdb/gdb: $(GDB_TARGET_DIR)/.configured
-	# force ELF support since it fails due to BFD linking problems
-	gdb_cv_var_elf=yes \
-	$(TARGET_MAKE_ENV) \
-	$(MAKE) CC="$(TARGET_CC)" MT_CFLAGS="$(TARGET_CFLAGS)" \
-		-C $(GDB_TARGET_DIR)
-
-$(TARGET_DIR)/usr/bin/gdb: $(GDB_TARGET_DIR)/gdb/gdb
-	install -c -D $(GDB_TARGET_DIR)/gdb/gdb $(TARGET_DIR)/usr/bin/gdb
-
-gdb_target: ncurses $(TARGET_DIR)/usr/bin/gdb
-
-gdb_target-source: $(DL_DIR)/$(GDB_SOURCE)
-
-gdb_target-clean:
-	-$(MAKE) -C $(GDB_DIR) clean
-
-gdb_target-dirclean:
-	rm -rf $(GDB_DIR)
-
-######################################################################
-#
-# gdbserver
-#
-######################################################################
-
-GDB_SERVER_DIR:=$(BUILD_DIR)/gdbserver-$(GDB_VERSION)
-
-$(GDB_SERVER_DIR)/.configured: $(GDB_DIR)/.unpacked
-	mkdir -p $(GDB_SERVER_DIR)
-	(cd $(GDB_SERVER_DIR); \
-		$(TARGET_CONFIGURE_OPTS) \
-		gdb_cv_func_sigsetjmp=yes \
-		bash_cv_have_mbstate_t=yes \
-		$(GDB_DIR)/gdb/gdbserver/configure $(QUIET) \
-		--cache-file=/dev/null \
-		--build=$(GNU_HOST_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--target=$(GNU_TARGET_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--includedir=$(STAGING_DIR)/usr/include \
-		$(DISABLE_NLS) \
-		--without-uiout $(DISABLE_GDBMI) \
-		--disable-tui --disable-gdbtk --without-x \
-		--without-included-gettext \
-	)
-	touch $@
-
-$(GDB_SERVER_DIR)/gdbserver: $(GDB_SERVER_DIR)/.configured
-	$(TARGET_MAKE_ENV) \
-	$(MAKE) CC="$(TARGET_CC)" MT_CFLAGS="$(TARGET_CFLAGS)" \
-		-C $(GDB_SERVER_DIR)
-
-$(TARGET_DIR)/usr/bin/gdbserver: $(GDB_SERVER_DIR)/gdbserver
-ifeq ($(BR2_CROSS_TOOLCHAIN_TARGET_UTILS),y)
-	mkdir -p $(STAGING_DIR)/usr/$(GNU_TARGET_NAME)/target_utils
-	install -c $(GDB_SERVER_DIR)/gdbserver \
-		$(STAGING_DIR)/usr/$(GNU_TARGET_NAME)/target_utils/gdbserver
-endif
-	install -c -D $(GDB_SERVER_DIR)/gdbserver $(TARGET_DIR)/usr/bin/gdbserver
-
-gdbserver: $(TARGET_DIR)/usr/bin/gdbserver
-
-gdbserver-source: $(DL_DIR)/$(GDB_SOURCE)
-
-gdbserver-clean:
-	-$(MAKE) -C $(GDB_SERVER_DIR) clean
-
-gdbserver-dirclean:
-	rm -rf $(GDB_SERVER_DIR)
-
-######################################################################
-#
-# gdb on host
-#
-######################################################################
-
-GDB_HOST_DIR:=$(TOOLCHAIN_DIR)/gdbhost-$(GDB_VERSION)
-
-$(GDB_HOST_DIR)/.configured: $(GDB_DIR)/.unpacked
-	mkdir -p $(GDB_HOST_DIR)
-	(cd $(GDB_HOST_DIR); \
-		gdb_cv_func_sigsetjmp=yes \
-		bash_cv_have_mbstate_t=yes \
-		$(HOST_CONFIGURE_OPTS) \
-		$(GDB_DIR)/configure $(QUIET) \
-		--cache-file=/dev/null \
-		--prefix=$(STAGING_DIR) \
-		--build=$(GNU_HOST_NAME) \
-		--host=$(GNU_HOST_NAME) \
-		--target=$(GNU_TARGET_NAME) \
-		$(DISABLE_NLS) \
-		--without-uiout $(DISABLE_GDBMI) \
-		--disable-tui --disable-gdbtk --without-x \
-		--without-included-gettext \
-		--enable-threads \
-		--disable-werror \
-	)
-	touch $@
-
-$(GDB_HOST_DIR)/gdb/gdb: $(GDB_HOST_DIR)/.configured
-	# force ELF support since it fails due to BFD linking problems
-	$(HOST_MAKE_ENV) \
-	gdb_cv_var_elf=yes \
-	$(MAKE) -C $(GDB_HOST_DIR)
-	strip $(GDB_HOST_DIR)/gdb/gdb
-
-$(TARGET_CROSS)gdb: $(GDB_HOST_DIR)/gdb/gdb
-	install -c $(GDB_HOST_DIR)/gdb/gdb $(TARGET_CROSS)gdb
-	ln -snf $(@F) $(HOST_DIR)/usr/bin/$(ARCH)-linux-gdb
-
-gdbhost: host-expat $(TARGET_CROSS)gdb
-
-gdbhost-source: $(DL_DIR)/$(GDB_SOURCE)
-
-gdbhost-clean:
-	-$(MAKE) -C $(GDB_HOST_DIR) clean
-
-gdbhost-dirclean:
-	rm -rf $(GDB_HOST_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_GDB),y)
-TARGETS+=gdb_target
-endif
-
-ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
-TARGETS+=gdbserver
-endif
-
-ifeq ($(BR2_PACKAGE_GDB_HOST),y)
-TARGETS+=gdbhost
-endif
diff --git a/toolchain/toolchain-buildroot.mk b/toolchain/toolchain-buildroot.mk
index adab0f7..5493177 100644
--- a/toolchain/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot.mk
@@ -2,6 +2,5 @@
 
 include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
-include toolchain/gdb/gdb.mk
 include toolchain/kernel-headers/kernel-headers.mk
 include toolchain/uClibc/uclibc.mk
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index a713727..7f19b09 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -99,6 +99,13 @@ choice
 		depends on !BR2_xtensa
 endchoice
 
+config BR2_PTHREAD_DEBUG
+	bool "Thread library debugging"
+	depends on BR2_PTHREADS || BR2_PTHREADS_OLD || BR2_PTHREADS_NATIVE
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	help
+	  Build the thread library with debugging enabled.
+
 source "toolchain/elf2flt/Config.in"
 
 config BR2_VFP_FLOAT
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index f6905ae..208ccac 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -3,7 +3,7 @@
 # we want gdb config in the middle of both source and external
 # toolchains, but mconf won't let us source the same file twice,
 # so put it here instead
-source "toolchain/gdb/Config.in"
+source "package/gdb/Config.in.host"
 
 config BR2_LARGEFILE
 	bool
@@ -27,11 +27,6 @@ config BR2_TOOLCHAIN_HAS_THREADS
 	bool
 
 config BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
-	bool
-
-config BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
-	default y if !BR2_TOOLCHAIN_HAS_THREADS
 	bool
 
 config BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
diff --git a/toolchain/toolchain-crosstool-ng.mk b/toolchain/toolchain-crosstool-ng.mk
index d677256..d1e7552 100644
--- a/toolchain/toolchain-crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng.mk
@@ -4,6 +4,5 @@
 include toolchain/helpers.mk
 include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
-include toolchain/gdb/gdb.mk
 include toolchain/toolchain-crosstool-ng/crosstool-ng.mk
 include toolchain/uClibc/uclibc.mk
diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index df4e9b1..93c12e9 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -121,15 +121,18 @@ choice
 	config BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS
 		bool "linuxthreads"
 		select BR2_TOOLCHAIN_HAS_THREADS
+		select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 
 	config BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS_OLD
 		bool "linuxthreads (stable/old)"
 		select BR2_TOOLCHAIN_HAS_THREADS
+		select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 		depends on BR2_TOOLCHAIN_CTNG_uClibc
 
 	config BR2_TOOLCHAIN_CTNG_THREADS_NPTL
 		bool "Native POSIX Threading (NPTL)"
 		select BR2_TOOLCHAIN_HAS_THREADS
+		select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 endchoice
 
 endif # BR2_TOOLCHAIN_CTNG
diff --git a/toolchain/toolchain-external.mk b/toolchain/toolchain-external.mk
index 4292d85..9999aa2 100644
--- a/toolchain/toolchain-external.mk
+++ b/toolchain/toolchain-external.mk
@@ -3,7 +3,6 @@
 include toolchain/helpers.mk
 include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
-include toolchain/gdb/gdb.mk
 include toolchain/kernel-headers/kernel-headers.mk
 include toolchain/toolchain-external/ext-tool.mk
 include toolchain/uClibc/uclibc.mk
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index d2f3926..e61378b 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -913,5 +913,12 @@ config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
 
 endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
+config BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
+	bool "Copy gdb server to the Target"
+	depends on BR2_TOOLCHAIN_EXTERNAL
+	help
+	  Copy the gdbserver provided by the external toolchain to the
+	  target.
+
 endif # BR2_TOOLCHAIN_EXTERNAL
 
diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index 57c9933..cebad45 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -53,12 +53,6 @@ config BR2_UCLIBC_CONFIG
 	  See also docs/README in this package.
 	  If unsure, use the default.
 
-config BR2_PTHREAD_DEBUG
-	bool "Thread library debugging"
-	depends on BR2_PTHREADS || BR2_PTHREADS_OLD || BR2_PTHREADS_NATIVE
-	help
-	  Build the thread library with debugging enabled.
-
 config BR2_UCLIBC_INSTALL_TEST_SUITE
 	bool "Compile and install uClibc tests"
 	select BR2_PACKAGE_MAKE
-- 
1.7.9.5

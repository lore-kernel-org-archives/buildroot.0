From: Steve Thomas <scjthm@live.com>
Date: Thu, 19 Jun 2014 22:55:23 +0000
Subject: [Buildroot] [PATCH 1/1] [PATCH v2 1/1] Add support for gold linker
	and LTO for GCC.
Message-ID: <BLU436-SMTP186D00E2AE794694F2CA956A8130@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Link Time Optimisations (LTO) from GCC needs the linker plugin. It also
needs support from the tools, in particular the archiver (AR) to
properly form archives that can be used by the linker.  The linker needs
to support the plugin also.

This patch changes the linker from BFD to GOLD and wraps the ar, nm and
ranlib utilities with a wrapper that calls the gcc-wrapper version that
call the actual utilities with an additional argument. This is a
temporary measure until the binutils supoort LTO natively.

Changes v1 -> v2:
    - removed unecessary configuration option for binutils
    - added siginging off to patches.
    - cleaned up formatting and added missing comments.

Signed-off-by: Steve Thomas <scjthm@live.com>
---
 package/binutils/Config.in.host         |  1 +
 package/binutils/binutils.mk            | 28 ++++++++++++-----
 package/gcc/4.8.3/950-lto-support.patch | 54 +++++++++++++++++++++++++++++++++
 package/gcc/4.9.0/950-lto-support.patch | 54 +++++++++++++++++++++++++++++++++
 package/gcc/Config.in.host              |  2 ++
 package/gcc/gcc-initial/gcc-initial.mk  | 18 +++++++++++
 package/gcc/gcc.mk                      | 11 +++++++
 toolchain/toolchain-buildroot/Config.in | 25 +++++++++++++++
 8 files changed, 185 insertions(+), 8 deletions(-)
 create mode 100644 package/gcc/4.8.3/950-lto-support.patch
 create mode 100644 package/gcc/4.9.0/950-lto-support.patch

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 08540a3..de7f29a 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -42,6 +42,7 @@ choice
 
 	config BR2_BINUTILS_VERSION_2_24
 		depends on !BR2_avr32
+		select BR2_BINUTILS_SUPPORTS_GOLD
 		bool "binutils 2.24"
 
 endchoice
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 9cc4d28..dcca490 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -44,10 +44,10 @@ endif
 
 # We need to specify host & target to avoid breaking ARM EABI
 BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
-		--host=$(GNU_TARGET_NAME) \
-		--target=$(GNU_TARGET_NAME) \
-		--enable-install-libiberty \
-		$(BINUTILS_EXTRA_CONFIG_OPTIONS)
+	--host=$(GNU_TARGET_NAME) \
+	--target=$(GNU_TARGET_NAME) \
+	--enable-install-libiberty \
+	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
 # Install binutils after busybox to prefer full-blown utilities
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
@@ -57,10 +57,22 @@ endif
 # "host" binutils should actually be "cross"
 # We just keep the convention of "host utility" for now
 HOST_BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
-			--target=$(GNU_TARGET_NAME) \
-			--disable-shared --enable-static \
-			--with-sysroot=$(STAGING_DIR) \
-			$(BINUTILS_EXTRA_CONFIG_OPTIONS)
+	--target=$(GNU_TARGET_NAME) \
+	--disable-shared --enable-static \
+	--with-sysroot=$(STAGING_DIR) \
+	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
+
+# disable ld explicitely and use ld.gold exclusively
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_GOLD),y)
+HOST_BINUTILS_CONF_OPT += \
+	--enable-plugins \
+	--enable-gold \
+	--disable-ld
+endif
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_LTO),y)
+HOST_BINUTILS_CONF_OPT += --enable-lto
+endif
 
 # We just want libbfd and libiberty, not the full-blown binutils in staging
 define BINUTILS_INSTALL_STAGING_CMDS
diff --git a/package/gcc/4.8.3/950-lto-support.patch b/package/gcc/4.8.3/950-lto-support.patch
new file mode 100644
index 0000000..fd34801
--- /dev/null
+++ b/package/gcc/4.8.3/950-lto-support.patch
@@ -0,0 +1,54 @@
+Add support for Link Time Optimisations (LTO)
+
+The link time optimisations cause the compiler optimisations
+to take place during linking rather than during compilation.
+
+Simply using the archiver (AR) on a number of object files
+doesn't work because the certain LTO specific symbols are 
+not handled properly.
+
+The GCC solution is to create a wrapper around ar, nm and 
+ranlib, called ar-gcc, rm-gcc and ranlib-gcc, and to call 
+these from the various project makefiles. For a complete
+LTO build, changing the makefiles that don't take AR from 
+the environment is not really practical. This is a temporary
+solution until the actual tools, provided by binutils
+will correctly handle LTO objects.
+
+Signed-off-by: Steve Thomas <sjthm@live.com>
+
+--- a/gcc/gcc-ar.c	2014-04-29 23:54:09.387237442 +0000
++++ b/gcc/gcc-ar.c	2014-04-29 23:52:35.184336991 +0000
+@@ -123,6 +126,7 @@
+ int 
+ main (int ac, char **av)
+ {
++  char real_exe_bin_name[256];
+   const char *exe_name;
+   char *plugin;
+   int k, status, err;
+@@ -143,20 +147,12 @@
+     }
+ 
+   /* Find the wrapped binutils program.  */
+-  exe_name = find_a_file (&target_path, PERSONALITY, X_OK);
++  exe_name = find_a_file (&target_path, PERSONALITY "-bin", X_OK);
+   if (!exe_name)
+     {
+-      const char *real_exe_name = PERSONALITY;
+-#ifdef CROSS_DIRECTORY_STRUCTURE
+-      real_exe_name = concat (target_machine, "-", PERSONALITY, NULL);
+-#endif
+-      exe_name = find_a_file (&path, real_exe_name, X_OK);
+-      if (!exe_name)
+-	{
+-	  fprintf (stderr, "%s: Cannot find binary '%s'\n", av[0],
+-		   real_exe_name);
+-	  exit (1);
+-	}
++      exe_name = real_exe_bin_name;
++      strcpy(real_exe_bin_name, av[0]);
++      strcat(real_exe_bin_name, "-bin");
+     }
+ 
+   /* Create new command line with plugin */
diff --git a/package/gcc/4.9.0/950-lto-support.patch b/package/gcc/4.9.0/950-lto-support.patch
new file mode 100644
index 0000000..fd34801
--- /dev/null
+++ b/package/gcc/4.9.0/950-lto-support.patch
@@ -0,0 +1,54 @@
+Add support for Link Time Optimisations (LTO)
+
+The link time optimisations cause the compiler optimisations
+to take place during linking rather than during compilation.
+
+Simply using the archiver (AR) on a number of object files
+doesn't work because the certain LTO specific symbols are 
+not handled properly.
+
+The GCC solution is to create a wrapper around ar, nm and 
+ranlib, called ar-gcc, rm-gcc and ranlib-gcc, and to call 
+these from the various project makefiles. For a complete
+LTO build, changing the makefiles that don't take AR from 
+the environment is not really practical. This is a temporary
+solution until the actual tools, provided by binutils
+will correctly handle LTO objects.
+
+Signed-off-by: Steve Thomas <sjthm@live.com>
+
+--- a/gcc/gcc-ar.c	2014-04-29 23:54:09.387237442 +0000
++++ b/gcc/gcc-ar.c	2014-04-29 23:52:35.184336991 +0000
+@@ -123,6 +126,7 @@
+ int 
+ main (int ac, char **av)
+ {
++  char real_exe_bin_name[256];
+   const char *exe_name;
+   char *plugin;
+   int k, status, err;
+@@ -143,20 +147,12 @@
+     }
+ 
+   /* Find the wrapped binutils program.  */
+-  exe_name = find_a_file (&target_path, PERSONALITY, X_OK);
++  exe_name = find_a_file (&target_path, PERSONALITY "-bin", X_OK);
+   if (!exe_name)
+     {
+-      const char *real_exe_name = PERSONALITY;
+-#ifdef CROSS_DIRECTORY_STRUCTURE
+-      real_exe_name = concat (target_machine, "-", PERSONALITY, NULL);
+-#endif
+-      exe_name = find_a_file (&path, real_exe_name, X_OK);
+-      if (!exe_name)
+-	{
+-	  fprintf (stderr, "%s: Cannot find binary '%s'\n", av[0],
+-		   real_exe_name);
+-	  exit (1);
+-	}
++      exe_name = real_exe_bin_name;
++      strcpy(real_exe_bin_name, av[0]);
++      strcat(real_exe_bin_name, "-bin");
+     }
+ 
+   /* Create new command line with plugin */
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index fde1b90..c79a102 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -64,6 +64,7 @@ choice
 		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a12 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_powerpc64le && !BR2_sparc
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
+		select BR2_GCC_SUPPORTS_GOLD
 		bool "gcc 4.8.x"
 
 	config BR2_GCC_VERSION_4_8_ARC
@@ -75,6 +76,7 @@ choice
 		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_sparc
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
+		select BR2_GCC_SUPPORTS_GOLD
 		bool "gcc 4.9.x"
 
 	config BR2_GCC_VERSION_SNAP
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index bc5ad26..717bbfd 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -40,4 +40,22 @@ HOST_GCC_INITIAL_CONF_ENV = \
 HOST_GCC_INITIAL_MAKE_OPT = all-gcc
 HOST_GCC_INITIAL_INSTALL_OPT = install-gcc
 
+# Create LTO aware wrappers for ar, nm and ranlib if they are not present.
+# The wrappers just add a linker plugin option and support LTO and non-LTO objects.
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_GOLD),y)
+define HOST_GCC_INSTALL_WRAPPERS
+        for i in ar nm ranlib ; do \
+			_tmp=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-$${i}; \
+	        if [ ! -f "$${_tmp}-bin" ] ; then \
+				mv $${_tmp} $${_tmp}-bin; \
+				cp -dpf $$(echo $${_tmp} | sed 's:-[^-]*$$:-gcc&:') $${_tmp}; \
+				ln -f $${_tmp}-bin $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin/$${i}-bin; \
+				ln -f $${_tmp} $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin/$${i}; \
+			fi; \
+        done; \
+		ln -fs $(HOST_DIR)/usr/libexec $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/libexec
+endef
+HOST_GCC_INITIAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPERS
+endif
+
 $(eval $(host-autotools-package))
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 5b60bc3..6980fa8 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -213,6 +213,17 @@ ifneq ($(GCC_TARGET_MODE),)
 HOST_GCC_COMMON_CONF_OPT += --with-mode=$(GCC_TARGET_MODE)
 endif
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_GOLD),y)
+HOST_GCC_COMMON_CONF_OPT += \
+           --enable-plugins \
+           --enable-gold \
+           --disable-ld
+endif
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_LTO),y)
+HOST_GCC_COMMON_CONF_OPT += --enable-lto
+endif
+
 # Branding works on >= 4.3
 ifneq ($(findstring x4.2.,x$(GCC_VERSION)),x4.2.)
 HOST_GCC_COMMON_CONF_OPT += \
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index eef9f9c..1aa1ee6 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -100,6 +100,31 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
 	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	default "musl"	 if BR2_TOOLCHAIN_BUILDROOT_MUSL
 
+config BR2_TOOLCHAIN_BUILDROOT_GOLD
+	bool "GOLD linker (experimental)"
+	depends on BR2_BINUTILS_SUPPORTS_GOLD
+	depends on BR2_GCC_SUPPORTS_GOLD
+	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64
+	help
+	  This option selects the gold ELF only linker from the
+	  binutils package. This is currently in beta. This
+	  option will only build and install the gold linker.
+
+	  http://sourceware.org/binutils/
+
+
+config BR2_TOOLCHAIN_BUILDROOT_LTO
+	bool "Link Time Optimisations (LTO) (experimental)"
+	depends on BR2_TOOLCHAIN_BUILDROOT_GOLD
+	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64
+	help
+	  This option builds GCC with suppport for Link Time
+	  Optimisation (LTO). To enable this option you must be using
+	  gold as the linker and enable the use of the linker plugin
+	  by compiling with the -fuse-linker-plugin flag.
+
+	  http://gcc.gnu.org/wiki/LinkTimeOptimization
+
 source "package/uclibc/Config.in"
 source "package/glibc/Config.in"
 source "package/binutils/Config.in.host"
-- 
2.0.0

From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Dec 2010 16:10:31 -0300
Subject: [Buildroot] [PATCH 06/10] gdb: make it a proper package
In-Reply-To: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>
References: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1293563435-10054-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Convert gdb to a proper autotargets package
* Add version 7.2
* Drop version 6.6
* Mark version 6.7.1 (non-avr32) as deprecated

Kconfig can't handle duplicate choices and we can't make source depend
on anything.
To fix this we suffix the different version choices for each case (in
the toolchain menu with internal toolchain, in the package menu for
target gdb/gdbserver for internal and external toolchains.

TODO: copy gdbserver from external toolchains

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Makefile                                           |    2 +-
 package/Config.in                                  |    6 +
 package/gdb/Config.in.external                     |   66 ++++++
 package/gdb/Config.in.host                         |   49 ++++
 package/gdb/Config.in.internal                     |   70 ++++++
 .../gdb-6.7.1}/600-fix-compile-flag-mismatch.patch |    0
 .../gdb-6.8}/600-fix-compile-flag-mismatch.patch   |    0
 package/gdb/gdb-7.2/100-fix-ipa.patch              |   25 ++
 .../gdb/gdb-7.2/101-fix-gdbserver-uninstall.patch  |   23 ++
 package/gdb/gdb.mk                                 |   62 +++++
 toolchain/gdb/6.6/100-uclibc-conf.patch            |   82 -------
 .../gdb/6.6/600-fix-compile-flag-mismatch.patch    |   69 ------
 toolchain/gdb/Config.in                            |   69 ------
 toolchain/gdb/gdb.mk                               |  237 --------------------
 toolchain/toolchain-buildroot.mk                   |    1 -
 toolchain/toolchain-buildroot/Config.in            |    1 +
 toolchain/toolchain-common.in                      |    5 -
 toolchain/toolchain-crosstool-ng.mk                |    1 -
 toolchain/toolchain-external.mk                    |    1 -
 19 files changed, 303 insertions(+), 466 deletions(-)
 create mode 100644 package/gdb/Config.in.external
 create mode 100644 package/gdb/Config.in.host
 create mode 100644 package/gdb/Config.in.internal
 rename {toolchain/gdb/6.7.1 => package/gdb/gdb-6.7.1}/600-fix-compile-flag-mismatch.patch (100%)
 rename {toolchain/gdb/6.8 => package/gdb/gdb-6.8}/600-fix-compile-flag-mismatch.patch (100%)
 create mode 100644 package/gdb/gdb-7.2/100-fix-ipa.patch
 create mode 100644 package/gdb/gdb-7.2/101-fix-gdbserver-uninstall.patch
 create mode 100644 package/gdb/gdb.mk
 delete mode 100644 toolchain/gdb/6.6/100-uclibc-conf.patch
 delete mode 100644 toolchain/gdb/6.6/600-fix-compile-flag-mismatch.patch
 delete mode 100644 toolchain/gdb/Config.in
 delete mode 100644 toolchain/gdb/gdb.mk

diff --git a/Makefile b/Makefile
index 2325319..d0f9032 100644
--- a/Makefile
+++ b/Makefile
@@ -612,7 +612,7 @@ endif
 
 configured: dirs kernel-headers uclibc-config busybox-config linux26-config
 
-prepatch:	gcc-patched gdb-patched uclibc-patched
+prepatch:	gcc-patched uclibc-patched
 
 cross: $(BASE_TARGETS)
 
diff --git a/package/Config.in b/package/Config.in
index fb47e27..3b442da 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -55,6 +55,12 @@ source "package/flex/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/gawk/Config.in"
 endif
+if BR2_TOOLCHAIN_BUILDROOT
+source "package/gdb/Config.in.internal"
+endif
+if !BR2_TOOLCHAIN_BUILDROOT
+source "package/gdb/Config.in.external"
+endif
 source "toolchain/gcc/Config.in.2"
 source "package/gettext/Config.in"
 source "package/gmp/Config.in"
diff --git a/package/gdb/Config.in.external b/package/gdb/Config.in.external
new file mode 100644
index 0000000..9f7b0bf
--- /dev/null
+++ b/package/gdb/Config.in.external
@@ -0,0 +1,66 @@
+config BR2_PACKAGE_GDB
+	bool
+	default y if BR2_PACKAGE_GDB_TARGET || BR2_PACKAGE_GDB_SERVER
+
+config BR2_PACKAGE_GDB_TARGET
+	bool "gdb"
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_GDB
+	depends on BR2_USE_WCHAR
+	help
+	    Build the full gdb debugger to run on the target.
+
+comment "GDB debugger for the target needs WCHAR support in toolchain"
+	depends on !BR2_USE_WCHAR
+
+config BR2_PACKAGE_GDB_SERVER
+	bool "gdbserver"
+	select BR2_PACKAGE_GDB
+	help
+	    Build the gdbserver stub to run on the target.
+	    A full gdb is needed to debug the progam.
+
+choice
+	prompt "GDB debugger Version"
+	depends on BR2_PACKAGE_GDB
+	default BR2_GDB_VERSION_6_8_e if !BR2_avr32
+	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5_e if BR2_avr32
+	help
+	  Select the version of gdb you wish to use.
+
+	config BR2_GDB_VERSION_6_7_1_e
+		depends on !BR2_avr32
+		bool "gdb 6.7.1"
+		depends on BR2_DEPRECATED
+
+	config BR2_GDB_VERSION_6_7_1_AVR32_2_1_5_e
+		depends on BR2_avr32
+		bool "gdb 6.7.1-avr32-2.1.5"
+
+	config BR2_GDB_VERSION_6_8_e
+		bool "gdb 6.8"
+		depends on !BR2_avr32
+
+	config BR2_GDB_VERSION_7_0_1_e
+		bool "gdb 7.0.1"
+		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
+
+	config BR2_GDB_VERSION_7_1_e
+		bool "gdb 7.1"
+		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
+
+	config BR2_GDB_VERSION_7_2_e
+		bool "gdb 7.2"
+		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
+
+endchoice
+
+config BR2_GDB_VERSION
+	depends on BR2_PACKAGE_GDB
+	string
+	default "6.7.1"			if BR2_GDB_VERSION_6_7_1_e
+	default "6.7.1-avr32-2.1.5"	if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5_e
+	default "6.8"			if BR2_GDB_VERSION_6_8_e
+	default "7.0.1"			if BR2_GDB_VERSION_7_0_1_e
+	default "7.1"			if BR2_GDB_VERSION_7_1_e
+	default "7.2"			if BR2_GDB_VERSION_7_2_e
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
new file mode 100644
index 0000000..78182ae
--- /dev/null
+++ b/package/gdb/Config.in.host
@@ -0,0 +1,49 @@
+config BR2_PACKAGE_HOST_GDB
+	bool "Build/install gdb for the host"
+	help
+	    Build gdb to run on the host to debug programs run on the target.
+
+choice
+	prompt "GDB debugger Version"
+	depends on BR2_PACKAGE_HOST_GDB
+	default BR2_GDB_VERSION_6_8 if !BR2_avr32
+	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
+	help
+	  Select the version of gdb you wish to use.
+
+	config BR2_GDB_VERSION_6_7_1
+		depends on !BR2_avr32
+		bool "gdb 6.7.1"
+		depends on BR2_DEPRECATED
+
+	config BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
+		depends on BR2_avr32
+		bool "gdb 6.7.1-avr32-2.1.5"
+
+	config BR2_GDB_VERSION_6_8
+		bool "gdb 6.8"
+		depends on !BR2_avr32
+
+	config BR2_GDB_VERSION_7_0_1
+		bool "gdb 7.0.1"
+		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
+
+	config BR2_GDB_VERSION_7_1
+		bool "gdb 7.1"
+		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
+
+	config BR2_GDB_VERSION_7_2
+		bool "gdb 7.2"
+		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
+
+endchoice
+
+config BR2_GDB_VERSION
+	depends on BR2_PACKAGE_HOST_GDB
+	string
+	default "6.7.1"			if BR2_GDB_VERSION_6_7_1
+	default "6.7.1-avr32-2.1.5"	if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
+	default "6.8"			if BR2_GDB_VERSION_6_8
+	default "7.0.1"			if BR2_GDB_VERSION_7_0_1
+	default "7.1"			if BR2_GDB_VERSION_7_1
+	default "7.2"			if BR2_GDB_VERSION_7_2
diff --git a/package/gdb/Config.in.internal b/package/gdb/Config.in.internal
new file mode 100644
index 0000000..d3d8de5
--- /dev/null
+++ b/package/gdb/Config.in.internal
@@ -0,0 +1,70 @@
+config BR2_PACKAGE_GDB
+	bool
+	default y if BR2_PACKAGE_GDB_TARGET || BR2_PACKAGE_GDB_SERVER
+
+config BR2_PACKAGE_GDB_TARGET
+	bool "gdb"
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_GDB
+	depends on BR2_USE_WCHAR
+	help
+	    Build the full gdb debugger to run on the target.
+
+comment "GDB debugger for the target needs WCHAR support in toolchain"
+	depends on !BR2_USE_WCHAR
+
+config BR2_PACKAGE_GDB_SERVER
+	bool "gdbserver"
+	depends on BR2_PACKAGE_HOST_GDB
+	select BR2_PACKAGE_GDB
+	help
+	    Build the gdbserver stub to run on the target.
+	    A full gdb is needed to debug the progam.
+
+comment "GDB server needs you to build a host GDB in toolchain"
+	depends on !BR2_PACKAGE_HOST_GDB
+
+choice
+	prompt "GDB debugger Version"
+	depends on !BR2_PACKAGE_HOST_GDB && BR2_PACKAGE_GDB
+	default BR2_GDB_VERSION_6_8_i if !BR2_avr32
+	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5_i if BR2_avr32
+	help
+	  Select the version of gdb you wish to use.
+
+	config BR2_GDB_VERSION_6_7_1_i
+		depends on !BR2_avr32
+		bool "gdb 6.7.1"
+		depends on BR2_DEPRECATED
+
+	config BR2_GDB_VERSION_6_7_1_AVR32_2_1_5_i
+		depends on BR2_avr32
+		bool "gdb 6.7.1-avr32-2.1.5"
+
+	config BR2_GDB_VERSION_6_8_i
+		bool "gdb 6.8"
+		depends on !BR2_avr32
+
+	config BR2_GDB_VERSION_7_0_1_i
+		bool "gdb 7.0.1"
+		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
+
+	config BR2_GDB_VERSION_7_1_i
+		bool "gdb 7.1"
+		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
+
+	config BR2_GDB_VERSION_7_2_i
+		bool "gdb 7.2"
+		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
+
+endchoice
+
+config BR2_GDB_VERSION
+	depends on !BR2_PACKAGE_HOST_GDB && BR2_PACKAGE_GDB
+	string
+	default "6.7.1"			if BR2_GDB_VERSION_6_7_1_i
+	default "6.7.1-avr32-2.1.5"	if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5_i
+	default "6.8"			if BR2_GDB_VERSION_6_8_i
+	default "7.0.1"			if BR2_GDB_VERSION_7_0_1_i
+	default "7.1"			if BR2_GDB_VERSION_7_1_i
+	default "7.2"			if BR2_GDB_VERSION_7_2_i
diff --git a/toolchain/gdb/6.7.1/600-fix-compile-flag-mismatch.patch b/package/gdb/gdb-6.7.1/600-fix-compile-flag-mismatch.patch
similarity index 100%
rename from toolchain/gdb/6.7.1/600-fix-compile-flag-mismatch.patch
rename to package/gdb/gdb-6.7.1/600-fix-compile-flag-mismatch.patch
diff --git a/toolchain/gdb/6.8/600-fix-compile-flag-mismatch.patch b/package/gdb/gdb-6.8/600-fix-compile-flag-mismatch.patch
similarity index 100%
rename from toolchain/gdb/6.8/600-fix-compile-flag-mismatch.patch
rename to package/gdb/gdb-6.8/600-fix-compile-flag-mismatch.patch
diff --git a/package/gdb/gdb-7.2/100-fix-ipa.patch b/package/gdb/gdb-7.2/100-fix-ipa.patch
new file mode 100644
index 0000000..96037a9
--- /dev/null
+++ b/package/gdb/gdb-7.2/100-fix-ipa.patch
@@ -0,0 +1,25 @@
+Fix gdbserver standalone
+
+See http://www.cygwin.com/ml/gdb-patches/2010-09/msg00148.html
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ gdb/gdbserver/Makefile.in |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/gdb/gdbserver/Makefile.in b/gdb/gdbserver/Makefile.in
+index 76577cf..c2fc245 100644
+--- a/gdb/gdbserver/Makefile.in
++++ b/gdb/gdbserver/Makefile.in
+@@ -164,7 +164,7 @@ install: all install-only
+ install-only:
+ 	n=`echo gdbserver | sed '$(program_transform_name)'`; \
+ 	if [ x$$n = x ]; then n=gdbserver; else true; fi; \
+-	if [ x$IPA_DEPFILES != x ]; then \
++	if [ x$$IPA_DEPFILES != x ]; then \
+ 		$(SHELL) $(srcdir)/../../mkinstalldirs $(DESTDIR)$(libdir); \
+ 		$(INSTALL_PROGRAM) $(IPA_LIB) $(DESTDIR)$(libdir)/$(IPA_LIB); \
+ 	fi; \
+-- 
+1.7.2.2
+
diff --git a/package/gdb/gdb-7.2/101-fix-gdbserver-uninstall.patch b/package/gdb/gdb-7.2/101-fix-gdbserver-uninstall.patch
new file mode 100644
index 0000000..c42fddc
--- /dev/null
+++ b/package/gdb/gdb-7.2/101-fix-gdbserver-uninstall.patch
@@ -0,0 +1,23 @@
+Fix uninstall target of gdbserver... meaning honor DESTDIR.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ gdb/gdbserver/Makefile.in |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/gdb/gdbserver/Makefile.in b/gdb/gdbserver/Makefile.in
+index 76577cf..43024fe 100644
+--- a/gdb/gdbserver/Makefile.in
++++ b/gdb/gdbserver/Makefile.in
+@@ -176,7 +176,7 @@ install-only:
+ uninstall: force
+ 	n=`echo gdbserver | sed '$(program_transform_name)'`; \
+ 	if [ x$$n = x ]; then n=gdbserver; else true; fi; \
+-	rm -f $(bindir)/$$n$(EXEEXT) $(DESTDIR)$(man1dir)/$$n.1
++	rm -f $(DESTDIR)$(bindir)/$$n$(EXEEXT) $(DESTDIR)$(man1dir)/$$n.1
+ 
+ installcheck:
+ check:
+-- 
+1.7.2.2
+
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
new file mode 100644
index 0000000..92cc4af
--- /dev/null
+++ b/package/gdb/gdb.mk
@@ -0,0 +1,62 @@
+#############################################################
+#
+# gdb
+#
+#############################################################
+
+GDB_VERSION = $(call qstrip,$(BR2_GDB_VERSION))
+GDB_SOURCE = gdb-$(GDB_VERSION).tar.bz2
+GDB_SITE = $(BR2_GNU_MIRROR)/gdb
+ifeq ($(ARCH),avr32)
+GDB_SITE = ftp://www.at91.com/pub/buildroot
+endif
+GDB_TARGET_BINS = gdb gdbserver gdbtui
+
+HOST_GDB_CONF_ENV = gdb_cv_func_sigsetjmp=yes \
+			bash_cv_have_mbstate_t=yes
+HOST_GDB_CONF_OPT = --without-uiout --disable-werror \
+			--disable-gdbtk --without-x \
+			--without-included-gettext --enable-threads \
+			--target=$(REAL_GNU_TARGET_NAME)
+
+define HOST_GDB_SYMLINK_CREATE
+	cd $(HOST_DIR)/usr/bin ; \
+	ln -sf $(REAL_GNU_TARGET_NAME)-gdb gdb ; \
+	ln -sf $(REAL_GNU_TARGET_NAME)-gdbtui gdbtui
+endef
+
+HOST_GDB_POST_INSTALL_HOOKS += HOST_GDB_SYMLINK_CREATE
+
+# If it's not full gdb then it's just gdbserver (if built at all)
+ifeq ($(BR2_PACKAGE_GDB_TARGET),y)
+GDB_DEPENDENCIES = ncurses
+GDB_CONF_ENV = ac_cv_type_uintptr_t=yes \
+		gt_cv_func_gettext_libintl=yes \
+		ac_cv_func_dcgettext=yes \
+		gdb_cv_func_sigsetjmp=yes \
+		bash_cv_func_strcoll_broken=no \
+		bash_cv_must_reinstall_sighandlers=no \
+		bash_cv_func_sigsetjmp=present \
+		bash_cv_have_mbstate_t=yes
+GDB_CONF_OPT = --cache-file=/dev/null --without-uiout \
+		--disable-sim --enable-gdbserver \
+		--without-included-gettext --disable-werror \
+		--program-transform-name=''
+else
+GDB_CONF_ENV = gdb_cv_func_sigsetjmp=yes \
+		bash_cv_have_mbstate_t=yes
+GDB_CONF_OPT = --cache-file=/dev/null --without-uiout \
+		--disable-tui --disable-gdbtk \
+		--without-included-gettext \
+		--includedir=$(STAGING_DIR)/usr/include \
+		--program-transform-name=''
+GDB_SUBDIR = gdb/gdbserver
+endif
+
+define GDB_UNINSTALL_TARGET_CMDS
+	rm -rf $(TARGET_DIR)/usr/share/gdb
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(GDB_TARGET_BINS))
+endef
+
+$(eval $(call AUTOTARGETS,package,gdb))
+$(eval $(call AUTOTARGETS,package,gdb,host))
diff --git a/toolchain/gdb/6.6/100-uclibc-conf.patch b/toolchain/gdb/6.6/100-uclibc-conf.patch
deleted file mode 100644
index a790b6f..0000000
--- a/toolchain/gdb/6.6/100-uclibc-conf.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-diff -rNdup gdb-6.6.orig/bfd/configure gdb-6.6/bfd/configure
---- gdb-6.6.orig/bfd/configure	2006-10-25 08:49:20.000000000 +0200
-+++ gdb-6.6/bfd/configure	2007-05-14 10:35:50.000000000 +0200
-@@ -3579,6 +3579,11 @@ linux-gnu*)
-   lt_cv_deplibs_check_method=pass_all
-   ;;
- 
-+linux-uclibc*)
-+  lt_cv_deplibs_check_method=pass_all
-+  lt_cv_file_magic_test_file=`echo /lib/libuClibc-*.so`
-+  ;;
-+
- netbsd* | knetbsd*-gnu)
-   if echo __ELF__ | $CC -E - | grep __ELF__ > /dev/null; then
-     lt_cv_deplibs_check_method='match_pattern /lib[^/\.]+\.so\.[0-9]+\.[0-9]+$'
-diff -rNdup gdb-6.6.orig/libtool.m4 gdb-6.6/libtool.m4
---- gdb-6.6.orig/libtool.m4	2005-12-27 17:37:57.000000000 +0100
-+++ gdb-6.6/libtool.m4	2007-05-14 10:35:50.000000000 +0200
-@@ -751,6 +751,11 @@ netbsd* | knetbsd*-gnu)
-   fi
-   ;;
- 
-+linux-uclibc*)
-+  lt_cv_deplibs_check_method=pass_all
-+  lt_cv_file_magic_test_file=`echo /lib/libuClibc-*.so`
-+  ;;
-+
- newsos6)
-   [lt_cv_deplibs_check_method='file_magic ELF [0-9][0-9]*-bit [ML]SB (executable|dynamic lib)']
-   lt_cv_file_magic_cmd=/usr/bin/file
-diff -rNdup gdb-6.6.orig/ltconfig gdb-6.6/ltconfig
---- gdb-6.6.orig/ltconfig	2006-07-04 22:31:03.000000000 +0200
-+++ gdb-6.6/ltconfig	2007-05-14 10:35:50.000000000 +0200
-@@ -602,7 +602,7 @@ host_os=`echo $host | sed 's/^\([^-]*\)-
- 
- # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
- case $host_os in
--linux-gnu*) ;;
-+linux-gnu*|linux-uclibc*) ;;
- linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
- esac
- 
-@@ -1270,6 +1270,24 @@ linux-gnu*)
-   dynamic_linker='GNU/Linux ld.so'
-   ;;
- 
-+linux-uclibc*)
-+  version_type=linux
-+  need_lib_prefix=no
-+  need_version=no
-+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major $libname.so'
-+  soname_spec='${libname}${release}.so$major'
-+  finish_cmds='PATH="\$PATH:/sbin" ldconfig -n $libdir'
-+  shlibpath_var=LD_LIBRARY_PATH
-+  shlibpath_overrides_runpath=no
-+  # This implies no fast_install, which is unacceptable.
-+  # Some rework will be needed to allow for fast_install
-+  # before this can be enabled.
-+  # Note: copied from linux-gnu, and may not be appropriate.
-+  hardcode_into_libs=yes
-+  # Assume using the uClibc dynamic linker.
-+  dynamic_linker="uClibc ld.so"
-+  ;;
-+
- netbsd*)
-   need_lib_prefix=no
-   need_version=no
-diff -rNdup gdb-6.6.orig/opcodes/configure gdb-6.6/opcodes/configure
---- gdb-6.6.orig/opcodes/configure	2006-10-25 08:49:20.000000000 +0200
-+++ gdb-6.6/opcodes/configure	2007-05-14 10:35:50.000000000 +0200
-@@ -3590,6 +3590,11 @@ netbsd* | knetbsd*-gnu)
-   fi
-   ;;
- 
-+linux-uclibc*)
-+  lt_cv_deplibs_check_method=pass_all
-+  lt_cv_file_magic_test_file=`echo /lib/libuClibc-*.so`
-+  ;;
-+
- newsos6)
-   lt_cv_deplibs_check_method='file_magic ELF [0-9][0-9]*-bit [ML]SB (executable|dynamic lib)'
-   lt_cv_file_magic_cmd=/usr/bin/file
diff --git a/toolchain/gdb/6.6/600-fix-compile-flag-mismatch.patch b/toolchain/gdb/6.6/600-fix-compile-flag-mismatch.patch
deleted file mode 100644
index 60f0ace..0000000
--- a/toolchain/gdb/6.6/600-fix-compile-flag-mismatch.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-diff -rduNp gdb-6.6-100/Makefile.in gdb-6.6/Makefile.in
---- gdb-6.6-100/Makefile.in	2006-12-18 08:21:19.000000000 +0100
-+++ gdb-6.6/Makefile.in	2007-05-14 10:54:29.000000000 +0200
-@@ -331,7 +331,7 @@ COMPILER_NM_FOR_TARGET=@COMPILER_NM_FOR_
- # CFLAGS will be just -g.  We want to ensure that TARGET libraries
- # (which we know are built with gcc) are built with optimizations so
- # prepend -O2 when setting CFLAGS_FOR_TARGET.
--CFLAGS_FOR_TARGET = -O2 $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
-+CFLAGS_FOR_TARGET = $(strip $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET))
- SYSROOT_CFLAGS_FOR_TARGET = @SYSROOT_CFLAGS_FOR_TARGET@
- CXXFLAGS_FOR_TARGET = $(CXXFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
- LIBCFLAGS_FOR_TARGET = $(CFLAGS_FOR_TARGET)
-diff -rduNp gdb-6.6-100/Makefile.tpl gdb-6.6/Makefile.tpl
---- gdb-6.6-100/Makefile.tpl	2006-11-15 00:26:39.000000000 +0100
-+++ gdb-6.6/Makefile.tpl	2007-05-14 10:54:29.000000000 +0200
-@@ -334,7 +334,7 @@ COMPILER_NM_FOR_TARGET=@COMPILER_NM_FOR_
- # CFLAGS will be just -g.  We want to ensure that TARGET libraries
- # (which we know are built with gcc) are built with optimizations so
- # prepend -O2 when setting CFLAGS_FOR_TARGET.
--CFLAGS_FOR_TARGET = -O2 $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
-+CFLAGS_FOR_TARGET = $(strip $(CFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET))
- SYSROOT_CFLAGS_FOR_TARGET = @SYSROOT_CFLAGS_FOR_TARGET@
- CXXFLAGS_FOR_TARGET = $(CXXFLAGS) $(SYSROOT_CFLAGS_FOR_TARGET)
- LIBCFLAGS_FOR_TARGET = $(CFLAGS_FOR_TARGET)
-diff -rduNp gdb-6.6-100/gdb/configure gdb-6.6/gdb/configure
---- gdb-6.6-100/gdb/configure	2006-12-17 16:38:59.000000000 +0100
-+++ gdb-6.6/gdb/configure	2007-05-14 10:55:41.000000000 +0200
-@@ -272,7 +272,7 @@ PACKAGE_STRING=
- PACKAGE_BUGREPORT=
- 
- ac_unique_file="main.c"
--ac_subdirs_all="$ac_subdirs_all doc testsuite"
-+ac_subdirs_all="$ac_subdirs_all doc"
- # Factoring default headers for most tests.
- ac_includes_default="\
- #include <stdio.h>
-@@ -3055,7 +3055,7 @@ _ACEOF
- 
- 
- 
--subdirs="$subdirs doc testsuite"
-+subdirs="$subdirs doc"
- 
- 
- # Provide defaults for some variables set by the per-host and per-target
-diff -rduNp gdb-6.6-100/gdb/gdbserver/configure gdb-6.6/gdb/gdbserver/configure
---- gdb-6.6-100/gdb/gdbserver/configure	2006-11-22 01:10:19.000000000 +0100
-+++ gdb-6.6/gdb/gdbserver/configure	2007-05-14 10:54:29.000000000 +0200
-@@ -1239,7 +1239,7 @@ echo "$as_me: error: \`$ac_var' was not 
-       ac_cache_corrupted=: ;;
-     ,);;
-     *)
--      if test "x$ac_old_val" != "x$ac_new_val"; then
-+      if test "`echo $ac_old_val`" != "`echo $ac_new_val`"; then
- 	{ echo "$as_me:$LINENO: error: \`$ac_var' has changed since the previous run:" >&5
- echo "$as_me: error: \`$ac_var' has changed since the previous run:" >&2;}
- 	{ echo "$as_me:$LINENO:   former value:  $ac_old_val" >&5
-diff -rduNp gdb-6.6-100/gdb/testsuite/configure gdb-6.6/gdb/testsuite/configure
---- gdb-6.6-100/gdb/testsuite/configure	2006-06-21 15:57:21.000000000 +0200
-+++ gdb-6.6/gdb/testsuite/configure	2007-05-14 10:54:29.000000000 +0200
-@@ -1248,7 +1248,7 @@ echo "$as_me: error: \`$ac_var' was not 
-       ac_cache_corrupted=: ;;
-     ,);;
-     *)
--      if test "x$ac_old_val" != "x$ac_new_val"; then
-+      if test "`echo $ac_old_val" != "`echo $ac_new_val"; then
- 	{ echo "$as_me:$LINENO: error: \`$ac_var' has changed since the previous run:" >&5
- echo "$as_me: error: \`$ac_var' has changed since the previous run:" >&2;}
- 	{ echo "$as_me:$LINENO:   former value:  $ac_old_val" >&5
diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
deleted file mode 100644
index b45de9a..0000000
--- a/toolchain/gdb/Config.in
+++ /dev/null
@@ -1,69 +0,0 @@
-comment "Gdb Options"
-
-config BR2_PACKAGE_GDB
-	bool "Build gdb debugger for the Target"
-	select BR2_PACKAGE_NCURSES
-	depends on BR2_USE_WCHAR
-	help
-	    Build the full gdb debugger to run on the target.
-
-comment "Gdb debugger for the target needs WCHAR support in toolchain"
-	depends on !BR2_USE_WCHAR
-
-config BR2_PACKAGE_GDB_SERVER
-	bool "Build gdb server for the Target"
-	help
-	    Build the gdbserver stub to run on the target.
-	    A full gdb is needed to debug the progam.
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
-	default BR2_GDB_VERSION_6_8 if !BR2_avr32
-	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
-	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_GDB_SERVER || BR2_PACKAGE_GDB_HOST
-	help
-	  Select the version of gdb you wish to use.
-
-	config BR2_GDB_VERSION_6_6
-		bool "gdb 6.6"
-		depends on !BR2_avr32
-		depends on BR2_DEPRECATED
-
-	config BR2_GDB_VERSION_6_7_1
-		depends on !BR2_avr32
-		bool "gdb 6.7.1"
-
-	config BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
-		depends on BR2_avr32
-		bool "gdb 6.7.1-avr32-2.1.5"
-
-	config BR2_GDB_VERSION_6_8
-		bool "gdb 6.8"
-		depends on !BR2_avr32
-
-	config BR2_GDB_VERSION_7_0_1
-		bool "gdb 7.0.1"
-		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
-
-	config BR2_GDB_VERSION_7_1
-		bool "gdb 7.1"
-		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
-
-endchoice
-
-config BR2_GDB_VERSION
-	string
-	default "6.6"      if BR2_GDB_VERSION_6_6
-	default "6.7.1"    if BR2_GDB_VERSION_6_7_1
-	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
-	default "6.8"      if BR2_GDB_VERSION_6_8
-	default "7.0.1"    if BR2_GDB_VERSION_7_0_1
-	default "7.1"      if BR2_GDB_VERSION_7_1
diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
deleted file mode 100644
index af08d1e..0000000
--- a/toolchain/gdb/gdb.mk
+++ /dev/null
@@ -1,237 +0,0 @@
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
-ifneq ($(filter xtensa%,$(ARCH)),)
-include target/xtensa/patch.in
-GDB_PATCH_EXTRA:=$(call XTENSA_PATCH,gdb,$(GDB_PATCH_DIR),. ..)
-endif
-
-GDB_DIR:=$(TOOLCHAIN_DIR)/gdb-$(GDB_VERSION)
-
-$(DL_DIR)/$(GDB_SOURCE):
-	$(call DOWNLOAD,$(GDB_SITE),$(GDB_SOURCE))
-
-gdb-unpacked: $(GDB_DIR)/.unpacked
-$(GDB_DIR)/.unpacked: $(DL_DIR)/$(GDB_SOURCE)
-	mkdir -p $(TOOLCHAIN_DIR)
-	$(GDB_CAT) $(DL_DIR)/$(GDB_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
-ifeq ($(GDB_VERSION),snapshot)
-	GDB_REAL_DIR=$(shell \
-		tar jtf $(DL_DIR)/$(GDB_SOURCE) | head -1 | cut -d"/" -f1)
-	ln -sf $(TOOLCHAIN_DIR)/$(shell tar jtf $(DL_DIR)/$(GDB_SOURCE) | head -1 | cut -d"/" -f1) $(GDB_DIR)
-endif
-ifneq ($(wildcard $(GDB_PATCH_DIR)),)
-	toolchain/patch-kernel.sh $(GDB_DIR) $(GDB_PATCH_DIR) \*.patch $(GDB_PATCH_EXTRA)
-endif
-	$(CONFIG_UPDATE) $(@D)
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
-		--host=$(REAL_GNU_TARGET_NAME) \
-		--target=$(REAL_GNU_TARGET_NAME) \
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
-		--host=$(REAL_GNU_TARGET_NAME) \
-		--target=$(REAL_GNU_TARGET_NAME) \
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
-	$(MAKE) CC="$(TARGET_CC)" MT_CFLAGS="$(TARGET_CFLAGS)" \
-		-C $(GDB_SERVER_DIR)
-
-$(TARGET_DIR)/usr/bin/gdbserver: $(GDB_SERVER_DIR)/gdbserver
-ifeq ($(BR2_CROSS_TOOLCHAIN_TARGET_UTILS),y)
-	mkdir -p $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/target_utils
-	install -c $(GDB_SERVER_DIR)/gdbserver \
-		$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/target_utils/gdbserver
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
-		$(GDB_DIR)/configure $(QUIET) \
-		--cache-file=/dev/null \
-		--prefix=$(STAGING_DIR) \
-		--build=$(GNU_HOST_NAME) \
-		--host=$(GNU_HOST_NAME) \
-		--target=$(REAL_GNU_TARGET_NAME) \
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
-	$(MAKE) -C $(GDB_HOST_DIR)
-	strip $(GDB_HOST_DIR)/gdb/gdb
-
-$(TARGET_CROSS)gdb: $(GDB_HOST_DIR)/gdb/gdb
-	install -c $(GDB_HOST_DIR)/gdb/gdb $(TARGET_CROSS)gdb
-	ln -snf ../../bin/$(REAL_GNU_TARGET_NAME)-gdb \
-		$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/gdb
-	ln -snf $(REAL_GNU_TARGET_NAME)-gdb \
-		$(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-gdb
-
-gdbhost: $(TARGET_CROSS)gdb
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
index c611562..764a1da 100644
--- a/toolchain/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot.mk
@@ -3,7 +3,6 @@
 include toolchain/dependencies/dependencies.mk
 include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
-include toolchain/gdb/gdb.mk
 include toolchain/kernel-headers/kernel-headers.mk
 include toolchain/mklibs/mklibs.mk
 include toolchain/uClibc/uclibc.mk
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 3894890..485ab7c 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -5,4 +5,5 @@ source "toolchain/kernel-headers/Config.in"
 source "toolchain/uClibc/Config.in"
 source "package/binutils/Config.in.host"
 source "toolchain/gcc/Config.in"
+source "package/gdb/Config.in.host"
 endif
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index bdc6e76..1276305 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -1,10 +1,5 @@
 # Generic toolchain options
 
-# we want gdb config in the middle of both source and external
-# toolchains, but mconf won't let us source the same file twice,
-# so put it here instead
-source "toolchain/gdb/Config.in"
-
 config BR2_LARGEFILE
 	bool
 
diff --git a/toolchain/toolchain-crosstool-ng.mk b/toolchain/toolchain-crosstool-ng.mk
index e480da9..5b0cc4e 100644
--- a/toolchain/toolchain-crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng.mk
@@ -5,7 +5,6 @@ include toolchain/helpers.mk
 include toolchain/dependencies/dependencies.mk
 include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
-include toolchain/gdb/gdb.mk
 include toolchain/toolchain-crosstool-ng/crosstool-ng.mk
 include toolchain/mklibs/mklibs.mk
 include toolchain/uClibc/uclibc.mk
diff --git a/toolchain/toolchain-external.mk b/toolchain/toolchain-external.mk
index d67405b..4ade92a 100644
--- a/toolchain/toolchain-external.mk
+++ b/toolchain/toolchain-external.mk
@@ -4,7 +4,6 @@ include toolchain/helpers.mk
 include toolchain/dependencies/dependencies.mk
 include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
-include toolchain/gdb/gdb.mk
 include toolchain/kernel-headers/kernel-headers.mk
 include toolchain/mklibs/mklibs.mk
 include toolchain/toolchain-external/ext-tool.mk
-- 
1.7.2.2

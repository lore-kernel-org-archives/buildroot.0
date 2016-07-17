From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Sun, 17 Jul 2016 12:05:57 -0300
Subject: [Buildroot] [PATCH 1/2] build: add support for as-needed linking
Message-ID: <1468767958-19572-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

This option tells the linker to only link to the libraries containing
symbols that are actually used.

It requires libtool patches to fully clean the needed chain, these are
used by major distributions such as Debian and Gentoo.
https://wiki.debian.org/ToolChain/DSOLinking
https://wiki.gentoo.org/wiki/Project:Quality_Assurance/As-needed

Introduce a BR2_AS_NEEDED global enable option (default=no, marked as
experimental) that generally disables the libtool patching and avoids
the extra LDFLAGS (-Wl,--as-needed).

Also add a per-package PACKAGE_AS_NEEDED (default=yes) option to work
around problematic packages that might not behave too well with
as-needed linking.

For the libtool patching use a guess (automatic) method since
version-matching doesn't work accurately with some packages that ship
patched/modified ltmain.sh scripts, normally based on 2.4. In some of
these cases the as-needed-v2.2.6.patch works, and in other cases the
as-needed-v2.4.2.patch is necessary and the exact condition can't be
found in a deterministic way. If for some reason none of the patches
applies to a particular package this will only affect said package and
shouldn't have any consequence even if passing -Wl,--as-needed LDFLAGS.

Example for a simple defconfig:
BR2_arm=y
BR2_AS_NEEDED=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_GSTREAMER1=y
BR2_PACKAGE_GST1_PLUGINS_BAD=y

With as-needed disabled:
$ readelf -a libgstbadvideo-1.0.so|grep "(NEEDED)"|wc -l
10

With as-needed enabled:
$ readelf -a libgstbadvideo-1.0.so|grep "(NEEDED)"|wc -l
8

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 Config.in                               |  6 +++++
 package/Makefile.in                     |  5 ++++
 package/pkg-autotools.mk                | 43 ++++++++++++++++++++++++++++++
 support/libtool/as-needed-v1.5.26.patch | 46 +++++++++++++++++++++++++++++++++
 support/libtool/as-needed-v1.5.patch    | 38 +++++++++++++++++++++++++++
 support/libtool/as-needed-v2.2.6.patch  | 46 +++++++++++++++++++++++++++++++++
 support/libtool/as-needed-v2.4.2.patch  | 46 +++++++++++++++++++++++++++++++++
 support/libtool/as-needed-v2.4.3.patch  | 46 +++++++++++++++++++++++++++++++++
 8 files changed, 276 insertions(+)
 create mode 100644 support/libtool/as-needed-v1.5.26.patch
 create mode 100644 support/libtool/as-needed-v1.5.patch
 create mode 100644 support/libtool/as-needed-v2.2.6.patch
 create mode 100644 support/libtool/as-needed-v2.4.2.patch
 create mode 100644 support/libtool/as-needed-v2.4.3.patch

diff --git a/Config.in b/Config.in
index 7bb2a01..e8b0477 100644
--- a/Config.in
+++ b/Config.in
@@ -739,6 +739,12 @@ config BR2_REPRODUCIBLE
 	  This is labeled as an experimental feature, as not all
 	  packages behave properly to ensure reproducibility.
 
+config BR2_AS_NEEDED
+	bool "Link target binaries/libraries as-needed (experimental)"
+	help
+	  Tell the linker to link in the produced binary/library only
+	   the libraries containing symbols that are actually used.
+
 endmenu
 
 source "toolchain/Config.in"
diff --git a/package/Makefile.in b/package/Makefile.in
index afd5d3a..b190363 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -144,6 +144,11 @@ TARGET_CXXFLAGS = $(TARGET_CFLAGS)
 TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
+# $(PKG)_AS_NEEDED gets expanded too early for ifeq usage, so use subst instead
+ifeq ($(BR2_AS_NEEDED),y)
+TARGET_LDFLAGS += -Wl,$(subst NO,--no,$(subst YES,-,$($(PKG)_AS_NEEDED)))-as-needed
+endif
+
 ifeq ($(BR2_BINFMT_FLAT),y)
 TARGET_CFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
 	-Wl$(comma)-elf2flt)
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 75e2df0..de00628 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -55,6 +55,26 @@ define UPDATE_CONFIG_HOOK
 endef
 
 #
+# Hook to patch libtool to make it work properly for as-needed linking
+#
+define LIBTOOL_AS_NEEDED_PATCH_HOOK
+	@$(call MESSAGE,"Patching libtool as-needed")
+	$(Q)for i in `find $($(PKG)_SRCDIR) -name ltmain.sh`; do \
+		if patch -p1 --dry-run -f -s -d $${i%/*} <support/libtool/as-needed-v2.4.3.patch >/dev/null ; then\
+			$(APPLY_PATCHES) $${i%/*} support/libtool as-needed-v2.4.3.patch; \
+		elif patch -p1 --dry-run -f -s -d $${i%/*} <support/libtool/as-needed-v2.4.2.patch >/dev/null ; then\
+			$(APPLY_PATCHES) $${i%/*} support/libtool as-needed-v2.4.2.patch; \
+		elif patch -p1 --dry-run -f -s -d $${i%/*} <support/libtool/as-needed-v2.2.6.patch >/dev/null ; then\
+			$(APPLY_PATCHES) $${i%/*} support/libtool as-needed-v2.2.6.patch; \
+		elif patch -p1 --dry-run -f -s -d $${i%/*} <support/libtool/as-needed-v1.5.26.patch >/dev/null ; then\
+			$(APPLY_PATCHES) $${i%/*} support/libtool as-needed-v1.5.26.patch; \
+		elif patch -p1 --dry-run -f -s -d $${i%/*} <support/libtool/as-needed-v1.5.patch >/dev/null ; then\
+			$(APPLY_PATCHES) $${i%/*} support/libtool as-needed-v1.5.patch; \
+		fi \
+	done
+endef
+
+#
 # Hook to patch libtool to make it work properly for cross-compilation
 #
 define LIBTOOL_PATCH_HOOK
@@ -111,6 +131,17 @@ endef
 
 define inner-autotools-package
 
+#
+# as-needed is only patched/enabled for target packages
+#
+ifndef $(2)_AS_NEEDED
+ ifeq ($(4),target)
+  $(2)_AS_NEEDED ?= YES
+ else
+  $(2)_AS_NEEDED ?= NO
+ endif
+endif
+
 ifndef $(2)_LIBTOOL_PATCH
  ifdef $(3)_LIBTOOL_PATCH
   $(2)_LIBTOOL_PATCH = $$($(3)_LIBTOOL_PATCH)
@@ -244,6 +275,12 @@ $(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
 ifneq ($$($(2)_LIBTOOL_PATCH),NO)
 $(2)_PRE_CONFIGURE_HOOKS += LIBTOOL_PATCH_HOOK
 endif
+# Don't patch packages that skip as-needed
+ifeq ($(BR2_AS_NEEDED),y)
+ifneq ($$($(2)_AS_NEEDED),NO)
+$(2)_PRE_CONFIGURE_HOOKS += LIBTOOL_AS_NEEDED_PATCH_HOOK
+endif
+endif
 $(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
 
 else # ! AUTORECONF = YES
@@ -252,6 +289,12 @@ else # ! AUTORECONF = YES
 ifneq ($$($(2)_LIBTOOL_PATCH),NO)
 $(2)_POST_PATCH_HOOKS += LIBTOOL_PATCH_HOOK
 endif
+# Don't patch packages that skip as-needed
+ifeq ($(BR2_AS_NEEDED),y)
+ifneq ($$($(2)_AS_NEEDED),NO)
+$(2)_PRE_CONFIGURE_HOOKS += LIBTOOL_AS_NEEDED_PATCH_HOOK
+endif
+endif
 
 endif
 
diff --git a/support/libtool/as-needed-v1.5.26.patch b/support/libtool/as-needed-v1.5.26.patch
new file mode 100644
index 0000000..6a347ca
--- /dev/null
+++ b/support/libtool/as-needed-v1.5.26.patch
@@ -0,0 +1,46 @@
+Conveniently fetched from Gentoo, these are basically the same as used
+by Debian.
+https://gitweb.gentoo.org/repo/gentoo.git/tree/eclass/ELT-patches/as-needed
+
+Upstream status: unknown
+
+Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
+
+--- a/ltmain.sh.orig	2009-04-18 16:51:52.000000000 +0200
++++ b/ltmain.sh	2009-04-18 16:55:05.000000000 +0200
+@@ -1812,10 +1812,15 @@
+ 	done
+ 	IFS="$save_ifs"
+ 	arg=`$echo "X$arg" | $Xsed -e "s/^ //"`
+ 	;;
+ 
++      -Wl,--as-needed|-Wl,--no-as-needed)
++	deplibs="$deplibs $arg"
++	continue
++	;;
++
+       -Wl,*)
+ 	args=`$echo "X$arg" | $Xsed -e "$sed_quote_subst" -e 's/^-Wl,//'`
+ 	arg=
+ 	save_ifs="$IFS"; IFS=','
+ 	for flag in $args; do
+@@ -2152,10 +2157,19 @@
+       fi
+       for deplib in $libs; do
+ 	lib=
+ 	found=no
+ 	case $deplib in
++	-Wl,--as-needed|-Wl,--no-as-needed)
++	  if test "$linkmode,$pass" = "prog,link"; then
++	    compile_deplibs="$deplib $compile_deplibs"
++	    finalize_deplibs="$deplib $finalize_deplibs"
++	  else
++	    deplibs="$deplib $deplibs"
++	  fi
++	  continue
++	  ;;
+ 	-mt|-mthreads|-kthread|-Kthread|-pthread|-pthreads|--thread-safe|-threads)
+ 	  if test "$linkmode,$pass" = "prog,link"; then
+ 	    compile_deplibs="$deplib $compile_deplibs"
+ 	    finalize_deplibs="$deplib $finalize_deplibs"
+ 	  else
diff --git a/support/libtool/as-needed-v1.5.patch b/support/libtool/as-needed-v1.5.patch
new file mode 100644
index 0000000..15e255c
--- /dev/null
+++ b/support/libtool/as-needed-v1.5.patch
@@ -0,0 +1,38 @@
+Conveniently fetched from Gentoo, these are basically the same as used
+by Debian.
+https://gitweb.gentoo.org/repo/gentoo.git/tree/eclass/ELT-patches/as-needed
+
+Upstream status: unknown
+
+Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
+
+--- a/ltmain.sh.orig	2006-03-29 15:45:36.000000000 +0200
++++ b/ltmain.sh	2006-03-29 16:39:30.000000000 +0200
+@@ -1754,6 +1754,11 @@
+ 	arg=`$echo "X$arg" | $Xsed -e "s/^ //"`
+ 	;;
+ 
++      -Wl,--as-needed|-Wl,--no-as-needed)
++	deplibs="$deplibs $arg"
++	continue
++	;;
++      
+       -Wl,*)
+ 	args=`$echo "X$arg" | $Xsed -e "$sed_quote_subst" -e 's/^-Wl,//'`
+ 	arg=
+@@ -2094,6 +2099,15 @@
+ 	lib=
+ 	found=no
+ 	case $deplib in
++	-Wl,--as-needed|-Wl,--no-as-needed)
++	  if test "$linkmode,$pass" = "prog,link"; then
++	    compile_deplibs="$deplib $compile_deplibs"
++	    finalize_deplibs="$deplib $finalize_deplibs"
++	  else
++	    deplibs="$deplib $deplibs"
++	  fi
++	  continue
++	  ;;
+ 	-mt|-mthreads|-kthread|-Kthread|-pthread|-pthreads|--thread-safe)
+ 	  if test "$linkmode,$pass" = "prog,link"; then
+ 	    compile_deplibs="$deplib $compile_deplibs"
diff --git a/support/libtool/as-needed-v2.2.6.patch b/support/libtool/as-needed-v2.2.6.patch
new file mode 100644
index 0000000..f27c100
--- /dev/null
+++ b/support/libtool/as-needed-v2.2.6.patch
@@ -0,0 +1,46 @@
+Conveniently fetched from Gentoo, these are basically the same as used
+by Debian.
+https://gitweb.gentoo.org/repo/gentoo.git/tree/eclass/ELT-patches/as-needed
+
+Upstream status: unknown
+
+Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
+
+--- a/ltmain.sh.orig	2009-04-18 14:37:16.000000000 +0200
++++ b/ltmain.sh	2009-04-18 14:40:08.000000000 +0200
+@@ -4721,10 +4721,15 @@
+ 	IFS="$save_ifs"
+ 	func_stripname ' ' '' "$arg"
+ 	arg=$func_stripname_result
+ 	;;
+ 
++      -Wl,--as-needed|-Wl,--no-as-needed)
++	deplibs="$deplibs $arg"
++	continue
++	;;
++
+       -Wl,*)
+ 	func_stripname '-Wl,' '' "$arg"
+ 	args=$func_stripname_result
+ 	arg=
+ 	save_ifs="$IFS"; IFS=','
+@@ -5075,10 +5080,19 @@
+ 
+       for deplib in $libs; do
+ 	lib=
+ 	found=no
+ 	case $deplib in
++	-Wl,--as-needed|-Wl,--no-as-needed)
++	  if test "$linkmode,$pass" = "prog,link"; then
++	    compile_deplibs="$deplib $compile_deplibs"
++	    finalize_deplibs="$deplib $finalize_deplibs"
++	  else
++	    deplibs="$deplib $deplibs"
++	  fi
++	  continue
++	  ;;
+ 	-mt|-mthreads|-kthread|-Kthread|-pthread|-pthreads|--thread-safe|-threads)
+ 	  if test "$linkmode,$pass" = "prog,link"; then
+ 	    compile_deplibs="$deplib $compile_deplibs"
+ 	    finalize_deplibs="$deplib $finalize_deplibs"
+ 	  else
diff --git a/support/libtool/as-needed-v2.4.2.patch b/support/libtool/as-needed-v2.4.2.patch
new file mode 100644
index 0000000..0ef0d99
--- /dev/null
+++ b/support/libtool/as-needed-v2.4.2.patch
@@ -0,0 +1,46 @@
+Conveniently fetched from Gentoo, these are basically the same as used
+by Debian.
+https://gitweb.gentoo.org/repo/gentoo.git/tree/eclass/ELT-patches/as-needed
+
+Upstream status: unknown
+
+Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
+
+--- a/ltmain.sh.orig	2012-08-19 10:18:57.929178597 +0200
++++ b/ltmain.sh	2012-08-19 10:31:43.409388998 +0200
+@@ -5798,10 +5798,15 @@
+ 	IFS="$save_ifs"
+ 	func_stripname ' ' '' "$arg"
+ 	arg=$func_stripname_result
+ 	;;
+ 
++      -Wl,--as-needed|-Wl,--no-as-needed)
++	deplibs="$deplibs $arg"
++	continue
++	;;
++
+       -Wl,*)
+ 	func_stripname '-Wl,' '' "$arg"
+ 	args=$func_stripname_result
+ 	arg=
+ 	save_ifs="$IFS"; IFS=','
+@@ -6158,10 +6163,19 @@
+ 
+       for deplib in $libs; do
+ 	lib=
+ 	found=no
+ 	case $deplib in
++	-Wl,--as-needed|-Wl,--no-as-needed)
++	  if test "$linkmode,$pass" = "prog,link"; then
++	    compile_deplibs="$deplib $compile_deplibs"
++	    finalize_deplibs="$deplib $finalize_deplibs"
++	  else
++	    deplibs="$deplib $deplibs"
++	  fi
++	  continue
++	  ;;
+ 	-mt|-mthreads|-kthread|-Kthread|-pthread|-pthreads|--thread-safe \
+         |-threads|-fopenmp|-openmp|-mp|-xopenmp|-omp|-qsmp=*)
+ 	  if test "$linkmode,$pass" = "prog,link"; then
+ 	    compile_deplibs="$deplib $compile_deplibs"
+ 	    finalize_deplibs="$deplib $finalize_deplibs"
diff --git a/support/libtool/as-needed-v2.4.3.patch b/support/libtool/as-needed-v2.4.3.patch
new file mode 100644
index 0000000..25e6dfc
--- /dev/null
+++ b/support/libtool/as-needed-v2.4.3.patch
@@ -0,0 +1,46 @@
+Conveniently fetched from Gentoo, these are basically the same as used
+by Debian.
+https://gitweb.gentoo.org/repo/gentoo.git/tree/eclass/ELT-patches/as-needed
+
+Upstream status: unknown
+
+Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
+
+--- a/ltmain.sh
++++ b/ltmain.sh
+@@ -7225,10 +7225,15 @@
+ 	IFS=$save_ifs
+ 	func_stripname ' ' '' "$arg"
+ 	arg=$func_stripname_result
+ 	;;
+ 
++      -Wl,--as-needed|-Wl,--no-as-needed)
++	deplibs="$deplibs $arg"
++	continue
++	;;
++
+       -Wl,*)
+ 	func_stripname '-Wl,' '' "$arg"
+ 	args=$func_stripname_result
+ 	arg=
+ 	save_ifs=$IFS; IFS=,
+@@ -7609,10 +7614,19 @@
+ 
+       for deplib in $libs; do
+ 	lib=
+ 	found=false
+ 	case $deplib in
++	-Wl,--as-needed|-Wl,--no-as-needed)
++	  if test "$linkmode,$pass" = "prog,link"; then
++	    compile_deplibs="$deplib $compile_deplibs"
++	    finalize_deplibs="$deplib $finalize_deplibs"
++	  else
++	    deplibs="$deplib $deplibs"
++	  fi
++	  continue
++	  ;;
+ 	-mt|-mthreads|-kthread|-Kthread|-pthread|-pthreads|--thread-safe \
+         |-threads|-fopenmp|-openmp|-mp|-xopenmp|-omp|-qsmp=*)
+ 	  if test prog,link = "$linkmode,$pass"; then
+ 	    compile_deplibs="$deplib $compile_deplibs"
+ 	    finalize_deplibs="$deplib $finalize_deplibs"
-- 
2.7.3

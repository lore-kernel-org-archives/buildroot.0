From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sat, 18 Sep 2010 19:59:43 +0200
Subject: [Buildroot] [PATCH 1/7] libtool: bump to 2.2.6b + introduce 2
	libtool packages + cross compile patch
In-Reply-To: <1284832789-22631-1-git-send-email-llandwerlin@gmail.com>
References: <1284832789-22631-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1284832789-22631-2-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

This patch deserve a little explanation...

Amongst packages which use autotools, some of them are using a tool
called libtool, to build themself. Libtool is particulary usefull when
you've to build libraries. It avoids us to deal with all kind of
tricks we would have to do by ourself. For example, it helps us to
build a full gnome stack within /opt/gnome which (except basic
libraries like glibc) does not depends on gnome's libraries already
installed /usr/lib. Each package using libtool embeds a libtool script
which is generated from the ltmain.sh script shipped within the
libtool sources. This script is generated when you run
autogen.sh/autoreconf from the root of your package's tree.

Here is our problem, because libtool does not handle very well cross
compilation. And until now, the buildroot's approach has been to try
to compile each package, and when we see a link problem with libtool
(usually libtool tries to link a package with the host's libraries),
we set the <PACKAGE_NAME>_LIBTOOL_PATCH variable to yes to patch the
libtool generated script.

The purpose of this patch is to handle this libtool problem in a
different way. Instead of patching each package's libtool script, we
provide a libtool patch which alterates the original ltmain.sh script,
and we activate autoreconfiguration by default for target packages.

The result of this is that the <PACKAGE_NAME>_LIBTOOL_PATCH variable
becomes almost useless (we might still need it for a very few
packages). We also does not need to add '-L$(STAGING_DIR)/lib
-L$(STAGING_DIR)/usr/lib' to LDFLAGS.

There two downside to this patch :
      1. we need to build libtool twice, because of dependencies
      between automake/autoconf/libtool
      2. we need to make a pass on all autotooled packages to make
      sure there is no problem when we run autoreconf on them...

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 Makefile                                           |   14 +-
 package/Makefile.autotools.in                      |   22 +-
 package/Makefile.in                                |    3 +-
 package/autoconf/autoconf.mk                       |   11 +-
 package/automake/automake.mk                       |    1 +
 package/libtool-host/libtool-host.mk               |   43 +++
 .../libtool-2.2.6b_cross-environment-support.patch |  300 ++++++++++++++++++++
 package/libtool/libtool.mk                         |   27 ++-
 8 files changed, 397 insertions(+), 24 deletions(-)
 create mode 100644 package/libtool-host/libtool-host.mk
 create mode 100644 package/libtool/libtool-2.2.6b_cross-environment-support.patch

diff --git a/Makefile b/Makefile
index faa802b..cf9c280 100644
--- a/Makefile
+++ b/Makefile
@@ -253,7 +253,8 @@ GNU_TARGET_SUFFIX:=-$(call qstrip,$(BR2_GNU_TARGET_SUFFIX))
 STAGING_DIR:=$(call qstrip,$(BR2_STAGING_DIR))
 
 # packages compiled for the host goes here
-HOST_DIR:=$(BASE_DIR)/host
+HOST_DIR:=$(BASE_DIR)/host-target
+HOST_HOST_DIR:=$(BASE_DIR)/host-host
 
 # stamp (dependency) files go here
 STAMP_DIR:=$(BASE_DIR)/stamps
@@ -312,7 +313,7 @@ TARGETS_ALL:=$(patsubst %,__real_tgt_%,$(TARGETS))
 $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 
 dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR)
+	$(HOST_DIR) $(HOST_HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
 $(BASE_TARGETS): dirs
 
@@ -328,7 +329,7 @@ world: prepare dependencies dirs $(BASE_TARGETS) $(TARGETS_ALL)
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
 	$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR)
+	$(HOST_DIR) $(HOST_HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
 #############################################################
 #
@@ -336,7 +337,7 @@ world: prepare dependencies dirs $(BASE_TARGETS) $(TARGETS_ALL)
 # dependencies anywhere else
 #
 #############################################################
-$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR):
+$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(HOST_DIR) $(HOST_HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR):
 	@mkdir -p $@
 
 $(STAGING_DIR):
@@ -560,8 +561,9 @@ endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 #
 #############################################################
 clean:
-	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
-		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR)
+	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR)		\
+		$(HOST_DIR) $(HOST_HOST_DIR) $(STAMP_DIR) $(BUILD_DIR)	\
+		$(TOOLCHAIN_DIR)
 
 distclean: clean
 ifeq ($(DL_DIR),$(TOPDIR)/dl)
diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index db44601..1eb7ca4 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -53,7 +53,7 @@ ifndef $(2)_LIBTOOL_PATCH
  ifdef $(3)_LIBTOOL_PATCH
   $(2)_LIBTOOL_PATCH = $($(3)_LIBTOOL_PATCH)
  else
-  $(2)_LIBTOOL_PATCH ?= YES
+  $(2)_LIBTOOL_PATCH ?= NO
  endif
 endif
 
@@ -64,13 +64,14 @@ $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPT			?=
 ifeq ($(5),host)
 $(2)_AUTORECONF			?= NO
-$(2)_AUTORECONF_OPT		?= -f -i -I "$$(ACLOCAL_HOST_DIR)"
+$(2)_AUTORECONF_OPT		?= -f -i -I "$$(ACLOCAL_HOST_HOST_DIR)" -I "$$(ACLOCAL_HOST_DIR)"
 $(2)_AUTORECONF_ENV		?= $$(HOST_CONFIGURE_OPTS) \
 				ACLOCAL="$$(ACLOCAL)" \
 				AUTOCONF="$$(AUTOCONF)" \
 				AUTOHEADER="$$(AUTOHEADER)" \
 				AUTOMAKE="$$(AUTOMAKE)" \
-				LIBTOOLIZE="$$(LIBTOOLIZE)"
+				LIBTOOL="$$(LIBTOOL_HOST)" \
+				LIBTOOLIZE="$$(LIBTOOLIZE_HOST)"
 else
 $(2)_AUTORECONF			?= YES
 $(2)_AUTORECONF_OPT		?= -f -i -I "$$(ACLOCAL_STAGING_DIR)"
@@ -80,7 +81,9 @@ $(2)_AUTORECONF_ENV		?= $$(TARGET_CONFIGURE_OPTS) \
 				AUTOCONF="$$(AUTOCONF)" \
 				AUTOHEADER="$$(AUTOHEADER)" \
 				AUTOMAKE="$$(AUTOMAKE)" \
-				LIBTOOLIZE="$$(LIBTOOLIZE)"
+				LIBTOOL="$$(LIBTOOL_TARGET)" \
+				LIBTOOLIZE="$$(LIBTOOLIZE_TARGET)" \
+				LIBTOOL_SYSROOT="$$(STAGING_DIR)"
 endif
 $(2)_USE_CONFIG_CACHE           ?= $(if $(BR2_CONFIG_CACHE),YES,NO)
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
@@ -179,7 +182,7 @@ endif
 #
 define AUTORECONF_HOOK
 	@$$(call MESSAGE,"Autoreconfiguring")
-	$(Q)cd $$($$(PKG)_SRCDIR) && $(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
+	$(Q)cd $$($$(PKG)_SRCDIR) && $$($$(PKG)_AUTORECONF_ENV) $(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
 	$(Q)if test "$($$(PKG)_LIBTOOL_PATCH)" = "YES"; then \
 		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
 		toolchain/patch-kernel.sh $${i%/*} package buildroot-libtool.patch; \
@@ -188,9 +191,14 @@ define AUTORECONF_HOOK
 endef
 
 ifeq ($$($(2)_AUTORECONF),YES)
+ifeq ($(5),host)
+$(2)_POST_PATCH_HOOKS += AUTORECONF_HOOK
+$(2)_DEPENDENCIES += host-automake host-autoconf host-libtool-host
+else
 $(2)_POST_PATCH_HOOKS += AUTORECONF_HOOK
 $(2)_DEPENDENCIES += host-automake host-autoconf host-libtool $(if $(BR2_NEEDS_GETTEXT,y),host-gettext)
 endif
+endif
 
 #
 # Build step. Only define it if not already defined by the package .mk
@@ -225,10 +233,6 @@ endif
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	$$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
-	for i in $$$$(find $(STAGING_DIR)/usr/lib* -name "*.la"); do \
-		cp -f $$$$i $$$$i~; \
-		$$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \
-	done
 endef
 endif
 
diff --git a/package/Makefile.in b/package/Makefile.in
index bb2aafa..46e9c50 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -81,7 +81,6 @@ ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
 endif
 
-TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 TARGET_SYSROOT_OPT=--sysroot=$(STAGING_DIR)
 
@@ -165,7 +164,7 @@ BISON:=$(shell which bison || type -p bison)
 HOST_CFLAGS   += -I$(HOST_DIR)/include -I$(HOST_DIR)/usr/include
 HOST_CXXFLAGS += -I$(HOST_DIR)/include -I$(HOST_DIR)/usr/include
 HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
-HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
+HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_HOST_DIR)/usr/bin:$(PATH)
 
 # hostcc version as an integer - E.G. 4.3.2 => 432
 HOSTCC_VERSION:=$(shell $(HOSTCC) --version | \
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 4b58986..4c69e91 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -9,13 +9,18 @@ AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 
 AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 		    ac_cv_prog_gnu_m4_gnu=no
-
 AUTOCONF_DEPENDENCIES = microperl host-m4
 
+#HOST_AUTOCONF_AUTORECONF = YES
+#HOST_AUTOCONF_AUTORECONF_ENV = $(HOST_CONFIGURE_OPTS) \
+				ACLOCAL="$(ACLOCAL)" \
+				AUTOCONF="$(AUTOCONF)" \
+				AUTOHEADER="$(AUTOHEADER)" \
+				AUTOMAKE="$(AUTOMAKE)" \
+				LIBTOOLIZE="/bin/true"
 HOST_AUTOCONF_CONF_ENV = ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 			ac_cv_prog_gnu_m4_gnu=no
-
-HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool
+HOST_AUTOCONF_DEPENDENCIES = host-m4
 
 $(eval $(call AUTOTARGETS,package,autoconf))
 $(eval $(call AUTOTARGETS,package,autoconf,host))
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 565bd42..9f42bed 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -24,4 +24,5 @@ $(eval $(call AUTOTARGETS,package,automake,host))
 AUTOMAKE = $(HOST_DIR)/usr/bin/automake
 ACLOCAL_STAGING_DIR = $(STAGING_DIR)/usr/share/aclocal
 ACLOCAL_HOST_DIR = $(HOST_DIR)/usr/share/aclocal
+ACLOCAL_HOST_HOST_DIR = $(HOST_HOST_DIR)/usr/share/aclocal
 ACLOCAL = $(HOST_DIR)/usr/bin/aclocal
diff --git a/package/libtool-host/libtool-host.mk b/package/libtool-host/libtool-host.mk
new file mode 100644
index 0000000..77c2b87
--- /dev/null
+++ b/package/libtool-host/libtool-host.mk
@@ -0,0 +1,43 @@
+#############################################################
+#
+# libtool-host (libtool dedicated to host packages)
+#
+#############################################################
+LIBTOOL_HOST_VERSION = 2.2.6b
+LIBTOOL_HOST_SOURCE = libtool-$(LIBTOOL_HOST_VERSION).tar.gz
+LIBTOOL_HOST_SITE = $(BR2_GNU_MIRROR)/libtool
+
+HOST_LIBTOOL_HOST_AUTORECONF = NO # NEVER !
+
+# We use our own configure to install libtool-host in $(HOST_HOST_DIR)
+define HOST_LIBTOOL_HOST_CONFIGURE_CMDS
+	(cd $(HOST_LIBTOOL_HOST_SRCDIR) && rm -rf config.cache; \
+	        $(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+                $(HOST_LIBTOOL_HOST_CONF_ENV) \
+		./configure \
+		$(if $(filter YES,$(HOST_LIBTOOL_HOST_USE_CONFIG_CACHE)),--cache-file="$(BUILD_DIR)/host-config.cache",) \
+		--prefix="$(HOST_HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_HOST_DIR)/etc" \
+		$(HOST_LIBTOOL_HOST_CONF_OPT) \
+	)
+endef
+HOST_LIBTOOL_HOST_INSTALL_OPT = DESTDIR=$(HOST_HOST_DIR) install
+
+# While running the configure script, the litool package uses aclocal
+# from the host system (because at this point we haven't build our
+# own). And because we can't know which version is installed on the
+# host system, we have to sed the generated libtool script which may
+# give compilation errors with some host libtool if version ~= 1.5.x.
+define HOST_LIBTOOL_HOST_POST_CONFIG_PATCH
+	$(SED) "s,lt_ptr,void *,g" $(@D)/libtool
+endef
+HOST_LIBTOOL_HOST_POST_CONFIGURE_HOOKS += HOST_LIBTOOL_HOST_POST_CONFIG_PATCH
+
+$(eval $(call AUTOTARGETS,package,libtool-host)) # Unused...
+$(eval $(call AUTOTARGETS,package,libtool-host,host))
+
+# variables used by other host packages
+LIBTOOL_HOST:=$(HOST_HOST_DIR)/usr/bin/libtool
+LIBTOOLIZE_HOST:=$(HOST_HOST_DIR)/usr/bin/libtoolize
diff --git a/package/libtool/libtool-2.2.6b_cross-environment-support.patch b/package/libtool/libtool-2.2.6b_cross-environment-support.patch
new file mode 100644
index 0000000..b0eb09c
--- /dev/null
+++ b/package/libtool/libtool-2.2.6b_cross-environment-support.patch
@@ -0,0 +1,300 @@
+From b0ef07b38c1a45c01e88cf04ffb0c2d49b59af2b Mon Sep 17 00:00:00 2001
+From: Lionel Landwerlin <lionel.landwerlin@pace.com>
+Date: Thu, 16 Sep 2010 17:34:09 +0200
+Subject: [PATCH] Add sysroot support to libtool
+
+This adds the sysroot option detection to ltmain.sh and also a
+LIBTOOL_SYSROOT environment variable which will be used by when
+running autoreconf to select directories to add to the default places
+to look for libraries at link time.
+
+Based on a patch made by Carl Shaw <carl.shaw@st.com>
+
+Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
+---
+ libltdl/config/ltmain.sh |  151 ++++++++++++++++++++++++++++++++++++++++++++--
+ libltdl/m4/libtool.m4    |    4 +-
+ 2 files changed, 148 insertions(+), 7 deletions(-)
+
+diff --git a/libltdl/config/ltmain.sh b/libltdl/config/ltmain.sh
+index a72f2fd..682faaa 100644
+--- a/libltdl/config/ltmain.sh
++++ b/libltdl/config/ltmain.sh
+@@ -110,6 +110,7 @@ done
+ 
+ $lt_unset CDPATH
+ 
++lt_sysroot=
+ 
+ 
+ 
+@@ -4774,6 +4775,13 @@ func_mode_link ()
+         continue
+         ;;
+ 
++      --sysroot*)
++	func_stripname '--sysroot=' '' "$arg"
++        func_quote_for_eval "$func_stripname_result"
++        lt_sysroot="$func_quote_for_eval_result"
++        compiler_flags="$compiler_flags $arg"
++        ;;
++
+       # Some other compiler flag.
+       -* | +*)
+         func_quote_for_eval "$arg"
+@@ -4929,8 +4937,23 @@ func_mode_link ()
+     else
+       shlib_search_path=
+     fi
++    # The value of sys_lib_search_path_spec is generated by the cross
++    # compiler, and so will already point into the target filesystem.
+     eval sys_lib_search_path=\"$sys_lib_search_path_spec\"
++    # However the value of sys_lib_dlsearch_path_spec will be relative
++    # to the root of the target filesystem, so we need to add the prefix.
+     eval sys_lib_dlsearch_path=\"$sys_lib_dlsearch_path_spec\"
++    if [ X"$sys_lib_dlsearch_path" != X ] ; then
++      tempdlsp=
++      for item in $sys_lib_dlsearch_path ; do
++        if [ X"$tempdlsp" = X ] ; then
++          tempdlsp=${lt_sysroot}$item
++        else
++          tempdlsp="$tempdlsp ${lt_sysroot}$item"
++        fi
++      done
++      sys_lib_dlsearch_path="$tempdlsp"
++    fi
+ 
+     func_dirname "$output" "/" ""
+     output_objdir="$func_dirname_result$objdir"
+@@ -5289,7 +5312,21 @@ func_mode_link ()
+ 
+ 	if test "$found" = yes || test -f "$lib"; then :
+ 	else
+-	  func_fatal_error "cannot find the library \`$lib' or unhandled argument \`$deplib'"
++          # XXX CRS XXX
++          # We may have to fix up the library path here for cases where a build generates
++          # an internal .la file
++          if [ ! -z "$lt_sysroot" ]; then
++            tstlib=$lib
++            lib=`$ECHO $tstlib | sed -e 's,'${lt_sysroot}',,'`
++            if [ -f $lib ]; then
++              $ECHO "$modename: WARNING converted $tstlib to $lib" 1>&2
++            fi
++          fi
++          # XXX CRS XXX
++          if [ ! -f $lib ]; then
++              $ECHO "$modename: cannot find the library \`$tstlib'" 1>&2
++               exit $EXIT_FAILURE
++          fi
+ 	fi
+ 
+ 	# Check to see that this really is a libtool archive.
+@@ -5327,6 +5364,50 @@ func_mode_link ()
+ 	  done
+ 	fi
+ 	dependency_libs=`$ECHO "X $dependency_libs" | $Xsed -e 's% \([^ $]*\).ltframework% -framework \1%g'`
++
++        # XXX CRS XXX
++        # Modify the libdir and dependency_lib variables to include the
++        # $lt_sysroot cross-compile setting
++
++        if [ ! -z "$libdir" ]; then
++                libdir=${lt_sysroot}${libdir}
++        fi
++
++        if [ ! -z "$dependency_libs" ]; then
++          tempdl=
++          for item in $dependency_libs; do
++                case $item in
++                        -L*) if [ ! -z $lt_sysroot ]; then
++                                if [ -z `$ECHO $item | grep $lt_sysroot` ]; then
++                                        item=`$ECHO $item | ${SED} -e 's,-L,-L'$lt_sysroot',g'`
++                                fi
++                             fi
++                             tempdl="$tempdl $item" ;;
++                        -l*) tempdl="$tempdl $item" ;;
++                        *) currentdir="${PWD}/${ladir}"
++                           checkfile=`$ECHO ${item} | sed -e 's,.*\/,,'`
++                           if [ ! -f "${currentdir}/${checkfile}" ]; then
++                                   if [ -f ${lt_sysroot}${item} ] ; then
++                                          item=${lt_sysroot}${item}
++                                   fi
++                           fi
++                           # Make sure any .la file in dependency_libs points to the correct one!
++                           # We have to be careful here - some packages generate an internal .la
++                           # file during their build and have dependency_libs having an absolute
++                           # path to within the build area
++                           if [ ! -z `$ECHO $item | grep \.la` ]; then
++                                if [ ! -z $lt_sysroot ]; then
++                                        if [ -z `$ECHO $item | grep ${lt_sysroot}` ]; then
++                                                item=${lt_sysroot}${item}
++                                        fi
++                                fi
++                           fi
++                           tempdl="$tempdl ${item}" ;;
++                esac
++          done
++          dependency_libs="$tempdl"
++        fi
++
+ 	if test "$linkmode,$pass" = "lib,link" ||
+ 	   test "$linkmode,$pass" = "prog,scan" ||
+ 	   { test "$linkmode" != prog && test "$linkmode" != lib; }; then
+@@ -5790,6 +5871,13 @@ func_mode_link ()
+ 	      if test -n "$inst_prefix_dir"; then
+ 		case $libdir in
+ 		  [\\/]*)
++                    # XXX CRS XXX make sure that our prefix base isn't replicated
++                    if [ ! -z $lt_sysroot ]; then
++                        if [ ! -z `$ECHO $libdir | grep $lt_sysroot` ]; then
++                                libdir=`echo $libdir | ${SED} -e 's,'$lt_sysroot',,'`
++                        fi
++                    fi
++                    # XXX CRS XXX
+ 		    add_dir="$add_dir -L$inst_prefix_dir$libdir"
+ 		    ;;
+ 		esac
+@@ -5909,6 +5997,17 @@ func_mode_link ()
+ 		  fi
+ 		  ;;
+ 		esac
++                # XXX CRS XXX
++                # For locally generated .la files, we may have added our base base when it is not
++                # required.  We can do a check here to find the correct .la file...
++                if [ ! -f $deplib ]; then
++                        if [ ! -z "${lt_sysroot}" ]; then
++                                olddeplib=$deplib
++                                deplib=`$ECHO $olddeplib | sed -e 's,'${lt_sysroot}',,'`
++                                $ECHO "$modename: WARNING changed $olddeplib to $deplib" 1>&2
++                        fi
++                fi
++                # XXX CRS XXX
+ 		if $GREP "^installed=no" $deplib > /dev/null; then
+ 		case $host in
+ 		*-*-darwin*)
+@@ -5939,6 +6038,7 @@ func_mode_link ()
+ 		  test -z "$libdir" && \
+ 		    func_fatal_error "\`$deplib' is not a valid libtool archive"
+ 		  test "$absdir" != "$libdir" && \
++		    test -z "$lt_sysroot" && \
+ 		    func_warning "\`$deplib' seems to be moved"
+ 
+ 		  path="-L$absdir"
+@@ -6102,7 +6202,12 @@ func_mode_link ()
+       lib*)
+ 	func_stripname 'lib' '.la' "$outputname"
+ 	name=$func_stripname_result
+-	eval shared_ext=\"$shrext_cmds\"
++        if test -n "$shrext_cmds"; then
++          eval shared_ext=\"$shrext_cmds\"
++        else
++          eval shared_ext=\"$shrext\"
++        fi
++        eval shared_ext=\"$shrext\"
+ 	eval libname=\"$libname_spec\"
+ 	;;
+       *)
+@@ -6113,7 +6218,11 @@ func_mode_link ()
+ 	  # Add the "lib" prefix for modules if required
+ 	  func_stripname '' '.la' "$outputname"
+ 	  name=$func_stripname_result
+-	  eval shared_ext=\"$shrext_cmds\"
++          if test -n "$shrext_cmds"; then
++            eval shared_ext=\"$shrext_cmds\"
++          else
++            eval shared_ext=\"$shrext\"
++          fi
+ 	  eval libname=\"$libname_spec\"
+ 	else
+ 	  func_stripname '' '.la' "$outputname"
+@@ -6939,7 +7048,11 @@ EOF
+ 	fi
+ 
+ 	# Get the real and link names of the library.
+-	eval shared_ext=\"$shrext_cmds\"
++        if test -n "$shrext_cmds"; then
++          eval shared_ext=\"$shrext_cmds\"
++        else
++          eval shared_ext=\"$shrext\"
++        fi
+ 	eval library_names=\"$library_names_spec\"
+ 	set dummy $library_names
+ 	shift
+@@ -7057,6 +7170,15 @@ EOF
+ 	done
+ 	deplibs="$tmp_deplibs"
+ 
++        # XXX CRS XXX
++        # Strip base directory off -Wl directory specifiers
++
++        if [ ! -z "$lt_sysroot" ]; then
++            deplibs=`$ECHO $deplibs | ${SED} -e 's%-Wl,'$lt_sysroot'%-Wl,%g'`
++        fi
++
++        # XXX CRS XXX
++
+ 	if test -n "$convenience"; then
+ 	  if test -n "$whole_archive_flag_spec" &&
+ 	    test "$compiler_needs_object" = yes &&
+@@ -7623,6 +7745,14 @@ EOF
+       fi
+       compile_rpath="$rpath"
+ 
++       # XXX CRS XXX
++       # alter rpaths if cross compiling
++       if [ ! -z "$lt_sysroot" ]; then
++         compile_rpath=`$ECHO "$compile_rpath" | ${SED} -e 's%'$lt_sysroot'%%g'`
++         finalize_rpath=`$ECHO "$finalize_rpath" | ${SED} -e 's%'$lt_sysroot'%%g'`
++       fi
++       # XXX CRS XXX
++
+       rpath=
+       hardcode_libdirs=
+       for libdir in $finalize_rpath; do
+@@ -8056,9 +8186,14 @@ EOF
+ 	      *.la)
+ 		func_basename "$deplib"
+ 		name="$func_basename_result"
+-		eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
++
++                # XXX CRS XXX We add our prefix UNLESS we have a local build .la creation
++                test -f "${lt_sysroot}/${deplib}" && \
++                        deplib=${lt_sysroot}${deplib}
++                eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' ${deplib}`
+ 		test -z "$libdir" && \
+ 		  func_fatal_error "\`$deplib' is not a valid libtool archive"
++
+ 		newdependency_libs="$newdependency_libs $libdir/$name"
+ 		;;
+ 	      *) newdependency_libs="$newdependency_libs $deplib" ;;
+@@ -8125,6 +8260,12 @@ EOF
+ 	  case $host,$output,$installed,$module,$dlname in
+ 	    *cygwin*,*lai,yes,no,*.dll | *mingw*,*lai,yes,no,*.dll | *cegcc*,*lai,yes,no,*.dll) tdlname=../bin/$dlname ;;
+ 	  esac
++          # XXX CRS XXX for cross-compilation environments, strip out the target root
++          # directory name from the dependency_libs
++          if [ ! -z "$lt_sysroot" ]; then
++            dependency_libs=`$ECHO $dependency_libs | ${SED} -e 's,'${lt_sysroot}',,g'`
++          fi
++          # XXX CRS XXX
+ 	  $ECHO > $output "\
+ # $outputname - a libtool library file
+ # Generated by $PROGRAM (GNU $PACKAGE$TIMESTAMP) $VERSION
+diff --git a/libltdl/m4/libtool.m4 b/libltdl/m4/libtool.m4
+index 39ba996..2aeddb6 100644
+--- a/libltdl/m4/libtool.m4
++++ b/libltdl/m4/libtool.m4
+@@ -2471,8 +2471,8 @@ linux* | k*bsd*-gnu)
+   hardcode_into_libs=yes
+ 
+   # Append ld.so.conf contents to the search path
+-  if test -f /etc/ld.so.conf; then
+-    lt_ld_extra=`awk '/^include / { system(sprintf("cd /etc; cat %s 2>/dev/null", \[$]2)); skip = 1; } { if (!skip) print \[$]0; skip = 0; }' < /etc/ld.so.conf | $SED -e 's/#.*//;/^[	 ]*hwcap[	 ]/d;s/[:,	]/ /g;s/=[^=]*$//;s/=[^= ]* / /g;/^$/d' | tr '\n' ' '`
++  if test -f ${LIBTOOL_SYSROOT}/etc/ld.so.conf; then
++    lt_ld_extra=`awk '/^include / { system(sprintf("cd /etc; cat %s 2>/dev/null", \[$]2)); skip = 1; } { if (!skip) print \[$]0; skip = 0; }' < ${LIBTOOL_SYSROOT}/etc/ld.so.conf | $SED -e 's/#.*//;/^[	 ]*hwcap[	 ]/d;s/[:,	]/ /g;s/=[^=]*$//;s/=[^= ]* / /g;/^$/d' | tr '\n' ' '`
+     sys_lib_dlsearch_path_spec="/lib /usr/lib $lt_ld_extra"
+   fi
+ 
+-- 
+1.6.0.6
+
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index a996876..3177c72 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -3,22 +3,41 @@
 # libtool
 #
 #############################################################
-LIBTOOL_VERSION = 1.5.24
+LIBTOOL_VERSION = 2.2.6b
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.gz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 
+HOST_LIBTOOL_AUTORECONF = YES
+HOST_LIBTOOL_AUTORECONF_ENV = $(HOST_CONFIGURE_OPTS) \
+				ACLOCAL="$(ACLOCAL)" \
+				AUTOCONF="$(AUTOCONF)" \
+				AUTOHEADER="$(AUTOHEADER)" \
+				AUTOMAKE="$(AUTOMAKE)" \
+				LIBTOOL="$(LIBTOOL_HOST)" \
+				LIBTOOLIZE="/bin/true"
+HOST_LIBTOOL_CONF_ENV = LIBTOOL="$(LIBTOOL_HOST)"
+
+# While running the configure script, the litool package uses aclocal
+# from the host system (because@this point we haven't build our
+# own). And because we can't know which version is installed on the
+# host system, we have to sed the generated libtool script which may
+# give compilation errors with some host libtool if version ~= 1.5.x.
+define HOST_LIBTOOL_POST_CONFIG_PATCH
+	$(SED) "s,lt_ptr,void *,g" $(@D)/libtool
+endef
+HOST_LIBTOOL_POST_CONFIGURE_HOOKS += HOST_LIBTOOL_POST_CONFIG_PATCH
+
 define HOST_LIBTOOL_CUSTOM_INSTALL
 	install -D -m 0644 $(HOST_DIR)/usr/share/aclocal/libtool.m4 \
 		$(STAGING_DIR)/usr/share/aclocal/libtool.m4
 	install -D -m 0644 $(HOST_DIR)/usr/share/aclocal/ltdl.m4 \
 		$(STAGING_DIR)/usr/share/aclocal/ltdl.m4
 endef
-
 HOST_LIBTOOL_POST_INSTALL_HOOKS += HOST_LIBTOOL_CUSTOM_INSTALL
 
 $(eval $(call AUTOTARGETS,package,libtool))
 $(eval $(call AUTOTARGETS,package,libtool,host))
 
 # variables used by other packages
-LIBTOOL:=$(HOST_DIR)/usr/bin/libtool
-LIBTOOLIZE:=$(HOST_DIR)/usr/bin/libtoolize
+LIBTOOL_TARGET:=$(HOST_DIR)/usr/bin/libtool
+LIBTOOLIZE_TARGET:=$(HOST_DIR)/usr/bin/libtoolize
-- 
1.7.1

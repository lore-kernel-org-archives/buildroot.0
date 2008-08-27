From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 00:29:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libdaemon
Message-ID: <20080827072917.6D584F8011@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 00:29:16 -0700 (Wed, 27 Aug 2008)
New Revision: 23234

Log:
libdaemon: convert to Makefile.autotools.in format

Removed:
   trunk/buildroot/package/libdaemon/libdir-la.patch
   trunk/buildroot/package/libdaemon/xcompile-setpgrp.patch

Modified:
   trunk/buildroot/package/libdaemon/libdaemon.mk


Changeset:
Modified: trunk/buildroot/package/libdaemon/libdaemon.mk
===================================================================
--- trunk/buildroot/package/libdaemon/libdaemon.mk	2008-08-27 07:29:13 UTC (rev 23233)
+++ trunk/buildroot/package/libdaemon/libdaemon.mk	2008-08-27 07:29:16 UTC (rev 23234)
@@ -3,98 +3,17 @@
 # libdaemon (UNIX daemon library)
 #
 #############################################################
-# Copyright 2003-2005 Lennart Poettering <mzqnrzba@0pointer.de>
-#
-# This library is free software; you can redistribute it
-# and/or modify it under the terms of the GNU Lesser General
-# Public License as published by the Free Software Foundation
-# either version 2.1 of the License, or (at your option) any
-# later version.
 
 LIBDAEMON_VERSION:=0.13
-LIBDAEMON_NAME:=libdaemon-$(LIBDAEMON_VERSION)
-LIBDAEMON_DIR:=$(BUILD_DIR)/$(LIBDAEMON_NAME)
+LIBDAEMON_SOURCE:=libdaemon-$(LIBDAEMON_VERSION).tar.gz
 LIBDAEMON_SITE:=http://0pointer.de/lennart/projects/libdaemon/
-LIBDAEMON_SOURCE:=$(LIBDAEMON_NAME).tar.gz
-LIBDAEMON_DESTDIR:=$(STAGING_DIR)/usr/lib
-LIBDAEMON_CAT:=$(ZCAT)
+LIBDAEMON_AUTORECONF:=no
+LIBDAEMON_INSTALL_STAGING:=YES
+LIBDAEMON_INSTALL_TARGET:=YES
+LIBDAEMON_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
+LIBDAEMON_CONF_ENV:=ac_cv_func_setpgrp_void=no
+LIBDAEMON_CONF_OPT:=--disable-lynx $(DISABLE_NLS) $(DISABLE_LARGEFILE)
 
-$(DL_DIR)/$(LIBDAEMON_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(LIBDAEMON_SITE)/$(LIBDAEMON_SOURCE)
+LIBDAEMON_DEPENDENCIES:=uclibc pkgconfig
 
-libdaemon-source: $(DL_DIR)/$(LIBDAEMON_SOURCE)
-
-libdaemon-unpacked: $(LIBDAEMON_DIR)/.unpacked
-$(LIBDAEMON_DIR)/.unpacked: $(DL_DIR)/$(LIBDAEMON_SOURCE)
-	$(LIBDAEMON_CAT) $(DL_DIR)/$(LIBDAEMON_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBDAEMON_DIR) package/libdaemon/ \*.patch
-	touch $@
-
-libdaemon-configured: $(LIBDAEMON_DIR)/.configured
-$(LIBDAEMON_DIR)/.configured: $(LIBDAEMON_DIR)/.unpacked
-	(cd $(LIBDAEMON_DIR) && rm -rf config.cache && libtoolize --copy --force && autoreconf)
-	$(CONFIG_UPDATE) $(LIBDAEMON_DIR)
-	(cd $(LIBDAEMON_DIR) && \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/usr/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--includedir=/usr/include \
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-		--disable-lynx \
-		--disable-shared \
-	)
-	touch $@
-
-$(LIBDAEMON_DIR)/.compiled: $(LIBDAEMON_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) LIBTOOL=$(LIBDAEMON_DIR)/libtool -C $(LIBDAEMON_DIR)
-	touch $@
-
-$(LIBDAEMON_DESTDIR)/libdaemon.a: $(LIBDAEMON_DIR)/.compiled
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBDAEMON_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libdaemon.la
-	touch -c $@
-
-#$(TARGET_DIR)/usr/lib/libdaemon.a: $(LIBDAEMON_DESTDIR)/libdaemon.a
-# -$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libdaemon.a
-
-libdaemon: uclibc pkgconfig $(LIBDAEMON_DESTDIR)/libdaemon.a
-
-libdaemon-unpacked: $(LIBDAEMON_DIR)/.unpacked
-
-libdaemon-clean:
-	-$(MAKE) -C $(LIBDAEMON_DIR) clean
-
-libdaemon-patch-prep: libdaemon-dirclean libdaemon-unpacked
-	cp -af $(LIBDAEMON_DIR) $(LIBDAEMON_DIR)-0rig
-
-libdaemon-patch:
-	(cd $(BUILD_DIR); \
-	diff -urN $(LIBDAEMON_NAME)-0rig $(LIBDAEMON_NAME) > ../../$(LIBDAEMON_NAME)-$(DATE).patch || echo)
-
-libdaemon-dirclean:
-	rm -rf $(LIBDAEMON_DIR)
-	rm -rf $(LIBDAEMON_DIR)-0rig
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_LIBDAEMON)),y)
-TARGETS+=libdaemon
-endif
+$(eval $(call AUTOTARGETS,package,libdaemon))

Deleted: trunk/buildroot/package/libdaemon/libdir-la.patch
===================================================================
--- trunk/buildroot/package/libdaemon/libdir-la.patch	2008-08-27 07:29:13 UTC (rev 23233)
+++ trunk/buildroot/package/libdaemon/libdir-la.patch	2008-08-27 07:29:16 UTC (rev 23234)
@@ -1,77 +0,0 @@
---- libdaemon/ltmain.sh.orig	2004-11-23 09:19:19.000000000 -0700
-+++ libdaemon/ltmain.sh	2007-01-13 14:36:53.000000000 -0700
-@@ -231,8 +231,9 @@
- 	# line option must be used.
- 	if test -z "$tagname"; then
- 	  $echo "$modename: unable to infer tagged configuration"
--	  $echo "$modename: specify a tag with \`--tag'" 1>&2
--	  exit $EXIT_FAILURE
-+	  $echo "$modename: defaulting to \`CC'"
-+	  $echo "$modename: if this is not correct, specify a tag with \`--tag'"
-+#	  exit $EXIT_FAILURE
- #        else
- #          $echo "$modename: using $tagname tagged configuration"
- 	fi
-@@ -2279,8 +2280,14 @@
- 	    absdir="$abs_ladir"
- 	    libdir="$abs_ladir"
- 	  else
--	    dir="$libdir"
--	    absdir="$libdir"
-+            # Adding 'libdir' from the .la file to our library search paths
-+            # breaks crosscompilation horribly.  We cheat here and don't add
-+            # it, instead adding the path where we found the .la.  -CL
-+	    dir="$abs_ladir"
-+	    absdir="$abs_ladir"
-+	    libdir="$abs_ladir"
-+	    #dir="$libdir"
-+	    #absdir="$libdir"
- 	  fi
- 	else
- 	  if test ! -f "$ladir/$objdir/$linklib" && test -f "$abs_ladir/$linklib"; then
-@@ -2754,6 +2761,16 @@
- 		esac
- 		if grep "^installed=no" $deplib > /dev/null; then
- 		  path="$absdir/$objdir"
-+#		This interferes with crosscompilation. -CL
-+#		else
-+#		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
-+#		  if test -z "$libdir"; then
-+#		    $echo "$modename: \`$deplib' is not a valid libtool archive" 1>&2
-+#		    exit 1
-+#		  fi
-+#		  if test "$absdir" != "$libdir"; then
-+#		    $echo "$modename: warning: \`$deplib' seems to be moved" 1>&2
-+#		  fi
- 		else
- 		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
- 		  if test -z "$libdir"; then
-@@ -5141,6 +5158,10 @@
- 	    # Replace all uninstalled libtool libraries with the installed ones
- 	    newdependency_libs=
- 	    for deplib in $dependency_libs; do
-+              # Replacing uninstalled with installed can easily break crosscompilation,
-+              # since the installed path is generally the wrong architecture.  -CL
-+              newdependency_libs="$newdependency_libs $deplib"
-+              continue
- 	      case $deplib in
- 	      *.la)
- 		name=`$echo "X$deplib" | $Xsed -e 's%^.*/%%'`
-@@ -5459,10 +5480,13 @@
- 	  # At present, this check doesn't affect windows .dll's that
- 	  # are installed into $libdir/../bin (currently, that works fine)
- 	  # but it's something to keep an eye on.
--	  if test "$inst_prefix_dir" = "$destdir"; then
--	    $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
--	    exit $EXIT_FAILURE
--	  fi
-+	  #
-+	  # This breaks install into our staging area.  -PB
-+	  # 
-+	  # if test "$inst_prefix_dir" = "$destdir"; then
-+	  #   $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
-+	  #   exit $EXIT_FAILURE
-+	  # fi
- 
- 	  if test -n "$inst_prefix_dir"; then
- 	    # Stick the inst_prefix_dir data into the link command.

Deleted: trunk/buildroot/package/libdaemon/xcompile-setpgrp.patch
===================================================================
--- trunk/buildroot/package/libdaemon/xcompile-setpgrp.patch	2008-08-27 07:29:13 UTC (rev 23233)
+++ trunk/buildroot/package/libdaemon/xcompile-setpgrp.patch	2008-08-27 07:29:16 UTC (rev 23234)
@@ -1,11 +0,0 @@
---- libdaemon-0.10/configure.ac.cls	2005-11-24 05:38:53.000000000 -0800
-+++ libdaemon-0.10/configure.ac	2006-09-25 08:16:33.000000000 -0700
-@@ -85,7 +85,7 @@
- AC_FUNC_VPRINTF
- AC_CHECK_FUNCS([select strerror dup2 memset strrchr])
- AC_TYPE_MODE_T
--AC_FUNC_SETPGRP
-+dnl AC_FUNC_SETPGRP
- AC_TYPE_SIGNAL
- AC_TYPE_SIZE_T
- 

From: Daniel Laird <danieljlaird@hotmail.com>
Date: Tue, 17 Mar 2009 08:29:43 +0000
Subject: [Buildroot] svn commit: [25692] trunk/buildroot/package/expat
In-Reply-To: <20090316205805.701717649F@busybox.osuosl.org>
References: <20090316205805.701717649F@busybox.osuosl.org>
Message-ID: <COL102-DS2253298296A264E169E897DC980@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Has the time come to have 2 libtool patches?
We could then sniff ltmain.sh and decide which patch to apply.

I ask as I have locally had to add patches for a few packages that all have
newer libtool meaning the global patch does not work.  Perhaps having 2
global patches and picking one would remove a large number of the
libdir-la.patch files (and it is increasing)

Cheers
Daniel Laird

-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net]
On Behalf Of jacmet at uclibc.org
Sent: 2009 Mar 16 20:58
To: buildroot at uclibc.org
Subject: [Buildroot] svn commit: [25692] trunk/buildroot/package/expat

Author: jacmet
Date: 2009-03-16 20:58:04 +0000 (Mon, 16 Mar 2009)
New Revision: 25692

Log:
expat: convert to Makefile.autotools.in format

Added:
   trunk/buildroot/package/expat/expat-libdir-la.patch

Removed:
   trunk/buildroot/package/expat/libdir-la.patch

Modified:
   trunk/buildroot/package/expat/expat.mk


Changeset:
Copied: trunk/buildroot/package/expat/expat-libdir-la.patch (from rev 25691,
trunk/buildroot/package/expat/libdir-la.patch)
===================================================================
--- trunk/buildroot/package/expat/expat-libdir-la.patch
(rev 0)
+++ trunk/buildroot/package/expat/expat-libdir-la.patch	2009-03-16 20:58:04
UTC (rev 25692)
@@ -0,0 +1,77 @@
+--- expat-2.0.0/conftools/ltmain.sh.orig	2007-01-13
14:39:51.000000000 -0700
++++ expat-2.0.0/conftools/ltmain.sh	2007-01-13 14:39:56.000000000 -0700
+@@ -273,8 +273,9 @@
+ 	# line option must be used.
+ 	if test -z "$tagname"; then
+ 	  $echo "$modename: unable to infer tagged configuration"
+-	  $echo "$modename: specify a tag with \`--tag'" 1>&2
+-	  exit $EXIT_FAILURE
++	  $echo "$modename: defaulting to \`CC'"
++	  $echo "$modename: if this is not correct, specify a tag with
\`--tag'"
++#	  exit $EXIT_FAILURE
+ #        else
+ #          $echo "$modename: using $tagname tagged configuration"
+ 	fi
+@@ -2404,8 +2405,14 @@
+ 	    absdir="$abs_ladir"
+ 	    libdir="$abs_ladir"
+ 	  else
+-	    dir="$libdir"
+-	    absdir="$libdir"
++            # Adding 'libdir' from the .la file to our library search
paths
++            # breaks crosscompilation horribly.  We cheat here and don't
add
++            # it, instead adding the path where we found the .la.  -CL
++	    dir="$abs_ladir"
++	    absdir="$abs_ladir"
++	    libdir="$abs_ladir"
++	    #dir="$libdir"
++	    #absdir="$libdir"
+ 	  fi
+ 	  test "X$hardcode_automatic" = Xyes && avoidtemprpath=yes
+ 	else
+@@ -2886,6 +2893,16 @@
+ 		esac
+ 		if grep "^installed=no" $deplib > /dev/null; then
+ 		  path="$absdir/$objdir"
++#		This interferes with crosscompilation. -CL
++#		else
++#		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p'
$deplib`
++#		  if test -z "$libdir"; then
++#		    $echo "$modename: \`$deplib' is not a valid libtool
archive" 1>&2
++#		    exit 1
++#		  fi
++#		  if test "$absdir" != "$libdir"; then
++#		    $echo "$modename: warning: \`$deplib' seems to be moved"
1>&2
++#		  fi
+ 		else
+ 		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p'
$deplib`
+ 		  if test -z "$libdir"; then
+@@ -5598,6 +5615,10 @@
+ 	    # Replace all uninstalled libtool libraries with the installed
ones
+ 	    newdependency_libs=
+ 	    for deplib in $dependency_libs; do
++              # Replacing uninstalled with installed can easily break
crosscompilation,
++              # since the installed path is generally the wrong
architecture.  -CL
++              newdependency_libs="$newdependency_libs $deplib"
++              continue
+ 	      case $deplib in
+ 	      *.la)
+ 		name=`$echo "X$deplib" | $Xsed -e 's%^.*/%%'`
+@@ -5919,10 +5940,13 @@
+ 	  # At present, this check doesn't affect windows .dll's that
+ 	  # are installed into $libdir/../bin (currently, that works fine)
+ 	  # but it's something to keep an eye on.
+-	  if test "$inst_prefix_dir" = "$destdir"; then
+-	    $echo "$modename: error: cannot install \`$file' to a directory
not ending in $libdir" 1>&2
+-	    exit $EXIT_FAILURE
+-	  fi
++	  #
++	  # This breaks install into our staging area.  -PB
++	  # 
++	  # if test "$inst_prefix_dir" = "$destdir"; then
++	  #   $echo "$modename: error: cannot install \`$file' to a
directory not ending in $libdir" 1>&2
++	  #   exit $EXIT_FAILURE
++	  # fi
+ 
+ 	  if test -n "$inst_prefix_dir"; then
+ 	    # Stick the inst_prefix_dir data into the link command.

Modified: trunk/buildroot/package/expat/expat.mk
===================================================================
--- trunk/buildroot/package/expat/expat.mk	2009-03-16 20:58:01 UTC (rev
25691)
+++ trunk/buildroot/package/expat/expat.mk	2009-03-16 20:58:04 UTC (rev
25692)
@@ -4,77 +4,22 @@
 #
 #############################################################
 
-EXPAT_VERSION=2.0.1
-EXPAT_SOURCE=expat-$(EXPAT_VERSION).tar.gz
-EXPAT_CAT:=$(ZCAT)
-EXPAT_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/
expat
-EXPAT_DIR:=$(BUILD_DIR)/expat-$(EXPAT_VERSION)
+EXPAT_VERSION = 2.0.1
+EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.gz
+EXPAT_SITE =
http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/expat
+EXPAT_LIBTOOL_PATCH = NO
+EXPAT_INSTALL_STAGING = YES
+EXPAT_INSTALL_TARGET = YES
+# no install-strip / install-exec
+EXPAT_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) installlib
+EXPAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) installlib
 
-EXPAT_BINARY:=.libs/libexpat.a
-EXPAT_TARGET_BINARY:=usr/lib/libexpat.so.1
+EXPAT_CONF_OPT = --enable-shared
 
-$(DL_DIR)/$(EXPAT_SOURCE):
-	$(call DOWNLOAD,$(EXPAT_SITE),$(EXPAT_SOURCE))
+EXPAT_DEPENDENCIES = uclibc pkgconfig
 
-expat-source: $(DL_DIR)/$(EXPAT_SOURCE)
+$(eval $(call AUTOTARGETS,package,expat))
 
-$(EXPAT_DIR)/.unpacked: $(DL_DIR)/$(EXPAT_SOURCE)
-	$(EXPAT_CAT) $(DL_DIR)/$(EXPAT_SOURCE) | \
-		tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(EXPAT_DIR)
-	$(CONFIG_UPDATE) $(EXPAT_DIR)/conftools
+$(EXPAT_HOOK_POST_INSTALL): $(EXPAT_TARGET_INSTALL_TARGET)
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
$(TARGET_DIR)/usr/lib/libexpat.so.*
 	touch $@
-
-$(EXPAT_DIR)/.configured: $(EXPAT_DIR)/.unpacked
-	(cd $(EXPAT_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--sysconfdir=/etc \
-		--localstatedir=/var \
-		--enable-shared \
-	)
-	touch $@
-
-$(EXPAT_DIR)/$(EXPAT_BINARY): $(EXPAT_DIR)/.configured
-	$(MAKE) -C $(EXPAT_DIR) all
-	touch -c $@
-
-$(STAGING_DIR)/$(EXPAT_TARGET_BINARY): $(EXPAT_DIR)/$(EXPAT_BINARY)
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(EXPAT_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
-		$(STAGING_DIR)/usr/lib/libexpat.la
-	touch -c $@
-
-$(TARGET_DIR)/$(EXPAT_TARGET_BINARY): $(STAGING_DIR)/$(EXPAT_TARGET_BINARY)
-	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -dpf $(STAGING_DIR)/usr/lib/libexpat.so* $(TARGET_DIR)/usr/lib/
-	#cp -dpf $(STAGING_DIR)/usr/bin/xmlwf $(TARGET_DIR)/usr/bin/xmlwf
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
$(TARGET_DIR)/usr/lib/libexpat.so*
-	touch -c $@
-
-expat: uclibc pkgconfig $(TARGET_DIR)/$(EXPAT_TARGET_BINARY)
-
-expat-clean:
-	rm -f $(EXPAT_DIR)/.configured
-	rm -f $(STAGING_DIR)/usr/lib/libexpat.* \
-		$(TARGET_DIR)/usr/lib/libexpat.*
-	#rm -f $(STAGING_DIR)/usr/bin/xmlwf $(TARGET_DIR)/usr/bin/xmlwf
-	-$(MAKE) -C $(EXPAT_DIR) clean
-
-expat-dirclean:
-	rm -rf $(EXPAT_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_EXPAT),y)
-TARGETS+=expat
-endif

Deleted: trunk/buildroot/package/expat/libdir-la.patch
===================================================================
--- trunk/buildroot/package/expat/libdir-la.patch	2009-03-16 20:58:01
UTC (rev 25691)
+++ trunk/buildroot/package/expat/libdir-la.patch	2009-03-16 20:58:04
UTC (rev 25692)
@@ -1,77 +0,0 @@
---- expat-2.0.0/conftools/ltmain.sh.orig	2007-01-13
14:39:51.000000000 -0700
-+++ expat-2.0.0/conftools/ltmain.sh	2007-01-13 14:39:56.000000000 -0700
-@@ -273,8 +273,9 @@
- 	# line option must be used.
- 	if test -z "$tagname"; then
- 	  $echo "$modename: unable to infer tagged configuration"
--	  $echo "$modename: specify a tag with \`--tag'" 1>&2
--	  exit $EXIT_FAILURE
-+	  $echo "$modename: defaulting to \`CC'"
-+	  $echo "$modename: if this is not correct, specify a tag with
\`--tag'"
-+#	  exit $EXIT_FAILURE
- #        else
- #          $echo "$modename: using $tagname tagged configuration"
- 	fi
-@@ -2404,8 +2405,14 @@
- 	    absdir="$abs_ladir"
- 	    libdir="$abs_ladir"
- 	  else
--	    dir="$libdir"
--	    absdir="$libdir"
-+            # Adding 'libdir' from the .la file to our library search
paths
-+            # breaks crosscompilation horribly.  We cheat here and don't
add
-+            # it, instead adding the path where we found the .la.  -CL
-+	    dir="$abs_ladir"
-+	    absdir="$abs_ladir"
-+	    libdir="$abs_ladir"
-+	    #dir="$libdir"
-+	    #absdir="$libdir"
- 	  fi
- 	  test "X$hardcode_automatic" = Xyes && avoidtemprpath=yes
- 	else
-@@ -2886,6 +2893,16 @@
- 		esac
- 		if grep "^installed=no" $deplib > /dev/null; then
- 		  path="$absdir/$objdir"
-+#		This interferes with crosscompilation. -CL
-+#		else
-+#		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p'
$deplib`
-+#		  if test -z "$libdir"; then
-+#		    $echo "$modename: \`$deplib' is not a valid libtool
archive" 1>&2
-+#		    exit 1
-+#		  fi
-+#		  if test "$absdir" != "$libdir"; then
-+#		    $echo "$modename: warning: \`$deplib' seems to be moved"
1>&2
-+#		  fi
- 		else
- 		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p'
$deplib`
- 		  if test -z "$libdir"; then
-@@ -5598,6 +5615,10 @@
- 	    # Replace all uninstalled libtool libraries with the installed
ones
- 	    newdependency_libs=
- 	    for deplib in $dependency_libs; do
-+              # Replacing uninstalled with installed can easily break
crosscompilation,
-+              # since the installed path is generally the wrong
architecture.  -CL
-+              newdependency_libs="$newdependency_libs $deplib"
-+              continue
- 	      case $deplib in
- 	      *.la)
- 		name=`$echo "X$deplib" | $Xsed -e 's%^.*/%%'`
-@@ -5919,10 +5940,13 @@
- 	  # At present, this check doesn't affect windows .dll's that
- 	  # are installed into $libdir/../bin (currently, that works fine)
- 	  # but it's something to keep an eye on.
--	  if test "$inst_prefix_dir" = "$destdir"; then
--	    $echo "$modename: error: cannot install \`$file' to a directory
not ending in $libdir" 1>&2
--	    exit $EXIT_FAILURE
--	  fi
-+	  #
-+	  # This breaks install into our staging area.  -PB
-+	  # 
-+	  # if test "$inst_prefix_dir" = "$destdir"; then
-+	  #   $echo "$modename: error: cannot install \`$file' to a
directory not ending in $libdir" 1>&2
-+	  #   exit $EXIT_FAILURE
-+	  # fi
- 
- 	  if test -n "$inst_prefix_dir"; then
- 	    # Stick the inst_prefix_dir data into the link command.

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

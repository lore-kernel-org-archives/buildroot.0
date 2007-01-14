From: andersen at uclibc.org <andersen@uclibc.org>
Date: Sat, 13 Jan 2007 19:39:53 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  fontconfig
Message-ID: <20070114033953.DA651485BF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-13 19:39:53 -0800 (Sat, 13 Jan 2007)
New Revision: 17284

Log:
add fontconfig package


Added:
   trunk/buildroot/package/fontconfig/
   trunk/buildroot/package/fontconfig/Config.in
   trunk/buildroot/package/fontconfig/fontconfig.mk
   trunk/buildroot/package/fontconfig/libdir-la.patch

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-01-14 03:38:02 UTC (rev 17283)
+++ trunk/buildroot/package/Config.in	2007-01-14 03:39:53 UTC (rev 17284)
@@ -58,6 +58,7 @@
 source "package/e2fsprogs/Config.in"
 source "package/fakeroot/Config.in"
 source "package/file/Config.in"
+source "package/fontconfig/Config.in"
 source "package/freetype/Config.in"
 source "package/gettext/Config.in"
 source "package/gmp/Config.in"

Added: trunk/buildroot/package/fontconfig/Config.in
===================================================================
--- trunk/buildroot/package/fontconfig/Config.in	                        (rev 0)
+++ trunk/buildroot/package/fontconfig/Config.in	2007-01-14 03:39:53 UTC (rev 17284)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FONTCONFIG
+	bool "fontconfig"
+	select BR2_PACKAGE_FREETYPE
+	default n
+	help
+
+	http://www.fontconfig.org/

Added: trunk/buildroot/package/fontconfig/fontconfig.mk
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig.mk	                        (rev 0)
+++ trunk/buildroot/package/fontconfig/fontconfig.mk	2007-01-14 03:39:53 UTC (rev 17284)
@@ -0,0 +1,75 @@
+#############################################################
+#
+# fontconfig
+#
+#############################################################
+FONTCONFIG_VERSION:=2.4.2
+FONTCONFIG_SOURCE:=fontconfig-$(FONTCONFIG_VERSION).tar.gz
+FONTCONFIG_SITE:=http://fontconfig.org/release
+FONTCONFIG_CAT:=$(ZCAT)
+FONTCONFIG_DIR:=$(BUILD_DIR)/fontconfig-$(FONTCONFIG_VERSION)
+
+$(DL_DIR)/$(FONTCONFIG_SOURCE):
+	$(WGET) -P $(DL_DIR) $(FONTCONFIG_SITE)/$(FONTCONFIG_SOURCE)
+
+fontconfig-source: $(DL_DIR)/$(FONTCONFIG_SOURCE)
+
+$(FONTCONFIG_DIR)/.unpacked: $(DL_DIR)/$(FONTCONFIG_SOURCE)
+	$(FONTCONFIG_CAT) $(DL_DIR)/$(FONTCONFIG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(FONTCONFIG_DIR)/.unpacked
+
+$(FONTCONFIG_DIR)/.configured: $(FONTCONFIG_DIR)/.unpacked
+	(cd $(FONTCONFIG_DIR); \
+	$(TARGET_CONFIGURE_OPTS) \
+	CFLAGS="$(TARGET_CFLAGS) " \
+	CCexe="$(HOSTCC)" \
+	./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--with-arch=$(GNU_TARGET_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--libdir=/lib \
+		--libexecdir=/usr/lib \
+		--sysconfdir=/etc \
+		--datadir=/usr/share \
+		--localstatedir=/var \
+		--includedir=/include \
+		--mandir=/usr/man \
+		--infodir=/usr/info \
+	);
+	touch $(FONTCONFIG_DIR)/.configured
+
+$(FONTCONFIG_DIR)/.compiled: $(FONTCONFIG_DIR)/.configured
+	$(MAKE) CCexe="$(HOSTCC)" -C $(FONTCONFIG_DIR)
+	touch $(FONTCONFIG_DIR)/.compiled
+
+$(STAGING_DIR)/lib/libfontconfig.so: $(FONTCONFIG_DIR)/.compiled
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(FONTCONFIG_DIR) install
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libfontconfig.la
+	touch -c $(STAGING_DIR)/lib/libfontconfig.so
+
+$(TARGET_DIR)/lib/libfontconfig.so: $(STAGING_DIR)/lib/libfontconfig.so
+	cp -dpf $(STAGING_DIR)/lib/libfontconfig.so* $(TARGET_DIR)/lib/
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libfontconfig.so
+
+fontconfig: uclibc freetype $(TARGET_DIR)/lib/libfontconfig.so
+
+fontconfig-clean:
+	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(FONTCONFIG_DIR) uninstall
+	-$(MAKE) -C $(FONTCONFIG_DIR) clean
+
+fontconfig-dirclean:
+	rm -rf $(FONTCONFIG_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_FONTCONFIG)),y)
+TARGETS+=fontconfig
+endif

Added: trunk/buildroot/package/fontconfig/libdir-la.patch
===================================================================
--- trunk/buildroot/package/fontconfig/libdir-la.patch	                        (rev 0)
+++ trunk/buildroot/package/fontconfig/libdir-la.patch	2007-01-14 03:39:53 UTC (rev 17284)
@@ -0,0 +1,77 @@
+--- fontconfig/builds/unix/ltmain.sh.orig	2006-04-20 08:27:27.000000000 -0600
++++ fontconfig/builds/unix/ltmain.sh	2007-01-13 14:26:01.000000000 -0700
+@@ -273,8 +273,9 @@
+ 	# line option must be used.
+ 	if test -z "$tagname"; then
+ 	  $echo "$modename: unable to infer tagged configuration"
+-	  $echo "$modename: specify a tag with \`--tag'" 1>&2
+-	  exit $EXIT_FAILURE
++	  $echo "$modename: defaulting to \`CC'"
++	  $echo "$modename: if this is not correct, specify a tag with \`--tag'"
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
++            # Adding 'libdir' from the .la file to our library search paths
++            # breaks crosscompilation horribly.  We cheat here and don't add
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
++#		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
++#		  if test -z "$libdir"; then
++#		    $echo "$modename: \`$deplib' is not a valid libtool archive" 1>&2
++#		    exit 1
++#		  fi
++#		  if test "$absdir" != "$libdir"; then
++#		    $echo "$modename: warning: \`$deplib' seems to be moved" 1>&2
++#		  fi
+ 		else
+ 		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
+ 		  if test -z "$libdir"; then
+@@ -5598,6 +5615,10 @@
+ 	    # Replace all uninstalled libtool libraries with the installed ones
+ 	    newdependency_libs=
+ 	    for deplib in $dependency_libs; do
++              # Replacing uninstalled with installed can easily break crosscompilation,
++              # since the installed path is generally the wrong architecture.  -CL
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
+-	    $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
+-	    exit $EXIT_FAILURE
+-	  fi
++	  #
++	  # This breaks install into our staging area.  -PB
++	  # 
++	  # if test "$inst_prefix_dir" = "$destdir"; then
++	  #   $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
++	  #   exit $EXIT_FAILURE
++	  # fi
+ 
+ 	  if test -n "$inst_prefix_dir"; then
+ 	    # Stick the inst_prefix_dir data into the link command.

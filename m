From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:10:00 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
Message-ID: <20080306181000.551161201F4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:09:59 -0800 (Thu, 06 Mar 2008)
New Revision: 21193

Log:
updated freetype

Added:
   trunk/buildroot/package/freetype/freetype-2.2.1-libdir-la.patch

Removed:
   trunk/buildroot/package/freetype/libdir-la.patch

Modified:
   trunk/buildroot/package/freetype/Config.in
   trunk/buildroot/package/freetype/freetype.mk


Changeset:
Modified: trunk/buildroot/package/freetype/Config.in
===================================================================
--- trunk/buildroot/package/freetype/Config.in	2008-03-06 18:09:37 UTC (rev 21192)
+++ trunk/buildroot/package/freetype/Config.in	2008-03-06 18:09:59 UTC (rev 21193)
@@ -2,6 +2,7 @@
 	bool "freetype"
 	default n
 	help
+	a free, high-quality and portable font engine.
 
 	http://www.freetype.org/
 

Added: trunk/buildroot/package/freetype/freetype-2.2.1-libdir-la.patch
===================================================================
--- trunk/buildroot/package/freetype/freetype-2.2.1-libdir-la.patch	                        (rev 0)
+++ trunk/buildroot/package/freetype/freetype-2.2.1-libdir-la.patch	2008-03-06 18:09:59 UTC (rev 21193)
@@ -0,0 +1,77 @@
+--- freetype-2.2.1/builds/unix/ltmain.sh.orig	2006-04-20 08:27:27.000000000 -0600
++++ freetype-2.2.1/builds/unix/ltmain.sh	2007-01-13 14:26:01.000000000 -0700
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

Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2008-03-06 18:09:37 UTC (rev 21192)
+++ trunk/buildroot/package/freetype/freetype.mk	2008-03-06 18:09:59 UTC (rev 21193)
@@ -3,119 +3,24 @@
 # freetype
 #
 #############################################################
-FREETYPE_VERSION:=$(strip $(subst ",, $(BR2_FREETYPE_VERSION)))
-FREETYPE_SOURCE:=freetype-$(FREETYPE_VERSION).tar.bz2
-FREETYPE_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
-FREETYPE_CAT:=$(BZCAT)
-FREETYPE_DIR:=$(BUILD_DIR)/freetype-$(FREETYPE_VERSION)
-FREETYPE_DIR1:=$(TOOL_BUILD_DIR)/freetype-$(FREETYPE_VERSION)
-FREETYPE_HOST_DIR:=$(TOOL_BUILD_DIR)/freetype-$(FREETYPE_VERSION)-host
+FREETYPE_VERSION = $(strip $(subst ",, $(BR2_FREETYPE_VERSION)))
+FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
+FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
+FREETYPE_AUTORECONF = NO
+FREETYPE_INSTALL_STAGING = YES
+FREETYPE_INSTALL_TARGET = YES
+FREETYPE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-$(DL_DIR)/$(FREETYPE_SOURCE):
-	$(WGET) -P $(DL_DIR) $(FREETYPE_SITE)/$(FREETYPE_SOURCE)
+FREETYPE_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) --prefix=/usr \
+		--exec-prefix=/usr --bindir=/usr/bin \
+		--sbindir=/usr/sbin --libdir=/usr/lib \
+		--libexecdir=/usr/lib --sysconfdir=/etc \
+		--datadir=/usr/share --localstatedir=/var \
+		--includedir=/usr/include --mandir=/usr/man \
+		--infodir=/usr/info 
 
-$(FREETYPE_DIR)/.unpacked: $(DL_DIR)/$(FREETYPE_SOURCE)
-	$(FREETYPE_CAT) $(DL_DIR)/$(FREETYPE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(FREETYPE_DIR)
-	$(CONFIG_UPDATE) $(FREETYPE_DIR)/builds/unix
-	touch $(FREETYPE_DIR)/.unpacked
+FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
+FREETYPE_DEPENDENCIES = uclibc pkgconfig
 
-# freetype for the target
-$(FREETYPE_DIR)/.configured: $(FREETYPE_DIR)/.unpacked
-	(cd $(FREETYPE_DIR); rm -f config.cache; \
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
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--includedir=/usr/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-	)
-	touch $(FREETYPE_DIR)/.configured
-
-$(FREETYPE_DIR)/.compiled: $(FREETYPE_DIR)/.configured
-	$(MAKE) CCexe="$(HOSTCC)" -C $(FREETYPE_DIR)
-	touch $(FREETYPE_DIR)/.compiled
-
-$(STAGING_DIR)/usr/include/freetype:
-	ln -sf ./freetype2/freetype $(STAGING_DIR)/usr/include/freetype
-
-#$(STAGING_DIR)/include/freetype:
-#	mkdir -p $(STAGING_DIR)/include
-#	ln -sf ../usr/include/freetype2/freetype $(STAGING_DIR)/include/freetype
-
-$(STAGING_DIR)/lib/libfreetype.so: $(FREETYPE_DIR)/.compiled
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(FREETYPE_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libfreetype.la
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)\',g" \
-		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" \
-		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" \
-		$(STAGING_DIR)/usr/bin/freetype-config
-	touch -c $(STAGING_DIR)/lib/libfreetype.so
-
-$(TARGET_DIR)/lib/libfreetype.so: $(STAGING_DIR)/lib/libfreetype.so
-	cp -dpf $(STAGING_DIR)/lib/libfreetype.so* $(TARGET_DIR)/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libfreetype.so
-
-# freetype for the host, needed for build-tools of fontconfig
-
-# great, it can't be built out of tree reliably
-$(FREETYPE_DIR1)/.unpacked: $(DL_DIR)/$(FREETYPE_SOURCE)
-	$(FREETYPE_CAT) $(DL_DIR)/$(FREETYPE_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(FREETYPE_DIR1)/.unpacked
-
-$(FREETYPE_DIR1)/.configured: $(FREETYPE_DIR1)/.unpacked
-	(cd $(FREETYPE_DIR1); \
-	./configure \
-		CC="$(HOSTCC)" \
-		--prefix="$(FREETYPE_HOST_DIR)" \
-	)
-	touch $(FREETYPE_DIR1)/.configured
-
-$(FREETYPE_DIR1)/.compiled: $(FREETYPE_DIR1)/.configured
-	$(MAKE) CCexe="$(HOSTCC)" -C $(FREETYPE_DIR1)
-	touch $(FREETYPE_DIR1)/.compiled
-
-$(FREETYPE_HOST_DIR)/lib/libfreetype.so: $(FREETYPE_DIR1)/.configured
-	$(MAKE) -C $(FREETYPE_DIR1) install
-	touch -c $@
-
-.PHONY: freetype freetype-source freetype-links freetype-clean freetype-dirclean
-
-freetype: uclibc pkgconfig $(TARGET_DIR)/lib/libfreetype.so freetype-links
-
-freetype-source: $(DL_DIR)/$(FREETYPE_SOURCE)
-
-freetype-links: $(STAGING_DIR)/usr/include/freetype # $(STAGING_DIR)/include/freetype
-
-freetype-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(FREETYPE_DIR) uninstall
-	-$(MAKE) -C $(FREETYPE_DIR) clean
-
-freetype-dirclean:
-	rm -rf $(FREETYPE_DIR)
-
-.PHONY: host-freetype
-
-host-freetype: $(FREETYPE_HOST_DIR)/lib/libfreetype.so
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_FREETYPE)),y)
-TARGETS+=freetype
-endif
+$(eval $(call AUTOTARGETS,package,freetype))
\ No newline at end of file

Deleted: trunk/buildroot/package/freetype/libdir-la.patch
===================================================================
--- trunk/buildroot/package/freetype/libdir-la.patch	2008-03-06 18:09:37 UTC (rev 21192)
+++ trunk/buildroot/package/freetype/libdir-la.patch	2008-03-06 18:09:59 UTC (rev 21193)
@@ -1,77 +0,0 @@
---- freetype-2.2.1/builds/unix/ltmain.sh.orig	2006-04-20 08:27:27.000000000 -0600
-+++ freetype-2.2.1/builds/unix/ltmain.sh	2007-01-13 14:26:01.000000000 -0700
-@@ -273,8 +273,9 @@
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
-@@ -2404,8 +2405,14 @@
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
- 	  test "X$hardcode_automatic" = Xyes && avoidtemprpath=yes
- 	else
-@@ -2886,6 +2893,16 @@
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
-@@ -5598,6 +5615,10 @@
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
-@@ -5919,10 +5940,13 @@
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

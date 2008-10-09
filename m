From: laird at uclibc.org <laird@uclibc.org>
Date: Thu,  9 Oct 2008 05:50:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
Message-ID: <20081009125057.1B4E63C8CE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-10-09 05:50:56 -0700 (Thu, 09 Oct 2008)
New Revision: 23637

Log:
package/freetype: Convert to Makefile.autotools.in

Use AutoTools.in to build freetype.
Slight issue with freetype installation to TARGET_DIR.
Doing an install results in far too many files being copied in.
So for now I do what the old makefile did which is copy the .so files 
and links manually rather than using a make install.
It also uses the autotools.in additions to not use the generic libtool patch and
use a local one instead.

Daniel Laird


Added:
   trunk/buildroot/package/freetype/freetype-2.3.7-libdir-la.patch

Modified:
   trunk/buildroot/package/freetype/freetype.mk


Changeset:
Added: trunk/buildroot/package/freetype/freetype-2.3.7-libdir-la.patch
===================================================================
--- trunk/buildroot/package/freetype/freetype-2.3.7-libdir-la.patch	                        (rev 0)
+++ trunk/buildroot/package/freetype/freetype-2.3.7-libdir-la.patch	2008-10-09 12:50:56 UTC (rev 23637)
@@ -0,0 +1,81 @@
+diff -urN freetype-2.3.7.orig/builds/unix/ltmain.sh freetype-2.3.7/builds/unix/ltmain.sh
+--- freetype-2.3.7.orig/builds/unix/ltmain.sh	2008-09-16 15:55:36.000000000 +0100
++++ freetype-2.3.7/builds/unix/ltmain.sh	2008-09-22 09:18:36.000000000 +0100
+@@ -1047,8 +1047,9 @@
+ 	# was found and let the user know that the "--tag" command
+ 	# line option must be used.
+ 	if test -z "$tagname"; then
+-	  func_echo "unable to infer tagged configuration"
+-	  func_fatal_error "specify a tag with \`--tag'"
++          func_echo "unable to infer tagged configuration"
++	  func_echo "$modename: defaulting to \`CC'"
++	  func_echo "$modename: if this is not correct, specify a tag with \`--tag'"
+ #	else
+ #	  func_verbose "using $tagname tagged configuration"
+ 	fi
+@@ -2017,8 +2018,11 @@
+ 	  # At present, this check doesn't affect windows .dll's that
+ 	  # are installed into $libdir/../bin (currently, that works fine)
+ 	  # but it's something to keep an eye on.
+-	  test "$inst_prefix_dir" = "$destdir" && \
+-	    func_fatal_error "error: cannot install \`$file' to a directory not ending in $libdir"
++	  #
++	  # This breaks install into our staging area.  -PB
++	  #
++	  #test "$inst_prefix_dir" = "$destdir" && \
++	  #  func_fatal_error "error: cannot install \`$file' to a directory not ending in $libdir"
+ 
+ 	  if test -n "$inst_prefix_dir"; then
+ 	    # Stick the inst_prefix_dir data into the link command.
+@@ -4885,8 +4889,14 @@
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
+@@ -5408,13 +5418,16 @@
+ 		  ;;
+ 		esac
+ 		else
+-		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
+-		  test -z "$libdir" && \
+-		    func_fatal_error "\`$deplib' is not a valid libtool archive"
+-		  test "$absdir" != "$libdir" && \
+-		    func_warning "\`$deplib' seems to be moved"
+-
+-		  path="-L$absdir"
++#       	  This interferes with crosscompilation. -CL
++#		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
++#		  test -z "$libdir" && \
++#		    func_fatal_error "\`$deplib' is not a valid libtool archive"
++#		  test "$absdir" != "$libdir" && \
++#		    func_warning "\`$deplib' seems to be moved"
++#
++#		  path="-L$absdir"
++        	  path="-L$absdir/$objdir"
++        	  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
+ 		fi
+ 		;;
+ 	      esac
+@@ -7520,6 +7533,10 @@
+ 	    # Replace all uninstalled libtool libraries with the installed ones
+ 	    newdependency_libs=
+ 	    for deplib in $dependency_libs; do
++              # Replacing uninstalled with installed can easily break crosscompilation,
++              # since the installed path is generally the wrong architecture.  -CL
++              newdependency_libs="$newdependency_libs $deplib"
++              continue
+ 	      case $deplib in
+ 	      *.la)
+ 		func_basename "$deplib"

Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2008-10-09 12:24:37 UTC (rev 23636)
+++ trunk/buildroot/package/freetype/freetype.mk	2008-10-09 12:50:56 UTC (rev 23637)
@@ -4,68 +4,21 @@
 #
 #############################################################
 FREETYPE_VERSION = $(strip $(subst ",, $(BR2_FREETYPE_VERSION)))
-FREETYPE_NAME = freetype-$(FREETYPE_VERSION)
-FREETYPE_DIR = $(BUILD_DIR)/$(FREETYPE_NAME)
 FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
-FREETYPE_SOURCE:=$(FREETYPE_NAME).tar.bz2
-FREETYPE_DESTDIR:=$(STAGING_DIR)/usr/lib
-FREETYPE_CAT:=$(BZCAT)
+FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
+FREETYPE_LIBTOOL_PATCH = NO
+FREETYPE_INSTALL_STAGING = YES
+FREETYPE_INSTALL_TARGET = NO
+FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
+FREETYPE_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
+FREETYPE_DEPENDENCIES = uclibc pkgconfig
 
-$(DL_DIR)/$(FREETYPE_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(FREETYPE_SITE)/$(FREETYPE_SOURCE)
+$(eval $(call AUTOTARGETS,package,freetype))
 
-$(FREETYPE_DIR)/.unpacked: $(DL_DIR)/$(FREETYPE_SOURCE)
-	$(FREETYPE_CAT) $(DL_DIR)/$(FREETYPE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(FREETYPE_DIR) package/freetype/ freetype-$(FREETYPE_VERSION)-\*.patch
-	$(CONFIG_UPDATE) $(FREETYPE_DIR)
-	$(CONFIG_UPDATE) $(FREETYPE_DIR)/builds/unix
-	touch $@
-
-$(FREETYPE_DIR)/.configured: $(FREETYPE_DIR)/.unpacked
-	(cd $(FREETYPE_DIR);  rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
-		--target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) --prefix=/usr \
-		--exec-prefix=/usr --bindir=/usr/bin \
-		--sbindir=/usr/sbin --libdir=/usr/lib \
-		--libexecdir=/usr/lib --sysconfdir=/etc \
-		--datadir=/usr/share --localstatedir=/var \
-		--includedir=/usr/include --mandir=/usr/man \
-		--infodir=/usr/info \ )
-	touch $@
-
-$(FREETYPE_DIR)/.compiled: $(FREETYPE_DIR)/.configured
-	$(MAKE) CCexe="$(HOSTCC)" -C $(FREETYPE_DIR)
-	touch $@
-
-$(FREETYPE_DIR)/.installed: $(FREETYPE_DIR)/.compiled
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(FREETYPE_DIR) install
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(FREETYPE_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libfreetype.la
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/freetype-config
-	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/freetype-config
-	$(SED) "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" $(STAGING_DIR)/usr/bin/freetype-config
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/bin/freetype-config
+$(FREETYPE_HOOK_POST_BUILD):
+	-cp -a $(FREETYPE_DIR)/objs/.libs/libfreetype.so* $(TARGET_DIR)/usr/lib/
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libfreetype.so
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(FREETYPE_DIR)/builds/unix/freetype-config
+	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(FREETYPE_DIR)/builds/unix/freetype-config
 	touch $@
 
-freetype: uclibc pkgconfig $(FREETYPE_DIR)/.installed
-
-freetype-clean:
-	-$(MAKE) -C $(FREETYPE_DIR) DESTDIR=$(STAGING_DIR) uninstall
-	-$(MAKE) -C $(FREETYPE_DIR) DESTDIR=$(TARGET_DIR) uninstall
-	-$(MAKE) -C $(FREETYPE_DIR) clean
-
-freetype-dirclean:
-	rm -rf $(FREETYPE_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_FREETYPE)),y)
-TARGETS+=freetype
-endif

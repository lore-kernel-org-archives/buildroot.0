From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:09:38 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fontconfig
Message-ID: <20080306180938.A220D1201EC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:09:37 -0800 (Thu, 06 Mar 2008)
New Revision: 21192

Log:
updated fontconfig

Added:
   trunk/buildroot/package/fontconfig/fontconfig-2.4.2-fc-lang.patch
   trunk/buildroot/package/fontconfig/fontconfig-2.4.2-host-tools.patch
   trunk/buildroot/package/fontconfig/fontconfig-2.4.2-libdir-la.patch

Removed:
   trunk/buildroot/package/fontconfig/fc-lang.patch
   trunk/buildroot/package/fontconfig/host-tools.patch
   trunk/buildroot/package/fontconfig/libdir-la.patch

Modified:
   trunk/buildroot/package/fontconfig/Config.in
   trunk/buildroot/package/fontconfig/fontconfig.mk


Changeset:
Modified: trunk/buildroot/package/fontconfig/Config.in
===================================================================
--- trunk/buildroot/package/fontconfig/Config.in	2008-03-06 18:09:12 UTC (rev 21191)
+++ trunk/buildroot/package/fontconfig/Config.in	2008-03-06 18:09:37 UTC (rev 21192)
@@ -4,5 +4,6 @@
 	select BR2_PACKAGE_EXPAT
 	default n
 	help
-
+	a library for font customization and configuration.
+	
 	http://www.fontconfig.org/

Deleted: trunk/buildroot/package/fontconfig/fc-lang.patch
===================================================================
--- trunk/buildroot/package/fontconfig/fc-lang.patch	2008-03-06 18:09:12 UTC (rev 21191)
+++ trunk/buildroot/package/fontconfig/fc-lang.patch	2008-03-06 18:09:37 UTC (rev 21192)
@@ -1,33 +0,0 @@
---- fontconfig-2.4.2/fc-lang/fc-lang.orig.c	2007-02-03 13:39:49.000000000 -0700
-+++ fontconfig-2.4.2/fc-lang/fc-lang.c	2007-02-03 13:46:08.000000000 -0700
-@@ -116,6 +116,20 @@
-     return f;
- }
- 
-+char* trim(char *s)
-+{
-+	int len = strlen(s);
-+
-+	/* nuke trailing whitespace */
-+	while (len > 0 && (isspace(s[len - 1]) || s[len - 1]=='\n'))
-+		s[--len] = '\0';
-+
-+	/* skip leading whitespace */
-+	s += strspn(s, " \n\r\t\v");
-+
-+	return s;
-+}
-+
- /*
-  * build a single charset from a source file
-  *
-@@ -142,8 +156,7 @@
-             if (!file)
-                 fatal (line, lineno, 
-                        "invalid syntax, expected: include filename");
--	    while (isspace(*file))
--		file++;
-+	    file = trim(file);
- 	    f = scanopen (file);
- 	    if (!f)
- 		fatal (file, 0, "can't open");

Added: trunk/buildroot/package/fontconfig/fontconfig-2.4.2-fc-lang.patch
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig-2.4.2-fc-lang.patch	                        (rev 0)
+++ trunk/buildroot/package/fontconfig/fontconfig-2.4.2-fc-lang.patch	2008-03-06 18:09:37 UTC (rev 21192)
@@ -0,0 +1,33 @@
+--- fontconfig-2.4.2/fc-lang/fc-lang.orig.c	2007-02-03 13:39:49.000000000 -0700
++++ fontconfig-2.4.2/fc-lang/fc-lang.c	2007-02-03 13:46:08.000000000 -0700
+@@ -116,6 +116,20 @@
+     return f;
+ }
+ 
++char* trim(char *s)
++{
++	int len = strlen(s);
++
++	/* nuke trailing whitespace */
++	while (len > 0 && (isspace(s[len - 1]) || s[len - 1]=='\n'))
++		s[--len] = '\0';
++
++	/* skip leading whitespace */
++	s += strspn(s, " \n\r\t\v");
++
++	return s;
++}
++
+ /*
+  * build a single charset from a source file
+  *
+@@ -142,8 +156,7 @@
+             if (!file)
+                 fatal (line, lineno, 
+                        "invalid syntax, expected: include filename");
+-	    while (isspace(*file))
+-		file++;
++	    file = trim(file);
+ 	    f = scanopen (file);
+ 	    if (!f)
+ 		fatal (file, 0, "can't open");

Added: trunk/buildroot/package/fontconfig/fontconfig-2.4.2-host-tools.patch
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig-2.4.2-host-tools.patch	                        (rev 0)
+++ trunk/buildroot/package/fontconfig/fontconfig-2.4.2-host-tools.patch	2008-03-06 18:09:37 UTC (rev 21192)
@@ -0,0 +1,95 @@
+--- fontconfig-2.4.2/fc-lang/Makefile.am.orig	2007-06-24 07:02:54.000000000 +0200
++++ fontconfig-2.4.2/fc-lang/Makefile.am	2007-06-24 07:05:14.000000000 +0200
+@@ -23,10 +23,16 @@
+ #
+ 
+ CC = @CC_FOR_BUILD@
++LD = @CC_FOR_BUILD@
++AM_CPPFLAGS =
++AM_CFLAGS = @CFLAGS_FOR_BUILD@
++AM_LDFLAGS = @LDFLAGS_FOR_BUILD@
+ EXEEXT = @EXEEXT_FOR_BUILD@
+-LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
++	$(AM_CFLAGS)
++LINK = $(LD) $(AM_CFLAGS) $(AM_LDFLAGS) -o $@
+ 
+-INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(FREETYPE_CFLAGS) $(WARN_CFLAGS)
++INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
+ 
+ TMPL=fclang.tmpl.h
+ STMPL=${top_srcdir}/fc-lang/fclang.tmpl.h
+--- fontconfig-2.4.2/fc-case/Makefile.am.orig	2007-06-24 07:02:54.000000000 +0200
++++ fontconfig-2.4.2/fc-case/Makefile.am	2007-06-24 07:05:14.000000000 +0200
+@@ -23,10 +23,16 @@
+ #
+ 
+ CC = @CC_FOR_BUILD@
++LD = @CC_FOR_BUILD@
++AM_CPPFLAGS =
++AM_CFLAGS = @CFLAGS_FOR_BUILD@
++AM_LDFLAGS = @LDFLAGS_FOR_BUILD@
+ EXEEXT = @EXEEXT_FOR_BUILD@
+-LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
++	$(AM_CFLAGS)
++LINK = $(LD) $(AM_CFLAGS) $(AM_LDFLAGS) -o $@
+ 
+-INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(FREETYPE_CFLAGS) $(WARN_CFLAGS)
++INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
+ 
+ TMPL=fccase.tmpl.h
+ STMPL=${top_srcdir}/fc-case/${TMPL}
+--- fontconfig-2.4.2/fc-glyphname/Makefile.am.orig	2007-06-24 07:02:54.000000000 +0200
++++ fontconfig-2.4.2/fc-glyphname/Makefile.am	2007-06-24 07:05:14.000000000 +0200
+@@ -23,10 +23,16 @@
+ #
+ 
+ CC = @CC_FOR_BUILD@
++LD = @CC_FOR_BUILD@
++AM_CPPFLAGS =
++AM_CFLAGS = @CFLAGS_FOR_BUILD@
++AM_LDFLAGS = @LDFLAGS_FOR_BUILD@
+ EXEEXT = @EXEEXT_FOR_BUILD@
+-LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
++	$(AM_CFLAGS)
++LINK = $(LD) $(AM_CFLAGS) $(AM_LDFLAGS) -o $@
+ 
+-INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(FREETYPE_CFLAGS) $(WARN_CFLAGS)
++INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
+ 
+ TMPL=fcglyphname.tmpl.h
+ STMPL=${top_srcdir}/fc-glyphname/${TMPL}
+--- fontconfig-2.4.2/configure.in.orig	2007-06-24 07:02:54.000000000 +0200
++++ fontconfig-2.4.2/configure.in	2007-06-24 07:02:59.000000000 +0200
+@@ -101,6 +101,8 @@
+ AC_MSG_CHECKING([for a C compiler for build tools])
+ if test $cross_compiling = yes; then
+   AC_CHECK_PROGS(CC_FOR_BUILD, gcc cc)
++  AC_SUBST(CFLAGS_FOR_BUILD)
++  AC_SUBST(LDFLAGS_FOR_BUILD)
+ else
+   CC_FOR_BUILD=$CC
+ fi
+--- fontconfig-2.4.2/fc-arch/Makefile.am.orig	2007-06-24 07:02:54.000000000 +0200
++++ fontconfig-2.4.2/fc-arch/Makefile.am	2007-06-24 07:05:14.000000000 +0200
+@@ -23,10 +23,16 @@
+ #
+ 
+ CC = @CC_FOR_BUILD@
++LD = @CC_FOR_BUILD@
++AM_CPPFLAGS =
++AM_CFLAGS = @CFLAGS_FOR_BUILD@
++AM_LDFLAGS = @LDFLAGS_FOR_BUILD@
+ EXEEXT = @EXEEXT_FOR_BUILD@
+-LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
++	$(AM_CFLAGS)
++LINK = $(LD) $(AM_CFLAGS) $(AM_LDFLAGS) -o $@
+ 
+-INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(FREETYPE_CFLAGS) $(WARN_CFLAGS)
++INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
+ 
+ TMPL=fcarch.tmpl.h
+ STMPL=${top_srcdir}/fc-arch/fcarch.tmpl.h

Added: trunk/buildroot/package/fontconfig/fontconfig-2.4.2-libdir-la.patch
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig-2.4.2-libdir-la.patch	                        (rev 0)
+++ trunk/buildroot/package/fontconfig/fontconfig-2.4.2-libdir-la.patch	2008-03-06 18:09:37 UTC (rev 21192)
@@ -0,0 +1,77 @@
+--- fontconfig/ltmain.sh.orig	2006-04-20 08:27:27.000000000 -0600
++++ fontconfig/ltmain.sh	2007-01-13 14:26:01.000000000 -0700
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

Modified: trunk/buildroot/package/fontconfig/fontconfig.mk
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig.mk	2008-03-06 18:09:12 UTC (rev 21191)
+++ trunk/buildroot/package/fontconfig/fontconfig.mk	2008-03-06 18:09:37 UTC (rev 21192)
@@ -3,99 +3,29 @@
 # fontconfig
 #
 #############################################################
-FONTCONFIG_VERSION:=2.4.2
-FONTCONFIG_SOURCE:=fontconfig-$(FONTCONFIG_VERSION).tar.gz
-FONTCONFIG_SITE:=http://fontconfig.org/release
-FONTCONFIG_CAT:=$(ZCAT)
-FONTCONFIG_DIR:=$(BUILD_DIR)/fontconfig-$(FONTCONFIG_VERSION)
+FONTCONFIG_VERSION = 2.4.2
+FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.gz
+FONTCONFIG_SITE = http://fontconfig.org/release
+FONTCONFIG_AUTORECONF = NO
+FONTCONFIG_INSTALL_STAGING = YES
+FONTCONFIG_INSTALL_TARGET = YES
 
-$(DL_DIR)/$(FONTCONFIG_SOURCE):
-	$(WGET) -P $(DL_DIR) $(FONTCONFIG_SITE)/$(FONTCONFIG_SOURCE)
+FONTCONFIG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-fontconfig-source: $(DL_DIR)/$(FONTCONFIG_SOURCE)
-
-$(FONTCONFIG_DIR)/.unpacked: $(DL_DIR)/$(FONTCONFIG_SOURCE)
-	$(FONTCONFIG_CAT) $(DL_DIR)/$(FONTCONFIG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(FONTCONFIG_DIR) package/fontconfig/ \*.patch*
-# use freetype-host for host tools
-	FREETYPE_CFLAGS="$(shell $(FREETYPE_HOST_DIR)/bin/freetype-config --cflags)"; \
-	FREETYPE_LIBS="$(shell $(FREETYPE_HOST_DIR)/bin/freetype-config --libs)"; \
-	for dir in fc-case fc-glyphname fc-lang fc-arch; \
-	do \
-		$(SED) "s~^FREETYPE_CFLAGS =.*~FREETYPE_CFLAGS = $$FREETYPE_CFLAGS~" \
-		    -e "s~^FREETYPE_LIBS =.*~FREETYPE_LIBS = $$FREETYPE_LIBS~" \
-			$(FONTCONFIG_DIR)/$$dir/Makefile.in; \
-	done
-	$(CONFIG_UPDATE) $(FONTCONFIG_DIR)
-	touch $@
-
-$(FONTCONFIG_DIR)/.configured: $(FONTCONFIG_DIR)/.unpacked
-	(cd $(FONTCONFIG_DIR); rm -rf config.cache; \
-		$(AUTORECONF) && \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CFLAGS_FOR_BUILD="-I$(FREETYPE_HOST_DIR)/include/freetype2 -I$(FREETYPE_HOST_DIR)/include" \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--with-arch=$(GNU_TARGET_NAME) \
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
-		--mandir=/usr/man \
-		--infodir=/usr/info \
+FONTCONFIG_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) --with-arch=$(GNU_TARGET_NAME) \
+		--prefix=/usr --exec-prefix=/usr \
+		--bindir=/usr/bin --sbindir=/usr/sbin \
+		--libdir=/usr/lib --libexecdir=/usr/lib \
+		--sysconfdir=/etc --datadir=/usr/share \
+		--localstatedir=/var --includedir=/usr/include \
+		--mandir=/usr/man --infodir=/usr/info \
 		--with-freetype-config="$(STAGING_DIR)/usr/bin/freetype-config" \
 		--with-expat="$(STAGING_DIR)/usr/lib" \
 		--with-expat-lib=$(STAGING_DIR)/usr/lib \
 		--with-expat-includes=$(STAGING_DIR)/usr/include \
-		--disable-docs \
-	)
-	touch $@
+		--disable-docs 
 
-$(FONTCONFIG_DIR)/.compiled: $(FONTCONFIG_DIR)/.configured
-	$(MAKE) -C $(FONTCONFIG_DIR)
-	touch $@
+FONTCONFIG_DEPENDENCIES = uclibc freetype expat
 
-$(STAGING_DIR)/usr/lib/libfontconfig.so: $(FONTCONFIG_DIR)/.compiled
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(FONTCONFIG_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libfontconfig.la
-	touch -c $@
-
-$(TARGET_DIR)/usr/lib/libfontconfig.so: $(STAGING_DIR)/usr/lib/libfontconfig.so
-	cp -dpf $(STAGING_DIR)/usr/lib/libfontconfig.so* $(TARGET_DIR)/usr/lib/
-	mkdir -p $(TARGET_DIR)/etc/fonts
-	cp $(STAGING_DIR)/etc/fonts/fonts.conf $(TARGET_DIR)/etc/fonts/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libfontconfig.so
-	mkdir -p $(TARGET_DIR)/var/cache/fontconfig
-	mkdir -p $(TARGET_DIR)/usr/bin
-	cp -a $(STAGING_DIR)/usr/bin/fc-cache $(TARGET_DIR)/usr/bin/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/fc-cache
-	cp -a $(STAGING_DIR)/usr/bin/fc-list $(TARGET_DIR)/usr/bin/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/fc-list
-	touch -c $@
-
-fontconfig: uclibc freetype host-freetype expat $(TARGET_DIR)/usr/lib/libfontconfig.so
-
-fontconfig-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(FONTCONFIG_DIR) uninstall
-	-$(MAKE) -C $(FONTCONFIG_DIR) clean
-
-fontconfig-dirclean:
-	rm -rf $(FONTCONFIG_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_FONTCONFIG)),y)
-TARGETS+=fontconfig
-endif
+$(eval $(call AUTOTARGETS,package,fontconfig))

Deleted: trunk/buildroot/package/fontconfig/host-tools.patch
===================================================================
--- trunk/buildroot/package/fontconfig/host-tools.patch	2008-03-06 18:09:12 UTC (rev 21191)
+++ trunk/buildroot/package/fontconfig/host-tools.patch	2008-03-06 18:09:37 UTC (rev 21192)
@@ -1,95 +0,0 @@
---- fontconfig-2.4.2/fc-lang/Makefile.am.orig	2007-06-24 07:02:54.000000000 +0200
-+++ fontconfig-2.4.2/fc-lang/Makefile.am	2007-06-24 07:05:14.000000000 +0200
-@@ -23,10 +23,16 @@
- #
- 
- CC = @CC_FOR_BUILD@
-+LD = @CC_FOR_BUILD@
-+AM_CPPFLAGS =
-+AM_CFLAGS = @CFLAGS_FOR_BUILD@
-+AM_LDFLAGS = @LDFLAGS_FOR_BUILD@
- EXEEXT = @EXEEXT_FOR_BUILD@
--LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
-+COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
-+	$(AM_CFLAGS)
-+LINK = $(LD) $(AM_CFLAGS) $(AM_LDFLAGS) -o $@
- 
--INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(FREETYPE_CFLAGS) $(WARN_CFLAGS)
-+INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
- 
- TMPL=fclang.tmpl.h
- STMPL=${top_srcdir}/fc-lang/fclang.tmpl.h
---- fontconfig-2.4.2/fc-case/Makefile.am.orig	2007-06-24 07:02:54.000000000 +0200
-+++ fontconfig-2.4.2/fc-case/Makefile.am	2007-06-24 07:05:14.000000000 +0200
-@@ -23,10 +23,16 @@
- #
- 
- CC = @CC_FOR_BUILD@
-+LD = @CC_FOR_BUILD@
-+AM_CPPFLAGS =
-+AM_CFLAGS = @CFLAGS_FOR_BUILD@
-+AM_LDFLAGS = @LDFLAGS_FOR_BUILD@
- EXEEXT = @EXEEXT_FOR_BUILD@
--LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
-+COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
-+	$(AM_CFLAGS)
-+LINK = $(LD) $(AM_CFLAGS) $(AM_LDFLAGS) -o $@
- 
--INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(FREETYPE_CFLAGS) $(WARN_CFLAGS)
-+INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
- 
- TMPL=fccase.tmpl.h
- STMPL=${top_srcdir}/fc-case/${TMPL}
---- fontconfig-2.4.2/fc-glyphname/Makefile.am.orig	2007-06-24 07:02:54.000000000 +0200
-+++ fontconfig-2.4.2/fc-glyphname/Makefile.am	2007-06-24 07:05:14.000000000 +0200
-@@ -23,10 +23,16 @@
- #
- 
- CC = @CC_FOR_BUILD@
-+LD = @CC_FOR_BUILD@
-+AM_CPPFLAGS =
-+AM_CFLAGS = @CFLAGS_FOR_BUILD@
-+AM_LDFLAGS = @LDFLAGS_FOR_BUILD@
- EXEEXT = @EXEEXT_FOR_BUILD@
--LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
-+COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
-+	$(AM_CFLAGS)
-+LINK = $(LD) $(AM_CFLAGS) $(AM_LDFLAGS) -o $@
- 
--INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(FREETYPE_CFLAGS) $(WARN_CFLAGS)
-+INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
- 
- TMPL=fcglyphname.tmpl.h
- STMPL=${top_srcdir}/fc-glyphname/${TMPL}
---- fontconfig-2.4.2/configure.in.orig	2007-06-24 07:02:54.000000000 +0200
-+++ fontconfig-2.4.2/configure.in	2007-06-24 07:02:59.000000000 +0200
-@@ -101,6 +101,8 @@
- AC_MSG_CHECKING([for a C compiler for build tools])
- if test $cross_compiling = yes; then
-   AC_CHECK_PROGS(CC_FOR_BUILD, gcc cc)
-+  AC_SUBST(CFLAGS_FOR_BUILD)
-+  AC_SUBST(LDFLAGS_FOR_BUILD)
- else
-   CC_FOR_BUILD=$CC
- fi
---- fontconfig-2.4.2/fc-arch/Makefile.am.orig	2007-06-24 07:02:54.000000000 +0200
-+++ fontconfig-2.4.2/fc-arch/Makefile.am	2007-06-24 07:05:14.000000000 +0200
-@@ -23,10 +23,16 @@
- #
- 
- CC = @CC_FOR_BUILD@
-+LD = @CC_FOR_BUILD@
-+AM_CPPFLAGS =
-+AM_CFLAGS = @CFLAGS_FOR_BUILD@
-+AM_LDFLAGS = @LDFLAGS_FOR_BUILD@
- EXEEXT = @EXEEXT_FOR_BUILD@
--LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
-+COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
-+	$(AM_CFLAGS)
-+LINK = $(LD) $(AM_CFLAGS) $(AM_LDFLAGS) -o $@
- 
--INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(FREETYPE_CFLAGS) $(WARN_CFLAGS)
-+INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
- 
- TMPL=fcarch.tmpl.h
- STMPL=${top_srcdir}/fc-arch/fcarch.tmpl.h

Deleted: trunk/buildroot/package/fontconfig/libdir-la.patch
===================================================================
--- trunk/buildroot/package/fontconfig/libdir-la.patch	2008-03-06 18:09:12 UTC (rev 21191)
+++ trunk/buildroot/package/fontconfig/libdir-la.patch	2008-03-06 18:09:37 UTC (rev 21192)
@@ -1,77 +0,0 @@
---- fontconfig/ltmain.sh.orig	2006-04-20 08:27:27.000000000 -0600
-+++ fontconfig/ltmain.sh	2007-01-13 14:26:01.000000000 -0700
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

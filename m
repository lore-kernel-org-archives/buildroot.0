From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 28 Jun 2007 07:03:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fontconfig
Message-ID: <20070628140305.01297A45EA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-28 07:03:04 -0700 (Thu, 28 Jun 2007)
New Revision: 18963

Log:
- fix building the utilities that are ment to be run on the _HOST_ (Julien Letessier)


Added:
   trunk/buildroot/package/fontconfig/host-tools.patch

Modified:
   trunk/buildroot/package/fontconfig/fc-lang.patch
   trunk/buildroot/package/fontconfig/fontconfig.mk


Changeset:
Modified: trunk/buildroot/package/fontconfig/fc-lang.patch
===================================================================
--- trunk/buildroot/package/fontconfig/fc-lang.patch	2007-06-28 13:51:07 UTC (rev 18962)
+++ trunk/buildroot/package/fontconfig/fc-lang.patch	2007-06-28 14:03:04 UTC (rev 18963)
@@ -1,21 +1,3 @@
---- /tmp/Makefile.am	2006-04-25 15:47:49.313035880 +0200
-+++ fontconfig-2.3.94/fc-lang/Makefile.am	2006-04-25 15:48:22.807943880 +0200
-@@ -31,6 +31,7 @@
- TMPL=fclang.tmpl.h
- STMPL=${top_srcdir}/fc-lang/fclang.tmpl.h
- TARG=fclang.h
-+FC_LANG=./fc-lang
- 
- noinst_PROGRAMS=fc-lang
- 
-@@ -44,6 +45,6 @@
- 
- $(TARG):$(ORTH) fc-lang${EXEEXT} $(STMPL)
- 	rm -f $(TARG)
--	./fc-lang${EXEEXT} -d ${srcdir} $(ORTH) < $(STMPL) > $(TARG)
-+	$(FC_LANG)${EXEEXT} -d ${srcdir} $(ORTH) < $(STMPL) > $(TARG)
- 
- CLEANFILES=$(TARG)
 --- fontconfig-2.4.2/fc-lang/fc-lang.orig.c	2007-02-03 13:39:49.000000000 -0700
 +++ fontconfig-2.4.2/fc-lang/fc-lang.c	2007-02-03 13:46:08.000000000 -0700
 @@ -116,6 +116,20 @@

Modified: trunk/buildroot/package/fontconfig/fontconfig.mk
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig.mk	2007-06-28 13:51:07 UTC (rev 18962)
+++ trunk/buildroot/package/fontconfig/fontconfig.mk	2007-06-28 14:03:04 UTC (rev 18963)
@@ -27,15 +27,15 @@
 			$(FONTCONFIG_DIR)/$$dir/Makefile.in; \
 	done
 	$(CONFIG_UPDATE) $(FONTCONFIG_DIR)
-	touch $(FONTCONFIG_DIR)/.unpacked
+	touch $@
 
 $(FONTCONFIG_DIR)/.configured: $(FONTCONFIG_DIR)/.unpacked
-	(cd $(FONTCONFIG_DIR); \
+	(cd $(FONTCONFIG_DIR); rm -rf config.cache ; \
+		$(AUTORECONF) && \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
-	BUILD_CFLAGS="-O2 -I$(FREETYPE_HOST_DIR)/include/freetype2 -I$(FREETYPE_HOST_DIR)/include" \
-	ac_cv_func_mmap_fixed_mapped=yes \
-	./configure \
+		CFLAGS_FOR_BUILD="-I$(FREETYPE_HOST_DIR)/include/freetype2 -I$(FREETYPE_HOST_DIR)/include" \
+		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
@@ -44,41 +44,42 @@
 		--exec-prefix=/usr \
 		--bindir=/usr/bin \
 		--sbindir=/usr/sbin \
-		--libdir=/lib \
+		--libdir=/usr/lib \
 		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
+		--includedir=/usr/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--with-freetype-config="$(STAGING_DIR)/usr/bin/freetype-config" \
 		--disable-docs \
-	);
-	touch $(FONTCONFIG_DIR)/.configured
+	)
+	touch $@
 
 $(FONTCONFIG_DIR)/.compiled: $(FONTCONFIG_DIR)/.configured
 	$(MAKE) -C $(FONTCONFIG_DIR)
-	touch $(FONTCONFIG_DIR)/.compiled
+	touch $@
 
-$(STAGING_DIR)/lib/libfontconfig.so: $(FONTCONFIG_DIR)/.compiled
+$(STAGING_DIR)/usr/lib/libfontconfig.so: $(FONTCONFIG_DIR)/.compiled
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(FONTCONFIG_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libfontconfig.la
-	touch -c $(STAGING_DIR)/lib/libfontconfig.so
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libfontconfig.la
+	touch -c $@
 
-$(TARGET_DIR)/lib/libfontconfig.so: $(STAGING_DIR)/lib/libfontconfig.so
-	cp -dpf $(STAGING_DIR)/lib/libfontconfig.so* $(TARGET_DIR)/lib/
+$(TARGET_DIR)/usr/lib/libfontconfig.so: $(STAGING_DIR)/usr/lib/libfontconfig.so
+	cp -dpf $(STAGING_DIR)/usr/lib/libfontconfig.so* $(TARGET_DIR)/usr/lib/
 	mkdir -p $(TARGET_DIR)/etc/fonts
 	cp $(STAGING_DIR)/etc/fonts/fonts.conf $(TARGET_DIR)/etc/fonts/
-	-$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libfontconfig.so
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libfontconfig.so
 	mkdir -p $(TARGET_DIR)/var/cache/fontconfig
 	mkdir -p $(TARGET_DIR)/usr/bin
 	cp -a $(STAGING_DIR)/usr/bin/fc-cache $(TARGET_DIR)/usr/bin/
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/fc-cache
 	cp -a $(STAGING_DIR)/usr/bin/fc-list $(TARGET_DIR)/usr/bin/
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/fc-list
+	touch -c $@
 
-fontconfig: uclibc freetype host-freetype expat $(TARGET_DIR)/lib/libfontconfig.so
+fontconfig: uclibc freetype host-freetype expat $(TARGET_DIR)/usr/lib/libfontconfig.so
 
 fontconfig-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(FONTCONFIG_DIR) uninstall

Added: trunk/buildroot/package/fontconfig/host-tools.patch
===================================================================
--- trunk/buildroot/package/fontconfig/host-tools.patch	                        (rev 0)
+++ trunk/buildroot/package/fontconfig/host-tools.patch	2007-06-28 14:03:04 UTC (rev 18963)
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

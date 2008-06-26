From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 26 Jun 2008 07:04:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fontconfig
Message-ID: <20080626140441.3A3983C669@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-26 07:04:39 -0700 (Thu, 26 Jun 2008)
New Revision: 22519

Log:
fontconfig: bump version


Removed:
   trunk/buildroot/package/fontconfig/fontconfig-2.4.2-fc-lang.patch
   trunk/buildroot/package/fontconfig/fontconfig-2.4.2-host-tools.patch

Modified:
   trunk/buildroot/package/fontconfig/fontconfig.mk


Changeset:
Deleted: trunk/buildroot/package/fontconfig/fontconfig-2.4.2-fc-lang.patch
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig-2.4.2-fc-lang.patch	2008-06-26 14:04:30 UTC (rev 22518)
+++ trunk/buildroot/package/fontconfig/fontconfig-2.4.2-fc-lang.patch	2008-06-26 14:04:39 UTC (rev 22519)
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

Deleted: trunk/buildroot/package/fontconfig/fontconfig-2.4.2-host-tools.patch
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig-2.4.2-host-tools.patch	2008-06-26 14:04:30 UTC (rev 22518)
+++ trunk/buildroot/package/fontconfig/fontconfig-2.4.2-host-tools.patch	2008-06-26 14:04:39 UTC (rev 22519)
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

Modified: trunk/buildroot/package/fontconfig/fontconfig.mk
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig.mk	2008-06-26 14:04:30 UTC (rev 22518)
+++ trunk/buildroot/package/fontconfig/fontconfig.mk	2008-06-26 14:04:39 UTC (rev 22519)
@@ -3,7 +3,7 @@
 # fontconfig
 #
 #############################################################
-FONTCONFIG_VERSION = 2.4.2
+FONTCONFIG_VERSION = 2.6.0
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.gz
 FONTCONFIG_SITE = http://fontconfig.org/release
 FONTCONFIG_AUTORECONF = NO
@@ -14,17 +14,12 @@
 
 FONTCONFIG_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) --with-arch=$(GNU_TARGET_NAME) \
-		--prefix=/usr --exec-prefix=/usr \
-		--bindir=/usr/bin --sbindir=/usr/sbin \
-		--libdir=/usr/lib --libexecdir=/usr/lib \
-		--sysconfdir=/etc --datadir=/usr/share \
-		--localstatedir=/var --includedir=/usr/include \
-		--mandir=/usr/man --infodir=/usr/info \
+		--prefix=/usr --sysconfdir=/etc \
 		--with-freetype-config="$(STAGING_DIR)/usr/bin/freetype-config" \
 		--with-expat="$(STAGING_DIR)/usr/lib" \
 		--with-expat-lib=$(STAGING_DIR)/usr/lib \
 		--with-expat-includes=$(STAGING_DIR)/usr/include \
-		--disable-docs 
+		--disable-docs
 
 FONTCONFIG_DEPENDENCIES = uclibc freetype expat
 

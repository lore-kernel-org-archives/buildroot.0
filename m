From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Remove obsolete liblbxutil
Message-ID: <20100308133618.5D56B776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d8805fdb990f08727c1ae4f8999b56a305dd5b51
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/Config.in                            |    1 -
 package/x11r7/xlib_liblbxutil/Config.in            |    6 ---
 .../xlib_liblbxutil-1.0.1-mk3gstates-nocc.patch    |   46 --------------------
 package/x11r7/xlib_liblbxutil/xlib_liblbxutil.mk   |   15 ------
 4 files changed, 0 insertions(+), 68 deletions(-)
 delete mode 100644 package/x11r7/xlib_liblbxutil/Config.in
 delete mode 100644 package/x11r7/xlib_liblbxutil/xlib_liblbxutil-1.0.1-mk3gstates-nocc.patch
 delete mode 100644 package/x11r7/xlib_liblbxutil/xlib_liblbxutil.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 25cc455..9a5a564 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -82,7 +82,6 @@ endmenu
 		source package/x11r7/xlib_libXxf86vm/Config.in
 		source package/x11r7/xlib_libdmx/Config.in
 		source package/x11r7/xlib_libfontenc/Config.in
-		source package/x11r7/xlib_liblbxutil/Config.in
 		source package/x11r7/xlib_liboldX/Config.in
 		source package/x11r7/xlib_libxkbfile/Config.in
 		source package/x11r7/xlib_libxkbui/Config.in
diff --git a/package/x11r7/xlib_liblbxutil/Config.in b/package/x11r7/xlib_liblbxutil/Config.in
deleted file mode 100644
index 826abf9..0000000
--- a/package/x11r7/xlib_liblbxutil/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XLIB_LIBLBXUTIL
-	bool "liblbxutil"
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	help
-	  liblbxutil 1.0.1
-	  X.Org lbxutil library
diff --git a/package/x11r7/xlib_liblbxutil/xlib_liblbxutil-1.0.1-mk3gstates-nocc.patch b/package/x11r7/xlib_liblbxutil/xlib_liblbxutil-1.0.1-mk3gstates-nocc.patch
deleted file mode 100644
index 3cd582c..0000000
--- a/package/x11r7/xlib_liblbxutil/xlib_liblbxutil-1.0.1-mk3gstates-nocc.patch
+++ /dev/null
@@ -1,46 +0,0 @@
---- a/src/Makefile.in.orig	2008-01-30 11:01:59.000000000 -0500
-+++ b/src/Makefile.in	2008-01-30 11:03:59.000000000 -0500
-@@ -76,8 +76,11 @@ LTCOMPILE = $(LIBTOOL) --tag=CC --mode=c
- 	$(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) \
- 	$(AM_CFLAGS) $(CFLAGS)
- CCLD = $(CC)
-+HOST_CC = gcc
- LINK = $(LIBTOOL) --tag=CC --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) \
- 	$(AM_LDFLAGS) $(LDFLAGS) -o $@
-+mkg3states_LINK = $(HOST_CC) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) \
-+	$(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
- SOURCES = $(liblbxutil_la_SOURCES) $(nodist_liblbxutil_la_SOURCES) \
- 	$(mkg3states_SOURCES)
- DIST_SOURCES = $(liblbxutil_la_SOURCES) $(mkg3states_SOURCES)
-@@ -282,7 +285,7 @@ clean-noinstPROGRAMS:
- 	done
- mkg3states$(EXEEXT): $(mkg3states_OBJECTS) $(mkg3states_DEPENDENCIES) 
- 	@rm -f mkg3states$(EXEEXT)
--	$(LINK) $(mkg3states_LDFLAGS) $(mkg3states_OBJECTS) $(mkg3states_LDADD) $(LIBS)
-+	$(mkg3states_LINK) $(mkg3states_LDFLAGS) $(mkg3states_OBJECTS) $(mkg3states_LDADD) $(LIBS)
- 
- mostlyclean-compile:
- 	-rm -f *.$(OBJEXT)
-@@ -386,18 +389,18 @@ lbxdelta.lo: $(srcdir)/delta/lbxdelta.c
- @am__fastdepCC_FALSE@	$(LIBTOOL) --tag=CC --mode=compile $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o lbxdelta.lo `test -f '$(srcdir)/delta/lbxdelta.c' || echo '$(srcdir)/'`$(srcdir)/delta/lbxdelta.c
- 
- mkg3states.o: $(srcdir)/image/mkg3states.c
-- at am__fastdepCC_TRUE@	if $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT mkg3states.o -MD -MP -MF "$(DEPDIR)/mkg3states.Tpo" -c -o mkg3states.o `test -f '$(srcdir)/image/mkg3states.c' || echo '$(srcdir)/'`$(srcdir)/image/mkg3states.c; \
-+ at am__fastdepCC_TRUE@	if $(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) -MT mkg3states.o -MD -MP -MF "$(DEPDIR)/mkg3states.Tpo" -c -o mkg3states.o `test -f '$(srcdir)/image/mkg3states.c' || echo '$(srcdir)/'`$(srcdir)/image/mkg3states.c; \
- @am__fastdepCC_TRUE@	then mv -f "$(DEPDIR)/mkg3states.Tpo" "$(DEPDIR)/mkg3states.Po"; else rm -f "$(DEPDIR)/mkg3states.Tpo"; exit 1; fi
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='$(srcdir)/image/mkg3states.c' object='mkg3states.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o mkg3states.o `test -f '$(srcdir)/image/mkg3states.c' || echo '$(srcdir)/'`$(srcdir)/image/mkg3states.c
-+ at am__fastdepCC_FALSE@	$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) -c -o mkg3states.o `test -f '$(srcdir)/image/mkg3states.c' || echo '$(srcdir)/'`$(srcdir)/image/mkg3states.c
- 
- mkg3states.obj: $(srcdir)/image/mkg3states.c
-- at am__fastdepCC_TRUE@	if $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT mkg3states.obj -MD -MP -MF "$(DEPDIR)/mkg3states.Tpo" -c -o mkg3states.obj `if test -f '$(srcdir)/image/mkg3states.c'; then $(CYGPATH_W) '$(srcdir)/image/mkg3states.c'; else $(CYGPATH_W) '$(srcdir)/$(srcdir)/image/mkg3states.c'; fi`; \
-+ at am__fastdepCC_TRUE@	if $(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) -MT mkg3states.obj -MD -MP -MF "$(DEPDIR)/mkg3states.Tpo" -c -o mkg3states.obj `if test -f '$(srcdir)/image/mkg3states.c'; then $(CYGPATH_W) '$(srcdir)/image/mkg3states.c'; else $(CYGPATH_W) '$(srcdir)/$(srcdir)/image/mkg3states.c'; fi`; \
- @am__fastdepCC_TRUE@	then mv -f "$(DEPDIR)/mkg3states.Tpo" "$(DEPDIR)/mkg3states.Po"; else rm -f "$(DEPDIR)/mkg3states.Tpo"; exit 1; fi
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='$(srcdir)/image/mkg3states.c' object='mkg3states.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
-- at am__fastdepCC_FALSE@	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o mkg3states.obj `if test -f '$(srcdir)/image/mkg3states.c'; then $(CYGPATH_W) '$(srcdir)/image/mkg3states.c'; else $(CYGPATH_W) '$(srcdir)/$(srcdir)/image/mkg3states.c'; fi`
-+ at am__fastdepCC_FALSE@	$(HOST_CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) -c -o mkg3states.obj `if test -f '$(srcdir)/image/mkg3states.c'; then $(CYGPATH_W) '$(srcdir)/image/mkg3states.c'; else $(CYGPATH_W) '$(srcdir)/$(srcdir)/image/mkg3states.c'; fi`
- 
- mostlyclean-libtool:
- 	-rm -f *.lo
diff --git a/package/x11r7/xlib_liblbxutil/xlib_liblbxutil.mk b/package/x11r7/xlib_liblbxutil/xlib_liblbxutil.mk
deleted file mode 100644
index a007b8e..0000000
--- a/package/x11r7/xlib_liblbxutil/xlib_liblbxutil.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xlib_liblbxutil -- X.Org lbxutil library
-#
-################################################################################
-
-XLIB_LIBLBXUTIL_VERSION = 1.0.1
-XLIB_LIBLBXUTIL_SOURCE = liblbxutil-$(XLIB_LIBLBXUTIL_VERSION).tar.bz2
-XLIB_LIBLBXUTIL_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBLBXUTIL_AUTORECONF = NO
-XLIB_LIBLBXUTIL_INSTALL_STAGING = YES
-XLIB_LIBLBXUTIL_DEPENDENCIES = xproto_xextproto
-XLIB_LIBLBXUTIL_CONF_OPT = --enable-shared --disable-static
-
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_liblbxutil))
-- 
1.6.3.3

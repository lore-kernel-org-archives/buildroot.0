From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Tue,  6 Feb 2007 10:17:08 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: dbus-glib gettext
	hal
Message-ID: <20070206181708.E7ABE48633@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-02-06 10:17:08 -0800 (Tue, 06 Feb 2007)
New Revision: 17798

Log:
Fix building of gettext/libintl when using an external toolchain.


Added:
   trunk/buildroot/package/dbus-glib/dbus-glib-libintl.patch
   trunk/buildroot/package/hal/hal06-libintl.patch

Modified:
   trunk/buildroot/package/gettext/gettext.mk


Changeset:
Added: trunk/buildroot/package/dbus-glib/dbus-glib-libintl.patch
===================================================================
--- trunk/buildroot/package/dbus-glib/dbus-glib-libintl.patch	                        (rev 0)
+++ trunk/buildroot/package/dbus-glib/dbus-glib-libintl.patch	2007-02-06 18:17:08 UTC (rev 17798)
@@ -0,0 +1,12 @@
+diff -ur dbus-glib-0.72/dbus/Makefile.in dbus-glib-0.72-patched/dbus/Makefile.in
+--- dbus-glib-0.72/dbus/Makefile.in	2006-10-25 16:14:31.000000000 -0500
++++ dbus-glib-0.72-patched/dbus/Makefile.in	2007-01-17 08:37:22.000000000 -0600
+@@ -493,7 +493,7 @@
+ 	done
+ dbus-binding-tool$(EXEEXT): $(dbus_binding_tool_OBJECTS) $(dbus_binding_tool_DEPENDENCIES) 
+ 	@rm -f dbus-binding-tool$(EXEEXT)
+-	$(LINK) $(dbus_binding_tool_LDFLAGS) $(dbus_binding_tool_OBJECTS) $(dbus_binding_tool_LDADD) $(LIBS)
++	$(LINK) $(dbus_binding_tool_LDFLAGS) $(dbus_binding_tool_OBJECTS) $(dbus_binding_tool_LDADD) $(LIBS) $(INTLLIBS)
+ dbus-glib-test$(EXEEXT): $(dbus_glib_test_OBJECTS) $(dbus_glib_test_DEPENDENCIES) 
+ 	@rm -f dbus-glib-test$(EXEEXT)
+ 	$(LINK) $(dbus_glib_test_LDFLAGS) $(dbus_glib_test_OBJECTS) $(dbus_glib_test_LDADD) $(LIBS)

Modified: trunk/buildroot/package/gettext/gettext.mk
===================================================================
--- trunk/buildroot/package/gettext/gettext.mk	2007-02-06 18:12:22 UTC (rev 17797)
+++ trunk/buildroot/package/gettext/gettext.mk	2007-02-06 18:17:08 UTC (rev 17798)
@@ -21,6 +21,10 @@
 	toolchain/patch-kernel.sh $(GETTEXT_DIR) package/gettext/ gettext\*.patch
 	touch $(GETTEXT_DIR)/.unpacked
 
+ifeq ($(strip $(BR2_TOOLCHAIN_EXTERNAL)),y)
+IGNORE_EXTERNAL_GETTEXT:=--with-included-gettext
+endif
+
 $(GETTEXT_DIR)/.configured: $(GETTEXT_DIR)/.unpacked
 	(cd $(GETTEXT_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
@@ -95,6 +99,7 @@
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--disable-libasprintf \
+		$(IGNORE_EXTERNAL_GETTEXT) \
 	);
 	touch $(GETTEXT_DIR)/.configured
 

Added: trunk/buildroot/package/hal/hal06-libintl.patch
===================================================================
--- trunk/buildroot/package/hal/hal06-libintl.patch	                        (rev 0)
+++ trunk/buildroot/package/hal/hal06-libintl.patch	2007-02-06 18:17:08 UTC (rev 17798)
@@ -0,0 +1,24 @@
+diff -ur hal-0.5.8/hald/Makefile.in hal-0.5.8-patched/hald/Makefile.in
+--- hal-0.5.8/hald/Makefile.in	2006-09-11 18:25:30.000000000 -0500
++++ hal-0.5.8-patched/hald/Makefile.in	2007-01-17 08:54:04.000000000 -0600
+@@ -336,7 +336,7 @@
+ 	osspec.h							\
+ 	property.h			property.c			
+ 
+-hald_LDADD = @GLIB_LIBS@ @DBUS_LIBS@ -lm @EXPAT_LIB@ $(top_builddir)/hald/$(HALD_BACKEND)/libhald_$(HALD_BACKEND).la
++hald_LDADD = @GLIB_LIBS@ @DBUS_LIBS@ -lm @EXPAT_LIB@ @INTLLIBS@ $(top_builddir)/hald/$(HALD_BACKEND)/libhald_$(HALD_BACKEND).la
+ 
+ #### Init scripts fun
+ SCRIPT_IN_FILES = haldaemon.in
+diff -ur hal-0.5.8/hald-runner/Makefile.in hal-0.5.8-patched/hald-runner/Makefile.in
+--- hal-0.5.8/hald-runner/Makefile.in	2006-09-11 18:25:30.000000000 -0500
++++ hal-0.5.8-patched/hald-runner/Makefile.in	2007-01-17 08:54:18.000000000 -0600
+@@ -303,7 +303,7 @@
+ 	@DBUS_CFLAGS@ @GLIB_CFLAGS@
+ 
+ hald_runner_SOURCES = main.c runner.c runner.h utils.h utils.c
+-hald_runner_LDADD = @GLIB_LIBS@ @DBUS_LIBS@
++hald_runner_LDADD = @GLIB_LIBS@ @DBUS_LIBS@ @INTLLIBS@
+ all: all-am
+ 
+ .SUFFIXES:

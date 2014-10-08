From: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Date: Wed,  8 Oct 2014 22:38:12 +0200
Subject: [Buildroot] [PATCH] squidguard: new package
Message-ID: <1412800692-17755-1-git-send-email-guillaume.gardet@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>

---
 package/Config.in                                  |   1 +
 package/squidguard/Config.in                       |  24 +++++
 package/squidguard/fix-for-db5.patch               |  11 ++
 package/squidguard/squidGuard-CVE-2009-3700.patch  |  46 +++++++++
 package/squidguard/squidGuard-CVE-2009-3826.patch  |  26 +++++
 package/squidguard/squidGuard-Makefile.patch       | 115 +++++++++++++++++++++
 package/squidguard/squidGuard.conf                 |  20 ++++
 .../squidguard/squidguard-1.4-cross-compile.patch  |  38 +++++++
 package/squidguard/squidguard.mk                   |  41 ++++++++
 9 files changed, 322 insertions(+)
 create mode 100644 package/squidguard/Config.in
 create mode 100644 package/squidguard/fix-for-db5.patch
 create mode 100644 package/squidguard/squidGuard-CVE-2009-3700.patch
 create mode 100644 package/squidguard/squidGuard-CVE-2009-3826.patch
 create mode 100644 package/squidguard/squidGuard-Makefile.patch
 create mode 100644 package/squidguard/squidGuard.conf
 create mode 100644 package/squidguard/squidguard-1.4-cross-compile.patch
 create mode 100644 package/squidguard/squidguard.mk

diff --git a/package/Config.in b/package/Config.in
index ea89c96..9c1f282 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1083,6 +1083,7 @@ endif
 	source "package/spice/Config.in"
 	source "package/spice-protocol/Config.in"
 	source "package/squid/Config.in"
+	source "package/squidguard/Config.in"
 	source "package/sshpass/Config.in"
 	source "package/strongswan/Config.in"
 	source "package/stunnel/Config.in"
diff --git a/package/squidguard/Config.in b/package/squidguard/Config.in
new file mode 100644
index 0000000..8d3c28e
--- /dev/null
+++ b/package/squidguard/Config.in
@@ -0,0 +1,24 @@
+comment "squidguards needs Squid"
+	depends on !BR2_PACKAGE_SQUID
+
+config BR2_PACKAGE_SQUIDGUARD
+	bool "squidguard"
+	select BR2_PACKAGE_BISON
+	select BR2_PACKAGE_FLEX
+	select BR2_PACKAGE_BERKELEYDB
+	depends on BR2_PACKAGE_SQUID
+	help
+	  SquidGuard is a free (GPL), flexible and ultra-fast filter,
+	  redirector, and access controller plugin for squid.
+
+	  http://www.squidguard.org/
+
+if BR2_PACKAGE_SQUIDGUARD
+	config BR2_PACKAGE_SQUIDGUARD_DEFAULT_CONF
+	bool "squidguard default blacklists and configuration"
+	help
+	  Add default blacklists provided by squidGuard and associated
+	  configuration file.
+
+	  http://www.squidguard.org/
+endif
diff --git a/package/squidguard/fix-for-db5.patch b/package/squidguard/fix-for-db5.patch
new file mode 100644
index 0000000..29fd19b
--- /dev/null
+++ b/package/squidguard/fix-for-db5.patch
@@ -0,0 +1,11 @@
+--- a/src/sgDb.c.orig	2014-07-23 13:10:54.335454387 +0200
++++ b/src/sgDb.c	2014-07-23 13:14:15.167901834 +0200
+@@ -114,7 +114,7 @@ void sgDbInit(Db, file)
+     }
+   }
+ #endif
+-#if DB_VERSION_MAJOR == 4
++#if DB_VERSION_MAJOR >= 4
+   if(globalUpdate || createdb || (dbfile != NULL && stat(dbfile,&st))){
+     flag = DB_CREATE;
+     if(createdb)
diff --git a/package/squidguard/squidGuard-CVE-2009-3700.patch b/package/squidguard/squidGuard-CVE-2009-3700.patch
new file mode 100644
index 0000000..d370787
--- /dev/null
+++ b/package/squidguard/squidGuard-CVE-2009-3700.patch
@@ -0,0 +1,46 @@
+Index: squidGuard-1.4/src/sgLog.c
+===================================================================
+--- squidGuard-1.4.orig/src/sgLog.c	2007-11-16 17:58:32.000000000 +0100
++++ squidGuard-1.4/src/sgLog.c	2010-07-29 13:47:50.000000000 +0200
+@@ -2,7 +2,7 @@
+   By accepting this notice, you agree to be bound by the following
+   agreements:
+   
+-  This software product, squidGuard, is copyrighted (C) 1998-2007
++  This software product, squidGuard, is copyrighted (C) 1998-2009
+   by Christine Kronberg, Shalla Secure Services. All rights reserved.
+  
+   This program is free software; you can redistribute it and/or modify it
+@@ -55,8 +55,8 @@ void sgLog(log, format, va_alist)
+   char msg[MAX_BUF];
+   va_list ap;
+   VA_START(ap, format);
+-  if(vsprintf(msg, format, ap) > (MAX_BUF - 1)) 
+-    fprintf(stderr,"overflow in vsprintf (sgLog): %s",strerror(errno));
++  if(vsnprintf(msg, MAX_BUF, format, ap) > (MAX_BUF - 1)) 
++    fprintf(stderr,"overflow in vsnprintf (sgLog): %s",strerror(errno));
+   va_end(ap);
+   date = niso(0);
+   if(globalDebug || log == NULL) {
+@@ -87,8 +87,8 @@ void sgLogError(format, va_alist)
+   char msg[MAX_BUF];
+   va_list ap;
+   VA_START(ap, format);
+-  if(vsprintf(msg, format, ap) > (MAX_BUF - 1)) 
+-    sgLogFatalError("overflow in vsprintf (sgLogError): %s",strerror(errno));
++  if(vsnprintf(msg, MAX_BUF, format, ap) > (MAX_BUF - 1)) 
++    sgLog(globalErrorLog, "overflow in vsnprintf (sgLogError): %s",strerror(errno));
+   va_end(ap);
+   sgLog(globalErrorLog,"%s",msg);
+ }
+@@ -104,8 +104,8 @@ void sgLogFatalError(format, va_alist)
+   char msg[MAX_BUF];
+   va_list ap;
+   VA_START(ap, format);
+-  if(vsprintf(msg, format, ap) > (MAX_BUF - 1)) 
+-    return;
++  if(vsnprintf(msg, MAX_BUF, format, ap) > (MAX_BUF - 1)) 
++    sgLog(globalErrorLog, "overflow in vsnprintf (sgLogError): %s",strerror(errno));
+   va_end(ap);
+   sgLog(globalErrorLog,"%s",msg);
+   sgEmergency();
diff --git a/package/squidguard/squidGuard-CVE-2009-3826.patch b/package/squidguard/squidGuard-CVE-2009-3826.patch
new file mode 100644
index 0000000..8d2b623
--- /dev/null
+++ b/package/squidguard/squidGuard-CVE-2009-3826.patch
@@ -0,0 +1,26 @@
+Index: squidGuard-1.4/src/sg.h.in
+===================================================================
+--- squidGuard-1.4.orig/src/sg.h.in
++++ squidGuard-1.4/src/sg.h.in
+@@ -73,7 +73,7 @@ int tolower();
+ #define REQUEST_TYPE_REDIRECT   2
+ #define REQUEST_TYPE_PASS       3
+ 
+-#define MAX_BUF 4096
++#define MAX_BUF 12288
+ 
+ #define DEFAULT_LOGFILE "squidGuard.log"
+ #define WARNING_LOGFILE "squidGuard.log"
+Index: squidGuard-1.4/src/sgDiv.c.in
+===================================================================
+--- squidGuard-1.4.orig/src/sgDiv.c.in
++++ squidGuard-1.4/src/sgDiv.c.in
+@@ -745,7 +745,7 @@ char *sgParseRedirect(redirect, req, acl
+       p++;
+       break;
+     case 'u': /* Requested URL */
+-      strcat(buf, req->orig);
++      strncat(buf, req->orig, 2048);
+       p++;
+       break;
+     default:
diff --git a/package/squidguard/squidGuard-Makefile.patch b/package/squidguard/squidGuard-Makefile.patch
new file mode 100644
index 0000000..650baa2
--- /dev/null
+++ b/package/squidguard/squidGuard-Makefile.patch
@@ -0,0 +1,115 @@
+Index: Makefile.in
+===================================================================
+--- a/Makefile.in.orig
++++ b/Makefile.in
+@@ -15,9 +15,9 @@ LIBS = @LIBS@
+ RM = rm -f
+ MKINSTALLDIRS = mkdir -p
+ 
+-prefix = @prefix@
+-exec_prefix = @exec_prefix@
+-bindir = $(exec_prefix)/bin
++prefix = $(DESTDIR)@prefix@
++exec_prefix = $(DESTDIR)@exec_prefix@
++bindir = @bindir@
+ infodir = $(prefix)/info
+ logdir = @sg_logdir@
+ configfile = @sg_config@
+@@ -47,34 +47,28 @@ install:	install-build install-conf
+ 
+ install-conf:
+ 	@echo Installing configuration file  ;
+-	@if [ ! -d $(prefix)/squidGuard ]; then \
+-		$(MKINSTALLDIRS) $(prefix)/squidGuard ; \
+-		echo Created directory $(prefix)/squidGuard ; \
+-		chown -R $(SQUIDUSER) $(prefix)/squidGuard || exit 1  ; \
+-		echo Assigned $(prefix)/squidGuard to user $(SQUIDUSER) ; \
++	@if [ ! -d $(DESTDIR)$(prefix)/squidGuard ]; then \
++		$(MKINSTALLDIRS) $(DESTDIR)$(prefix)/squidGuard ; \
++		echo Created directory $(DESTDIR)$(prefix)/squidGuard ; \
+ 	fi ; 
+-	@if [ ! -d $(dbhomedir) ]; then \
+-		$(MKINSTALLDIRS) $(dbhomedir) ; \
+-		echo Created directory $(dbhomedir) ; \
+-		chown -R $(SQUIDUSER) $(dbhomedir) || exit 1 ; \
+-		echo Assigned $(dbhomedir) to user $(SQUIDUSER) ; \
++	@if [ ! -d $(DESTDIR)$(dbhomedir) ]; then \
++		$(MKINSTALLDIRS) $(DESTDIR)$(dbhomedir) ; \
++		echo Created directory $(DESTDIR)$(dbhomedir) ; \
+ 	fi ; 
+-	@if [ ! -d $(logdir) ]; then \
+-		$(MKINSTALLDIRS) $(logdir) ; \
+-		echo Created directory $(logdir) ; \
+-		chown -R $(SQUIDUSER) $(logdir) || exit 1 ; \
+-		echo Assigned $(logdir) to user $(SQUIDUSER) ; \
++	@if [ ! -d $(DESTDIR)$(logdir) ]; then \
++		$(MKINSTALLDIRS) $(DESTDIR)$(logdir) ; \
++		echo Created directory $(DESTDIR)$(logdir) ; \
+ 	fi ; 
+-	@if [ ! -d `dirname $(configfile)` ]; then \
++	@if [ ! -d `dirname $(DESTDIR)$(configfile)` ]; then \
+ 		umask 022 ; \
+-		mkdir -p `dirname $(configfile)` ; \
+-		echo No configuration directory found. Created `dirname $(configfile)`. ; \
++		mkdir -p `dirname $(DESTDIR)$(configfile)` ; \
++		echo No configuration directory found. Created `dirname $(DESTDIR)$(configfile)`. ; \
+ 	fi;
+-	@if test ! -f $(configfile); then \
+-		cp samples/sample.conf $(configfile) || exit 1  ; \
++	@if test ! -f $(DESTDIR)$(configfile); then \
++		cp samples/sample.conf $(DESTDIR)$(configfile) || exit 1  ; \
+ 		echo Copied sample squidGuard.conf ; \
+-		chmod 644 $(configfile) || exit 1 ; \
+-		echo $(configfile) is now readable ; \
++		chmod 644 $(DESTDIR)$(configfile) || exit 1 ; \
++		echo $(DESTDIR)$(configfile) is now readable ; \
+ 		echo The initial configuration is complete. ; \
+ 	else \
+ 		echo Configuration file found. Not changing anything ; \
+@@ -84,7 +78,7 @@ install-conf:
+ 	@echo ;
+ 
+ install-build:
+-	@echo Installing squidGuard 
++	@echo Installing squidGuard in $(bindir) 
+ 	@if [ ! -d $(bindir) ]; then \
+ 		$(MKINSTALLDIRS) $(bindir) ; \
+ 	fi ; \
+Index: src/Makefile.in
+===================================================================
+--- a/src/Makefile.in.orig
++++ b/src/Makefile.in
+@@ -31,11 +31,11 @@ top_srcdir = @top_srcdir@
+ srcdir     = @srcdir@
+ VPATH      = @srcdir@
+ 
+-prefix	= @prefix@
+-exec_prefix = @exec_prefix@
+-bindir	= $(exec_prefix)/bin
+-logdir	= @sg_logdir@
+-cfgdir	= @sg_cfgdir@
++prefix	= $(DESTDIR)@prefix@
++exec_prefix = $(DESTDIR)@exec_prefix@
++bindir	= $(DESTDIR)@bindir@
++logdir	= $(DESTDIR)@sg_logdir@
++cfgdir	= $(DESTDIR)@sg_cfgdir@
+ infodir	= $(prefix)/info
+ 
+ OBJS	= main.o sgLog.o sgDb.o HTParse.o sgDiv.o sgFree.o y.tab.o lex.yy.o
+@@ -122,12 +122,13 @@ uninstall::	 uninstall.bin
+ 
+ install.bin:: squidGuard
+ 	@echo making $@ in `basename \`pwd\``
+-	@$(MKDIR) $(bindir) $(logdir) $(cfgdir)
+-	$(INSTALL_PROGRAM) squidGuard $(bindir)/squidGuard
++	@$(MKDIR) $(DESTDIR)$(bindir) $(DESTDIR)$(logdir) $(DESTDIR)$(cfgdir)
++	@echo installing squidGuard in $(DESTDIR)$(bindir)/squidGuard
++	$(INSTALL_PROGRAM) squidGuard $(DESTDIR)$(bindir)/squidGuard
+ 
+ uninstall.bin::
+ 	@echo making $@ in `basename \`pwd\``
+-	$(RM) $(bindir)/squidGuard
++	$(RM) $(DESTDIR)$(bindir)/squidGuard
+ 
+ update::
+ 	@echo making $@ in `basename \`pwd\``
diff --git a/package/squidguard/squidGuard.conf b/package/squidguard/squidGuard.conf
new file mode 100644
index 0000000..c2d612f
--- /dev/null
+++ b/package/squidguard/squidGuard.conf
@@ -0,0 +1,20 @@
+#
+# Default config file for squidGuard
+#
+
+dbhome /var/lib/squidGuard/db
+logdir /var/log/squidGuard
+
+
+dest blacklist {
+        domainlist      blacklist/domains
+        urllist         blacklist/urls
+        expressionlist  blacklist/expressions
+        }
+
+acl {
+        default {
+                pass !blacklist all
+                redirect http://localhost/block.html
+        }
+}
\ No newline at end of file
diff --git a/package/squidguard/squidguard-1.4-cross-compile.patch b/package/squidguard/squidguard-1.4-cross-compile.patch
new file mode 100644
index 0000000..43fced9
--- /dev/null
+++ b/package/squidguard/squidguard-1.4-cross-compile.patch
@@ -0,0 +1,38 @@
+--- a/configure.orig	2014-07-17 13:40:02.276083485 +0200
++++ b/configure	2014-07-17 13:41:04.645497630 +0200
+@@ -4602,7 +4602,7 @@ fi
+ 
+ LIBS="$LIBS -ldb"
+ if test "$cross_compiling" = yes; then
+-  db_ok_version=no
++  db_ok_version=yes
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+ 
+@@ -4671,7 +4671,7 @@ if test $db_ok_version = no; then
+ fi
+ 
+ if test "$cross_compiling" = yes; then
+-  db_ok_version=no
++  db_ok_version=yes
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+ 
+@@ -4741,7 +4741,7 @@ if test $db_ok_version = no; then
+ fi
+ 
+ if test "$cross_compiling" = yes; then
+-  dbg2_ok_version=no
++  dbg2_ok_version=yes
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+ 
+@@ -4806,7 +4806,7 @@ _ACEOF
+ fi
+ 
+ if test "$cross_compiling" = yes; then
+-  dbg3_ok_version=no
++  dbg3_ok_version=yes
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+ 
diff --git a/package/squidguard/squidguard.mk b/package/squidguard/squidguard.mk
new file mode 100644
index 0000000..d2f062f
--- /dev/null
+++ b/package/squidguard/squidguard.mk
@@ -0,0 +1,41 @@
+###############################################################################
+#
+# squidguard
+#
+###############################################################################
+
+SQUIDGUARD_VERSION = 1.4
+SQUIDGUARD_SOURCE = squidGuard-$(SQUIDGUARD_VERSION).tar.gz
+SQUIDGUARD_SITE = http://www.squidguard.org/Downloads/
+SQUIDGUARD_LICENCE = GPLv2+
+SQUIDGUARD_LICENCE_FILE = COPYING
+SQUIDGUARD_CONF_OPTS += --with-sg-config=/etc/squidGuard.conf \
+			--with-sg-logdir=/var/log/squidGuard \
+			--with-sg-dbhome=/var/lib/squidGuard/db \
+			--with-db-inc=$(STAGING_DIR)/usr/include \
+			--with-db-lib=$(STAGING_DIR)/usr/lib
+SQUIDGUARD_DEPENDENCIES = bison flex berkeleydb
+
+
+ifeq ($(BR2_PACKAGE_SQUIDGUARD_DEFAULT_CONF),y)
+
+define DEFAULT_BLACKLIST
+	$(INSTALL) -m 0644 -D $(SQUIDGUARD_DIR)/test/blacklist/domains \
+		$(TARGET_DIR)/var/lib/squidGuard/db/blacklist/domains
+	$(INSTALL) -m 0644 -D $(SQUIDGUARD_DIR)/test/blacklist/expressions \
+		$(TARGET_DIR)/var/lib/squidGuard/db/blacklist/expressions
+	$(INSTALL) -m 0644 -D $(SQUIDGUARD_DIR)/test/blacklist/urls \
+		$(TARGET_DIR)/var/lib/squidGuard/db/blacklist/urls
+endef
+
+define DEFAULT_CONF
+	$(INSTALL) -m 0644 -D package/squidguard/squidGuard.conf \
+		$(TARGET_DIR)/etc/squidGuard.conf
+endef
+
+SQUIDGUARD_POST_INSTALL_TARGET_HOOKS = DEFAULT_BLACKLIST DEFAULT_CONF
+
+endif
+
+
+$(eval $(autotools-package))
-- 
1.8.4.5

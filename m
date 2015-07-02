From: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Date: Thu,  2 Jul 2015 11:50:15 +0200
Subject: [Buildroot]  [PATCH V2] squidguard: new package
In-Reply-To: <543F9CBD.2010705@oliseo.fr>
References: <543F9CBD.2010705@oliseo.fr>
Message-ID: <1435830615-7656-1-git-send-email-guillaume.gardet@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>

---

Changes in V2:
* Remove comment on squid dependency
* Switch to 'host-' bison and flex dependencies
* Fix config line indentation
* Add git-style header to patches
* Rename patches to <pkg>-<number>-XXX.patch format
* Add missing SQUIDGUARD_ prefix in squidguard.mk
* Add one more official patch

 package/Config.in                                  |   1 +
 package/squidguard/Config.in                       |  19 ++++
 package/squidguard/squidGuard.conf                 |  20 ++++
 package/squidguard/squidguard-01-fix-for-db5.patch |  15 +++
 .../squidguard/squidguard-02-Fix_Makefile.patch    | 120 +++++++++++++++++++++
 .../squidguard/squidguard-03-cross-compile.patch   |  42 ++++++++
 .../squidguard-04-Official-patch-20091015.patch    |  65 +++++++++++
 .../squidguard-05-Official-patch-20091019.patch    |  45 ++++++++
 .../squidguard-06-Official-patch-20150201.patch    |  87 +++++++++++++++
 package/squidguard/squidguard.mk                   |  41 +++++++
 10 files changed, 455 insertions(+)
 create mode 100644 package/squidguard/Config.in
 create mode 100644 package/squidguard/squidGuard.conf
 create mode 100644 package/squidguard/squidguard-01-fix-for-db5.patch
 create mode 100644 package/squidguard/squidguard-02-Fix_Makefile.patch
 create mode 100644 package/squidguard/squidguard-03-cross-compile.patch
 create mode 100644 package/squidguard/squidguard-04-Official-patch-20091015.patch
 create mode 100644 package/squidguard/squidguard-05-Official-patch-20091019.patch
 create mode 100644 package/squidguard/squidguard-06-Official-patch-20150201.patch
 create mode 100644 package/squidguard/squidguard.mk

diff --git a/package/Config.in b/package/Config.in
index 13a7e74..da0e3a5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1295,6 +1295,7 @@ endif
 	source "package/spice/Config.in"
 	source "package/spice-protocol/Config.in"
 	source "package/squid/Config.in"
+	source "package/squidguard/Config.in"
 	source "package/sshpass/Config.in"
 	source "package/strongswan/Config.in"
 	source "package/stunnel/Config.in"
diff --git a/package/squidguard/Config.in b/package/squidguard/Config.in
new file mode 100644
index 0000000..8b06c3c
--- /dev/null
+++ b/package/squidguard/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_SQUIDGUARD
+	bool "squidguard"
+	select BR2_PACKAGE_BERKELEYDB
+	depends on BR2_PACKAGE_SQUID
+	help
+	  SquidGuard is a free (GPL), flexible and ultra-fast filter,
+	  redirector, and access controller plugin for squid.
+
+	  http://www.squidguard.org/
+
+if BR2_PACKAGE_SQUIDGUARD
+config BR2_PACKAGE_SQUIDGUARD_DEFAULT_CONF
+	bool "squidguard default blacklists and configuration"
+	help
+	  Add default blacklists provided by squidGuard and associated
+	  configuration file.
+
+	  http://www.squidguard.org/
+endif
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
diff --git a/package/squidguard/squidguard-01-fix-for-db5.patch b/package/squidguard/squidguard-01-fix-for-db5.patch
new file mode 100644
index 0000000..6600722
--- /dev/null
+++ b/package/squidguard/squidguard-01-fix-for-db5.patch
@@ -0,0 +1,15 @@
+Fix DB5 usage.
+
+Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
+
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
diff --git a/package/squidguard/squidguard-02-Fix_Makefile.patch b/package/squidguard/squidguard-02-Fix_Makefile.patch
new file mode 100644
index 0000000..3cf0866
--- /dev/null
+++ b/package/squidguard/squidguard-02-Fix_Makefile.patch
@@ -0,0 +1,120 @@
+Fix Makefiles to make use of DESTDIR.
+
+Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
+
+
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
diff --git a/package/squidguard/squidguard-03-cross-compile.patch b/package/squidguard/squidguard-03-cross-compile.patch
new file mode 100644
index 0000000..5ffb606
--- /dev/null
+++ b/package/squidguard/squidguard-03-cross-compile.patch
@@ -0,0 +1,42 @@
+Assume that DB is ok since auto-detection does not work.
+
+Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
+
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
diff --git a/package/squidguard/squidguard-04-Official-patch-20091015.patch b/package/squidguard/squidguard-04-Official-patch-20091015.patch
new file mode 100644
index 0000000..475e220
--- /dev/null
+++ b/package/squidguard/squidguard-04-Official-patch-20091015.patch
@@ -0,0 +1,65 @@
+Patch-20091015: Official patch from squidguard project: 
+http://www.squidguard.org/Downloads/Patches/1.4/squidGuard-1.4-patch-20091015.tar.gz
+
+	This patch fixes one buffer overflow problem in sgLog.c when overlong URLs
+	are requested. SquidGuard will then go into emergency mode were no blocking
+	occurs. This is not required in this situation.
+	The URLs must be build with a overlong sequence of slashes (/).
+
+	ATTENTION:  While squidGuard will no longer go into emergeny mode when one
+	overlong URL is passed to it, it is possible to use the overlong URL to
+	bypass the filter. This vulnerability is not fixed by this patch!
+	You can check if this vulnerability is actually exploited on your system
+	by checking the logfile squidGuard.log for the following warning (provided
+	you have not used the option --with-nolog=yes with configure before compiling
+	squidguard):
+
+	Warning: Possible bypass attempt. Found multiple slashes where only one is expected:
+
+
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
diff --git a/package/squidguard/squidguard-05-Official-patch-20091019.patch b/package/squidguard/squidguard-05-Official-patch-20091019.patch
new file mode 100644
index 0000000..aaab135
--- /dev/null
+++ b/package/squidguard/squidguard-05-Official-patch-20091019.patch
@@ -0,0 +1,45 @@
+Patch-20091019: Official patch from squidguard project: 
+http://www.squidguard.org/Downloads/Patches/1.4/squidGuard-1.4-patch-20091019.tar.gz
+
+	This patch fixes two bypass problems with URLs which length is close to the 
+	limit defined by MAX_BUF (default: 4096) in squidGuard and MAX_URL (default:
+	4096 in squid 2.x and 8192 in squid 3.x) in squid. For this kind of URLs the 
+	proxy request exceeds MAX_BUF causing squidGuard to complain about not being 
+	able to parse the squid request. Increasing the buffer limit to be higher than 
+	the one defined in MAX_URL solves the issue.
+
+	The second problem, too, is related to the definition of these buffer limits.
+	Once squidGuard finds the parsed URL to be candidate for blocking it return
+	the block URL defined in the squidGuard configuration. The bypass occurs when
+	the redirect URL shall contain the information about the original URL. With
+	URLs close to MAX_URL the final URL exceeds this limit because of this addi-
+	tional information. The fix truncates the originally requested URL to 2048
+	bytes.
+
+
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
diff --git a/package/squidguard/squidguard-06-Official-patch-20150201.patch b/package/squidguard/squidguard-06-Official-patch-20150201.patch
new file mode 100644
index 0000000..e3af5e8
--- /dev/null
+++ b/package/squidguard/squidguard-06-Official-patch-20150201.patch
@@ -0,0 +1,87 @@
+--- a/samples/squidGuard.cgi.in	2008-12-23 22:08:35.000000000 +0100
++++ b/samples/squidGuard.cgi.in	2015-02-01 19:43:27.000000000 +0100
+@@ -1,4 +1,4 @@
+-#! @PERL@  -w
++#! /usr/bin/perl  -w
+ #
+ # Explain to the user that the URL is blocked and by which rule set
+ #
+@@ -6,7 +6,8 @@
+ # French texts thanks to Fabrice Prigent (fabrice.prigent at univ-tlse1.fr)
+ # Dutch texts thanks to Anneke Sicherer-Roetman (sicherer at sichemsoft.nl)
+ # German texts thanks to Buergernetz Pfaffenhofen (http://www.bn-paf.de/filter/)
+-# Spanish texts thanks to Samuel Garc??a).
++# Spanish texts thanks to Samuel Garc??a.
++# Russian texts thanks to Vladimir Ipatov.
+ # Rewrite by Christine Kronberg, 2008, to enable an easier integration of
+ # other languages.
+ #
+@@ -57,21 +58,22 @@ sub showinaddr($$$$$);
+ #
+ # CONFIGURABLE OPTIONS:
+ #
+-# (Currently: "en", "fr", "de", "es", "nl", "no")
++# (Currently: "en", "fr", "de", "es", "nl", "no", "ru")
+ @supported   = (
+ 		"en (English), ",
+-		"fr (Fran?ais), ",
++		"fr (Fran&#231;ais), ",
+ 		"de (Deutsch), ",
+-		"es (Espa?ol), ",
++		"es (Espa&#241;ol), ",
+ 		"nl (Nederlands), ",
+-		"no (Norsk)."
++		"no (Norsk), ",
++		"ru (Russian)."
+ 	       );
+ #
+ # Modifiy the values below to reflect you environment
+ # The image you define with "$image" and redirect will be displayed if the unappropriate
+ # url is of the type: gif, jpg, jpeg, png, mp3, mpg, mpeg, avi or mov.
+ #
+-$image       = "/images/blocked.gif";					# RELATIVE TO DOCUMENT_ROOT
++$image       = "/Logos/md5.png";					# RELATIVE TO DOCUMENT_ROOT
+ $redirect    = "http://admin.your-domain/images/blocked.gif";		# "" TO AVOID REDIRECTION
+ $proxy       = "proxy.your-domain";					# Your proxy server
+ $proxymaster = "operator\@your-domain";					# The email of your proxy adminstrator
+@@ -142,7 +144,7 @@ sub parsequery($) {
+ }
+ 
+ #
+-# PRINT HTTP STATUS HEARER:
++# PRINT HTTP STATUS HEADER:
+ #
+ sub status($) {
+   my $status = shift;
+@@ -150,7 +152,7 @@ sub status($) {
+ }
+ 
+ #
+-# PRINT HTTP LOCATION HEARER:
++# PRINT HTTP LOCATION HEADER:
+ #
+ sub redirect($) {
+   my $location = shift;
+@@ -249,7 +251,7 @@ sub showinaddr($$$$$) {
+     status("404 Not Found");
+   }
+   if (@names) {
+-    print "Content-type: text/html\n\n";
++    print "Content-type: text/html\n\n\n";
+     print "<!DOCTYPE html PUBLIC \"-//W3C//DTD  HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n";
+     print "<html><head>\n";
+     print "<title>$Babel{Title}</title>\n";
+@@ -317,9 +319,12 @@ if ($targetgroup eq "in-addr") {
+    showinaddr($targetgroup,$protocol,$address,$port,$path);
+ }
+ 
++$url =~ s/</&lt;/g ;
++$url =~ s/>/&gt;/g ;
++
+ status("403 Forbidden");
+ expires(0);
+-print "Content-type: text/html\n\n";
++print "Content-type: text/html\n\n\n";
+ print "<!DOCTYPE html PUBLIC \"-//W3C//DTD  HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n";
+ print "<html><head>\n";
+ print "<title>$Babel{Title}</title>\n";
diff --git a/package/squidguard/squidguard.mk b/package/squidguard/squidguard.mk
new file mode 100644
index 0000000..7796aa9
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
+SQUIDGUARD_DEPENDENCIES = host-bison host-flex berkeleydb
+
+
+ifeq ($(BR2_PACKAGE_SQUIDGUARD_DEFAULT_CONF),y)
+
+define SQUIDGUARD_DEFAULT_BLACKLIST
+	$(INSTALL) -m 0644 -D $(SQUIDGUARD_DIR)/test/blacklist/domains \
+		$(TARGET_DIR)/var/lib/squidGuard/db/blacklist/domains
+	$(INSTALL) -m 0644 -D $(SQUIDGUARD_DIR)/test/blacklist/expressions \
+		$(TARGET_DIR)/var/lib/squidGuard/db/blacklist/expressions
+	$(INSTALL) -m 0644 -D $(SQUIDGUARD_DIR)/test/blacklist/urls \
+		$(TARGET_DIR)/var/lib/squidGuard/db/blacklist/urls
+endef
+
+define SQUIDGUARD_DEFAULT_CONF
+	$(INSTALL) -m 0644 -D package/squidguard/squidGuard.conf \
+		$(TARGET_DIR)/etc/squidGuard.conf
+endef
+
+SQUIDGUARD_POST_INSTALL_TARGET_HOOKS = SQUIDGUARD_DEFAULT_BLACKLIST SQUIDGUARD_DEFAULT_CONF
+
+endif
+
+
+$(eval $(autotools-package))
-- 
1.8.4.5

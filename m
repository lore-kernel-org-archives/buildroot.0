From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 22 Jan 2007 05:56:04 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/at
Message-ID: <20070122135604.F3D0448578@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-22 05:56:04 -0800 (Mon, 22 Jan 2007)
New Revision: 17458

Log:
- add missing include panic.h to parsetime.h
- add missing prerequisite y.tab.h of lex.yy.c to fix parallel builds


Modified:
   trunk/buildroot/package/at/at-crosscompile.patch
   trunk/buildroot/package/at/at.mk


Changeset:
Modified: trunk/buildroot/package/at/at-crosscompile.patch
===================================================================
--- trunk/buildroot/package/at/at-crosscompile.patch	2007-01-22 12:27:33 UTC (rev 17457)
+++ trunk/buildroot/package/at/at-crosscompile.patch	2007-01-22 13:56:04 UTC (rev 17458)
@@ -1,15 +1,38 @@
---- at/config.h.in
-+++ at/config.h.in
-@@ -182,3 +182,6 @@
+diff -rdup at-3.1.10.orig/Makefile.in at-3.1.10/Makefile.in
+--- at-3.1.10.orig/Makefile.in	2007-01-22 14:35:41.000000000 +0100
++++ at-3.1.10/Makefile.in	2007-01-22 14:41:41.000000000 +0100
+@@ -62,6 +62,8 @@ MISC =  COPYING  Makefile.in configure a
+ DIST = $(CSRCS) $(HEADERS) $(MISC) $(OTHERS)
+ LIST = Filelist Filelist.asc
  
++IROOT = $(DESTDIR)
++
+ .PHONY: all install clean dist distclean
+ 
+ all: at atd atrun
+@@ -78,7 +80,7 @@ atd: $(RUNOBJECTS)
+ y.tab.c y.tab.h: parsetime.y
+ 	$(YACC) -d parsetime.y
+ 
+-lex.yy.c: parsetime.l
++lex.yy.c: parsetime.l y.tab.h
+ 	$(LEX) -i parsetime.l
+ 
+ atrun: atrun.in
+diff -rdup at-3.1.10.orig/config.h.in at-3.1.10/config.h.in
+--- at-3.1.10.orig/config.h.in	2007-01-22 14:35:41.000000000 +0100
++++ at-3.1.10/config.h.in	2007-01-22 14:35:35.000000000 +0100
+@@ -181,3 +181,6 @@
+ 
  #undef HAVE_ATTRIBUTE_NORETURN
  #undef HAVE_PAM
 +
 +#undef NEED_YYWRAP
 +
---- at/configure
-+++ at/configure
-@@ -1037,7 +1037,7 @@
+diff -rdup at-3.1.10.orig/configure at-3.1.10/configure
+--- at-3.1.10.orig/configure	2007-01-22 14:35:41.000000000 +0100
++++ at-3.1.10/configure	2007-01-22 14:35:35.000000000 +0100
+@@ -1037,7 +1037,7 @@ esac
  echo $ac_n "checking Trying to compile a trivial ANSI C program""... $ac_c" 1>&6
  echo "configure:1039: checking Trying to compile a trivial ANSI C program" >&5
  if test "$cross_compiling" = yes; then
@@ -18,9 +41,10 @@
  else
    cat > conftest.$ac_ext <<EOF
  #line 1044 "configure"
---- at/getloadavg.c
-+++ at/getloadavg.c
-@@ -66,11 +66,12 @@
+diff -rdup at-3.1.10.orig/getloadavg.c at-3.1.10/getloadavg.c
+--- at-3.1.10.orig/getloadavg.c	2007-01-22 14:35:41.000000000 +0100
++++ at-3.1.10/getloadavg.c	2007-01-22 14:35:35.000000000 +0100
+@@ -66,11 +66,12 @@ Boston, MA  02110-1301  USA */
  
  /* This should always be first.  */
  #ifdef HAVE_CONFIG_H
@@ -36,22 +60,23 @@
  
  #ifndef HAVE_GETLOADAVG
  
---- at/Makefile.in
-+++ at/Makefile.in
-@@ -62,6 +62,8 @@
- DIST = $(CSRCS) $(HEADERS) $(MISC) $(OTHERS)
- LIST = Filelist Filelist.asc
+diff -rdup at-3.1.10.orig/parsetime.h at-3.1.10/parsetime.h
+--- at-3.1.10.orig/parsetime.h	2005-08-05 05:16:01.000000000 +0200
++++ at-3.1.10/parsetime.h	2007-01-22 14:45:41.000000000 +0100
+@@ -17,6 +17,7 @@
+  *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+  */
  
-+IROOT = $(DESTDIR)
-+
- .PHONY: all install clean dist distclean
++#include "panic.h"
+ time_t parsetime(int argc, char **argv);
  
- all:@atd atrun
---- at/parsetime.l
-+++ at/parsetime.l
+ extern char *last_token;
+diff -rdup at-3.1.10.orig/parsetime.l at-3.1.10/parsetime.l
+--- at-3.1.10.orig/parsetime.l	2007-01-22 14:35:41.000000000 +0100
++++ at-3.1.10/parsetime.l	2007-01-22 14:35:35.000000000 +0100
 @@ -1,5 +1,6 @@
  %{
-
+ 
 +#include "config.h"
  #include <string.h>
  #include <time.h>

Modified: trunk/buildroot/package/at/at.mk
===================================================================
--- trunk/buildroot/package/at/at.mk	2007-01-22 12:27:33 UTC (rev 17457)
+++ trunk/buildroot/package/at/at.mk	2007-01-22 13:56:04 UTC (rev 17458)
@@ -18,7 +18,7 @@
 $(AT_DIR)/.unpacked: $(DL_DIR)/$(AT_SOURCE)
 	$(AT_CAT) $(DL_DIR)/$(AT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(AT_DIR) package/at/ at\*.patch
-	touch $(AT_DIR)/.unpacked
+	touch $@
 
 $(AT_DIR)/.configured: $(AT_DIR)/.unpacked
 	(cd $(AT_DIR); rm -rf config.cache; \
@@ -38,7 +38,7 @@
 		--with-daemon_username=at \
 		--with-daemon_groupname=at \
 	);
-	touch $(AT_DIR)/.configured
+	touch $@
 
 $(AT_DIR)/$(AT_BINARY): $(AT_DIR)/.configured
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(AT_DIR)

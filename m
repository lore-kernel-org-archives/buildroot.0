From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 15 Oct 2011 00:07:22 -0300
Subject: [Buildroot] [PATCH 08/25] psmisc: bump to version 22.14
In-Reply-To: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318648059-30431-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/psmisc/psmisc-link-against-libintl.patch |   42 ++++++++++++++-------
 package/psmisc/psmisc.mk                         |    2 +-
 2 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/package/psmisc/psmisc-link-against-libintl.patch b/package/psmisc/psmisc-link-against-libintl.patch
index 985e232..fca49c6 100644
--- a/package/psmisc/psmisc-link-against-libintl.patch
+++ b/package/psmisc/psmisc-link-against-libintl.patch
@@ -14,30 +14,44 @@ the "autopoint" program, which itself depends on CVS being installed,
 for some strange reasons. That's the reason why we fall back to the
 hacky solution of modifying the Makefile.in file.
 
-It replaces a hack which was mistakenly removed by commit
-542fbe8520c981f9c96705a57e4263f34f2ab2e6.
+Forward-ported Thomas's patch to psmisc 22.14
+from commit f066ed70cd6939838d4057f66798cbc1d972cc73
 
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-Index: psmisc-22.13/src/Makefile.in
-===================================================================
---- psmisc-22.13.orig/src/Makefile.in	2011-05-21 15:12:17.212412293 +0200
-+++ psmisc-22.13/src/Makefile.in	2011-05-21 16:08:50.220326032 +0200
-@@ -216,12 +216,15 @@
- 	$(am__append_4) $(am__append_6) $(am__append_8) \
+diff -Nura psmisc-22.14.orig/src/Makefile.in psmisc-22.14/src/Makefile.in
+--- psmisc-22.14.orig/src/Makefile.in	2011-10-12 12:12:09.711983726 -0300
++++ psmisc-22.14/src/Makefile.in	2011-10-12 12:14:01.733350322 -0300
+@@ -70,16 +70,16 @@
+ PROGRAMS = $(bin_PROGRAMS)
+ am_fuser_OBJECTS = fuser.$(OBJEXT) signals.$(OBJEXT)
+ fuser_OBJECTS = $(am_fuser_OBJECTS)
+-fuser_LDADD = $(LDADD)
++fuser_LDADD = $(LDADD) @INTLLIBS@
+ am_killall_OBJECTS = killall.$(OBJEXT) signals.$(OBJEXT)
+ killall_OBJECTS = $(am_killall_OBJECTS)
+ killall_DEPENDENCIES =
+ am_peekfd_OBJECTS = peekfd.$(OBJEXT)
+ peekfd_OBJECTS = $(am_peekfd_OBJECTS)
+-peekfd_LDADD = $(LDADD)
++peekfd_LDADD = $(LDADD) @INTLLIBS@
+ am_prtstat_OBJECTS = prtstat.$(OBJEXT)
+ prtstat_OBJECTS = $(am_prtstat_OBJECTS)
+-prtstat_LDADD = $(LDADD)
++prtstat_LDADD = $(LDADD) @INTLLIBS@
+ am_pstree_OBJECTS = pstree.$(OBJEXT)
+ pstree_OBJECTS = $(am_pstree_OBJECTS)
+ pstree_DEPENDENCIES =
+@@ -217,10 +217,10 @@
  	$(am__append_10)
- fuser_SOURCES = fuser.c comm.h signals.c signals.h i18n.h fuser.h
-+fuser_LDADD = @INTLLIBS@
+ fuser_SOURCES = fuser.c comm.h signals.c signals.h i18n.h fuser.h lists.h
  killall_SOURCES = killall.c comm.h signals.c signals.h i18n.h
 -killall_LDADD = @SELINUX_LIB@
 +killall_LDADD = @SELINUX_LIB@ @INTLLIBS@
  peekfd_SOURCES = peekfd.c
-+peekfd_LDADD = @INTLLIBS@
  pstree_SOURCES = pstree.c comm.h i18n.h
 -pstree_LDADD = @TERMCAP_LIB@ @SELINUX_LIB@
 +pstree_LDADD = @TERMCAP_LIB@ @SELINUX_LIB@ @INTLLIBS@
  prtstat_SOURCES = prtstat.c prtstat.h
-+prtstat_LDADD = @INTLLIBS@
  BUILT_SOURCES = signames.h
  EXTRA_DIST = signames.c 
- CLEANFILES = signames.h
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index dca5021..df116fc 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PSMISC_VERSION = 22.13
+PSMISC_VERSION = 22.14
 PSMISC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/psmisc
 PSMISC_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 
-- 
1.7.3.4

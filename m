From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 28 Mar 2012 23:25:01 -0300
Subject: [Buildroot] [PATCH 5/7] psmisc: bump to version 22.16
In-Reply-To: <1332987903-12378-1-git-send-email-gustavo@zacarias.com.ar>
References: <1332987903-12378-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1332987903-12378-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/psmisc/psmisc-link-against-libintl.patch |   38 ++++------------------
 package/psmisc/psmisc.mk                         |    6 ++-
 2 files changed, 11 insertions(+), 33 deletions(-)

diff --git a/package/psmisc/psmisc-link-against-libintl.patch b/package/psmisc/psmisc-link-against-libintl.patch
index fca49c6..907e7e7 100644
--- a/package/psmisc/psmisc-link-against-libintl.patch
+++ b/package/psmisc/psmisc-link-against-libintl.patch
@@ -14,44 +14,20 @@ the "autopoint" program, which itself depends on CVS being installed,
 for some strange reasons. That's the reason why we fall back to the
 hacky solution of modifying the Makefile.in file.
 
-Forward-ported Thomas's patch to psmisc 22.14
+Forward-ported Thomas's patch to psmisc 22.16
 from commit f066ed70cd6939838d4057f66798cbc1d972cc73
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-diff -Nura psmisc-22.14.orig/src/Makefile.in psmisc-22.14/src/Makefile.in
---- psmisc-22.14.orig/src/Makefile.in	2011-10-12 12:12:09.711983726 -0300
-+++ psmisc-22.14/src/Makefile.in	2011-10-12 12:14:01.733350322 -0300
-@@ -70,16 +70,16 @@
- PROGRAMS = $(bin_PROGRAMS)
- am_fuser_OBJECTS = fuser.$(OBJEXT) signals.$(OBJEXT)
- fuser_OBJECTS = $(am_fuser_OBJECTS)
--fuser_LDADD = $(LDADD)
-+fuser_LDADD = $(LDADD) @INTLLIBS@
- am_killall_OBJECTS = killall.$(OBJEXT) signals.$(OBJEXT)
- killall_OBJECTS = $(am_killall_OBJECTS)
+diff -Nura psmisc-22.16.orig/src/Makefile.in psmisc-22.16/src/Makefile.in
+--- psmisc-22.16.orig/src/Makefile.in	2012-03-28 22:27:33.106660358 -0300
++++ psmisc-22.16/src/Makefile.in	2012-03-28 22:28:55.752219349 -0300
+@@ -76,7 +76,7 @@
  killall_DEPENDENCIES =
  am_peekfd_OBJECTS = peekfd.$(OBJEXT)
  peekfd_OBJECTS = $(am_peekfd_OBJECTS)
 -peekfd_LDADD = $(LDADD)
-+peekfd_LDADD = $(LDADD) @INTLLIBS@
++peekfd_LDADD = $(LDADD) @LIBINTL@
  am_prtstat_OBJECTS = prtstat.$(OBJEXT)
  prtstat_OBJECTS = $(am_prtstat_OBJECTS)
--prtstat_LDADD = $(LDADD)
-+prtstat_LDADD = $(LDADD) @INTLLIBS@
- am_pstree_OBJECTS = pstree.$(OBJEXT)
- pstree_OBJECTS = $(am_pstree_OBJECTS)
- pstree_DEPENDENCIES =
-@@ -217,10 +217,10 @@
- 	$(am__append_10)
- fuser_SOURCES = fuser.c comm.h signals.c signals.h i18n.h fuser.h lists.h
- killall_SOURCES = killall.c comm.h signals.c signals.h i18n.h
--killall_LDADD = @SELINUX_LIB@
-+killall_LDADD = @SELINUX_LIB@ @INTLLIBS@
- peekfd_SOURCES = peekfd.c
- pstree_SOURCES = pstree.c comm.h i18n.h
--pstree_LDADD = @TERMCAP_LIB@ @SELINUX_LIB@
-+pstree_LDADD = @TERMCAP_LIB@ @SELINUX_LIB@ @INTLLIBS@
- prtstat_SOURCES = prtstat.c prtstat.h
- BUILT_SOURCES = signames.h
- EXTRA_DIST = signames.c 
+ prtstat_DEPENDENCIES =
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index df116fc..c6d1108 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-PSMISC_VERSION = 22.14
-PSMISC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/psmisc
+PSMISC_VERSION = 22.16
+PSMISC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/psmisc/psmisc
 PSMISC_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+# Don't force -fstack-protector
+PSMISC_CONF_OPT = --disable-harden-flags
 
 # build after busybox, we prefer fat versions while we're at it
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-- 
1.7.3.4

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Dec 2012 00:44:42 +0100
Subject: [Buildroot] [PATCH 22/52] package/libedit2: new package
In-Reply-To: <1355183112-10735-1-git-send-email-yann.morin.1998@free.fr>
References: <1355183112-10735-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1355183112-10735-23-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in                                  |    1 +
 package/libedit2/Config.in                         |    9 +++
 package/libedit2/libedit2-01-Makefile.patch        |   25 +++++++
 package/libedit2/libedit2-02-el.c-issetugid.patch  |   24 ++++++
 package/libedit2/libedit2-03-el.c-MAXPATHLEN.patch |   40 +++++++++++
 .../libedit2/libedit2-04-readline.h-stdio.patch    |   17 +++++
 .../libedit2/libedit2-08-readline-history.h.patch  |   20 +++++
 .../libedit2/libedit2-10-define_SIZE_T_MAX.patch   |   18 +++++
 .../libedit2/libedit2-12-libedit-Makefile.patch    |   54 ++++++++++++++
 package/libedit2/libedit2-20-fortify.patch         |   23 ++++++
 package/libedit2/libedit2.mk                       |   75 ++++++++++++++++++++
 package/libedit2/libedit2.pc                       |   13 ++++
 12 files changed, 319 insertions(+), 0 deletions(-)
 create mode 100644 package/libedit2/Config.in
 create mode 100644 package/libedit2/libedit2-01-Makefile.patch
 create mode 100644 package/libedit2/libedit2-02-el.c-issetugid.patch
 create mode 100644 package/libedit2/libedit2-03-el.c-MAXPATHLEN.patch
 create mode 100644 package/libedit2/libedit2-04-readline.h-stdio.patch
 create mode 100644 package/libedit2/libedit2-08-readline-history.h.patch
 create mode 100644 package/libedit2/libedit2-10-define_SIZE_T_MAX.patch
 create mode 100644 package/libedit2/libedit2-12-libedit-Makefile.patch
 create mode 100644 package/libedit2/libedit2-20-fortify.patch
 create mode 100644 package/libedit2/libedit2.mk
 create mode 100644 package/libedit2/libedit2.pc

diff --git a/package/Config.in b/package/Config.in
index e016378..47c01db 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -538,6 +538,7 @@ endmenu
 menu "Text and terminal handling"
 source "package/enchant/Config.in"
 source "package/icu/Config.in"
+source "package/libedit2/Config.in"
 source "package/libiconv/Config.in"
 source "package/linenoise/Config.in"
 source "package/ncurses/Config.in"
diff --git a/package/libedit2/Config.in b/package/libedit2/Config.in
new file mode 100644
index 0000000..1e7b95d
--- /dev/null
+++ b/package/libedit2/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBEDIT2
+	bool "libedit2"
+	select BR2_PACKAGE_LIBBSD
+	select BR2_PACKAGE_NCURSES
+	help
+	  The editline library (from BSD) provides generic line editing
+	  and history functions. It slightly resembles GNU readline.
+	  
+	  http://ftp.netbsd.org/pub/NetBSD/NetBSD-release-5-0/src/lib/libedit/
diff --git a/package/libedit2/libedit2-01-Makefile.patch b/package/libedit2/libedit2-01-Makefile.patch
new file mode 100644
index 0000000..91645e4
--- /dev/null
+++ b/package/libedit2/libedit2-01-Makefile.patch
@@ -0,0 +1,25 @@
+ 01-Makefile.diff by Neal H Walfield <neal@cs.uml.edu> and
+ Gergely Nagy <algernon@debian.org>
+
+ Add the necessary includes and other things to the libedit
+ Makefile, so it will compile on GNU systems, with our supplied
+ glue code
+
+ Yann E. MORIN: patch from debian.
+
+--- a/libedit/Makefile
++++ b/libedit/Makefile
+@@ -1,6 +1,13 @@
+ #	$NetBSD: Makefile,v 1.36 2007/05/28 12:06:18 tls Exp $
+ #	@(#)Makefile	8.1 (Berkeley) 6/4/93
+ 
++OS!=	sh -c "case `uname -s` in GNU|GNU/*) echo GNU ;; *) uname -s ;; esac"
++
++.if ${OS} == GNU || ${OS} == Linux
++CFLAGS += -include bsd/bsd.h
++MKLINT=no
++.endif
++
+ USE_SHLIBDIR=	yes
+ 
+ WARNS=	3
diff --git a/package/libedit2/libedit2-02-el.c-issetugid.patch b/package/libedit2/libedit2-02-el.c-issetugid.patch
new file mode 100644
index 0000000..b060fa4
--- /dev/null
+++ b/package/libedit2/libedit2-02-el.c-issetugid.patch
@@ -0,0 +1,24 @@
+ 02-el.c-issetugid.diff by Gergely Nagy <algernon@debian.org>
+
+ issetugid(2) is not implemented on GNU systems, so #ifdef it out
+
+ Yann E. MORIN: patch from debian.
+
+--- a/libedit/el.c	2008-04-06 02:53:28.000000000 +1100
++++ b/libedit/el.c	2009-06-23 08:51:48.000000000 +1000
+@@ -479,12 +479,14 @@ el_source(EditLine *el, const char *fnam
+ 
+ 	fp = NULL;
+ 	if (fname == NULL) {
+-#ifdef HAVE_ISSETUGID
++#if 1
+ 		static const char elpath[] = "/.editrc";
+ 		char path[MAXPATHLEN];
+ 
++#ifndef __GLIBC__
+ 		if (issetugid())
+ 			return (-1);
++#endif
+ 		if ((ptr = getenv("HOME")) == NULL)
+ 			return (-1);
+ 		if (strlcpy(path, ptr, sizeof(path)) >= sizeof(path))
diff --git a/package/libedit2/libedit2-03-el.c-MAXPATHLEN.patch b/package/libedit2/libedit2-03-el.c-MAXPATHLEN.patch
new file mode 100644
index 0000000..aadd36a
--- /dev/null
+++ b/package/libedit2/libedit2-03-el.c-MAXPATHLEN.patch
@@ -0,0 +1,40 @@
+ 03-el.c-MAXPATHLEN.diff by Gergely Nagy <algernon@debian.org>
+
+ on systems without MAXPATHLEN, allocate memory dynamically
+
+ Yann E. MORIN: patch from debian.
+
+--- a/libedit/el.c	2009-06-23 08:57:04.000000000 +1000
++++ b/libedit/el.c	2009-06-23 08:57:30.000000000 +1000
+@@ -481,7 +481,11 @@ el_source(EditLine *el, const char *fnam
+ 	if (fname == NULL) {
+ #if 1
+ 		static const char elpath[] = "/.editrc";
++#ifdef MAXPATHLEN
+ 		char path[MAXPATHLEN];
++#else
++		char *path;
++#endif
+ 
+ #ifndef __GLIBC__
+ 		if (issetugid())
+@@ -489,10 +493,19 @@ el_source(EditLine *el, const char *fnam
+ #endif
+ 		if ((ptr = getenv("HOME")) == NULL)
+ 			return (-1);
++#ifndef MAXPATHLEN
++                path = (char *)malloc(strlen(ptr) + strlen(elpath) + 10);
++		if (path == NULL)
++			return (-1);
++		/* Always succeeds, since we have enough memory */
++		strcpy(path, ptr);
++		strcat(path, elpath);
++#else
+ 		if (strlcpy(path, ptr, sizeof(path)) >= sizeof(path))
+ 			return (-1);
+ 		if (strlcat(path, elpath, sizeof(path)) >= sizeof(path))
+ 			return (-1);
++#endif
+ 		fname = path;
+ #else
+ 		/*
diff --git a/package/libedit2/libedit2-04-readline.h-stdio.patch b/package/libedit2/libedit2-04-readline.h-stdio.patch
new file mode 100644
index 0000000..84257b9
--- /dev/null
+++ b/package/libedit2/libedit2-04-readline.h-stdio.patch
@@ -0,0 +1,17 @@
+ 04-readline.h-stdio.diff by Gergely Nagy <algernon@debian.org>
+
+ since readline.h uses types defined in stdio.h, that header should
+ be included
+
+ Yann E. MORIN: patch from debian.
+
+--- a/libedit/readline/readline.h	2008-04-29 16:53:01.000000000 +1000
++++ b/libedit/readline/readline.h	2009-06-23 08:35:58.000000000 +1000
+@@ -31,6 +31,7 @@
+ #ifndef _READLINE_H_
+ #define _READLINE_H_
+ 
++#include <stdio.h>
+ #include <sys/types.h>
+ 
+ /* list of readline stuff supported by editline library's readline wrapper */
diff --git a/package/libedit2/libedit2-08-readline-history.h.patch b/package/libedit2/libedit2-08-readline-history.h.patch
new file mode 100644
index 0000000..f30093f
--- /dev/null
+++ b/package/libedit2/libedit2-08-readline-history.h.patch
@@ -0,0 +1,20 @@
+ 08-readline-history.h.diff by Pawel Wiecek <coven@debian.org>
+ (compatibility with older versions)
+
+ Setting the global variable rl_inhibit_completion to 1 did indeed
+ disable completion, but the invoking key (e.g., <TAB>) was not
+ inserted directly into the input line as it should be.
+ This patch fixes this problem, and also declares rl_inhibit_completion
+ in readline.h for better readline compatibility.
+
+ Yann E. MORIN: patch from debian.
+
+--- a/libedit/readline/Makefile	2003-08-03 19:23:15.000000000 +1000
++++ b/libedit/readline/Makefile	2009-06-23 08:35:58.000000000 +1000
+@@ -10,4 +10,6 @@ INCS=		readline.h
+ INCSDIR=	/usr/include/readline
+ INCSYMLINKS=	readline.h ${INCSDIR}/history.h
+ 
++incinstall:: linksinstall
++
+ .include <bsd.prog.mk>
diff --git a/package/libedit2/libedit2-10-define_SIZE_T_MAX.patch b/package/libedit2/libedit2-10-define_SIZE_T_MAX.patch
new file mode 100644
index 0000000..c8ce262
--- /dev/null
+++ b/package/libedit2/libedit2-10-define_SIZE_T_MAX.patch
@@ -0,0 +1,18 @@
+ 10-define_SIZE_T_MAX.diff by Anibal Monsalve Salazar
+ define SIZE_T_MAX as UINT_MAX in limits.h
+
+ Yann E. MORIN: patch from debian.
+
+--- a/libedit/readline.c	2008-04-29 16:53:01.000000000 +1000
++++ a/libedit/readline.c	2008-06-14 23:54:16.000000000 +1000
+@@ -61,6 +61,10 @@ __RCSID("$NetBSD: readline.c,v 1.75 2008
+ #include "readline/readline.h"
+ #include "filecomplete.h"
+ 
++#ifndef SIZE_T_MAX
++#define SIZE_T_MAX UINT_MAX
++#endif
++
+ void rl_prep_terminal(int);
+ void rl_deprep_terminal(void);
+ 
diff --git a/package/libedit2/libedit2-12-libedit-Makefile.patch b/package/libedit2/libedit2-12-libedit-Makefile.patch
new file mode 100644
index 0000000..3234f33
--- /dev/null
+++ b/package/libedit2/libedit2-12-libedit-Makefile.patch
@@ -0,0 +1,54 @@
+ 12-libedit-Makefile.diff by Anibal Monsalve Salazar
+ without this patch I get the following message:
+ make: ${_MKTARGET_CREATE} expands to empty string
+
+ Yann E. MORIN: patch from debian.
+
+--- a/libedit/Makefile	2007-05-28 22:06:18.000000000 +1000
++++ a/libedit/Makefile	2008-06-15 13:53:50.000000000 +1000
+@@ -59,45 +59,37 @@ CLEANFILES+=	${AHDR} fcns.h help.h fcns.
+ SUBDIR=	readline
+ 
+ vi.h: vi.c makelist Makefile
+-	${_MKTARGET_CREATE}
+ 	${HOST_SH} ${LIBEDITDIR}/makelist -h ${LIBEDITDIR}/vi.c \
+ 	    > ${.TARGET}.tmp && \
+ 	    mv ${.TARGET}.tmp ${.TARGET}
+ 
+ emacs.h: emacs.c makelist Makefile
+-	${_MKTARGET_CREATE}
+ 	${HOST_SH} ${LIBEDITDIR}/makelist -h ${LIBEDITDIR}/emacs.c \
+ 	    > ${.TARGET}.tmp && \
+ 	    mv ${.TARGET}.tmp ${.TARGET}
+ 
+ common.h: common.c makelist Makefile
+-	${_MKTARGET_CREATE}
+ 	${HOST_SH} ${LIBEDITDIR}/makelist -h ${LIBEDITDIR}/common.c \
+ 	    > ${.TARGET}.tmp && \
+ 	    mv ${.TARGET}.tmp ${.TARGET}
+ 
+ fcns.h: ${AHDR} makelist Makefile
+-	${_MKTARGET_CREATE}
+ 	${HOST_SH} ${LIBEDITDIR}/makelist -fh ${AHDR} > ${.TARGET}.tmp && \
+ 	    mv ${.TARGET}.tmp ${.TARGET}
+ 
+ fcns.c: ${AHDR} fcns.h help.h makelist Makefile
+-	${_MKTARGET_CREATE}
+ 	${HOST_SH} ${LIBEDITDIR}/makelist -fc ${AHDR} > ${.TARGET}.tmp && \
+ 	    mv ${.TARGET}.tmp ${.TARGET}
+ 
+ help.c: ${ASRC} makelist Makefile
+-	${_MKTARGET_CREATE}
+ 	${HOST_SH} ${LIBEDITDIR}/makelist -bc ${ASRC} > ${.TARGET}.tmp && \
+ 	    mv ${.TARGET}.tmp ${.TARGET}
+ 
+ help.h: ${ASRC} makelist Makefile
+-	${_MKTARGET_CREATE}
+ 	${HOST_SH} ${LIBEDITDIR}/makelist -bh ${ASRC} > ${.TARGET}.tmp && \
+ 	    mv ${.TARGET}.tmp ${.TARGET}
+ 
+ editline.c: ${OSRCS} makelist Makefile
+-	${_MKTARGET_CREATE}
+ 	${HOST_SH} ${LIBEDITDIR}/makelist -e ${OSRCS:T} > ${.TARGET}.tmp && \
+ 	    mv ${.TARGET}.tmp ${.TARGET}
+ 
diff --git a/package/libedit2/libedit2-20-fortify.patch b/package/libedit2/libedit2-20-fortify.patch
new file mode 100644
index 0000000..0a41ce3
--- /dev/null
+++ b/package/libedit2/libedit2-20-fortify.patch
@@ -0,0 +1,23 @@
+http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=488456
+
+Patch by Kees Cook <kees@outflux.net>
+
+Yann E. MORIN: patch from debian.
+
+--- a/libedit/vi.c	2006-10-22 17:48:13.000000000 +1000
++++ b/libedit/vi.c	2009-06-23 08:35:58.000000000 +1000
+@@ -1012,8 +1012,12 @@ vi_histedit(EditLine *el, int c)
+ 	if (fd < 0)
+ 		return CC_ERROR;
+ 	cp = el->el_line.buffer;
+-	write(fd, cp, el->el_line.lastchar - cp +0u);
+-	write(fd, "\n", 1);
++	if (write(fd, cp, el->el_line.lastchar - cp +0u)<0 ||
++	    write(fd, "\n", 1)<0) {
++		close(fd);
++		unlink(tempfile);
++		return CC_ERROR;
++	}
+ 	pid = fork();
+ 	switch (pid) {
+ 	case -1:
diff --git a/package/libedit2/libedit2.mk b/package/libedit2/libedit2.mk
new file mode 100644
index 0000000..b9ca41e
--- /dev/null
+++ b/package/libedit2/libedit2.mk
@@ -0,0 +1,75 @@
+#############################################################
+#
+# libedit2
+#
+#############################################################
+
+# Note: libedit2 does not have a regular homepage, and it seems
+# there is no place where to download a tarball from. That's
+# why we use the Debian way-back machine.
+LIBEDIT2_VERSION_MAJOR   = 2
+LIBEDIT2_VERSION_MINOR   = 11-20080614
+LIBEDIT2_VERSION         = $(LIBEDIT2_VERSION_MAJOR).$(LIBEDIT2_VERSION_MINOR)
+LIBEDIT2_SOURCE          = libedit_$(LIBEDIT2_VERSION).orig.tar.bz2
+LIBEDIT2_SITE            = http://snapshot.debian.org/archive/debian/20120601T033558Z/pool/main/libe/libedit
+LIBEDIT2_SUBDIR          = libedit
+LIBEDIT2_INSTALL_STAGING = YES
+LIBEDIT2_DEPENDENCIES    = host-pmake libbsd ncurses
+
+define POST_PATCH_PERMISSIONS
+	chmod +x $(@D)/libedit/makelist
+endef
+
+LIBEDIT2_POST_PATCH_HOOKS += POST_PATCH_PERMISSIONS
+
+define LIBEDIT2_FIX_VIS_H_INCLUDE
+	$(SED) 's/^#include <vis.h>$$/#include <bsd\/vis.h>/;' $(@D)/libedit/filecomplete.c
+	$(SED) 's/^#include <vis.h>$$/#include <bsd\/vis.h>/;' $(@D)/libedit/history.c
+	$(SED) 's/^#include <vis.h>$$/#include <bsd\/vis.h>/;' $(@D)/libedit/readline.c
+endef
+LIBEDIT2_POST_PATCH_HOOKS += LIBEDIT2_FIX_VIS_H_INCLUDE
+
+LIBEDIT2_PMAKE_ARGS = MKPROFILE=no MKCATPAGES=no MLINKS= MANPAGES= NOGCCERROR=1         \
+                      SHLIB_SHFLAGS="-Wl,-soname,libedit.so.${LIBEDIT2_VERSION_MAJOR}"  \
+
+define LIBEDIT2_BUILD_CMDS
+	cd $(@D)/$(LIBEDIT2_SUBDIR); \
+	$(TARGET_CONFIGURE_OPTS) LDADD="-lbsd -lcurses" pmake $(LIBEDIT2_PMAKE_ARGS)
+endef
+
+LIBEDIT2_MAN_LINKS = el_init el_end el_reset el_gets el_getc el_push el_parse   \
+                     el_set el_get el_source el_resize el_line el_insertstr     \
+                     el_deletestr history_init history_end history
+
+# $1: DESTDIR to install into
+# Can't use pmake to install, it wants to be root. sigh... :-(
+define LIBEDIT2_INSTALL_CMDS
+	$(INSTALL) -D -m 0644 package/libedit2/libedit2.pc $(1)/usr/lib/pkgconfig/libedit2.pc
+	ln -sf libedit2.pc $(1)/usr/lib/pkgconfig/libedit.pc
+	$(INSTALL) -D -m 0644 $(@D)/libedit/libedit.a $(1)/usr/lib/libedit.a
+	$(INSTALL) -D -m 0644 $(@D)/libedit/libedit_pic.a $(1)/usr/lib/libedit_pic.a
+	$(INSTALL) -D -m 0644 $(@D)/libedit/libedit.so.2.11 $(1)/usr/lib/libedit.so.2.11
+	$(INSTALL) -D -m 0644 $(@D)/libedit/histedit.h $(1)/usr/include/histedit.h
+	ln -sf libedit.so.$(LIBEDIT2_VERSION) $(1)/usr/lib/libedit.so.$(LIBEDIT2_VERSION_MAJOR)
+	ln -sf libedit.so.$(LIBEDIT2_VERSION_MAJOR) $(1)/usr/lib/libedit.so
+	$(INSTALL) -D -m 0644 $(@D)/libedit/readline/readline.h $(1)/usr/include/editline/readline.h
+	if [ "$(BR2_HAVE_DOCUMENTATION)" = "y" ]; then                                              \
+	    $(INSTALL) -v -D -m 0644 $(@D)/libedit/editline.3 $(1)/usr/share/man/man3/editline.3el; \
+	    $(INSTALL) -v -D -m 0644 $(@D)/libedit/editrc.3 $(1)/usr/share/man/man5/editrc.5el;     \
+	    for lnk in $(LIBEDIT2_MAN_LINKS); do                                                    \
+	        ln -sfv editline.3el $(1)/usr/share/man/man3/$${lnk}.3el;                           \
+	    done;                                                                                   \
+	fi
+endef
+#	cd $(@D)/libedit; pmake install incinstall DESTDIR=$(1) $(LIBEDIT2_PMAKE_ARGS)
+#	cd $(@D)/libedit/readline; pmake incinstall DESTDIR=$(1) $(LIBEDIT2_PMAKE_ARGS)
+
+define LIBEDIT2_INSTALL_STAGING_CMDS
+	$(call LIBEDIT2_INSTALL_CMDS,$(STAGING_DIR))
+endef
+
+define LIBEDIT2_INSTALL_TARGET_CMDS
+	$(call LIBEDIT2_INSTALL_CMDS,$(TARGET_DIR))
+endef
+
+$(eval $(generic-package))
diff --git a/package/libedit2/libedit2.pc b/package/libedit2/libedit2.pc
new file mode 100644
index 0000000..47ac871
--- /dev/null
+++ b/package/libedit2/libedit2.pc
@@ -0,0 +1,13 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: libedit
+Description: Not just a replacement library for libreadline and libhistory.
+Version: 2.11
+Requires: libbsd ncurses
+Requires.private:
+Libs: -L${libdir} -ledit
+Libs.private:
+Cflags: -I${includedir}
-- 
1.7.2.5

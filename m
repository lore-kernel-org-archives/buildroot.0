From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 22 Feb 2013 23:34:39 +0100
Subject: [Buildroot] [git commit branch/next] package/tvheadend: update to
	v3.5
Message-ID: <20130222224626.C9E5D9AC63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4667e1cb86ebcad372c61c72c8ad0f15a30d0552
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../tvheadend-001-no-auto-download-dvbscans.patch  |   66 ++++++++++++++++++++
 .../tvheadend/tvheadend-002-no-check_config.patch  |   23 +++++++
 package/tvheadend/tvheadend-fix-Werror.patch       |   44 -------------
 .../tvheadend-no-auto-download-dvbscans.patch      |   60 ------------------
 package/tvheadend/tvheadend-no-wordexp.patch       |   20 ------
 package/tvheadend/tvheadend.mk                     |    2 +-
 6 files changed, 90 insertions(+), 125 deletions(-)

diff --git a/package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch b/package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch
new file mode 100644
index 0000000..cc25c56
--- /dev/null
+++ b/package/tvheadend/tvheadend-001-no-auto-download-dvbscans.patch
@@ -0,0 +1,66 @@
+Do not download transponder data as part of the build
+
+If dvb-scan is enabled, tvheadend will download the transponders data
+from the dvb-apps package. This does not play well with buildroot.
+
+Instead, we rely on the dvb-apps package to install those files, so
+it is no longer needed to install those as part of tvheadend.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN tvheadend-v3.5.orig/configure tvheadend-v3.5/configure
+--- tvheadend-v3.5.orig/configure	2013-02-15 14:41:26.000000000 +0100
++++ tvheadend-v3.5/configure	2013-02-16 15:41:16.675556099 +0100
+@@ -178,15 +178,16 @@
+ #
+ # DVB scan
+ #
+-if enabled linuxdvb && enabled dvbscan; then
+-  printf "${TAB}" "fetching dvb-scan files ..."
+-  ${ROOTDIR}/support/getmuxlist
+-  if [ $? -ne 0 ]; then
+-    echo "fail"
+-    die "Failed to fetch dvb-scan data (use --disable-dvbscan)"
+-  fi
+-  echo "ok"
+-fi
++# For buildroot, we already installed those files via the dvb-apps package
++#if enabled linuxdvb && enabled dvbscan; then
++#  printf "${TAB}" "fetching dvb-scan files ..."
++#  ${ROOTDIR}/support/getmuxlist
++#  if [ $? -ne 0 ]; then
++#    echo "fail"
++#    die "Failed to fetch dvb-scan data (use --disable-dvbscan)"
++#  fi
++#  echo "ok"
++#fi
+ 
+ # ###########################################################################
+ # Write config
+Binary files tvheadend-v3.5.orig/.configure.swp and tvheadend-v3.5/.configure.swp differ
+diff -durN tvheadend-v3.5.orig/Makefile tvheadend-v3.5/Makefile
+--- tvheadend-v3.5.orig/Makefile	2013-02-15 14:41:26.000000000 +0100
++++ tvheadend-v3.5/Makefile	2013-02-16 15:41:38.218821287 +0100
+@@ -207,7 +207,7 @@
+ SRCS-${CONFIG_BUNDLE}     += bundle.c
+ BUNDLES-yes               += docs/html docs/docresources src/webui/static
+ BUNDLES-yes               += data/conf
+-BUNDLES-${CONFIG_DVBSCAN} += data/dvb-scan
++#BUNDLES-${CONFIG_DVBSCAN} += data/dvb-scan
+ BUNDLES                    = $(BUNDLES-yes)
+ 
+ #
+diff -durN tvheadend-v3.5.orig/support/posix.mk tvheadend-v3.5/support/posix.mk
+--- tvheadend-v3.5.orig/support/posix.mk	2013-02-15 14:41:26.000000000 +0100
++++ tvheadend-v3.5/support/posix.mk	2013-02-16 15:42:41.015290003 +0100
+@@ -15,6 +15,10 @@
+ 
+ 	find ${DESTDIR}${datadir}/tvheadend -name .git -exec rm -rf {} \; &>/dev/null || /bin/true
+ 
++	mkdir -p ${DESTDIR}${datadir}/tvheadend/data
++	rm -f ${DESTDIR}${datadir}/tvheadend/data/dvb-scan
++	ln -sf /usr/share/dvb ${DESTDIR}${datadir}/tvheadend/data/dvb-scan
++
+ uninstall:
+ 	rm -f ${DESTDIR}${bindir)/tvheadend
+ 	rm -f ${DESTDIR}${mandir)/tvheadend.1
diff --git a/package/tvheadend/tvheadend-002-no-check_config.patch b/package/tvheadend/tvheadend-002-no-check_config.patch
new file mode 100644
index 0000000..a0edcdc
--- /dev/null
+++ b/package/tvheadend/tvheadend-002-no-check_config.patch
@@ -0,0 +1,23 @@
+Makefile: do not use check_config
+
+test(1) only uses the second to compare two files dates.
+test(1) also does a strict comparison wrt. dates.
+
+But, on very fast systems, the configure and .config.mk
+files may be created in the same second, and so would lead
+to a false comparison of the files' dates.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN tvheadend-v3.5.orig/Makefile tvheadend-v3.5/Makefile
+--- tvheadend-v3.5.orig/Makefile	2013-02-17 15:15:03.228749505 +0100
++++ tvheadend-v3.5/Makefile	2013-02-17 15:15:51.591923062 +0100
+@@ -246,7 +246,7 @@
+ 	$(CURDIR)/configure $(CONFIGURE_ARGS)
+ 
+ # Binary
+-${PROG}: check_config $(OBJS) $(ALLDEPS)
++${PROG}: $(OBJS) $(ALLDEPS)
+ 	$(CC) -o $@ $(OBJS) $(CFLAGS) $(LDFLAGS)
+ 
+ # Object
diff --git a/package/tvheadend/tvheadend-fix-Werror.patch b/package/tvheadend/tvheadend-fix-Werror.patch
deleted file mode 100644
index 5f6dbad..0000000
--- a/package/tvheadend/tvheadend-fix-Werror.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-commit 1334869bf0ea668e58e1c72daa3c09c1a95b5d81
-Author: Alexey I. Froloff <raorn@raorn.name>
-Date:   Wed Oct 24 21:10:15 2012 +0400
-
-    [PR-172] Fix compilatioin issues on OpenWRT
-    
-    Fix SHA1_* function names
-    Fix unused variables and functions
-
----
-"Yann E. MORIN" <yann.morin.1998@free.fr>:
-    For buildroot, I removed the SHA_* fixes, as we're not affected.
-    No point in fixing something that does not bug us.
-
-diff --git a/src/trap.c b/src/trap.c
-index bd76118..b0fe543 100644
---- a/src/trap.c
-+++ b/src/trap.c
-@@ -67,6 +67,7 @@ sappend(char *buf, size_t l, const char *fmt, ...)
- /**
-  *
-  */
-+#if ENABLE_EXECINFO
- static int
- add2lineresolve(const char *binary, void *addr, char *buf0, size_t buflen)
- {
-@@ -126,6 +127,7 @@ add2lineresolve(const char *binary, void *addr, char *buf0, size_t buflen)
-   close(fd[0]);
-   return 0;
- }
-+#endif /* ENABLE_EXECINFO */
- 
- 
- 
-@@ -133,8 +135,8 @@ static void
- traphandler(int sig, siginfo_t *si, void *UC)
- {
-   ucontext_t *uc = UC;
--  char buf[200];
- #if ENABLE_EXECINFO
-+  char buf[200];
-   static void *frames[MAXFRAMES];
-   int nframes = backtrace(frames, MAXFRAMES);
-   Dl_info dli;
diff --git a/package/tvheadend/tvheadend-no-auto-download-dvbscans.patch b/package/tvheadend/tvheadend-no-auto-download-dvbscans.patch
deleted file mode 100644
index 963d4f2..0000000
--- a/package/tvheadend/tvheadend-no-auto-download-dvbscans.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-Do not download transponder data as part of the build
-
-If dvb-scan is enabled, tvheadend will download the transponders data
-from the dvb-apps package. This does not play well with buildroot.
-
-Instead, we rely on the dvb-apps package to install those files, so
-it is no longer needed to install those as part of tvheadend.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN tvheadend-v3.3.orig//configure tvheadend-v3.3/configure
---- tvheadend-v3.3.orig//configure	2012-09-25 15:32:31.000000000 +0200
-+++ tvheadend-v3.3/configure	2012-12-28 17:17:23.580253413 +0100
-@@ -96,13 +96,14 @@
- #
- # DVB scan
- #
--if enabled linuxdvb && enabled dvbscan; then
--  if [ ! -d ${ROOTDIR}/data/dvb-scan ]; then
--    echo -n "Fetching dvb-scan files... "
--    ${ROOTDIR}/support/getmuxlist &> /dev/null || die "Failed to fetch dvb-scan files (use --disable-dvbscan to skip)"
--    echo "done"
--  fi
--fi
-+# For buildroot, we already installed those files via the dvb-apps package
-+#if enabled linuxdvb && enabled dvbscan; then
-+#  if [ ! -d ${ROOTDIR}/data/dvb-scan ]; then
-+#    echo -n "Fetching dvb-scan files... "
-+#    ${ROOTDIR}/support/getmuxlist &> /dev/null || die "Failed to fetch dvb-scan files (use --disable-dvbscan to skip)"
-+#    echo "done"
-+#  fi
-+#fi
- 
- # ###########################################################################
- # Write config
-diff -durN tvheadend-v3.3.orig//Makefile tvheadend-v3.3/Makefile
---- tvheadend-v3.3.orig//Makefile	2012-09-25 15:32:31.000000000 +0200
-+++ tvheadend-v3.3/Makefile	2012-12-28 17:17:47.573497346 +0100
-@@ -180,7 +180,7 @@
- SRCS-${CONFIG_BUNDLE}     += bundle.c
- BUNDLES-yes               += docs/html docs/docresources src/webui/static
- BUNDLES-yes               += data/conf
--BUNDLES-${CONFIG_DVBSCAN} += data/dvb-scan
-+#BUNDLES-${CONFIG_DVBSCAN} += data/dvb-scan
- BUNDLES                    = $(BUNDLES-yes)
- 
- #
-diff -durN tvheadend-v3.3.orig//support/posix.mk tvheadend-v3.3/support/posix.mk
---- tvheadend-v3.3.orig//support/posix.mk	2012-09-25 15:32:31.000000000 +0200
-+++ tvheadend-v3.3/support/posix.mk	2012-12-28 17:19:28.903121722 +0100
-@@ -12,7 +12,8 @@
- 		mkdir -p ${DESTDIR}${datadir}/tvheadend/$$bundle ;\
- 		cp -r $$bundle/*  ${DESTDIR}${datadir}/tvheadend/$$bundle ;\
- 	done
--
-+	mkdir -p ${DESTDIR}${datadir}/tvheadend/data
-+	ln -sf /usr/share/dvb ${DESTDIR}${datadir}/tvheadend/data/dvb-scan
- 
- uninstall:
- 	rm -f ${DESTDIR}${bindir)/tvheadend
diff --git a/package/tvheadend/tvheadend-no-wordexp.patch b/package/tvheadend/tvheadend-no-wordexp.patch
deleted file mode 100644
index ae290ed..0000000
--- a/package/tvheadend/tvheadend-no-wordexp.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-epggrab: do not include wordexp.h
-
-Nothing from wordexp.h is needed (stray include?)
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
-Patch sent upstream, but no mailing-list. :-(
-Status: awaiting feedback.
-
-diff -durN tvheadend-v3.3.orig/src/epggrab.c tvheadend-v3.3/src/epggrab.c
---- tvheadend-v3.3.orig/src/epggrab.c	2012-09-25 15:32:31.000000000 +0200
-+++ tvheadend-v3.3/src/epggrab.c	2012-12-31 19:22:29.768431849 +0100
-@@ -20,7 +20,6 @@
- #include <stdlib.h>
- #include <string.h>
- #include <assert.h>
--#include <wordexp.h>
- #include <unistd.h>
- #include <sys/types.h>
- #include <sys/un.h>
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 5100781..5a971b8 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ##############################################################
 
-TVHEADEND_VERSION           = v3.3
+TVHEADEND_VERSION           = v3.5
 TVHEADEND_SITE              = http://github.com/tvheadend/tvheadend/tarball/$(TVHEADEND_VERSION)
 TVHEADEND_LICENSE           = GPLv3+
 TVHEADEND_LICENSE_FILES     = LICENSE

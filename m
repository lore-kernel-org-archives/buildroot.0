From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 May 2015 08:59:15 +0200
Subject: [Buildroot] [git commit] package/gnuchess: fix static build with
	uClibc
Message-ID: <20150511070052.A42AE80136@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1444c268712667fa77656de0b2807d69ff1e1a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch src/Makefile.in to avoid to use autoconf and it's
dependencies.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-fix-static-build-with-uClibc.patch        |   47 ++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/package/gnuchess/0001-fix-static-build-with-uClibc.patch b/package/gnuchess/0001-fix-static-build-with-uClibc.patch
new file mode 100644
index 0000000..20a0835
--- /dev/null
+++ b/package/gnuchess/0001-fix-static-build-with-uClibc.patch
@@ -0,0 +1,47 @@
+From 5bb2bc6384024c2344ef5cc6785131b382c38170 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sun, 10 May 2015 22:19:03 +0200
+Subject: [PATCH] fix static build with uClibc
+
+uClibc doesn't provide lintl which should be provided
+by gettext. If gnuchess is linked statically, -lintl should
+be placed after libfrontend.a libadapter.a libengine.a.
+
+Fixes:
+http://autobuild.buildroot.net/results/dcb/dcb1c0eb7212bd8d1e0d8b51fd517b73b7569cea/
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ src/Makefile.am | 2 +-
+ src/Makefile.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index ba90bce..fc02543 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -34,7 +34,7 @@ DEFS = -DLOCALEDIR=\"$(localedir)\" @DEFS@
+ DISTCLEANFILES = *~
+ 
+ SUBDIRS = frontend adapter engine
+-gnuchess_LDADD = $(LIBINTL) frontend/libfrontend.a adapter/libadapter.a engine/libengine.a
++gnuchess_LDADD = frontend/libfrontend.a adapter/libadapter.a engine/libengine.a $(LIBINTL)
+ 
+ configmake.h: Makefile
+ 	rm -f $@-t $@
+diff --git a/src/Makefile.in b/src/Makefile.in
+index 9460bfd..424da52 100644
+--- a/src/Makefile.in
++++ b/src/Makefile.in
+@@ -395,7 +395,7 @@ AM_LDFLAGS = $(PTHREAD_LDFLAGS) $(PTHREAD_LIBS)
+ AM_CPPFLAGS = -I$(top_srcdir)/lib -I$(top_builddir)/lib
+ DISTCLEANFILES = *~
+ SUBDIRS = frontend adapter engine
+-gnuchess_LDADD = $(LIBINTL) frontend/libfrontend.a adapter/libadapter.a engine/libengine.a
++gnuchess_LDADD = frontend/libfrontend.a adapter/libadapter.a engine/libengine.a $(LIBINTL)
+ BUILT_SOURCES = configmake.h
+ CLEANFILES = configmake.h configmake.h-t
+ all: $(BUILT_SOURCES) config.h
+-- 
+1.9.3
+

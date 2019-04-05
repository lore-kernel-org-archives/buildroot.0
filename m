From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Apr 2019 19:10:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/qdecoder: bump to version 12.0.7
Message-ID: <20190405171022.16130-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove all patches (already in version)
- Drop AUTORECONF as configure.ac is not patched anymore
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qdecoder/0001-fix-make-install.patch  | 40 -------------------
 ...02-configure.ac-drop-hardcoded-paths.patch | 25 ------------
 package/qdecoder/0003-errno.patch             | 34 ----------------
 package/qdecoder/qdecoder.hash                |  3 +-
 package/qdecoder/qdecoder.mk                  |  4 +-
 5 files changed, 3 insertions(+), 103 deletions(-)
 delete mode 100644 package/qdecoder/0001-fix-make-install.patch
 delete mode 100644 package/qdecoder/0002-configure.ac-drop-hardcoded-paths.patch
 delete mode 100644 package/qdecoder/0003-errno.patch

diff --git a/package/qdecoder/0001-fix-make-install.patch b/package/qdecoder/0001-fix-make-install.patch
deleted file mode 100644
index f353566839..0000000000
--- a/package/qdecoder/0001-fix-make-install.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-[PATCH] fix make install to respect DESTDIR
-
-And also ensure destination directories exist.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/Makefile.in |   17 +++++++++--------
- 1 file changed, 9 insertions(+), 8 deletions(-)
-
-Index: qdecoder-r12.0.5/src/Makefile.in
-===================================================================
---- qdecoder-r12.0.5.orig/src/Makefile.in
-+++ qdecoder-r12.0.5/src/Makefile.in
-@@ -78,17 +78,18 @@
- 	${LN_S} -f ${SLIBREALNAME} ${SLIBNAME}
- 
- install: all
--	${INSTALL_DATA} qdecoder.h ${HEADERDIR}/qdecoder.h
--	${INSTALL_DATA} ${LIBNAME} ${LIBDIR}/${LIBNAME}
--	${INSTALL_DATA} ${SLIBREALNAME} ${LIBDIR}/${SLIBREALNAME}
--	( cd ${LIBDIR}; ${LN_S} -f ${SLIBREALNAME} ${SLIBNAME} )
-+	mkdir -p ${DESTDIR}/${HEADERDIR} ${DESTDIR}/${LIBDIR}
-+	${INSTALL_DATA} qdecoder.h ${DESTDIR}/${HEADERDIR}/qdecoder.h
-+	${INSTALL_DATA} ${LIBNAME} ${DESTDIR}/${LIBDIR}/${LIBNAME}
-+	${INSTALL_DATA} ${SLIBREALNAME} ${DESTDIR}/${LIBDIR}/${SLIBREALNAME}
-+	( cd ${DESTDIR}/${LIBDIR}; ${LN_S} -f ${SLIBREALNAME} ${SLIBNAME} )
- 
- deinstall: uninstall
- uninstall:
--	${RM} -f ${HEADERDIR}/qdecoder.h
--	${RM} -f ${LIBDIR}/${LIBNAME}
--	${RM} -f ${LIBDIR}/${SLIBREALNAME}
--	${RM} -f ${LIBDIR}/${SLIBNAME}
-+	${RM} -f ${DESTDIR}/${HEADERDIR}/qdecoder.h
-+	${RM} -f ${DESTDIR}/${LIBDIR}/${LIBNAME}
-+	${RM} -f ${DESTDIR}/${LIBDIR}/${SLIBREALNAME}
-+	${RM} -f ${DESTDIR}/${LIBDIR}/${SLIBNAME}
- 
- doc:
- 	doxygen doxygen.conf
diff --git a/package/qdecoder/0002-configure.ac-drop-hardcoded-paths.patch b/package/qdecoder/0002-configure.ac-drop-hardcoded-paths.patch
deleted file mode 100644
index 689d1d9124..0000000000
--- a/package/qdecoder/0002-configure.ac-drop-hardcoded-paths.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-[PATCH] configure.ac: drop hardcoded paths
-
-Causing problems with cross compilation.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- configure.ac |    5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-Index: qdecoder-r12.0.5/configure.ac
-===================================================================
---- qdecoder-r12.0.5.orig/configure.ac
-+++ qdecoder-r12.0.5/configure.ac
-@@ -81,10 +81,7 @@
- AC_CONFIG_HEADER([config.h])
- AC_CONFIG_FILES([Makefile src/Makefile examples/Makefile])
- 
--## Set path
--PATH="$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"
--CPPFLAGS="$CPPFLAGS -I/usr/include -I/usr/local/include -I./ -D_GNU_SOURCE"
--LDFLAGS="$LDFLAGS -L/usr/lib -L/usr/local/lib"
-+CPPFLAGS="$CPPFLAGS -I./ -D_GNU_SOURCE"
- 
- ## Set autoconf setting
- #AC_CANONICAL_TARGET
diff --git a/package/qdecoder/0003-errno.patch b/package/qdecoder/0003-errno.patch
deleted file mode 100644
index 71d5cfd662..0000000000
--- a/package/qdecoder/0003-errno.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Fixes build error
-
-qcgireq.c: In function '_parse_multipart_value_into_disk':
-qcgireq.c:738:60: error: 'errno' undeclared (first use in this function)
-         DEBUG("I/O error. (errno=%d)", (ioerror == true) ? errno : 0);
-
-Patch downloaded from upstream repo:
-https://github.com/wolkykim/qdecoder/commit/574f0216a51e3e852cd94e2a0a3b52dc64e74548
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-
-From 574f0216a51e3e852cd94e2a0a3b52dc64e74548 Mon Sep 17 00:00:00 2001
-From: nyov <nyov@nexnode.net>
-Date: Fri, 5 Sep 2014 18:41:10 +0000
-Subject: [PATCH] add missing header include
-
-fixes #7
----
- src/qcgireq.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/qcgireq.c b/src/qcgireq.c
-index dcb8c57..d34ff83 100644
---- a/src/qcgireq.c
-+++ b/src/qcgireq.c
-@@ -139,6 +139,7 @@
- #ifndef _WIN32
- #include <dirent.h>
- #endif
-+#include <errno.h>
- #include "qdecoder.h"
- #include "internal.h"
- 
diff --git a/package/qdecoder/qdecoder.hash b/package/qdecoder/qdecoder.hash
index 6b30310784..181cbd7aab 100644
--- a/package/qdecoder/qdecoder.hash
+++ b/package/qdecoder/qdecoder.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 641d3df4895626d7a530c5d26724e9b5887e9845d4b47f42c1cbce4a17ebf6af  qdecoder-r12.0.5.tar.gz
+sha256 01d4852b9343757abe98bbdb9d4bf0dc142ccb602ec921906ddde32c16164376  qdecoder-v12.0.7.tar.gz
+sha256 17e647523e5c5c75fd02861dcf3ea91a146d918ab303460ee58135c9dd70904e  COPYING
diff --git a/package/qdecoder/qdecoder.mk b/package/qdecoder/qdecoder.mk
index bbbf42a98c..1112f0707b 100644
--- a/package/qdecoder/qdecoder.mk
+++ b/package/qdecoder/qdecoder.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-QDECODER_VERSION = r12.0.5
+QDECODER_VERSION = v12.0.7
 QDECODER_SITE = $(call github,wolkykim,qdecoder,$(QDECODER_VERSION))
 QDECODER_LICENSE = BSD-2
 QDECODER_LICENSE_FILES = COPYING
-# we patch configure.ac
-QDECODER_AUTORECONF = YES
 QDECODER_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
 QDECODER_INSTALL_STAGING = YES
-- 
2.20.1

From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 May 2016 10:22:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/qlibc: bump version to 2.4.1
Message-ID: <1463818975-16680-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch depends on http://patchwork.ozlabs.org/patch/624729/

Rebased 0002-obey-destdir.patch using upstream commit.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/qlibc/0002-obey-destdir.patch              | 154 ++++++++++++++-------
 ...l-build-by-removing-usage-of-internal-gli.patch |  11 +-
 package/qlibc/qlibc.mk                             |   2 +-
 3 files changed, 110 insertions(+), 57 deletions(-)

diff --git a/package/qlibc/0002-obey-destdir.patch b/package/qlibc/0002-obey-destdir.patch
index 02b0bc4..f007aa4 100644
--- a/package/qlibc/0002-obey-destdir.patch
+++ b/package/qlibc/0002-obey-destdir.patch
@@ -1,90 +1,144 @@
-Make sure the Makefile obeys $(DESTDIR)
+From dbdc772a35244b45c725a72fad5ddade9bd7d521 Mon Sep 17 00:00:00 2001
+From: pcarpent <pierre-francois.carpentier@c-s.fr>
+Date: Tue, 15 Dec 2015 10:23:44 +0100
+Subject: [PATCH] fix makefile
 
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+add DESTDIR variables in install targets
 
-Index: b/src/Makefile.in
-===================================================================
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(downloaded from upstream commit not included in v2.4.1
+ https://github.com/wolkykim/qlibc/commit/dbdc772a35244b45c725a72fad5ddade9bd7d521)
+---
+ src/Makefile.in | 110 ++++++++++++++++++++++++++++----------------------------
+ 1 file changed, 55 insertions(+), 55 deletions(-)
+
+diff --git a/src/Makefile.in b/src/Makefile.in
+index 8a7ab43..4e274ed 100644
 --- a/src/Makefile.in
 +++ b/src/Makefile.in
-@@ -120,48 +120,48 @@
+@@ -122,70 +122,70 @@ qlibcext: ${QLIBCEXT_OBJS}
  install: ${INSTALL_TARGETS}
  
  install-qlibc: qlibc
 -	${MKDIR_P} ${INST_INCDIR}/qlibc
 -	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibc.h ${INST_INCDIR}/qlibc/qlibc.h
+-	${MKDIR_P} ${INST_INCDIR}/qlibc/containers/
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/containers/qtreetbl.h ${INST_INCDIR}/qlibc/containers/qtreetbl.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/containers/qhashtbl.h ${INST_INCDIR}/qlibc/containers/qhashtbl.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/containers/qhasharr.h ${INST_INCDIR}/qlibc/containers/qhasharr.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/containers/qlisttbl.h ${INST_INCDIR}/qlibc/containers/qlisttbl.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/containers/qlist.h ${INST_INCDIR}/qlibc/containers/qlist.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/containers/qvector.h ${INST_INCDIR}/qlibc/containers/qvector.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/containers/qqueue.h ${INST_INCDIR}/qlibc/containers/qqueue.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/containers/qstack.h ${INST_INCDIR}/qlibc/containers/qstack.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/containers/qgrow.h ${INST_INCDIR}/qlibc/containers/qgrow.h
+-	${MKDIR_P} ${INST_INCDIR}/qlibc/utilities/
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/utilities/qcount.h ${INST_INCDIR}/qlibc/utilities/qcount.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/utilities/qencode.h ${INST_INCDIR}/qlibc/utilities/qencode.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/utilities/qfile.h ${INST_INCDIR}/qlibc/utilities/qfile.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/utilities/qhash.h ${INST_INCDIR}/qlibc/utilities/qhash.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/utilities/qio.h ${INST_INCDIR}/qlibc/utilities/qio.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/utilities/qsocket.h ${INST_INCDIR}/qlibc/utilities/qsocket.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/utilities/qstring.h ${INST_INCDIR}/qlibc/utilities/qstring.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/utilities/qsystem.h ${INST_INCDIR}/qlibc/utilities/qsystem.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/utilities/qtime.h ${INST_INCDIR}/qlibc/utilities/qtime.h
+-	${MKDIR_P} ${INST_INCDIR}/qlibc/ipc/
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/ipc/qsem.h ${INST_INCDIR}/qlibc/ipc/qsem.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/ipc/qshm.h ${INST_INCDIR}/qlibc/ipc/qshm.h
 -	${MKDIR_P} ${INST_LIBDIR}
 -	${INSTALL_DATA} ${QLIBC_LIBDIR}/${QLIBC_LIBNAME} ${INST_LIBDIR}/${QLIBC_LIBNAME}
 -	${INSTALL_DATA} ${QLIBC_LIBDIR}/${QLIBC_SLIBREALNAME} ${INST_LIBDIR}/${QLIBC_SLIBREALNAME}
 -	( cd ${INST_LIBDIR}; ${LN_S} -f ${QLIBC_SLIBREALNAME} ${QLIBC_SLIBNAME} )
-+	${MKDIR_P} ${DESTDIR}/${INST_INCDIR}/qlibc
-+	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibc.h ${DESTDIR}/${INST_INCDIR}/qlibc/qlibc.h
-+	${MKDIR_P} ${DESTDIR}/${INST_LIBDIR}
-+	${INSTALL_DATA} ${QLIBC_LIBDIR}/${QLIBC_LIBNAME} ${DESTDIR}/${INST_LIBDIR}/${QLIBC_LIBNAME}
-+	${INSTALL_DATA} ${QLIBC_LIBDIR}/${QLIBC_SLIBREALNAME} ${DESTDIR}/${INST_LIBDIR}/${QLIBC_SLIBREALNAME}
-+	( cd ${DESTDIR}/${INST_LIBDIR}; ${LN_S} -f ${QLIBC_SLIBREALNAME} ${QLIBC_SLIBNAME} )
++	${MKDIR_P} $(DESTDIR)/${INST_INCDIR}/qlibc
++	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibc.h $(DESTDIR)/${INST_INCDIR}/qlibc/qlibc.h
++	${MKDIR_P} $(DESTDIR)/${INST_INCDIR}/qlibc/containers/
++	${INSTALL_DATA} ${QLIBC_INCDIR}/containers/qtreetbl.h $(DESTDIR)/${INST_INCDIR}/qlibc/containers/qtreetbl.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/containers/qhashtbl.h $(DESTDIR)/${INST_INCDIR}/qlibc/containers/qhashtbl.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/containers/qhasharr.h $(DESTDIR)/${INST_INCDIR}/qlibc/containers/qhasharr.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/containers/qlisttbl.h $(DESTDIR)/${INST_INCDIR}/qlibc/containers/qlisttbl.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/containers/qlist.h $(DESTDIR)/${INST_INCDIR}/qlibc/containers/qlist.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/containers/qvector.h $(DESTDIR)/${INST_INCDIR}/qlibc/containers/qvector.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/containers/qqueue.h $(DESTDIR)/${INST_INCDIR}/qlibc/containers/qqueue.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/containers/qstack.h $(DESTDIR)/${INST_INCDIR}/qlibc/containers/qstack.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/containers/qgrow.h $(DESTDIR)/${INST_INCDIR}/qlibc/containers/qgrow.h
++	${MKDIR_P} $(DESTDIR)/${INST_INCDIR}/qlibc/utilities/
++	${INSTALL_DATA} ${QLIBC_INCDIR}/utilities/qcount.h $(DESTDIR)/${INST_INCDIR}/qlibc/utilities/qcount.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/utilities/qencode.h $(DESTDIR)/${INST_INCDIR}/qlibc/utilities/qencode.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/utilities/qfile.h $(DESTDIR)/${INST_INCDIR}/qlibc/utilities/qfile.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/utilities/qhash.h $(DESTDIR)/${INST_INCDIR}/qlibc/utilities/qhash.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/utilities/qio.h $(DESTDIR)/${INST_INCDIR}/qlibc/utilities/qio.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/utilities/qsocket.h $(DESTDIR)/${INST_INCDIR}/qlibc/utilities/qsocket.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/utilities/qstring.h $(DESTDIR)/${INST_INCDIR}/qlibc/utilities/qstring.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/utilities/qsystem.h $(DESTDIR)/${INST_INCDIR}/qlibc/utilities/qsystem.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/utilities/qtime.h $(DESTDIR)/${INST_INCDIR}/qlibc/utilities/qtime.h
++	${MKDIR_P} $(DESTDIR)/${INST_INCDIR}/qlibc/ipc/
++	${INSTALL_DATA} ${QLIBC_INCDIR}/ipc/qsem.h $(DESTDIR)/${INST_INCDIR}/qlibc/ipc/qsem.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/ipc/qshm.h $(DESTDIR)/${INST_INCDIR}/qlibc/ipc/qshm.h
++	${MKDIR_P} $(DESTDIR)/${INST_LIBDIR}
++	${INSTALL_DATA} ${QLIBC_LIBDIR}/${QLIBC_LIBNAME} $(DESTDIR)/${INST_LIBDIR}/${QLIBC_LIBNAME}
++	${INSTALL_DATA} ${QLIBC_LIBDIR}/${QLIBC_SLIBREALNAME} $(DESTDIR)/${INST_LIBDIR}/${QLIBC_SLIBREALNAME}
++	( cd $(DESTDIR)/${INST_LIBDIR}; ${LN_S} -f ${QLIBC_SLIBREALNAME} ${QLIBC_SLIBNAME} )
  
  uninstall-qlibc:
 -	${RM} -f ${INST_INCDIR}/qlibc/qlibc.h
+-	${RM} -rf ${INST_INCDIR}/qlibc/containers
+-	${RM} -rf ${INST_INCDIR}/qlibc/utilities
+-	${RM} -rf ${INST_INCDIR}/qlibc/ipc
 -	${RM} -f ${INST_LIBDIR}/${QLIBC_LIBNAME}
 -	${RM} -f ${INST_LIBDIR}/${QLIBC_SLIBREALNAME}
 -	${RM} -f ${INST_LIBDIR}/${QLIBC_SLIBNAME}
-+	${RM} -f ${DESTDIR}/${INST_INCDIR}/qlibc/qlibc.h
-+	${RM} -f ${DESTDIR}/${INST_LIBDIR}/${QLIBC_LIBNAME}
-+	${RM} -f ${DESTDIR}/${INST_LIBDIR}/${QLIBC_SLIBREALNAME}
-+	${RM} -f ${DESTDIR}/${INST_LIBDIR}/${QLIBC_SLIBNAME}
++	${RM} -f $(DESTDIR)/${INST_INCDIR}/qlibc/qlibc.h
++	${RM} -rf $(DESTDIR)/${INST_INCDIR}/qlibc/containers
++	${RM} -rf $(DESTDIR)/${INST_INCDIR}/qlibc/utilities
++	${RM} -rf $(DESTDIR)/${INST_INCDIR}/qlibc/ipc
++	${RM} -f $(DESTDIR)/${INST_LIBDIR}/${QLIBC_LIBNAME}
++	${RM} -f $(DESTDIR)/${INST_LIBDIR}/${QLIBC_SLIBREALNAME}
++	${RM} -f $(DESTDIR)/${INST_LIBDIR}/${QLIBC_SLIBNAME}
  
  install-qlibcext: qlibcext
 -	${MKDIR_P} ${INST_INCDIR}/qlibc
--	${MKDIR_P} ${INST_INCDIR}/qlibc/qlibcext/
 -	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext.h ${INST_INCDIR}/qlibc/qlibcext.h
--	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext/qconfig.h ${INST_INCDIR}/qlibc/qlibcext/qconfig.h
--	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext/qaconf.h ${INST_INCDIR}/qlibc/qlibcext/qaconf.h
--	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext/qlog.h ${INST_INCDIR}/qlibc/qlibcext/qlog.h
--	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext/qhttpclient.h ${INST_INCDIR}/qlibc/qlibcext/qhttpclient.h
--	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext/qdatabase.h ${INST_INCDIR}/qlibc/qlibcext/qdatabase.h
+-	${MKDIR_P} ${INST_INCDIR}/qlibc/extensions/
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/extensions/qconfig.h ${INST_INCDIR}/qlibc/extensions/qconfig.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/extensions/qaconf.h ${INST_INCDIR}/qlibc/extensions/qaconf.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/extensions/qlog.h ${INST_INCDIR}/qlibc/extensions/qlog.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/extensions/qhttpclient.h ${INST_INCDIR}/qlibc/extensions/qhttpclient.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/extensions/qdatabase.h ${INST_INCDIR}/qlibc/extensions/qdatabase.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/extensions/qtokenbucket.h ${INST_INCDIR}/qlibc/extensions/qtokenbucket.h
 -	${MKDIR_P} ${INST_LIBDIR}
 -	${INSTALL_DATA} ${QLIBC_LIBDIR}/${QLIBCEXT_LIBNAME} ${INST_LIBDIR}/${QLIBCEXT_LIBNAME}
 -	${INSTALL_DATA} ${QLIBC_LIBDIR}/${QLIBCEXT_SLIBREALNAME} ${INST_LIBDIR}/${QLIBCEXT_SLIBREALNAME}
 -	( cd ${INST_LIBDIR}; ${LN_S} -f ${QLIBCEXT_SLIBREALNAME} ${QLIBCEXT_SLIBNAME} )
-+	${MKDIR_P} ${DESTDIR}/${INST_INCDIR}/qlibc
-+	${MKDIR_P} ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext/
-+	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext.h ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext.h
-+	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext/qconfig.h ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext/qconfig.h
-+	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext/qaconf.h ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext/qaconf.h
-+	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext/qlog.h ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext/qlog.h
-+	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext/qhttpclient.h ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext/qhttpclient.h
-+	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext/qdatabase.h ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext/qdatabase.h
-+	${MKDIR_P} ${DESTDIR}/${INST_LIBDIR}
-+	${INSTALL_DATA} ${QLIBC_LIBDIR}/${QLIBCEXT_LIBNAME} ${DESTDIR}/${INST_LIBDIR}/${QLIBCEXT_LIBNAME}
-+	${INSTALL_DATA} ${QLIBC_LIBDIR}/${QLIBCEXT_SLIBREALNAME} ${DESTDIR}/${INST_LIBDIR}/${QLIBCEXT_SLIBREALNAME}
-+	( cd ${DESTDIR}/${INST_LIBDIR}; ${LN_S} -f ${QLIBCEXT_SLIBREALNAME} ${QLIBCEXT_SLIBNAME} )
++	${MKDIR_P} $(DESTDIR)/${INST_INCDIR}/qlibc
++	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext.h $(DESTDIR)/${INST_INCDIR}/qlibc/qlibcext.h
++	${MKDIR_P} $(DESTDIR)/${INST_INCDIR}/qlibc/extensions/
++	${INSTALL_DATA} ${QLIBC_INCDIR}/extensions/qconfig.h $(DESTDIR)/${INST_INCDIR}/qlibc/extensions/qconfig.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/extensions/qaconf.h $(DESTDIR)/${INST_INCDIR}/qlibc/extensions/qaconf.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/extensions/qlog.h $(DESTDIR)/${INST_INCDIR}/qlibc/extensions/qlog.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/extensions/qhttpclient.h $(DESTDIR)/${INST_INCDIR}/qlibc/extensions/qhttpclient.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/extensions/qdatabase.h $(DESTDIR)/${INST_INCDIR}/qlibc/extensions/qdatabase.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/extensions/qtokenbucket.h $(DESTDIR)/${INST_INCDIR}/qlibc/extensions/qtokenbucket.h
++	${MKDIR_P} $(DESTDIR)/${INST_LIBDIR}
++	${INSTALL_DATA} ${QLIBC_LIBDIR}/${QLIBCEXT_LIBNAME} $(DESTDIR)/${INST_LIBDIR}/${QLIBCEXT_LIBNAME}
++	${INSTALL_DATA} ${QLIBC_LIBDIR}/${QLIBCEXT_SLIBREALNAME} $(DESTDIR)/${INST_LIBDIR}/${QLIBCEXT_SLIBREALNAME}
++	( cd $(DESTDIR)/${INST_LIBDIR}; ${LN_S} -f ${QLIBCEXT_SLIBREALNAME} ${QLIBCEXT_SLIBNAME} )
  
  uninstall-qlibcext:
 -	${RM} -f ${INST_INCDIR}/qlibc/qlibcext.h
--	${RM} -f ${INST_INCDIR}/qlibc/qlibcext/qconfig.h
--	${RM} -f ${INST_INCDIR}/qlibc/qlibcext/qaconf.h
--	${RM} -f ${INST_INCDIR}/qlibc/qlibcext/qlog.h
--	${RM} -f ${INST_INCDIR}/qlibc/qlibcext/qhttpclient.h
--	${RM} -f ${INST_INCDIR}/qlibc/qlibcext/qdatabase.h
+-	${RM} -rf ${INST_INCDIR}/qlibc/extensions
 -	${RM} -f ${INST_LIBDIR}/${QLIBCEXT_LIBNAME}
 -	${RM} -f ${INST_LIBDIR}/${QLIBCEXT_SLIBREALNAME}
 -	${RM} -f ${INST_LIBDIR}/${QLIBCEXT_SLIBNAME}
-+	${RM} -f ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext.h
-+	${RM} -f ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext/qconfig.h
-+	${RM} -f ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext/qaconf.h
-+	${RM} -f ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext/qlog.h
-+	${RM} -f ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext/qhttpclient.h
-+	${RM} -f ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext/qdatabase.h
-+	${RM} -f ${DESTDIR}/${INST_LIBDIR}/${QLIBCEXT_LIBNAME}
-+	${RM} -f ${DESTDIR}/${INST_LIBDIR}/${QLIBCEXT_SLIBREALNAME}
-+	${RM} -f ${DESTDIR}/${INST_LIBDIR}/${QLIBCEXT_SLIBNAME}
++	${RM} -f $(DESTDIR)/${INST_INCDIR}/qlibc/qlibcext.h
++	${RM} -rf $(DESTDIR)/${INST_INCDIR}/qlibc/extensions
++	${RM} -f $(DESTDIR)/${INST_LIBDIR}/${QLIBCEXT_LIBNAME}
++	${RM} -f $(DESTDIR)/${INST_LIBDIR}/${QLIBCEXT_SLIBREALNAME}
++	${RM} -f $(DESTDIR)/${INST_LIBDIR}/${QLIBCEXT_SLIBNAME}
  
  deinstall: uninstall
  uninstall: uninstall-qlibc uninstall-qlibcext
--	${RMDIR} ${INST_INCDIR}/qlibc/qlibcext
 -	${RMDIR} ${INST_INCDIR}/qlibc
-+	${RMDIR} ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext
-+	${RMDIR} ${DESTDIR}/${INST_INCDIR}/qlibc
++	${RMDIR} $(DESTDIR)/${INST_INCDIR}/qlibc
  
  clean:
  	${RM} -f ${QLIBC_OBJS}
diff --git a/package/qlibc/0004-md5-fix-musl-build-by-removing-usage-of-internal-gli.patch b/package/qlibc/0004-md5-fix-musl-build-by-removing-usage-of-internal-gli.patch
index 2ce3757..a48b27f 100644
--- a/package/qlibc/0004-md5-fix-musl-build-by-removing-usage-of-internal-gli.patch
+++ b/package/qlibc/0004-md5-fix-musl-build-by-removing-usage-of-internal-gli.patch
@@ -9,8 +9,7 @@ http://wiki.musl-libc.org/wiki/FAQ#Q:_I.27m_trying_to_compile_something_against_
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 (Patch for master branch sent upstream:
- https://github.com/wolkykim/qlibc/pull/53,
- this patch is a backport for v2.1.6)
+ https://github.com/wolkykim/qlibc/pull/53)
 ---
  src/internal/md5/md5.h  | 10 ++++++----
  src/internal/md5/md5c.c |  1 -
@@ -21,7 +20,7 @@ index cbfa7ca..8e726fe 100644
 --- a/src/internal/md5/md5.h
 +++ b/src/internal/md5/md5.h
 @@ -35,9 +35,9 @@ typedef struct MD5Context {
-     unsigned char buffer[64];	/* input buffer */
+     unsigned char buffer[64]; /* input buffer */
  } MD5_CTX;
  
 -#include <sys/cdefs.h>
@@ -30,9 +29,9 @@ index cbfa7ca..8e726fe 100644
 +#ifdef __cplusplus
 +extern "C" {
 +#endif
- void   MD5Init (MD5_CTX *);
- void   MD5Update (MD5_CTX *, const unsigned char *, unsigned int);
- void   MD5Final (unsigned char[16], MD5_CTX *);
+ void MD5Init(MD5_CTX *);
+ void MD5Update(MD5_CTX *, const unsigned char *, unsigned int);
+ void MD5Final(unsigned char[16], MD5_CTX *);
 @@ -45,6 +45,8 @@ char * MD5End(MD5_CTX *, char *);
  char * MD5File(const char *, char *);
  char * MD5FileChunk(const char *, char *, off_t, off_t);
diff --git a/package/qlibc/qlibc.mk b/package/qlibc/qlibc.mk
index 6a747e4..5aee1f4 100644
--- a/package/qlibc/qlibc.mk
+++ b/package/qlibc/qlibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QLIBC_VERSION = v2.1.6
+QLIBC_VERSION = v2.4.1
 QLIBC_SITE = $(call github,wolkykim,qlibc,$(QLIBC_VERSION))
 QLIBC_LICENSE = BSD-2c
 QLIBC_LICENSE_FILES = COPYING
-- 
2.8.1

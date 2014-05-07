From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 May 2014 22:18:11 +0200
Subject: [Buildroot] [git commit] qdecoder : new package
Message-ID: <20140507202446.3FC569CB25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e94e89709a568fb04831a63e4fa4df4df97e853
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Features:
   Supports parsing a request encoded by GET/POST method
   Supports parsing multipart/form-data encoding.(in-memory and direct disk)
   Supports COOKIE handling.
   Supports Session management.
   Supports FastCGI

[Peter: drop invalid patch, add patches for make install + configure paths]
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                  |    1 +
 package/qdecoder/Config.in                         |    8 ++++
 .../qdecoder/qdecoder-0001-fix-make-install.patch  |   40 ++++++++++++++++++++
 ...er-0002-configure.ac-drop-hardcoded-paths.patch |   25 ++++++++++++
 package/qdecoder/qdecoder.mk                       |   14 +++++++
 5 files changed, 88 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7800f23..2da27ce 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -755,6 +755,7 @@ source "package/nss-mdns/Config.in"
 source "package/omniorb/Config.in"
 source "package/openpgm/Config.in"
 source "package/ortp/Config.in"
+source "package/qdecoder/Config.in"
 source "package/rtmpdump/Config.in"
 source "package/slirp/Config.in"
 source "package/snmppp/Config.in"
diff --git a/package/qdecoder/Config.in b/package/qdecoder/Config.in
new file mode 100644
index 0000000..edc4d34
--- /dev/null
+++ b/package/qdecoder/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_QDECODER
+	bool "qdecoder"
+	depends on !BR2_PREFER_STATIC_LIB
+	help
+	  qDecoder is a simple and powerful CGI library
+	  for the C/C++ programming language.
+
+	  http://wolkykim.github.io/qdecoder
diff --git a/package/qdecoder/qdecoder-0001-fix-make-install.patch b/package/qdecoder/qdecoder-0001-fix-make-install.patch
new file mode 100644
index 0000000..f353566
--- /dev/null
+++ b/package/qdecoder/qdecoder-0001-fix-make-install.patch
@@ -0,0 +1,40 @@
+[PATCH] fix make install to respect DESTDIR
+
+And also ensure destination directories exist.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/Makefile.in |   17 +++++++++--------
+ 1 file changed, 9 insertions(+), 8 deletions(-)
+
+Index: qdecoder-r12.0.5/src/Makefile.in
+===================================================================
+--- qdecoder-r12.0.5.orig/src/Makefile.in
++++ qdecoder-r12.0.5/src/Makefile.in
+@@ -78,17 +78,18 @@
+ 	${LN_S} -f ${SLIBREALNAME} ${SLIBNAME}
+ 
+ install: all
+-	${INSTALL_DATA} qdecoder.h ${HEADERDIR}/qdecoder.h
+-	${INSTALL_DATA} ${LIBNAME} ${LIBDIR}/${LIBNAME}
+-	${INSTALL_DATA} ${SLIBREALNAME} ${LIBDIR}/${SLIBREALNAME}
+-	( cd ${LIBDIR}; ${LN_S} -f ${SLIBREALNAME} ${SLIBNAME} )
++	mkdir -p ${DESTDIR}/${HEADERDIR} ${DESTDIR}/${LIBDIR}
++	${INSTALL_DATA} qdecoder.h ${DESTDIR}/${HEADERDIR}/qdecoder.h
++	${INSTALL_DATA} ${LIBNAME} ${DESTDIR}/${LIBDIR}/${LIBNAME}
++	${INSTALL_DATA} ${SLIBREALNAME} ${DESTDIR}/${LIBDIR}/${SLIBREALNAME}
++	( cd ${DESTDIR}/${LIBDIR}; ${LN_S} -f ${SLIBREALNAME} ${SLIBNAME} )
+ 
+ deinstall: uninstall
+ uninstall:
+-	${RM} -f ${HEADERDIR}/qdecoder.h
+-	${RM} -f ${LIBDIR}/${LIBNAME}
+-	${RM} -f ${LIBDIR}/${SLIBREALNAME}
+-	${RM} -f ${LIBDIR}/${SLIBNAME}
++	${RM} -f ${DESTDIR}/${HEADERDIR}/qdecoder.h
++	${RM} -f ${DESTDIR}/${LIBDIR}/${LIBNAME}
++	${RM} -f ${DESTDIR}/${LIBDIR}/${SLIBREALNAME}
++	${RM} -f ${DESTDIR}/${LIBDIR}/${SLIBNAME}
+ 
+ doc:
+ 	doxygen doxygen.conf
diff --git a/package/qdecoder/qdecoder-0002-configure.ac-drop-hardcoded-paths.patch b/package/qdecoder/qdecoder-0002-configure.ac-drop-hardcoded-paths.patch
new file mode 100644
index 0000000..689d1d9
--- /dev/null
+++ b/package/qdecoder/qdecoder-0002-configure.ac-drop-hardcoded-paths.patch
@@ -0,0 +1,25 @@
+[PATCH] configure.ac: drop hardcoded paths
+
+Causing problems with cross compilation.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ configure.ac |    5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+Index: qdecoder-r12.0.5/configure.ac
+===================================================================
+--- qdecoder-r12.0.5.orig/configure.ac
++++ qdecoder-r12.0.5/configure.ac
+@@ -81,10 +81,7 @@
+ AC_CONFIG_HEADER([config.h])
+ AC_CONFIG_FILES([Makefile src/Makefile examples/Makefile])
+ 
+-## Set path
+-PATH="$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"
+-CPPFLAGS="$CPPFLAGS -I/usr/include -I/usr/local/include -I./ -D_GNU_SOURCE"
+-LDFLAGS="$LDFLAGS -L/usr/lib -L/usr/local/lib"
++CPPFLAGS="$CPPFLAGS -I./ -D_GNU_SOURCE"
+ 
+ ## Set autoconf setting
+ #AC_CANONICAL_TARGET
diff --git a/package/qdecoder/qdecoder.mk b/package/qdecoder/qdecoder.mk
new file mode 100644
index 0000000..506d975
--- /dev/null
+++ b/package/qdecoder/qdecoder.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# qdecoder
+#
+################################################################################
+
+QDECODER_VERSION = r12.0.5
+QDECODER_SITE = $(call github,wolkykim,qdecoder,$(QDECODER_VERSION))
+QDECODER_LICENSE = BSD-2
+QDECODER_LICENSE_FILES = COPYING
+
+QDECODER_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))

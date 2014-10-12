From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 15:12:11 +0200
Subject: [Buildroot] [PATCH] qlibc : new package
Message-ID: <1413119531-20050-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sagaert Johan <sagaert.johan@skynet.be>

[Thomas:
 - add dependency on threads, wchar and dynamic librayr
 - add dependency on libiconv when locale support is not enabled
 - replace patch hacking includedir by a patch that lets the Makefile
   obey to $(DESTDIR)
 - remove optional OpenSSL and MySQL support which simply cannot work
   due to the usage of AC_CHECK_FILE() in configure.ac, this required
   an additional patch to fix the bogus AC_ARG_WITH() calls.
 - move from 'Miscellaneous' to 'Libraries' -> 'Other'.
 - fixup the licensing information.]

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 package/qlibc/Config.in                            | 17 ++++
 .../qlibc/qlibc-0001-remove-absolute-paths.patch   | 19 +++++
 package/qlibc/qlibc-0002-obey-destdir.patch        | 90 ++++++++++++++++++++++
 .../qlibc-0003-fix-openssl-mysql-checks.patch      | 36 +++++++++
 package/qlibc/qlibc.mk                             | 23 ++++++
 6 files changed, 186 insertions(+)
 create mode 100644 package/qlibc/Config.in
 create mode 100644 package/qlibc/qlibc-0001-remove-absolute-paths.patch
 create mode 100644 package/qlibc/qlibc-0002-obey-destdir.patch
 create mode 100644 package/qlibc/qlibc-0003-fix-openssl-mysql-checks.patch
 create mode 100644 package/qlibc/qlibc.mk

diff --git a/package/Config.in b/package/Config.in
index ea94a2e..0ef9356 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -885,6 +885,7 @@ menu "Other"
 	source "package/protobuf/Config.in"
 	source "package/protobuf-c/Config.in"
 	source "package/qhull/Config.in"
+	source "package/qlibc/Config.in"
 	source "package/schifra/Config.in"
 	source "package/startup-notification/Config.in"
 	source "package/tz/Config.in"
diff --git a/package/qlibc/Config.in b/package/qlibc/Config.in
new file mode 100644
index 0000000..184c283
--- /dev/null
+++ b/package/qlibc/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_QLIBC
+	bool "qlibc"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
+	depends on !BR2_PREFER_STATIC_LIB
+	help
+	  qLibc is currently one of the most functionally complete
+	  public licensed C/C++ libraries.  The C/C++ library which
+	  includes all kinds of containers and general library
+	  routines. It provides ready-made set of common container
+	  APIs with consistant API look.
+
+	  https://github.com/wolkykim/qlibc
+
+comment "qlibc needs a toolchain w/ threads, wchar, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
diff --git a/package/qlibc/qlibc-0001-remove-absolute-paths.patch b/package/qlibc/qlibc-0001-remove-absolute-paths.patch
new file mode 100644
index 0000000..5976c3c
--- /dev/null
+++ b/package/qlibc/qlibc-0001-remove-absolute-paths.patch
@@ -0,0 +1,19 @@
+Remove absolute paths to host locations
+
+Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -85,10 +85,8 @@
+ 
+ ## Set path
+ PATH="$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"
+-CPPFLAGS="$CPPFLAGS -I/usr/include -I/usr/local/include"
+ CPPFLAGS="$CPPFLAGS -D_GNU_SOURCE"
+ CPPFLAGS="$CPPFLAGS -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
+-LDFLAGS="$LDFLAGS -L/usr/lib -L/usr/local/lib"
+ 
+ ## Set autoconf setting
+ #AC_CANONICAL_TARGET
diff --git a/package/qlibc/qlibc-0002-obey-destdir.patch b/package/qlibc/qlibc-0002-obey-destdir.patch
new file mode 100644
index 0000000..02b0bc4
--- /dev/null
+++ b/package/qlibc/qlibc-0002-obey-destdir.patch
@@ -0,0 +1,90 @@
+Make sure the Makefile obeys $(DESTDIR)
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/src/Makefile.in
+===================================================================
+--- a/src/Makefile.in
++++ b/src/Makefile.in
+@@ -120,48 +120,48 @@
+ install: ${INSTALL_TARGETS}
+ 
+ install-qlibc: qlibc
+-	${MKDIR_P} ${INST_INCDIR}/qlibc
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibc.h ${INST_INCDIR}/qlibc/qlibc.h
+-	${MKDIR_P} ${INST_LIBDIR}
+-	${INSTALL_DATA} ${QLIBC_LIBDIR}/${QLIBC_LIBNAME} ${INST_LIBDIR}/${QLIBC_LIBNAME}
+-	${INSTALL_DATA} ${QLIBC_LIBDIR}/${QLIBC_SLIBREALNAME} ${INST_LIBDIR}/${QLIBC_SLIBREALNAME}
+-	( cd ${INST_LIBDIR}; ${LN_S} -f ${QLIBC_SLIBREALNAME} ${QLIBC_SLIBNAME} )
++	${MKDIR_P} ${DESTDIR}/${INST_INCDIR}/qlibc
++	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibc.h ${DESTDIR}/${INST_INCDIR}/qlibc/qlibc.h
++	${MKDIR_P} ${DESTDIR}/${INST_LIBDIR}
++	${INSTALL_DATA} ${QLIBC_LIBDIR}/${QLIBC_LIBNAME} ${DESTDIR}/${INST_LIBDIR}/${QLIBC_LIBNAME}
++	${INSTALL_DATA} ${QLIBC_LIBDIR}/${QLIBC_SLIBREALNAME} ${DESTDIR}/${INST_LIBDIR}/${QLIBC_SLIBREALNAME}
++	( cd ${DESTDIR}/${INST_LIBDIR}; ${LN_S} -f ${QLIBC_SLIBREALNAME} ${QLIBC_SLIBNAME} )
+ 
+ uninstall-qlibc:
+-	${RM} -f ${INST_INCDIR}/qlibc/qlibc.h
+-	${RM} -f ${INST_LIBDIR}/${QLIBC_LIBNAME}
+-	${RM} -f ${INST_LIBDIR}/${QLIBC_SLIBREALNAME}
+-	${RM} -f ${INST_LIBDIR}/${QLIBC_SLIBNAME}
++	${RM} -f ${DESTDIR}/${INST_INCDIR}/qlibc/qlibc.h
++	${RM} -f ${DESTDIR}/${INST_LIBDIR}/${QLIBC_LIBNAME}
++	${RM} -f ${DESTDIR}/${INST_LIBDIR}/${QLIBC_SLIBREALNAME}
++	${RM} -f ${DESTDIR}/${INST_LIBDIR}/${QLIBC_SLIBNAME}
+ 
+ install-qlibcext: qlibcext
+-	${MKDIR_P} ${INST_INCDIR}/qlibc
+-	${MKDIR_P} ${INST_INCDIR}/qlibc/qlibcext/
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext.h ${INST_INCDIR}/qlibc/qlibcext.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext/qconfig.h ${INST_INCDIR}/qlibc/qlibcext/qconfig.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext/qaconf.h ${INST_INCDIR}/qlibc/qlibcext/qaconf.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext/qlog.h ${INST_INCDIR}/qlibc/qlibcext/qlog.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext/qhttpclient.h ${INST_INCDIR}/qlibc/qlibcext/qhttpclient.h
+-	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext/qdatabase.h ${INST_INCDIR}/qlibc/qlibcext/qdatabase.h
+-	${MKDIR_P} ${INST_LIBDIR}
+-	${INSTALL_DATA} ${QLIBC_LIBDIR}/${QLIBCEXT_LIBNAME} ${INST_LIBDIR}/${QLIBCEXT_LIBNAME}
+-	${INSTALL_DATA} ${QLIBC_LIBDIR}/${QLIBCEXT_SLIBREALNAME} ${INST_LIBDIR}/${QLIBCEXT_SLIBREALNAME}
+-	( cd ${INST_LIBDIR}; ${LN_S} -f ${QLIBCEXT_SLIBREALNAME} ${QLIBCEXT_SLIBNAME} )
++	${MKDIR_P} ${DESTDIR}/${INST_INCDIR}/qlibc
++	${MKDIR_P} ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext/
++	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext.h ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext/qconfig.h ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext/qconfig.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext/qaconf.h ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext/qaconf.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext/qlog.h ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext/qlog.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext/qhttpclient.h ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext/qhttpclient.h
++	${INSTALL_DATA} ${QLIBC_INCDIR}/qlibcext/qdatabase.h ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext/qdatabase.h
++	${MKDIR_P} ${DESTDIR}/${INST_LIBDIR}
++	${INSTALL_DATA} ${QLIBC_LIBDIR}/${QLIBCEXT_LIBNAME} ${DESTDIR}/${INST_LIBDIR}/${QLIBCEXT_LIBNAME}
++	${INSTALL_DATA} ${QLIBC_LIBDIR}/${QLIBCEXT_SLIBREALNAME} ${DESTDIR}/${INST_LIBDIR}/${QLIBCEXT_SLIBREALNAME}
++	( cd ${DESTDIR}/${INST_LIBDIR}; ${LN_S} -f ${QLIBCEXT_SLIBREALNAME} ${QLIBCEXT_SLIBNAME} )
+ 
+ uninstall-qlibcext:
+-	${RM} -f ${INST_INCDIR}/qlibc/qlibcext.h
+-	${RM} -f ${INST_INCDIR}/qlibc/qlibcext/qconfig.h
+-	${RM} -f ${INST_INCDIR}/qlibc/qlibcext/qaconf.h
+-	${RM} -f ${INST_INCDIR}/qlibc/qlibcext/qlog.h
+-	${RM} -f ${INST_INCDIR}/qlibc/qlibcext/qhttpclient.h
+-	${RM} -f ${INST_INCDIR}/qlibc/qlibcext/qdatabase.h
+-	${RM} -f ${INST_LIBDIR}/${QLIBCEXT_LIBNAME}
+-	${RM} -f ${INST_LIBDIR}/${QLIBCEXT_SLIBREALNAME}
+-	${RM} -f ${INST_LIBDIR}/${QLIBCEXT_SLIBNAME}
++	${RM} -f ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext.h
++	${RM} -f ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext/qconfig.h
++	${RM} -f ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext/qaconf.h
++	${RM} -f ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext/qlog.h
++	${RM} -f ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext/qhttpclient.h
++	${RM} -f ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext/qdatabase.h
++	${RM} -f ${DESTDIR}/${INST_LIBDIR}/${QLIBCEXT_LIBNAME}
++	${RM} -f ${DESTDIR}/${INST_LIBDIR}/${QLIBCEXT_SLIBREALNAME}
++	${RM} -f ${DESTDIR}/${INST_LIBDIR}/${QLIBCEXT_SLIBNAME}
+ 
+ deinstall: uninstall
+ uninstall: uninstall-qlibc uninstall-qlibcext
+-	${RMDIR} ${INST_INCDIR}/qlibc/qlibcext
+-	${RMDIR} ${INST_INCDIR}/qlibc
++	${RMDIR} ${DESTDIR}/${INST_INCDIR}/qlibc/qlibcext
++	${RMDIR} ${DESTDIR}/${INST_INCDIR}/qlibc
+ 
+ clean:
+ 	${RM} -f ${QLIBC_OBJS}
diff --git a/package/qlibc/qlibc-0003-fix-openssl-mysql-checks.patch b/package/qlibc/qlibc-0003-fix-openssl-mysql-checks.patch
new file mode 100644
index 0000000..bb609b2
--- /dev/null
+++ b/package/qlibc/qlibc-0003-fix-openssl-mysql-checks.patch
@@ -0,0 +1,36 @@
+Allow to explicitly disable openssl and mysql
+
+AC_ARG_WITH() is being incorrectly used: the third argument indicates
+the action that needs to be taken when a value was passed, when not
+the option is enabled. Therefore, the result of the existing code was
+that when you passed --without-mysql or --without-openssl, the
+$withval variable would get the value 'yes', which is obviously wrong.
+
+Instead, we simply empty this third argument, because $withval is
+already properly filled with 'yes' or 'no' by the AC_ARG_WITH()
+function.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -170,7 +170,7 @@
+ ## --with section
+ ##
+ 
+-AC_ARG_WITH([openssl],[AS_HELP_STRING([--with-openssl], [This will enable HTTPS support in qhttpclient extension API. When it's enabled, user applications will need to link openssl library with -lssl option.])],[withval=yes],[withval=no])
++AC_ARG_WITH([openssl],[AS_HELP_STRING([--with-openssl], [This will enable HTTPS support in qhttpclient extension API. When it's enabled, user applications will need to link openssl library with -lssl option.])],[],[withval=no])
+ if test "$withval" = yes; then
+ 	if test "$with_openssl" = yes; then
+ 		with_openssl="/usr/include"
+@@ -185,7 +185,7 @@
+ 	fi
+ fi
+ 
+-AC_ARG_WITH([mysql],[AS_HELP_STRING([--with-mysql], [This will enable MySQL database support in qdatabase extension API. When it's enabled, user applications need to link mysql client library. (ex: -lmysqlclient)])],[withval=yes],[withval=no])
++AC_ARG_WITH([mysql],[AS_HELP_STRING([--with-mysql], [This will enable MySQL database support in qdatabase extension API. When it's enabled, user applications need to link mysql client library. (ex: -lmysqlclient)])],[],[withval=no])
+ if test "$withval" = yes; then
+ 	if test "$with_mysql" = yes; then
+ 		with_mysql="/usr/include/mysql"
diff --git a/package/qlibc/qlibc.mk b/package/qlibc/qlibc.mk
new file mode 100644
index 0000000..6a747e4
--- /dev/null
+++ b/package/qlibc/qlibc.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# qlibc
+#
+################################################################################
+
+QLIBC_VERSION = v2.1.6
+QLIBC_SITE = $(call github,wolkykim,qlibc,$(QLIBC_VERSION))
+QLIBC_LICENSE = BSD-2c
+QLIBC_LICENSE_FILES = COPYING
+
+# We're patching configure.ac
+QLIBC_AUTORECONF = YES
+QLIBC_INSTALL_STAGING = YES
+QLIBC_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+
+# The configure.ac checks for these use AC_CHECK_FILE() which doesn't
+# work for cross-compilation. If someone wants to enable the support
+# for OpenSSL or MySQL, some changes to the configure.ac will be
+# needed.
+QLIBC_CONF_OPTS = --without-mysql --without-openssl
+
+$(eval $(autotools-package))
-- 
2.0.0

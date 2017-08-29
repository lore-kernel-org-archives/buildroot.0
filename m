From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 29 Aug 2017 15:19:51 +0300
Subject: [Buildroot] [PATCH] lirc-tools: bump to version 0.10.0
Message-ID: <e695590b2b797d7762c02213c8576131e32f3dcc.1504009191.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.

Add a patch fixing build without python.

Add two more patches fixing cross compile of the python client library.

Enable devinput and uinput unconditionally to suppress non cross compile
compatible host checks.

Set DEVINPUT_HEADER to target header of input events to avoid use of
host header.

Add python3 as optional dependency.

Cc: Rhys Williams <github@wilberforce.co.nz>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
---
 .../lirc-tools/0001-Fix-build-without-Python.patch | 63 ++++++++++++++++++++++
 ...ll.h-fix-header-guard-collision-with-musl.patch | 62 ---------------------
 .../0002-Fix-python-client-cross-compile.patch     | 48 +++++++++++++++++
 ...Fix-lirc-version-detection-when-cross-com.patch | 39 ++++++++++++++
 package/lirc-tools/lirc-tools.hash                 |  8 +--
 package/lirc-tools/lirc-tools.mk                   | 19 ++++++-
 6 files changed, 171 insertions(+), 68 deletions(-)
 create mode 100644 package/lirc-tools/0001-Fix-build-without-Python.patch
 delete mode 100644 package/lirc-tools/0001-lib-curl_poll.h-fix-header-guard-collision-with-musl.patch
 create mode 100644 package/lirc-tools/0002-Fix-python-client-cross-compile.patch
 create mode 100644 package/lirc-tools/0003-python-pkg-Fix-lirc-version-detection-when-cross-com.patch

diff --git a/package/lirc-tools/0001-Fix-build-without-Python.patch b/package/lirc-tools/0001-Fix-build-without-Python.patch
new file mode 100644
index 000000000000..fe6a38c078ce
--- /dev/null
+++ b/package/lirc-tools/0001-Fix-build-without-Python.patch
@@ -0,0 +1,63 @@
+From 71f329d997d949d3c12d62d2f1473a1c99ee49b0 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sun, 27 Aug 2017 21:30:37 +0300
+Subject: [PATCH] Fix build without Python
+
+Don't define HAVE_PYTHON35 when PYTHON_LIBS is empty.
+
+Also, don't build Python dependent code when HAVE_PYTHON35 is not
+defined.
+
+This fixes build failures like:
+
+Makefile:1616: recipe for target 'python-pkg/dist/lirc-0.10.0.tar.gz' failed
+make[3]: *** [python-pkg/dist/lirc-0.10.0.tar.gz] Error 1
+python-pkg/lirc/_client.c:1:20: fatal error: Python.h: No such file or directory
+ #include <Python.h>
+                    ^
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://sourceforge.net/p/lirc/mailman/message/36014545/
+
+ Makefile.am  | 2 ++
+ configure.ac | 3 ++-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 9f3dd14340cc..d8164fcd44cf 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -104,6 +104,7 @@ dist_py_pkg_doc_DATA    = python-pkg/doc/Doxyfile \
+ 
+ libpython               = $(libdir)/python$(PYTHON_VERSION)
+ pydir                   = $(libpython)/site-packages/lirc
++if HAVE_PYTHON35
+ py_LTLIBRARIES          = python-pkg/lib/_client.la
+ python_pkg_lib__client_la_SOURCES = \
+                           python-pkg/lirc/_client.c
+@@ -116,6 +117,7 @@ python_pkg_lib__client_la_LDFLAGS  = \
+                           $(PYTHON_LIBS)
+ python_pkg_lib__client_la_LIBADD = \
+                           lib/liblirc_client.la
++endif
+ 
+ pylint: .phony
+ 	$(MAKE) -C tools pylint
+diff --git a/configure.ac b/configure.ac
+index 4108688433f8..07d901deafdf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -50,7 +50,8 @@ test -z "$PYTHON_LIBS" && \
+ test -n "$PYTHON_LIBS" || \
+     AC_MSG_WARN([No python package found (missing devel package?)])
+ python_version_nodots=$(echo $PYTHON_VERSION | tr -d '.')
+-AM_CONDITIONAL(HAVE_PYTHON35, [test $python_version_nodots -ge 35])
++AM_CONDITIONAL(HAVE_PYTHON35, [test -n "$PYTHON_LIBS" && \
++			       test $python_version_nodots -ge 35])
+ CFLAGS="$CFLAGS $PYTHON_CFLAGS"
+ 
+ 
+-- 
+2.14.1
+
diff --git a/package/lirc-tools/0001-lib-curl_poll.h-fix-header-guard-collision-with-musl.patch b/package/lirc-tools/0001-lib-curl_poll.h-fix-header-guard-collision-with-musl.patch
deleted file mode 100644
index a5cb7f35a03a..000000000000
--- a/package/lirc-tools/0001-lib-curl_poll.h-fix-header-guard-collision-with-musl.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From: Baruch Siach <baruch@tkos.co.il>
-Subject: [PATCH] lib/curl_poll.h: fix header guard collision with musl libc
-
-The musl libc uses the _POLL_H macro as a double include guard for the poll.h
-header. This breaks compilation of files the include curl_poll.h:
-
-In file included from driver.h:32:0,
-                 from driver.c:12:
-lirc/curl_poll.h:38:29: error: array type has incomplete element type ?struct pollfd?
- int curl_poll(struct pollfd ufds[], unsigned int nfds, int timeout_ms);
-                             ^~~~
-
-Rename the curl_poll.h header guard macro to avoid collision. Don't use a name
-that starts with an underscore and a capital letter since these names are
-reserved according to the ANSI C standard.
-
-https://www.gnu.org/software/libc/manual/html_node/Reserved-Names.html
-
-[ This patch is based on upstream, but changes also another copy of
-  curl_poll.h under lib/lirc/ ]
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: upstream
-https://sourceforge.net/p/lirc/git/ci/e07a80aa00a14fc98d7347afa1fa44282732b27f/
-
-diff --git lirc-0.9.4d-orig/lib/curl_poll.h lirc-0.9.4d/lib/curl_poll.h
-index af25381b3e26..1e895aa62f93 100644
---- lirc-0.9.4d-orig/lib/curl_poll.h
-+++ lirc-0.9.4d/lib/curl_poll.h
-@@ -1,5 +1,5 @@
--#ifndef _POLL_H
--#define _POLL_H
-+#ifndef HEADER_LIB_CURL_POLL_H
-+#define HEADER_LIB_CURL_POLL_H
- /***************************************************************************
-  *                                  _   _ ____  _
-  *  Project                     ___| | | |  _ \| |
-@@ -42,4 +42,4 @@ int curl_poll(struct pollfd ufds[], unsigned int nfds, int timeout_ms);
- #endif
- 
- 
--#endif /* _POLL_H */
-+#endif /* HEADER_LIB_CURL_POLL_H */
-diff --git lirc-0.9.4d-orig/lib/lirc/curl_poll.h lirc-0.9.4d/lib/lirc/curl_poll.h
-index af25381b3e26..1e895aa62f93 100644
---- lirc-0.9.4d-orig/lib/lirc/curl_poll.h
-+++ lirc-0.9.4d/lib/lirc/curl_poll.h
-@@ -1,5 +1,5 @@
--#ifndef _POLL_H
--#define _POLL_H
-+#ifndef HEADER_LIB_CURL_POLL_H
-+#define HEADER_LIB_CURL_POLL_H
- /***************************************************************************
-  *                                  _   _ ____  _
-  *  Project                     ___| | | |  _ \| |
-@@ -42,4 +42,4 @@ int curl_poll(struct pollfd ufds[], unsigned int nfds, int timeout_ms);
- #endif
- 
- 
--#endif /* _POLL_H */
-+#endif /* HEADER_LIB_CURL_POLL_H */
diff --git a/package/lirc-tools/0002-Fix-python-client-cross-compile.patch b/package/lirc-tools/0002-Fix-python-client-cross-compile.patch
new file mode 100644
index 000000000000..a268c0f1cb52
--- /dev/null
+++ b/package/lirc-tools/0002-Fix-python-client-cross-compile.patch
@@ -0,0 +1,48 @@
+From 13c4ffcfde07f659a836fba4a604dc1c5024bb90 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 29 Aug 2017 11:37:36 +0300
+Subject: [PATCH] Fix python client cross compile
+
+The setup.py setuptools wrapper needs to use a version of python built
+specifically for cross compiling to cross compile successfully. Allow
+setting that in the environment using the SETUPTOOLS_ENV variable.
+
+Fixes the following build failure:
+
+/usr/bin/ld: skipping incompatible .../lirc-tools-0.10.0/lib/.libs/liblirc_client.so when searching for -llirc_client
+/usr/bin/ld: cannot find -llirc_client
+collect2: error: ld returned 1 exit status
+error: command '/usr/bin/gcc' failed with exit status 1
+Makefile:1578: recipe for target 'all-local' failed
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: posted to upstream mailing list, awaits moderator approval
+https://sourceforge.net/p/lirc/mailman/lirc-list/?viewmonth=201708
+
+ Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index d8164fcd44cf..a16be4278ae2 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -131,6 +131,7 @@ pep8: $(py_PYTHON)
+ if HAVE_PYTHON35
+ all-local:
+ 	cd python-pkg; \
++	    $(SETUPTOOLS_ENV) \
+ 	    CFLAGS="-I$(abs_top_srcdir)/lib -I$(abs_builddir)/lib" \
+ 	    LDFLAGS=-L$(abs_builddir)/lib/.libs $(PYTHON) setup.py \
+ 	    $(if $(VERBOSE),,-q) build
+@@ -179,6 +180,7 @@ $(abs_builddir)/python-pkg/setup.py:
+ $(PYTHON_TARBALL): $(abs_builddir)/python-pkg/setup.py
+ 	cp $(top_builddir)/VERSION $(abs_builddir)/python-pkg
+ 	cd $(abs_builddir)/python-pkg; CFLAGS=-I$(abs_top_srcdir)/lib \
++	    $(SETUPTOOLS_ENV) \
+ 	    LDFLAGS=-L$(abs_builddir)/lib/.libs $(PYTHON) setup.py -q sdist
+ 
+ $(top_builddir)/python-pkg/VERSION: VERSION
+-- 
+2.14.1
+
diff --git a/package/lirc-tools/0003-python-pkg-Fix-lirc-version-detection-when-cross-com.patch b/package/lirc-tools/0003-python-pkg-Fix-lirc-version-detection-when-cross-com.patch
new file mode 100644
index 000000000000..d5787cbb76c6
--- /dev/null
+++ b/package/lirc-tools/0003-python-pkg-Fix-lirc-version-detection-when-cross-com.patch
@@ -0,0 +1,39 @@
+From a30d83908177c4aa11e2007f00928e2160051b98 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 29 Aug 2017 11:50:09 +0300
+Subject: [PATCH] python-pkg: Fix lirc version detection when cross compiling
+
+The setup.py script that run on the host can't use the client library
+built for target. So setup.py falls back to a hard-coded VERSION value.
+Correct this hard-coded value, so that the generated tarball gets named
+correctly.
+
+Fixes build failure:
+
+/usr/bin/install -c -m 644 ./python-pkg/dist/lirc-0.10.0.tar.gz '.../output/host/arm-buildroot-linux-musleabihf/sysroot/usr/share/lirc'
+/usr/bin/install: cannot stat './python-pkg/dist/lirc-0.10.0.tar.gz': No such file or directory
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: posted to upstream mailing list, awaits moderator approval
+https://sourceforge.net/p/lirc/mailman/lirc-list/?viewmonth=201708
+
+ python-pkg/setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/python-pkg/setup.py b/python-pkg/setup.py
+index e9b33690f828..6c580cc8eb9e 100644
+--- a/python-pkg/setup.py
++++ b/python-pkg/setup.py
+@@ -10,7 +10,7 @@ try:
+     import lirc.config
+     VERSION = lirc.config.VERSION.replace('-devel','')
+ except ImportError:
+-    VERSION='0.0.0'
++    VERSION='0.10.0'
+ 
+ from setuptools import setup, Extension
+ 
+-- 
+2.14.1
+
diff --git a/package/lirc-tools/lirc-tools.hash b/package/lirc-tools/lirc-tools.hash
index 13d3f02758bf..f4bd161f915d 100644
--- a/package/lirc-tools/lirc-tools.hash
+++ b/package/lirc-tools/lirc-tools.hash
@@ -1,5 +1,5 @@
-# hash from http://sourceforge.net/projects/lirc/files/LIRC/0.9.4d/
-sha1 5dbfd95a9e290260e6b5febadf685227df9c0529 lirc-0.9.4d.tar.bz2
-md5 0d11679cbdd94a5a6da00a8e7231b4bf lirc-0.9.4d.tar.bz2
+# hash from https://sourceforge.net/projects/lirc/files/LIRC/0.10.0/
+sha1 ab1095a1a241cf7ccf96f047cbd1884b7dc02dc1 lirc-0.10.0.tar.bz2
+md5 5c410678b5eba7ea2ca57f7e287ba326 lirc-0.10.0.tar.bz2
 # Locally computed
-sha256 c68f18c35b489b865c0a741d119b136e8702191538cd3551b977a7af6c4e41ab lirc-0.9.4d.tar.bz2
+sha256 e57c2de8b1b91325d23f1c14fc553ec7912b0add7891e653d048300d38c3f553 lirc-0.10.0.tar.bz2
diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index e767d9d7f02c..55738cb7a253 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -4,16 +4,26 @@
 #
 ################################################################################
 
-LIRC_TOOLS_VERSION = 0.9.4d
+LIRC_TOOLS_VERSION = 0.10.0
 LIRC_TOOLS_SOURCE = lirc-$(LIRC_TOOLS_VERSION).tar.bz2
 LIRC_TOOLS_SITE = http://downloads.sourceforge.net/project/lirc/LIRC/$(LIRC_TOOLS_VERSION)
 LIRC_TOOLS_LICENSE = GPL-2.0+
 LIRC_TOOLS_LICENSE_FILES = COPYING
 LIRC_TOOLS_DEPENDENCIES = host-libxslt host-pkgconf host-python3
 LIRC_TOOLS_INSTALL_STAGING = YES
+# Patching configure.ac and Makefile.am
+LIRC_TOOLS_AUTORECONF = YES
 
 LIRC_TOOLS_CONF_ENV = XSLTPROC=yes HAVE_WORKING_POLL=yes
-LIRC_TOOLS_CONF_OPTS = --without-x
+LIRC_TOOLS_CONF_OPTS = --without-x --enable-devinput --enable-uinput
+
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4),y)
+LIRC_TOOLS_CONF_ENV += \
+	DEVINPUT_HEADER=$(STAGING_DIR)/usr/include/linux/input-event-codes.h
+else
+LIRC_TOOLS_CONF_ENV += \
+	DEVINPUT_HEADER=$(STAGING_DIR)/usr/include/linux/input.h
+endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LIRC_TOOLS_DEPENDENCIES += udev
@@ -31,6 +41,11 @@ ifeq ($(BR2_PACKAGE_LIBFTDI1),y)
 LIRC_TOOLS_DEPENDENCIES += libftdi1
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LIRC_TOOLS_DEPENDENCIES += python3 host-python-setuptools
+LIRC_TOOLS_MAKE_ENV += SETUPTOOLS_ENV="$(PKG_PYTHON_SETUPTOOLS_ENV)"
+endif
+
 define LIRC_TOOLS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/lirc-tools/S25lircd \
 		$(TARGET_DIR)/etc/init.d/S25lircd
-- 
2.14.1

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Feb 2010 09:14:32 +0100
Subject: [Buildroot] [PATCH 2/6] libcgicc: fix build breakage and bump
	version
In-Reply-To: <cover.1267172039.git.thomas.petazzoni@free-electrons.com>
References: <cover.1267172039.git.thomas.petazzoni@free-electrons.com>
Message-ID: <85e611804bc6de69f3aff1f896a0655223259ea6.1267172039.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

First, the build was failing with:

cd .. && /bin/sh /home/test/brbuild/build/cgicc-3.2.7/support/missing --run autoheader
/home/test/brbuild/build/cgicc-3.2.7/support/missing: line 52: autoheader: command not found
WARNING: `autoheader' is missing on your system.  You should only need it if
         you modified `acconfig.h' or `configure.ac'.  You might want
         to install the `Autoconf' and `GNU m4' packages.  Grab them
         from any GNU archive site.

That was because the PATH doesn't contain $(HOST_DIR)/usr/bin. So we
pass $(TARGET_MAKE_ENV) when calling make.

Then, the build was failing because of the crappy configure.ac and
doc/Makefile.am this project has. configure.ac checks if doxygen is
available, and if it isn't, it sets DOXYGEN to /bin/echo. Then,
doc/Makefile.am does:

        DATE=`date '+%-d %b %Y'` VERSION=$(VERSION) $(DOXYGEN) Doxyfile
        cp $(IMAGES) cgicc-doc.css html
        mv html/index.html html/index.html.bak

When DOXYGEN=/bin/echo, then the first line does not generate anything
in html/, and the third line fails.

Therefore, we add a patch that allows to pass a --disable-doc option,
which removes the check for Doxygen. If --enable-doc is passed, then
the configure script fails if Doxygen isn't found (but in the
Buildroot case, we always pass --disable-doc to avoid the doxygen
dependency).

We also take this opportunity to bump the version of libcgicc, and to
remove a patch that is no longer needed due to this version bump.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcgicc/cgicc-3.2.7-memset.patch          |   12 -----
 .../cgicc-3.2.9-disable-documentation-option.patch |   50 ++++++++++++++++++++
 package/libcgicc/libcgicc.mk                       |    8 ++-
 3 files changed, 55 insertions(+), 15 deletions(-)
 delete mode 100644 package/libcgicc/cgicc-3.2.7-memset.patch
 create mode 100644 package/libcgicc/cgicc-3.2.9-disable-documentation-option.patch

diff --git a/package/libcgicc/cgicc-3.2.7-memset.patch b/package/libcgicc/cgicc-3.2.7-memset.patch
deleted file mode 100644
index f1c1411..0000000
--- a/package/libcgicc/cgicc-3.2.7-memset.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -urN cgicc-3.2.7-0rig//demo/dns.cpp cgicc-3.2.7/demo/dns.cpp
---- cgicc-3.2.7-0rig//demo/dns.cpp	2009-01-21 00:24:13.000000000 +0100
-+++ cgicc-3.2.7/demo/dns.cpp	2009-01-21 00:24:30.000000000 +0100
-@@ -34,6 +34,7 @@
- #include <vector>
- #include <stdexcept>
- #include <iostream>
-+#include <string.h>
- 
- #include "cgicc/CgiDefs.h"
- #include "cgicc/Cgicc.h"
-
diff --git a/package/libcgicc/cgicc-3.2.9-disable-documentation-option.patch b/package/libcgicc/cgicc-3.2.9-disable-documentation-option.patch
new file mode 100644
index 0000000..a7b04a8
--- /dev/null
+++ b/package/libcgicc/cgicc-3.2.9-disable-documentation-option.patch
@@ -0,0 +1,50 @@
+Index: cgicc-3.2.9/Makefile.am
+===================================================================
+--- cgicc-3.2.9.orig/Makefile.am	2010-02-25 16:34:06.000000000 +0100
++++ cgicc-3.2.9/Makefile.am	2010-02-25 16:34:14.000000000 +0100
+@@ -8,9 +8,15 @@
+ DEMO =
+ endif
+ 
++if DOC
++DOCDIR = doc
++else
++DOC =
++endif
++
+ ACLOCAL_AMFLAGS= 
+ 
+-SUBDIRS = cgicc doc support $(DEMO)
++SUBDIRS = cgicc $(DOCDIR) support $(DEMO)
+ 
+ CLEANFILES = *~
+ 
+Index: cgicc-3.2.9/configure.ac
+===================================================================
+--- cgicc-3.2.9.orig/configure.ac	2010-02-25 16:34:06.000000000 +0100
++++ cgicc-3.2.9/configure.ac	2010-02-25 16:45:46.000000000 +0100
+@@ -17,9 +17,23 @@
+ AC_PROG_CXX
+ AC_PROG_INSTALL
+ AC_PROG_LIBTOOL
+-AC_CHECK_PROG(DOXYGEN, doxygen, doxygen, /bin/echo)
+ 
+ 
++AC_ARG_ENABLE(doc, 
++  [  --enable-doc          build doc [[default=yes]]],
++  [case "${enableval}" in
++    yes) cgicc_doc=yes ;;
++    no)  cgicc_doc=no ;;
++    *) AC_MSG_ERROR(bad value ${enableval} for --enable-doc) ;;
++  esac], cgicc_doc=yes)
++
++if test "$cgicc_doc" = yes; then
++ AC_CHECK_PROG(DOXYGEN, doxygen, doxygen)
++ if test -z "$DOXYGEN" ; then
++   AC_MSG_ERROR([Doxygen is required to build the documentation])
++ fi
++fi
++AM_CONDITIONAL(DOC, test "$cgicc_doc" = yes)
+ 
+ dnl Determine host system type
+ 
diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index 5237e70..b4cf567 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBCGICC_VERSION=3.2.7
+LIBCGICC_VERSION=3.2.9
 LIBCGICC_DIR=$(BUILD_DIR)/cgicc-$(LIBCGICC_VERSION)
 LIBCGICC_SITE=$(BR2_GNU_MIRROR)/cgicc
 LIBCGICC_SOURCE=cgicc-$(LIBCGICC_VERSION).tar.gz
@@ -22,6 +22,7 @@ $(LIBCGICC_DIR)/.unpacked: $(DL_DIR)/$(LIBCGICC_SOURCE)
 
 $(LIBCGICC_DIR)/.configured: $(LIBCGICC_DIR)/.unpacked
 	(cd $(LIBCGICC_DIR); rm -f config.cache; \
+		$(AUTORECONF); \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure $(QUIET) \
@@ -33,15 +34,16 @@ $(LIBCGICC_DIR)/.configured: $(LIBCGICC_DIR)/.unpacked
 		--sysconfdir=/etc \
 		--localstatedir=/var \
 		--disable-demos \
+		--disable-doc \
 	)
 	touch $@
 
 $(LIBCGICC_DIR)/.compiled: $(LIBCGICC_DIR)/.configured
-	$(MAKE) -C $(LIBCGICC_DIR)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LIBCGICC_DIR)
 	touch $@
 
 $(STAGING_DIR)/usr/lib/libcgicc.so: $(LIBCGICC_DIR)/.compiled
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBCGICC_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBCGICC_DIR) install
 	touch -c $(STAGING_DIR)/usr/lib/libcgicc.so
 
 $(TARGET_DIR)/usr/lib/libcgicc.so: $(STAGING_DIR)/usr/lib/libcgicc.so
-- 
1.6.3.3

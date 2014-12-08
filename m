From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 21:44:46 +0100
Subject: [Buildroot] [git commit] ola: bump to 0.9.3
Message-ID: <20141208211303.3E32A800D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66056a5179ef49f2ec10ba5d7fbd1a58863d1350
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This update requires a few changes. First, good news, the patches that you
guys have submitted to OLA have been merged, so we can drop those:

 ola-0001-fix-build-warning.patch -> ea375582b0bfee93d66608ffc807078ffc48e961
 ola-0002-move-python-sub-check-to-configure.ac.patch -> 673a7602a6bf7a6aa8a8461ebd9362d59f6e21df
 ola-0003-fix-check-for-python-module-for-cross-compilation.patch -> b51b48be81ec38bc7d1229be0c7d3189c5ddbafa

Less good news: OLA now builds a small protoc wrapper (ola_protoc) that is
built and executed at compile-time on the host. If we don't change anything,
ola_protoc is built with the target toolchain and therefore can't run on the
host. Explanation for ola_protoc is here

To solve this, I created a package host-ola, which builds and provides an
ola_protoc for the host. It tries to disable as much as possible of things
that we won't need at configure time. Only ola_protoc is built and installed
so it's not that long.

The change has been built-tested only.

[1] https://github.com/OpenLightingProject/ola/blob/master/protoc/ola-protoc.cpp#L20

[Thomas:
 - add HOST_OLA_DEPENDENCIES variable, so that host-ola doesn't get
   all the dependencies of the target ola package: certain target ola
   dependencies do not have corresponding host packages (and it
   doesn't make sense to have them as dependencies just to build
   ola_protoc)
 - improve the commit log to mention which upstream commits correspond
   to our patches.]

Signed-off-by: Simon Marchi <simon.marchi@polymtl.ca>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ola/ola-0001-fix-build-warning.patch       |   27 -------
 ...002-move-python-sub-check-to-configure.ac.patch |   48 ------------
 ...k-for-python-module-for-cross-compilation.patch |   81 --------------------
 package/ola/ola.mk                                 |   35 +++++++--
 4 files changed, 29 insertions(+), 162 deletions(-)

diff --git a/package/ola/ola-0001-fix-build-warning.patch b/package/ola/ola-0001-fix-build-warning.patch
deleted file mode 100644
index 1fdb58f..0000000
--- a/package/ola/ola-0001-fix-build-warning.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Fix build on 64 bits architectures
-
-This upstream patch fixes a warning that, due to -Werror, is causing
-build failures on 64 bits architectures.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-commit ea375582b0bfee93d66608ffc807078ffc48e961
-Author: Simon Newton <nomis52@gmail.com>
-Date:   Wed Oct 30 09:23:49 2013 -0700
-
-    * Avoid a compiler warning
-
-diff --git a/plugins/e131/e131/PreamblePacker.cpp b/plugins/e131/e131/PreamblePacker.cpp
-index ef29e18..8dfcc72 100644
---- a/plugins/e131/e131/PreamblePacker.cpp
-+++ b/plugins/e131/e131/PreamblePacker.cpp
-@@ -77,7 +77,8 @@ const uint8_t *PreamblePacker::Pack(const PDUBlock<PDU> &pdu_block,
-   if (!m_send_buffer)
-     Init();
- 
--  unsigned int size = MAX_DATAGRAM_SIZE - sizeof(ACN_HEADER);
-+  unsigned int size = MAX_DATAGRAM_SIZE -
-+      static_cast<unsigned int>(sizeof(ACN_HEADER));
-   if (!pdu_block.Pack(m_send_buffer + sizeof(ACN_HEADER), &size)) {
-     OLA_WARN << "Failed to pack E1.31 PDU";
-     return NULL;
diff --git a/package/ola/ola-0002-move-python-sub-check-to-configure.ac.patch b/package/ola/ola-0002-move-python-sub-check-to-configure.ac.patch
deleted file mode 100644
index 1a79035..0000000
--- a/package/ola/ola-0002-move-python-sub-check-to-configure.ac.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-commit 673a7602a6bf7a6aa8a8461ebd9362d59f6e21df
-Author: Yann E. MORIN <yann.morin.1998@free.fr>
-Date:   Tue Jan 14 21:37:51 2014 +0100
-
-    configure: move python sub-check to configure.ac
-    
-    We do not want to re-test the python name for each Python module
-    we want to check for.
-    
-    Even if we only check for one Python module right now, this is
-    good practice overall.
-    
-    Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
-Sent upstream, awaiting for response...
-
-diff --git a/config/ax_python_module.m4 b/config/ax_python_module.m4
-index bd70a06..96dd1ab 100644
---- a/config/ax_python_module.m4
-+++ b/config/ax_python_module.m4
-@@ -25,11 +25,6 @@
- 
- AU_ALIAS([AC_PYTHON_MODULE], [AX_PYTHON_MODULE])
- AC_DEFUN([AX_PYTHON_MODULE],[
--    if test -z $PYTHON;
--    then
--        PYTHON="python"
--    fi
--    PYTHON_NAME=`basename $PYTHON`
-     AC_MSG_CHECKING($PYTHON_NAME module: $1)
- 	$PYTHON -c "import $1" 2>/dev/null
- 	if test $? -eq 0;
-diff --git a/configure.ac b/configure.ac
-index 1efedf1..5f6f604 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -530,6 +530,10 @@ AM_CONDITIONAL(INSTALL_RDM_TESTS, test "${enable_rdm_tests}" = "yes")
- 
- if test "${enable_python_libs}" = "yes"; then
-  AM_PATH_PYTHON(2.6)
-+ if test -z $PYTHON; then
-+  PYTHON="python"
-+ fi
-+ PYTHON_NAME=`basename $PYTHON`
-  AX_PYTHON_MODULE("google.protobuf", "fatal")
- fi
- 
diff --git a/package/ola/ola-0003-fix-check-for-python-module-for-cross-compilation.patch b/package/ola/ola-0003-fix-check-for-python-module-for-cross-compilation.patch
deleted file mode 100644
index 436974d..0000000
--- a/package/ola/ola-0003-fix-check-for-python-module-for-cross-compilation.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-commit ea985068c2d699ffb5b353de090f7ded713c08a7
-Author: Yann E. MORIN <yann.morin.1998@free.fr>
-Date:   Tue Jan 14 21:38:27 2014 +0100
-
-    configure: add option for user to override checks for Python modules
-    
-    The check for google.protobuf is inherently flawed for cross-compilation,
-    as it uses the host Python to check for target modules.
-    
-    In this case, it is not possible to check for a Pyhon modules altogether,
-    and we need to rely on the user to properly tell us whether we do or do
-    not have google.protobuf.
-    
-    This is done by adding am autoconf cache variable:
-        ac_cv_have_pymod_google_protobuf
-    
-    which can be set to:
-      - yes     : force the test to be true
-      - no      : force the test to be false
-      - (empty) : let the test decide
-    
-    This is then used in AX_PYTHON_MODULE to override the test.
-    
-    Currently, only the google.protobuf Python module is checked for, but
-    the same could be done later on of other Python modules that may be
-    added in the future, of course.
-    
-    Fixes configure-errors like:
-        http://autobuild.buildroot.net/results/e63/e634d5f0cee3967caffaa6e7ada8c0968e3eff63/build-end.log
-    
-    Also fixes some under-quotation in the python module check.
-    
-    Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
-Sent upstream, awaiting for response...
-
-diff --git a/config/ax_python_module.m4 b/config/ax_python_module.m4
-index 96dd1ab..2910e88 100644
---- a/config/ax_python_module.m4
-+++ b/config/ax_python_module.m4
-@@ -25,20 +25,17 @@
- 
- AU_ALIAS([AC_PYTHON_MODULE], [AX_PYTHON_MODULE])
- AC_DEFUN([AX_PYTHON_MODULE],[
--    AC_MSG_CHECKING($PYTHON_NAME module: $1)
- 	$PYTHON -c "import $1" 2>/dev/null
- 	if test $? -eq 0;
- 	then
--		AC_MSG_RESULT(yes)
--		eval AS_TR_CPP(HAVE_PYMOD_$1)=yes
-+		eval AS_TR_CPP([HAVE_PYMOD_$1])=yes
- 	else
--		AC_MSG_RESULT(no)
--		eval AS_TR_CPP(HAVE_PYMOD_$1)=no
-+		eval AS_TR_CPP([HAVE_PYMOD_$1])=no
- 		#
- 		if test -n "$2"
- 		then
--			AC_MSG_ERROR(failed to find required module $1)
--			exit 1
-+			AC_MSG_ERROR([failed to find required module $1])
- 		fi
- 	fi
-+	AC_MSG_RESULT([AS_TR_CPP([HAVE_PYMOD_$1])])
- ])
-diff --git a/configure.ac b/configure.ac
-index 5f6f604..5994d06 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -534,7 +534,9 @@ if test "${enable_python_libs}" = "yes"; then
-   PYTHON="python"
-  fi
-  PYTHON_NAME=`basename $PYTHON`
-- AX_PYTHON_MODULE("google.protobuf", "fatal")
-+ AC_CACHE_CHECK([$PYTHON_NAME module: google.protobuf],
-+    [ac_cv_have_pymod_google_protobuf],
-+    [AX_PYTHON_MODULE([google.protobuf], [fatal])])
- fi
- 
- # Maybe build the logic sniffer tools
diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 95810c1..2eee54c 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -4,18 +4,16 @@
 #
 ################################################################################
 
-OLA_VERSION = 0.8.33
-OLA_SITE = https://open-lighting.googlecode.com/files
+OLA_VERSION = 0.9.3
+OLA_SITE = $(call github,OpenLightingProject,ola,$(OLA_VERSION))
 
 OLA_LICENSE = LGPLv2.1+ (libola, libolacommon, Python bindings), GPLv2+ (libolaserver, olad, Python examples and tests)
 OLA_LICENSE_FILES = LICENCE GPL LGPL
 OLA_INSTALL_STAGING = YES
-
-# We modify configure.ac, so we need to autoreconf
 OLA_AUTORECONF = YES
 
 # util-linux provides uuid lib
-OLA_DEPENDENCIES = protobuf util-linux host-bison host-flex
+OLA_DEPENDENCIES = protobuf util-linux host-bison host-flex host-ola
 
 OLA_CONF_OPTS = \
 	ac_cv_have_pymod_google_protobuf=yes \
@@ -24,7 +22,31 @@ OLA_CONF_OPTS = \
 	--disable-unittests \
 	--disable-root-check \
 	--disable-java-libs \
-	--disable-fatal-warnings
+	--disable-fatal-warnings \
+	--with-ola-protoc=$(HOST_DIR)/usr/bin/ola_protoc
+
+HOST_OLA_DEPENDENCIES = host-util-linux host-protobuf
+
+# When building the host part, disable as much as possible to speed up
+# the configure step and avoid missing host dependencies.
+HOST_OLA_CONF_OPTS = \
+	--disable-all-plugins \
+	--disable-slp \
+	--disable-osc \
+	--disable-uart \
+	--disable-libusb \
+	--disable-libftdi \
+	--disable-http  \
+	--disable-examples \
+	--disable-unittests \
+	--disable-doxygen-html \
+	--disable-doxygen-doc
+
+# On the host side, we only need ola_protoc, so build and install this only.
+HOST_OLA_MAKE_OPTS = protoc/ola_protoc
+define HOST_OLA_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/protoc/ola_protoc $(HOST_DIR)/usr/bin/ola_protoc
+endef
 
 # sets where to find python libs built for target and required by ola
 OLA_CONF_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
@@ -149,3 +171,4 @@ OLA_CONF_OPTS += --disable-usbpro
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))

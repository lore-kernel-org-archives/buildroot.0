From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jan 2014 22:36:05 +0100
Subject: [Buildroot] [PATCH 2/2] package/ola: fix check for google.protobuf
In-Reply-To: <1389735365-20795-1-git-send-email-yann.morin.1998@free.fr>
References: <1389735365-20795-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1389735365-20795-2-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Fix the google.protobuf check in an upstreamable way.

As suggested by Arnout, use an autoconf ac_cv_have_* variable
so we can pass it on the command line. This is generic behaviour
for a lot of autoconf internals, so it makes sense to do it this
way.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 .../ola-0002-fix-check-for-google.protobuf.patch   | 30 --------
 ...002-move-python-sub-check-to-configure.ac.patch | 48 +++++++++++++
 ...k-for-python-module-for-cross-compilation.patch | 81 ++++++++++++++++++++++
 package/ola/ola.mk                                 |  1 +
 4 files changed, 130 insertions(+), 30 deletions(-)
 delete mode 100644 package/ola/ola-0002-fix-check-for-google.protobuf.patch
 create mode 100644 package/ola/ola-0002-move-python-sub-check-to-configure.ac.patch
 create mode 100644 package/ola/ola-0003-fix-check-for-python-module-for-cross-compilation.patch

diff --git a/package/ola/ola-0002-fix-check-for-google.protobuf.patch b/package/ola/ola-0002-fix-check-for-google.protobuf.patch
deleted file mode 100644
index f0bc465..0000000
--- a/package/ola/ola-0002-fix-check-for-google.protobuf.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-configure: do not check for google.protobuf
-
-The check for google.protobuf is inherently flawed for cross-compilation,
-as it uses the host Python to check for target modules.
-
-In Buildroot, our dependencies ensures that google.protobuf is present
-by the time we configure and build ola, so we can just skip the test
-altogether.
-
-We don't need to fake the result of the test: it is used nowhere; the
-test is only here to fail or succeed.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN ola-0.8.32.orig/configure.ac ola-0.8.32/configure.ac
---- ola-0.8.32.orig/configure.ac	2013-09-29 19:46:48.000000000 +0200
-+++ ola-0.8.32/configure.ac	2014-01-09 19:43:55.342044336 +0100
-@@ -530,7 +530,11 @@
- 
- if test "${enable_python_libs}" = "yes"; then
-  AM_PATH_PYTHON(2.6)
-- AX_PYTHON_MODULE("google.protobuf", "fatal")
-+# AX_PYTHON_MODULE is inherently broken for cross-compilation
-+# since it executes the host Python to check for target modules.
-+# In Buildroot, we do not need to check for google.protobuf,
-+# since our dependencies ensure it is available.
-+# AX_PYTHON_MODULE("google.protobuf", "fatal")
- fi
- 
- # Maybe build the logic sniffer tools
diff --git a/package/ola/ola-0002-move-python-sub-check-to-configure.ac.patch b/package/ola/ola-0002-move-python-sub-check-to-configure.ac.patch
new file mode 100644
index 0000000..1a79035
--- /dev/null
+++ b/package/ola/ola-0002-move-python-sub-check-to-configure.ac.patch
@@ -0,0 +1,48 @@
+commit 673a7602a6bf7a6aa8a8461ebd9362d59f6e21df
+Author: Yann E. MORIN <yann.morin.1998@free.fr>
+Date:   Tue Jan 14 21:37:51 2014 +0100
+
+    configure: move python sub-check to configure.ac
+    
+    We do not want to re-test the python name for each Python module
+    we want to check for.
+    
+    Even if we only check for one Python module right now, this is
+    good practice overall.
+    
+    Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Sent upstream, awaiting for response...
+
+diff --git a/config/ax_python_module.m4 b/config/ax_python_module.m4
+index bd70a06..96dd1ab 100644
+--- a/config/ax_python_module.m4
++++ b/config/ax_python_module.m4
+@@ -25,11 +25,6 @@
+ 
+ AU_ALIAS([AC_PYTHON_MODULE], [AX_PYTHON_MODULE])
+ AC_DEFUN([AX_PYTHON_MODULE],[
+-    if test -z $PYTHON;
+-    then
+-        PYTHON="python"
+-    fi
+-    PYTHON_NAME=`basename $PYTHON`
+     AC_MSG_CHECKING($PYTHON_NAME module: $1)
+ 	$PYTHON -c "import $1" 2>/dev/null
+ 	if test $? -eq 0;
+diff --git a/configure.ac b/configure.ac
+index 1efedf1..5f6f604 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -530,6 +530,10 @@ AM_CONDITIONAL(INSTALL_RDM_TESTS, test "${enable_rdm_tests}" = "yes")
+ 
+ if test "${enable_python_libs}" = "yes"; then
+  AM_PATH_PYTHON(2.6)
++ if test -z $PYTHON; then
++  PYTHON="python"
++ fi
++ PYTHON_NAME=`basename $PYTHON`
+  AX_PYTHON_MODULE("google.protobuf", "fatal")
+ fi
+ 
diff --git a/package/ola/ola-0003-fix-check-for-python-module-for-cross-compilation.patch b/package/ola/ola-0003-fix-check-for-python-module-for-cross-compilation.patch
new file mode 100644
index 0000000..436974d
--- /dev/null
+++ b/package/ola/ola-0003-fix-check-for-python-module-for-cross-compilation.patch
@@ -0,0 +1,81 @@
+commit ea985068c2d699ffb5b353de090f7ded713c08a7
+Author: Yann E. MORIN <yann.morin.1998@free.fr>
+Date:   Tue Jan 14 21:38:27 2014 +0100
+
+    configure: add option for user to override checks for Python modules
+    
+    The check for google.protobuf is inherently flawed for cross-compilation,
+    as it uses the host Python to check for target modules.
+    
+    In this case, it is not possible to check for a Pyhon modules altogether,
+    and we need to rely on the user to properly tell us whether we do or do
+    not have google.protobuf.
+    
+    This is done by adding am autoconf cache variable:
+        ac_cv_have_pymod_google_protobuf
+    
+    which can be set to:
+      - yes     : force the test to be true
+      - no      : force the test to be false
+      - (empty) : let the test decide
+    
+    This is then used in AX_PYTHON_MODULE to override the test.
+    
+    Currently, only the google.protobuf Python module is checked for, but
+    the same could be done later on of other Python modules that may be
+    added in the future, of course.
+    
+    Fixes configure-errors like:
+        http://autobuild.buildroot.net/results/e63/e634d5f0cee3967caffaa6e7ada8c0968e3eff63/build-end.log
+    
+    Also fixes some under-quotation in the python module check.
+    
+    Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Sent upstream, awaiting for response...
+
+diff --git a/config/ax_python_module.m4 b/config/ax_python_module.m4
+index 96dd1ab..2910e88 100644
+--- a/config/ax_python_module.m4
++++ b/config/ax_python_module.m4
+@@ -25,20 +25,17 @@
+ 
+ AU_ALIAS([AC_PYTHON_MODULE], [AX_PYTHON_MODULE])
+ AC_DEFUN([AX_PYTHON_MODULE],[
+-    AC_MSG_CHECKING($PYTHON_NAME module: $1)
+ 	$PYTHON -c "import $1" 2>/dev/null
+ 	if test $? -eq 0;
+ 	then
+-		AC_MSG_RESULT(yes)
+-		eval AS_TR_CPP(HAVE_PYMOD_$1)=yes
++		eval AS_TR_CPP([HAVE_PYMOD_$1])=yes
+ 	else
+-		AC_MSG_RESULT(no)
+-		eval AS_TR_CPP(HAVE_PYMOD_$1)=no
++		eval AS_TR_CPP([HAVE_PYMOD_$1])=no
+ 		#
+ 		if test -n "$2"
+ 		then
+-			AC_MSG_ERROR(failed to find required module $1)
+-			exit 1
++			AC_MSG_ERROR([failed to find required module $1])
+ 		fi
+ 	fi
++	AC_MSG_RESULT([AS_TR_CPP([HAVE_PYMOD_$1])])
+ ])
+diff --git a/configure.ac b/configure.ac
+index 5f6f604..5994d06 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -534,7 +534,9 @@ if test "${enable_python_libs}" = "yes"; then
+   PYTHON="python"
+  fi
+  PYTHON_NAME=`basename $PYTHON`
+- AX_PYTHON_MODULE("google.protobuf", "fatal")
++ AC_CACHE_CHECK([$PYTHON_NAME module: google.protobuf],
++    [ac_cv_have_pymod_google_protobuf],
++    [AX_PYTHON_MODULE([google.protobuf], [fatal])])
+ fi
+ 
+ # Maybe build the logic sniffer tools
diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 843ec0b..a503bc3 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -18,6 +18,7 @@ OLA_AUTORECONF = YES
 OLA_DEPENDENCIES = protobuf util-linux host-bison host-flex
 
 OLA_CONF_OPT = \
+	ac_cv_have_pymod_google_protobuf=yes \
 	--disable-gcov \
 	--disable-tcmalloc \
 	--disable-unittests \
-- 
1.8.1.2

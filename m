From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jan 2014 22:23:57 +0100
Subject: [Buildroot] [PATCH 2/2] configure: add option for user to override
	checks for Python modules
In-Reply-To: <1389734637-8329-1-git-send-email-yann.morin.1998@free.fr>
References: <1389734637-8329-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1389734637-8329-3-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The check for google.protobuf is inherently flawed for cross-compilation,
as it uses the host Python to check for target modules.

In this case, it is not possible to check for a Pyhon modules altogether,
and we need to rely on the user to properly tell us whether we do or do
not have google.protobuf.

This is done by adding am autoconf cache variable:
    ac_cv_have_pymod_google_protobuf

which can be set to:
  - yes     : force the test to be true
  - no      : force the test to be false
  - (empty) : let the test decide

This is then used in AX_PYTHON_MODULE to override the test.

Currently, only the google.protobuf Python module is checked for, but
the same could be done later on of other Python modules that may be
added in the future, of course.

Fixes configure-errors like:
    http://autobuild.buildroot.net/results/e63/e634d5f0cee3967caffaa6e7ada8c0968e3eff63/build-end.log

Also fixes some under-quotation in the python module check.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 config/ax_python_module.m4 | 11 ++++-------
 configure.ac               |  4 +++-
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/config/ax_python_module.m4 b/config/ax_python_module.m4
index 96dd1ab..2910e88 100644
--- a/config/ax_python_module.m4
+++ b/config/ax_python_module.m4
@@ -25,20 +25,17 @@
 
 AU_ALIAS([AC_PYTHON_MODULE], [AX_PYTHON_MODULE])
 AC_DEFUN([AX_PYTHON_MODULE],[
-    AC_MSG_CHECKING($PYTHON_NAME module: $1)
 	$PYTHON -c "import $1" 2>/dev/null
 	if test $? -eq 0;
 	then
-		AC_MSG_RESULT(yes)
-		eval AS_TR_CPP(HAVE_PYMOD_$1)=yes
+		eval AS_TR_CPP([HAVE_PYMOD_$1])=yes
 	else
-		AC_MSG_RESULT(no)
-		eval AS_TR_CPP(HAVE_PYMOD_$1)=no
+		eval AS_TR_CPP([HAVE_PYMOD_$1])=no
 		#
 		if test -n "$2"
 		then
-			AC_MSG_ERROR(failed to find required module $1)
-			exit 1
+			AC_MSG_ERROR([failed to find required module $1])
 		fi
 	fi
+	AC_MSG_RESULT([AS_TR_CPP([HAVE_PYMOD_$1])])
 ])
diff --git a/configure.ac b/configure.ac
index 5f6f604..5994d06 100644
--- a/configure.ac
+++ b/configure.ac
@@ -574,7 +574,9 @@ if test "${enable_python_libs}" = "yes"; then
   PYTHON="python"
  fi
  PYTHON_NAME=`basename $PYTHON`
- AX_PYTHON_MODULE("google.protobuf", "fatal")
+ AC_CACHE_CHECK([$PYTHON_NAME module: google.protobuf],
+    [ac_cv_have_pymod_google_protobuf],
+    [AX_PYTHON_MODULE([google.protobuf], [fatal])])
 fi
 
 # Maybe build the logic sniffer tools
-- 
1.8.1.2

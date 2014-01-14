From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jan 2014 22:23:56 +0100
Subject: [Buildroot] [PATCH 1/2] configure: move python sub-check to
	configure.ac
In-Reply-To: <1389734637-8329-1-git-send-email-yann.morin.1998@free.fr>
References: <1389734637-8329-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1389734637-8329-2-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

We do not want to re-test the python name for each Python module
we want to check for.

Even if we only check for one Python module right now, this is
good practice overall.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 config/ax_python_module.m4 | 5 -----
 configure.ac               | 4 ++++
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/config/ax_python_module.m4 b/config/ax_python_module.m4
index bd70a06..96dd1ab 100644
--- a/config/ax_python_module.m4
+++ b/config/ax_python_module.m4
@@ -25,11 +25,6 @@
 
 AU_ALIAS([AC_PYTHON_MODULE], [AX_PYTHON_MODULE])
 AC_DEFUN([AX_PYTHON_MODULE],[
-    if test -z $PYTHON;
-    then
-        PYTHON="python"
-    fi
-    PYTHON_NAME=`basename $PYTHON`
     AC_MSG_CHECKING($PYTHON_NAME module: $1)
 	$PYTHON -c "import $1" 2>/dev/null
 	if test $? -eq 0;
diff --git a/configure.ac b/configure.ac
index 1efedf1..5f6f604 100644
--- a/configure.ac
+++ b/configure.ac
@@ -570,6 +570,10 @@ AM_CONDITIONAL(INSTALL_RDM_TESTS, test "${enable_rdm_tests}" = "yes")
 
 if test "${enable_python_libs}" = "yes"; then
  AM_PATH_PYTHON(2.6)
+ if test -z $PYTHON; then
+  PYTHON="python"
+ fi
+ PYTHON_NAME=`basename $PYTHON`
  AX_PYTHON_MODULE("google.protobuf", "fatal")
 fi
 
-- 
1.8.1.2

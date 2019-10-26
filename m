From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Oct 2019 16:53:21 +0200
Subject: [Buildroot] [PATCH 2/5] support/dependencies: don't check for
 python on the host
In-Reply-To: <cover.1572101547.git.yann.morin.1998@free.fr>
References: <cover.1572101547.git.yann.morin.1998@free.fr>
Message-ID: <bfb78a4bd87d237f9fe865e2392ac04deae6b9c8.1572101547.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We no longer have anything that needs it during the build, so we don't
require it anymore.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 3f18985435..1b66fb6e7d 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -160,7 +160,7 @@ fi
 
 # Check that a few mandatory programs are installed
 missing_progs="no"
-for prog in patch perl tar wget cpio python unzip rsync bc ${DL_TOOLS} ; do
+for prog in patch perl tar wget cpio unzip rsync bc ${DL_TOOLS} ; do
 	if ! which $prog > /dev/null ; then
 		echo "You must install '$prog' on your build machine";
 		missing_progs="yes"
@@ -180,14 +180,6 @@ if test "${missing_progs}" = "yes" ; then
 	exit 1
 fi
 
-# Check that the python version is at least 2.7
-PYTHON_VERSION=$(python -V 2>&1 |awk '{ split($2, v, "."); print v[1] v[2] }')
-if [ $PYTHON_VERSION -lt 27 ]; then
-	echo
-	echo "You have '$(python -V 2>&1)' installed.  Python >= 2.7 is required"
-	exit 1;
-fi
-
 if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
 	if ! which locale > /dev/null ; then
 		echo
@@ -293,8 +285,3 @@ if [ -n "$missing_perl_modules" ] ; then
 	echo
 	exit 1
 fi
-
-if ! python -c "import argparse" > /dev/null 2>&1 ; then
-	echo "Your Python installation is not complete enough: argparse module is missing"
-	exit 1
-fi
-- 
2.20.1

From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Sat, 29 Dec 2012 03:45:51 +0200
Subject: [Buildroot] [PATCH 3/5] mesa3d: bumped to 8.0.5
In-Reply-To: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1356745553-15362-4-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cross-compile patch
URL: http://git.openembedded.org/openembedded-core/plain/meta/recipes-graphics/mesa/mesa/0002-cross-compile.patch

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 .../x11r7/mesa3d/mesa3d-0002-cross-compile.patch   |   94 ++++++++++++++++++++
 1 files changed, 94 insertions(+), 0 deletions(-)
 create mode 100644 package/x11r7/mesa3d/mesa3d-0002-cross-compile.patch

diff --git a/package/x11r7/mesa3d/mesa3d-0002-cross-compile.patch b/package/x11r7/mesa3d/mesa3d-0002-cross-compile.patch
new file mode 100644
index 0000000..dc8e994
--- /dev/null
+++ b/package/x11r7/mesa3d/mesa3d-0002-cross-compile.patch
@@ -0,0 +1,94 @@
+cross compile
+
+This patch is ported from WindRiver linux and to fix cross compile
+failure.
+
+And original commits are:
+commit 8d5ccc8113e1b51b0529a00c18a4aba956247e1b
+commit 5c4212084b871a0c0fb7d174280ec9a634637deb
+
+Upstream-Status: Pending
+
+Signed-off-by: Kang Kai <kai.kang@windriver.com>
+---
+ bin/mklib |   24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/bin/mklib b/bin/mklib
+index 9bac29e..b33aa90 100755
+--- a/bin/mklib
++++ b/bin/mklib
+@@ -49,8 +49,8 @@ expand_archives() {
+                     /*) ;;
+                     *)  FILE="$ORIG_DIR/$FILE" ;;
+                 esac
+-                MEMBERS=`ar t $FILE`
+-                ar x $FILE
++                MEMBERS=`${AR} t $FILE`
++                ${AR} x $FILE
+                 for MEMBER in $MEMBERS ; do
+                     NEWFILES="$NEWFILES $DIR/$MEMBER"
+                 done
+@@ -77,7 +77,7 @@ expand_archives() {
+ make_ar_static_lib() {
+     OPTS=$1
+     shift;
+-    RANLIB=$1
++    USE_RANLIB=$1
+     shift;
+     LIBNAME=$1
+     shift;
+@@ -87,11 +87,11 @@ make_ar_static_lib() {
+     rm -f ${LIBNAME}
+ 
+     # make static lib
+-    ar ${OPTS} ${LIBNAME} ${OBJECTS}
++    ${AR} ${OPTS} ${LIBNAME} ${OBJECTS}
+ 
+     # run ranlib
+-    if [ ${RANLIB} = 1 ] ; then
+-        ranlib ${LIBNAME}
++    if [ ${USE_RANLIB} = 1 ] ; then
++        ${RANLIB} ${LIBNAME}
+     fi
+ 
+     echo ${LIBNAME}
+@@ -313,9 +313,9 @@ case $ARCH in
+ 	if [ "x$LINK" = "x" ] ; then
+ 	    # -linker was not specified so set default link command now
+             if [ $CPLUSPLUS = 1 ] ; then
+-                LINK=g++
++                LINK=$CXX
+             else
+-                LINK=gcc
++                LINK=$CC
+             fi
+ 	fi
+ 
+@@ -535,9 +535,9 @@ case $ARCH in
+ 	if [ "x$LINK" = "x" ] ; then
+ 	    # -linker was not specified so set default link command now
+             if [ $CPLUSPLUS = 1 ] ; then
+-                LINK=g++
++                LINK=$CXX
+             else
+-                LINK=gcc
++                LINK=$CC
+             fi
+ 	fi
+ 
+@@ -903,9 +903,9 @@ case $ARCH in
+ 	if [ "x$LINK" = "x" ] ; then
+ 	    # -linker was not specified so set default link command now
+             if [ $CPLUSPLUS = 1 ] ; then
+-                LINK=g++
++                LINK=${CXX}
+             else
+-                LINK=gcc
++                LINK=${CC}
+             fi
+ 	fi
+ 
+-- 
+1.7.10.4
+
-- 
1.7.7.6

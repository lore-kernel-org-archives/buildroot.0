From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Sat, 29 Dec 2012 03:45:52 +0200
Subject: [Buildroot] [PATCH 4/5] mesa3d: bumped to 8.0.5
In-Reply-To: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1356745553-15362-5-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Additional cross-compiling fixes
URL: http://git.openembedded.org/openembedded-core/plain/meta/recipes-graphics/mesa/mesa/0003-fix-for-x32.patch

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/x11r7/mesa3d/mesa3d-0003-fix-for-x32.patch |   50 ++++++++++++++++++++
 1 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 package/x11r7/mesa3d/mesa3d-0003-fix-for-x32.patch

diff --git a/package/x11r7/mesa3d/mesa3d-0003-fix-for-x32.patch b/package/x11r7/mesa3d/mesa3d-0003-fix-for-x32.patch
new file mode 100644
index 0000000..2d6a150
--- /dev/null
+++ b/package/x11r7/mesa3d/mesa3d-0003-fix-for-x32.patch
@@ -0,0 +1,50 @@
+Upstream-Status: Pending
+
+Using uname like this when cross compiling is a really bad idea. We
+provide the correct linker flags, lets just assume we can get this
+right ourselves.
+
+RP 2012/04/26
+---
+ bin/mklib |   16 ----------------
+ 1 file changed, 16 deletions(-)
+
+diff --git a/bin/mklib b/bin/mklib
+index b33aa90..16cb017 100755
+--- a/bin/mklib
++++ b/bin/mklib
+@@ -330,15 +330,7 @@ case $ARCH in
+ 	    ;;
+ 	    esac
+ 
+-	    # Check if objects are 32-bit and we're running in 64-bit
+-	    # environment.  If so, pass -m32 flag to linker.
+ 	    set ${OBJECTS}
+-	    ABI32=`file $1 | grep 32-bit`
+-	    ARM=`file $1 | grep ARM`
+-	    # Do not add "-m32" option for arm.
+-            if [ -z "$ARM" -a "${ABI32}" -a `uname -m` = "x86_64" ] ; then
+-		OPTS="-m32 ${OPTS}"
+-	    fi
+ 
+             if [ "${ALTOPTS}" ] ; then
+                 OPTS=${ALTOPTS}
+@@ -389,15 +381,7 @@ case $ARCH in
+ 		# exptmp is removed below
+ 	    fi
+ 
+-	    # Check if objects are 32-bit and we're running in 64-bit
+-	    # environment.  If so, pass -m32 flag to linker.
+ 	    set ${OBJECTS}
+-	    ABI32=`file $1 | grep 32-bit`
+-            ARM=`file $1 | grep ARM`
+-	    # Do not add "-m32" option for arm.
+-            if [ -z "$ARM" -a "${ABI32}" -a `uname -m` = "x86_64" ] ; then
+-		OPTS="-m32 ${OPTS}"
+-	    fi
+             if [ "${ALTOPTS}" ] ; then
+                 OPTS=${ALTOPTS}
+             fi
+-- 
+1.7.10.4
+
-- 
1.7.7.6

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Feb 2015 11:52:06 +0100
Subject: [Buildroot] [PATCH 4/4] br-reproduce-build: quote all variables
In-Reply-To: <cover.1423910953.git.yann.morin.1998@free.fr>
References: <cover.1423910953.git.yann.morin.1998@free.fr>
Message-ID: <0b43bc60a4856f45924e3814010dc49d0240b1a4.1423910953.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though we do not really support building in a path that contains
spaces (or other weird characters), it's still better to quote
variables.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 utils/br-reproduce-build | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/utils/br-reproduce-build b/utils/br-reproduce-build
index 9987684..0033102 100755
--- a/utils/br-reproduce-build
+++ b/utils/br-reproduce-build
@@ -22,26 +22,26 @@ BUILD_ID="${BUILD_ID%${BUILD_ID#???}}/${BUILD_ID}"
 
 BUILD_DIR="${OUTPUT_DIR}/${BUILD_ID#*/}"
 
-mkdir -p ${BUILD_DIR}
+mkdir -p "${BUILD_DIR}"
 if [ $? -ne 0 ] ; then
     echo "Cannot create output directory"
     exit 1
 fi
 
-wget -O ${BUILD_DIR}/config http://autobuild.buildroot.org/results/${BUILD_ID}/config
+wget -O "${BUILD_DIR}/config http://autobuild.buildroot.org/results/${BUILD_ID}/config"
 if [ $? -ne 0 ] ; then
     echo "Cannot get configuration for build ${BUILD_ID}"
-    rm -f ${BUILD_DIR}
+    rm -f "${BUILD_DIR}"
     exit 1
 fi
 
-wget -O ${BUILD_DIR}/gitid http://autobuild.buildroot.org/results/${BUILD_ID}/gitid
+wget -O "${BUILD_DIR}/gitid http://autobuild.buildroot.org/results/${BUILD_ID}/gitid"
 
-cd ${BUILD_DIR}
-git clone ${BASE_GIT}
+cd "${BUILD_DIR}"
+git clone "${BASE_GIT}"
 if [ $? -ne 0 ] ; then
     echo "Cannot clone Buildroot Git repository"
-    rm -rf ${BUILD_DIR}
+    rm -rf "${BUILD_DIR}"
     exit 1
 fi
 
@@ -52,17 +52,17 @@ git remote set-url origin git://git.busybox.net/buildroot
 git pull
 if [ $? -ne 0 ] ; then
     echo "Cannot pull Buildroot Git repository"
-    rm -rf ${BUILD_DIR}
+    rm -rf "${BUILD_DIR}"
     exit 1
 fi
 
 git checkout $(cat ../gitid)
 if [ $? -ne 0 ] ; then
     echo "Cannot checkout commit " $(cat ../gitid)
-    rm -rf ${BUILD_DIR}
+    rm -rf "${BUILD_DIR}"
     exit 1
 fi
 
 mkdir ../output
-cp ${BUILD_DIR}/config ../output/.config
+cp "${BUILD_DIR}/config" ../output/.config
 make 2>&1 O=../output | tee logfile
-- 
1.9.1

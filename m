From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2015 14:42:12 +0200
Subject: [Buildroot] [PATCH 1/2 v2 autobuilders] br-reproduce-build: quote
	variables
In-Reply-To: <cover.1428842444.git.yann.morin.1998@free.fr>
References: <cover.1428842444.git.yann.morin.1998@free.fr>
Message-ID: <0d9fe02c42d69eb9fd073a9c0636415e07c55dd8.1428842444.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though we do not really support building in a path that
contains spaces (or other weird characters), it's still better
to quote variables.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 utils/br-reproduce-build | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/utils/br-reproduce-build b/utils/br-reproduce-build
index 01d1b7a..0ecfb54 100755
--- a/utils/br-reproduce-build
+++ b/utils/br-reproduce-build
@@ -16,30 +16,30 @@ if [ $# -ne 1 ] ; then
     exit 1 ;
 fi
 
-BUILD_ID=$1
+BUILD_ID="$1"
 
-BUILD_DIR=${OUTPUT_DIR}/${BUILD_ID}
+BUILD_DIR="${OUTPUT_DIR}/${BUILD_ID}"
 
-mkdir -p ${BUILD_DIR}
+mkdir -p "${BUILD_DIR}"
 if [ $? -ne 0 ] ; then
     echo "Cannot create output directory"
     exit 1
 fi
 
-wget -O ${BUILD_DIR}/config http://autobuild.buildroot.org/results/${BUILD_ID}/config
+wget -O "${BUILD_DIR}/config" "http://autobuild.buildroot.org/results/${BUILD_ID}/config"
 if [ $? -ne 0 ] ; then
     echo "Cannot get configuration for build ${BUILD_ID}"
-    rm -f ${BUILD_DIR}
+    rm -f "${BUILD_DIR}"
     exit 1
 fi
 
-wget -O ${BUILD_DIR}/gitid http://autobuild.buildroot.org/results/${BUILD_ID}/gitid
+wget -O "${BUILD_DIR}/gitid" "http://autobuild.buildroot.org/results/${BUILD_ID}/gitid"
 
-cd ${BUILD_DIR}
-git clone ${BASE_GIT} buildroot
+cd "${BUILD_DIR}"
+git clone "${BASE_GIT}" buildroot
 if [ $? -ne 0 ] ; then
     echo "Cannot clone Buildroot Git repository"
-    rm -rf ${BUILD_DIR}
+    rm -rf "${BUILD_DIR}"
     exit 1
 fi
 
@@ -50,17 +50,17 @@ git remote set-url origin git://git.busybox.net/buildroot
 git fetch
 if [ $? -ne 0 ] ; then
     echo "Cannot fetch Buildroot official Git repository"
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

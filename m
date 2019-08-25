From: Atharva Lele <itsatharva@gmail.com>
Date: Sun, 25 Aug 2019 23:06:35 +0530
Subject: [Buildroot] [PATCH] utils/br-reproduce-build: handle
 reproducibility failures
Message-ID: <20190825173635.23860-1-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a condition to check if the config has BR2_REPRODUCIBLE enabled and if it
does, run the build in two output directories - output-1, output-2 - and then
run diffoscope on the generated images.

NOTE: You should have diffoscope installed in order to test reproducibility
failures.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 utils/br-reproduce-build | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/utils/br-reproduce-build b/utils/br-reproduce-build
index 592edc2..d8df3b2 100755
--- a/utils/br-reproduce-build
+++ b/utils/br-reproduce-build
@@ -76,7 +76,24 @@ if [ $? -ne 0 ] ; then
     exit 1
 fi
 
-mkdir ../output
-cp "${BUILD_DIR}/config" ../output/.config
-make olddefconfig O=../output/
-make 2>&1 O=../output | tee logfile
+# Handle cases of testing reproducibility failures.
+# Run the build in different output directories if BR2_REPRODUCIBLE=y
+# and run diffoscope on the generated images. Output of diffoscope is
+# saved in the "output-1" directory.
+# NOTE: You should have diffoscope installed in order to test
+# reproducibility failures.
+if grep -Fxq "BR2_REPRODUCIBLE=y" "${BUILD_DIR}/config"; then
+    mkdir ../output-1 ../output-2
+    cp "${BUILD_DIR}/config" ../output-1/.config
+    cp "${BUILD_DIR}/config" ../output-2/.config
+    make 2>&1 O=../output-1 | tee logfile && make 2>&1 O=../output-2 | tee logfile
+    PREFIX=$(make --no-print-directory O=../output-1 printvars VARS=TARGET_CROSS | cut -c 14- | head -c -1)
+    IMAGE_1="../output-1/images/rootfs.tar"
+    IMAGE_2="../output-2/images/rootfs.tar"
+    diffoscope ${IMAGE_1} ${IMAGE_2} --tool-prefix-binutils ${PREFIX} --text ../output-1/diffoscope_results.txt
+else
+    mkdir ../output
+    cp "${BUILD_DIR}/config" ../output/.config
+    make olddefconfig O=../output/
+    make 2>&1 O=../output | tee logfile
+fi
\ No newline at end of file
-- 
2.22.0

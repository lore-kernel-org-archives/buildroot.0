From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  5 Feb 2019 17:16:05 +0100
Subject: [Buildroot] [PATCH] utils/test-pkg: clean output dir for successful
 builds
Message-ID: <20190205161605.1331-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

test-pkg will use gigabytes of space when testing all toolchains.
Nevertheless, you are normally only interested in the actual build / host
tree when there is a build failure.

Do a 'make clean' for successful builds to save disk space.
Note that the logfile and configuration is still retained for inspection.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 utils/test-pkg | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/test-pkg b/utils/test-pkg
index 1995fa8578..1e40ad7b75 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -161,6 +161,10 @@ build_one() {
     if ! make O="${dir}" legal-info >> "${dir}/logfile" 2>&1; then
         return 3
     fi
+
+    # if we get here, the build was successful.
+    # Clean up the build/host directories to save disk space
+    make O="${dir}" clean >> "${dir}/logfile" 2>&1
 }
 
 help() {
-- 
2.19.2

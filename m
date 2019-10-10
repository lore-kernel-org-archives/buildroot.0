From: heiko.thiery at gmail.com <heiko.thiery@gmail.com>
Date: Thu, 10 Oct 2019 10:51:19 +0200
Subject: [Buildroot] [PATCH 1/1] utils/test-pkg: set the return code for fail
Message-ID: <20191010085120.32730-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

Add an option (-e) to exit the script with an error if a build
or the legal-info check fails.

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
---
 utils/test-pkg | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index f3b34d5d0d..5e440b12f6 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -138,6 +138,10 @@ main() {
 
     printf "%d builds, %d skipped, %d build failed, %d legal-info failed\n" \
         ${nb} ${nb_skip} ${nb_fail} ${nb_legal}
+
+    if [ ${nb_fail} -ne 0 -o ${nb_legal} -ne 0 ]; then
+        return 1
+    fi
 }
 
 build_one() {
@@ -264,4 +268,7 @@ _EOF_
 }
 
 my_name="${0##*/}"
-main "${@}"
+main "${@}" && ret=0 || ret=${?}
+if [ ${ret} -ne 0 ]; then
+    exit 1
+fi
-- 
2.20.1

From: heiko.thiery at gmail.com <heiko.thiery@gmail.com>
Date: Thu, 10 Oct 2019 08:39:33 +0200
Subject: [Buildroot] [PATCH] utils/test-pkg: set the return code for fail
Message-ID: <20191010063933.30858-1-heiko.thiery@gmail.com>
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
 utils/test-pkg | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index f3b34d5d0d..e54c9f0cd8 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -17,8 +17,8 @@ main() {
     local -a toolchains
     local pkg_br_name
 
-    o='hakc:d:n:p:r:t:'
-    O='help,all,keep,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
+    o='hakec:d:n:p:r:t:'
+    O='help,all,keep,error,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
     opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
 
@@ -28,6 +28,7 @@ main() {
     number=0
     mode=0
     toolchains_csv="${TOOLCHAINS_CSV}"
+    exitcode=0
     while [ ${#} -gt 0 ]; do
         case "${1}" in
         (-h|--help)
@@ -57,6 +58,9 @@ main() {
         (-t|--toolchains-csv)
             toolchains_csv="${2}"; shift 2
             ;;
+        (-e|--error)
+            exitcode=1;shift 1
+            ;;
         (--)
             shift; break
             ;;
@@ -138,6 +142,10 @@ main() {
 
     printf "%d builds, %d skipped, %d build failed, %d legal-info failed\n" \
         ${nb} ${nb_skip} ${nb_fail} ${nb_legal}
+
+    if [ ${nb_fail} -ne 0 -o ${nb_legal} -ne 0 ]; then
+        return 1
+    fi
 }
 
 build_one() {
@@ -251,6 +259,9 @@ Options:
         Note: the logfile and configuration is always retained, even without
         this option.
 
+    -e, --error
+        Set return code in case of build fail or legal-info error.
+
 Example:
 
     Testing libcec would require a config snippet that contains:
@@ -264,4 +275,7 @@ _EOF_
 }
 
 my_name="${0##*/}"
-main "${@}"
+main "${@}" && ret=0 || ret=${?}
+if [ ${exitcode} -ne 0 -a ${ret} -ne 0 ]; then
+    exit 1
+fi
-- 
2.20.1

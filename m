From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Feb 2017 22:44:35 +0100
Subject: [Buildroot] [PATCH 7/7 v4] support/test-pkg: run legal-info
In-Reply-To: <cover.1487195062.git.yann.morin.1998@free.fr>
References: <cover.1487195062.git.yann.morin.1998@free.fr>
Message-ID: <58d4b1a3fa0de47c84ee8bc281d3b89edfe5b40c.1487195062.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-tips.txt |  5 +++--
 support/scripts/test-pkg             | 15 +++++++++++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 61cf0bf..34d861c 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -93,9 +93,9 @@ $ ./support/scripts/test-pkg -c libcurl.config -p libcurl
                    br-arm-cortex-a9-musl [ 7/11]: FAILED
                    br-arm-cortex-m4-full [ 8/11]: OK
                              br-arm-full [ 9/11]: OK
-                    br-arm-full-nothread [10/11]: OK
+                    br-arm-full-nothread [10/11]: FAILED
                       br-arm-full-static [11/11]: OK
-11 builds, 2 skipped, 2 failed
+11 builds, 2 skipped, 2 build failed, 1 legal-info failed
 ----
 
 The results mean:
@@ -108,6 +108,7 @@ The results mean:
 * `FAILED`: the build failed for one of various reasons; in either case,
   inspect the +logfile+ file in the output build  directory:
 ** the actual build failed,
+** the legal-info failed,
 ** one of the preliminary steps (download the config file, apply the
    configuration, running `dirclean` for the package) failed;
 
diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index 8435848..56728ae 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -6,7 +6,7 @@ TOOLCHAINS_URL='http://autobuild.buildroot.org/toolchains/configs/toolchain-conf
 main() {
     local o O opts
     local cfg dir pkg random url toolchain
-    local ret nb nb_skip nb_fail nb_tc build_dir
+    local ret nb nb_skip nb_fail nb_legal nb_tc build_dir
     local -a toolchains
 
     o='hc:d:p:r:t:'
@@ -83,6 +83,7 @@ main() {
     nb=0
     nb_skip=0
     nb_fail=0
+    nb_legal=0
     for url in "${toolchains[@]}"; do
         : $((nb++))
         # Using basename(1) on a URL works nicely
@@ -95,10 +96,12 @@ main() {
         (0) printf "OK\n";;
         (1) : $((nb_skip++)); printf "SKIPPED\n";;
         (2) : $((nb_fail++)); printf "FAILED\n";;
+        (3) : $((nb_legal++)); printf "FAILED\n";;
         esac
     done
 
-    printf "%d builds, %d skipped, %d failed\n" ${nb} ${nb_skip} ${nb_fail}
+    printf "%d builds, %d skipped, %d build failed, %d legal-info failed\n" \
+        ${nb} ${nb_skip} ${nb_fail} ${nb_legal}
 }
 
 build_one() {
@@ -145,6 +148,14 @@ build_one() {
     if ! make O="${dir}" ${pkg} >> "${dir}/logfile" 2>&1; then
         return 2
     fi
+
+    # legal-info done systematically, because some packages have different
+    # sources depending on the configuration (e.g. lua-5.2 vs. lua-5.3)
+    if [ -n "${pkg}" ]; then
+        if ! make O="${dir}" "${pkg}-legal-info" >> "${dir}/logfile" 2>&1; then
+            return 3
+        fi
+    fi
 }
 
 help() {
-- 
2.7.4

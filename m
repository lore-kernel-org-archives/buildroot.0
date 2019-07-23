From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 23 Jul 2019 20:23:36 +0300
Subject: [Buildroot] [PATCH 1/1] utils/test-pkg: add option to enable NLS
 support
Message-ID: <20190723172336.24010-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sometimes the package or specific configuration should be build with and
without NLS support which requires additionally append NLS related
config options or to have separate config file or use additional shell
script.

So add helper command line option which appends config file with NLS
options to the final config file which is now always stored in temporary
file before merge it with the default configuration (even only -c was
specified).

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 utils/test-pkg | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index f3b34d5d0d..6a48e039e0 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -16,9 +16,10 @@ main() {
     local ret nb nb_skip nb_fail nb_legal nb_tc build_dir keep
     local -a toolchains
     local pkg_br_name
+    local with_nls
 
-    o='hakc:d:n:p:r:t:'
-    O='help,all,keep,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
+    o='hakNc:d:n:p:r:t:'
+    O='help,all,keep,with-nls,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
     opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
 
@@ -27,6 +28,7 @@ main() {
     keep=0
     number=0
     mode=0
+    with_nls=0
     toolchains_csv="${TOOLCHAINS_CSV}"
     while [ ${#} -gt 0 ]; do
         case "${1}" in
@@ -41,6 +43,10 @@ main() {
             ;;
         (-c|--config-snippet)
             cfg="${2}"; shift 2
+
+            if [ ! -e "${cfg}" ]; then
+                printf "error: %s: no such file\n" "${cfg}" >&2; exit 1
+            fi
             ;;
         (-d|--build-dir)
             dir="${2}"; shift 2
@@ -57,6 +63,9 @@ main() {
         (-t|--toolchains-csv)
             toolchains_csv="${2}"; shift 2
             ;;
+        (-N|--with-nls)
+            with_nls=1; shift 1
+            ;;
         (--)
             shift; break
             ;;
@@ -65,16 +74,21 @@ main() {
 
     trap do_clean INT TERM HUP EXIT
 
+    TEMP_CONF=$(mktemp /tmp/test-${pkg}-config.XXXXXX)
+
     if [ -z "${cfg}" ]; then
         pkg_br_name="${pkg//-/_}"
         pkg_br_name="BR2_PACKAGE_${pkg_br_name^^}"
-        TEMP_CONF=$(mktemp /tmp/test-${pkg}-config.XXXXXX)
-        echo "${pkg_br_name}=y" > ${TEMP_CONF}
-        cfg="${TEMP_CONF}"
+        echo "${pkg_br_name}=y" >> ${TEMP_CONF}
+    else
+        cat "${cfg}" >> ${TEMP_CONF}
     fi
-    if [ ! -e "${cfg}" ]; then
-        printf "error: %s: no such file\n" "${cfg}" >&2; exit 1
+
+    if [ ${with_nls} -eq 1 ]; then
+        echo "BR2_USE_WCHAR=y" >> ${TEMP_CONF}
+        echo "BR2_SYSTEM_ENABLE_NLS=y" >> ${TEMP_CONF}
     fi
+
     if [ -z "${dir}" ]; then
         dir="${HOME}/br-test-pkg"
     fi
@@ -127,7 +141,7 @@ main() {
         toolchain="$(basename "${toolchainconfig}" .config)"
         build_dir="${dir}/${toolchain}"
         printf "%40s [%*d/%d]: " "${toolchain}" ${#nb_tc} ${nb} ${nb_tc}
-        build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
+        build_one "${build_dir}" "${toolchainconfig}" "${TEMP_CONF}" "${pkg}" && ret=0 || ret=${?}
         case ${ret} in
         (0) printf "OK\n";;
         (1) : $((nb_skip++)); printf "SKIPPED\n";;
@@ -251,6 +265,10 @@ Options:
         Note: the logfile and configuration is always retained, even without
         this option.
 
+    -N, --with-nls
+        Build with NLS support enabled. Required config options
+        for NLS support will be automatically enabled.
+
 Example:
 
     Testing libcec would require a config snippet that contains:
-- 
2.17.1

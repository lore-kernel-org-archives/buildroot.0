From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Jun 2021 22:15:14 +0200
Subject: [Buildroot] [PATCH 3/4 v5] utils/test-pkg: add mode to only prepare
 .config files
In-Reply-To: <cover.1624911306.git.yann.morin.1998@free.fr>
References: <cover.1624911306.git.yann.morin.1998@free.fr>
Message-ID: <ae1e35ca4f0557873fa25ca5205d92aa2a16dd1f.1624911306.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, running test-pkg is only done locally on the developpers
machine.

In a follow up commit, we'll add the possibility to run test-pkg in a
gitlab-ci pipeline and, to speed up things, with one job per buildable
configuration.

As such, we will need that test-pkg only ever prepares the
configuration, and that it does not build them.

Add such a mode, with a new option, --prepare-only

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Note: naming is hard; naming options is harder; naming options with a
terse term is even harder; naming options with a terse term that is
still meaningful and explains what the option does, is even harder yet.

---
v5: split off from the next patch into this patch
---
 utils/test-pkg | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index 54c6c5e8fe..4a20cab57f 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -12,13 +12,13 @@ do_clean() {
 
 main() {
     local o O opts
-    local cfg dir pkg random toolchains_csv toolchain all number mode
+    local cfg dir pkg random toolchains_csv toolchain all number mode prepare_only
     local ret nb nb_skip nb_fail nb_legal nb_tc build_dir keep
     local -a toolchains
     local pkg_br_name
 
-    o='hakc:d:n:p:r:t:'
-    O='help,all,keep,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
+    o='hakgc:d:n:p:r:t:'
+    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
     opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
 
@@ -27,6 +27,7 @@ main() {
     keep=0
     number=0
     mode=0
+    prepare_only=0
     toolchains_csv="${TOOLCHAINS_CSV}"
     while [ ${#} -gt 0 ]; do
         case "${1}" in
@@ -39,6 +40,9 @@ main() {
         (-k|--keep)
             keep=1; shift 1
             ;;
+        (-l|--prepare-only)
+            prepare_only=1; shift 1
+            ;;
         (-c|--config-snippet)
             cfg="${2}"; shift 2
             ;;
@@ -127,7 +131,7 @@ main() {
         toolchain="$(basename "${toolchainconfig}" .config)"
         build_dir="${dir}/${toolchain}"
         printf "%40s [%*d/%d]: " "${toolchain}" ${#nb_tc} ${nb} ${nb_tc}
-        build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
+        build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" "${prepare_only}" && ret=0 || ret=${?}
         case ${ret} in
         (0) printf "OK\n";;
         (1) : $((nb_skip++)); printf "SKIPPED\n";;
@@ -147,6 +151,7 @@ build_one() {
     local toolchainconfig="${2}"
     local cfg="${3}"
     local pkg="${4}"
+    local defer="${5}"
 
     mkdir -p "${dir}"
 
@@ -170,6 +175,11 @@ build_one() {
     # Remove file, it's empty anyway.
     rm -f "${dir}/missing.config"
 
+    # Defer building the job to the caller (e.g. a gitlab pipeline)
+    if [ ${defer} -eq 1 ]; then
+        return 0
+    fi
+
     if [ -n "${pkg}" ]; then
         if ! make O="${dir}" "${pkg}-dirclean" >> "${dir}/logfile" 2>&1; then
             return 2
@@ -257,6 +267,10 @@ Options:
         Note: the logfile and configuration is always retained, even without
         this option.
 
+    --prepare-only
+        Only prepare the .config files, but do not build them. Output the
+        list of build directories to stdout, and the status on stderr.
+
 Example:
 
     Testing libcec would require a config snippet that contains:
-- 
2.25.1

From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  8 May 2021 18:48:15 +0200
Subject: [Buildroot] [RFC] utils/test-pkg: add gitlab-ci support
Message-ID: <20210508164815.765195-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gitlab-ci support in test-pkg allow to parallelize the test-pkg
work into several gitlab jobs. It's much faster than local serialized
testing.

The new --gitlab-ci option create a commit in a new branch. This
commit contains all test-pkg's generated defconfig (all skipped
configuration are not commited). The commit can be pushed to any
gitlab Buildroot fork where runners (free or private) are available.

example:
./utils/test-pkg -c defconfig -p nano -g

The current generate-gitlab-ci-yml script is updated to detect any
branches using a suffix "*-test-pkg" to generate a gitlab-ci pipeline
using the newly introcuded .test_pkg job template.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/misc/gitlab-ci.yml.in          | 25 +++++++++++
 support/scripts/generate-gitlab-ci-yml | 14 +++++-
 utils/test-pkg                         | 59 ++++++++++++++++++++++++--
 3 files changed, 92 insertions(+), 6 deletions(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index fcfff5c6aa..7dc93f5f72 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -76,3 +76,28 @@
             - test-output/*/.config
             - test-output/*/images/*
 
+.test_pkg:
+    before_script:
+        - TOOLCHAIN_NAME=${CI_JOB_NAME}
+    script:
+        - echo "Configure Buildroot for ${TOOLCHAIN_NAME}"
+        - make O=br-test-pkg/${TOOLCHAIN_NAME} defconfig BR2_DEFCONFIG=br-test-pkg/${TOOLCHAIN_NAME}/defconfig
+        - make O=br-test-pkg/${TOOLCHAIN_NAME}
+        - echo 'Build buildroot'
+        - |
+            make O=br-test-pkg/${TOOLCHAIN_NAME} > >(tee build.log |grep '>>>') 2>&1 || {
+                echo 'Failed build last output'
+                tail -200 build.log
+                exit 1
+            }
+    artifacts:
+        when: always
+        expire_in: 2 weeks
+        paths:
+            - build.log
+            - br-test-pkg/*/.config
+            - br-test-pkg/*/defconfig
+            - br-test-pkg/*/images/
+            - br-test-pkg/*/build/build-time.log
+            - br-test-pkg/*/build/packages-file-list.txt
+            - br-test-pkg/*/build/*/.config
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 3f498e08fd..9881431551 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -22,8 +22,8 @@ _EOF_
 }
 
 gen_tests() {
-    local -a basics defconfigs runtimes
-    local do_basics do_defconfigs do_runtime
+    local -a basics defconfigs runtimes toolchains
+    local do_basics do_defconfigs do_runtime do_testpkg
     local defconfigs_ext cfg tst
 
     basics=( DEVELOPERS flake8 package )
@@ -74,12 +74,16 @@ gen_tests() {
             runtimes=( "${CI_COMMIT_REF_NAME##*-}" )
             do_runtime=true
             ;;
+          (*-test-pkg)
+            toolchains=( $(cd br-test-pkg; LC_ALL=C ls -1) )
+            do_testpkg=yes
         esac
     fi
 
     # If nothing else, at least do the basics to generate a valid pipeline
     if [    -z "${do_defconfigs}" \
          -a -z "${do_runtime}" \
+         -a -z "${do_testpkg}" \
        ]
     then
         do_basics=true
@@ -101,6 +105,12 @@ gen_tests() {
     if ${do_runtime:-false}; then
         printf '%s: { extends: .runtime_test_base }\n' "${runtimes[@]}"
     fi
+
+    if [ -n "${do_testpkg}" ]; then
+        for cfg in "${toolchains[@]}"; do
+            printf '%s: { extends: .test_pkg }\n' "${cfg}"
+        done
+    fi
 }
 
 main "${@}"
diff --git a/utils/test-pkg b/utils/test-pkg
index a317d8c17a..ff502ec538 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -3,22 +3,25 @@ set -e
 
 TOOLCHAINS_CSV='support/config-fragments/autobuild/toolchain-configs.csv'
 TEMP_CONF=""
+GIT_BUILD_BRANCH="$(date +%Y-%m-%d--%H-%M-%S)-test-pkg"
+GIT_CURRENT_BRANCH=$(git symbolic-ref -q --short HEAD)
 
 do_clean() {
     if [ ! -z "${TEMP_CONF}" ]; then
         rm -f "${TEMP_CONF}"
     fi
+    git checkout $GIT_CURRENT_BRANCH >/dev/null 2>&1
 }
 
 main() {
     local o O opts
-    local cfg dir pkg random toolchains_csv toolchain all number mode
+    local cfg dir pkg random toolchains_csv toolchain all number mode gitlab_ci
     local ret nb nb_skip nb_fail nb_legal nb_tc build_dir keep
     local -a toolchains
     local pkg_br_name
 
-    o='hakc:d:n:p:r:t:'
-    O='help,all,keep,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
+    o='hakgc:d:n:p:r:t:'
+    O='help,all,keep,gitlab-ci,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
     opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
 
@@ -27,6 +30,7 @@ main() {
     keep=0
     number=0
     mode=0
+    gitlab_ci=0
     toolchains_csv="${TOOLCHAINS_CSV}"
     while [ ${#} -gt 0 ]; do
         case "${1}" in
@@ -39,6 +43,9 @@ main() {
         (-k|--keep)
             keep=1; shift 1
             ;;
+        (-g|--gitlab-ci)
+            gitlab_ci=1; shift 1
+            ;;
         (-c|--config-snippet)
             cfg="${2}"; shift 2
             ;;
@@ -118,6 +125,19 @@ main() {
         printf "error: no toolchain found (networking issue?)\n" >&2; exit 1
     fi
 
+    if [ ${gitlab_ci} -eq 1  ]; then
+        # We need to create a commit, so check if Buildroot git repository is available
+        # and if it's clean.
+        git diff-index --quiet HEAD 2> /dev/null && ret=0 || ret=${?}
+        if [ ${ret} -ne 0 ]; then
+            printf "error: A clean git repository is required.\n" >&2; exit 1
+        fi
+
+        # We have to hard code the directory name since it's reused to generate the pipeline jobs.
+        # ${dir} must be located in the git repository
+        dir="br-test-pkg"
+    fi
+
     nb=0
     nb_skip=0
     nb_fail=0
@@ -127,18 +147,36 @@ main() {
         toolchain="$(basename "${toolchainconfig}" .config)"
         build_dir="${dir}/${toolchain}"
         printf "%40s [%*d/%d]: " "${toolchain}" ${#nb_tc} ${nb} ${nb_tc}
-        build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
+        build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" "${gitlab_ci}" && ret=0 || ret=${?}
         case ${ret} in
         (0) printf "OK\n";;
         (1) : $((nb_skip++)); printf "SKIPPED\n";;
         (2) : $((nb_fail++)); printf "FAILED\n";;
         (3) : $((nb_legal++)); printf "FAILED\n";;
+        (4) printf "GITLAB CI\n";;
         esac
     done
 
     printf "%d builds, %d skipped, %d build failed, %d legal-info failed\n" \
         ${nb} ${nb_skip} ${nb_fail} ${nb_legal}
 
+    # Prepare the build commit
+    if [ ${gitlab_ci} -eq 1  ]; then
+        # Customize the build branch name with the name of the package if provided.
+        if [ -n "${pkg}" ]; then
+            GIT_BUILD_BRANCH="${pkg}-${GIT_BUILD_BRANCH}"
+        fi
+
+        git branch -D ${GIT_BUILD_BRANCH} 2> /dev/null || true
+        git checkout -b ${GIT_BUILD_BRANCH} || exit 1
+
+        git add -f ${dir}/*/defconfig
+        git commit -m "Build bot: trigger new builds" ${dir}/*/defconfig
+
+        # Let the user to push the build branch to its Buildroot gitlab fork.
+        printf "The branch ${GIT_BUILD_BRANCH} is ready and can now be pushed to gitlab.\n"
+    fi
+
     return $((nb_fail + nb_legal))
 }
 
@@ -147,6 +185,7 @@ build_one() {
     local toolchainconfig="${2}"
     local cfg="${3}"
     local pkg="${4}"
+    local gitlab_ci="${5}"
 
     mkdir -p "${dir}"
 
@@ -166,6 +205,12 @@ build_one() {
     # Remove file, it's empty anyway.
     rm -f "${dir}/missing.config"
 
+    # Differ to gitlab pipeline
+    if [ ${gitlab_ci} -eq 1  ]; then
+        make O="${dir}" savedefconfig >> "${dir}/logfile" 2>&1
+        return 4
+    fi
+
     if [ -n "${pkg}" ]; then
         if ! make O="${dir}" "${pkg}-dirclean" >> "${dir}/logfile" 2>&1; then
             return 2
@@ -253,6 +298,12 @@ Options:
         Note: the logfile and configuration is always retained, even without
         this option.
 
+    -g, --gitlab-ci
+        Create a commit in a new branch to use gitlab-ci. This commit contains
+        all test-pkg's generated defconfig (all skipped configuration are not
+        commited). The commit can be pushed to any gitlab user account where
+        runners (free or private) are available.
+
 Example:
 
     Testing libcec would require a config snippet that contains:
-- 
2.30.2

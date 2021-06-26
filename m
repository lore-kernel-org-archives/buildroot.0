From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 27 Jun 2021 00:38:40 +0200
Subject: [Buildroot] [PATCH v3 2/2] utils/test-pkg: add gitlab-ci support
In-Reply-To: <20210626223840.148319-1-romain.naour@gmail.com>
References: <20210626223840.148319-1-romain.naour@gmail.com>
Message-ID: <20210626223840.148319-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gitlab-ci support in test-pkg allows to parallelize the test-pkg
work into several gitlab jobs. It's much faster than local serialized
testing.

The current generate-gitlab-ci-yml script is updated to generate a
gitlab-ci pipeline using the newly introduced .test_pkg job template.

The test-pkg script is executed in the generate-gitlab-ci job to
create the list of jobs in the child-pipeline. There is no need to
execute test-pkg locally. But we need to add a new --generate-only (-g)
option to generate .config file for each toolchains without building
them. All configuration files are kept as gitlab artifacts for the
child-pipeline jobs.
(We can't keep br-test-pkg directory due to a 5 Mo size limit in gitlab)

Only valid toolchains are added to the child-pipeline job list.

To execute test-pkg we need to provide a config snippet to select
the package we want to test. The config snippet must be added to the
last commit log below the line "test-pkg config:"
The config snipped is retrieved in generate-gitlab-ci job using
CI_COMMIT_DESCRIPTION gitlab variable.

Since the test-pkg script is executed from generate-gitlab-ci job in
parent pipeline, we have to enable the parent's artifacts download
from the child-pipeline jobs [1]. This artifact contains the
br-test-pkg directory that contains all .config files.

[1] https://docs.gitlab.com/ee/ci/yaml/README.html#artifact-downloads-to-child-pipelines

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v3: Implement Arnout's review: http://lists.busybox.net/pipermail/buildroot/2021-May/310656.html
    Enable artifacts download from child-pipeline

v2: Rework this patch following Arnout review
    use CI_COMMIT_DESCRIPTION
    remove .config from artifacts but keep images directory since
    it can be useful for further issue investigation
    use the "br-test-pkg" prefix for test-pkg jobs
---
 .gitlab-ci.yml                         |  4 ++++
 support/misc/gitlab-ci.yml.in          | 22 ++++++++++++++++++++++
 support/scripts/generate-gitlab-ci-yml | 23 ++++++++++++++++++++++-
 utils/test-pkg                         | 24 ++++++++++++++++++++----
 4 files changed, 68 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e85ac32033..ad50e20dce 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -13,6 +13,8 @@ generate-gitlab-ci-yml:
   artifacts:
     paths:
       - generated-gitlab-ci.yml
+      - br-test-pkg/*/.config
+      - test-pkg.log
 
 buildroot-pipeline:
   stage: build
@@ -21,3 +23,5 @@ buildroot-pipeline:
       - artifact: generated-gitlab-ci.yml
         job: generate-gitlab-ci-yml
     strategy: depend
+  variables:
+    PARENT_PIPELINE_ID: $CI_PIPELINE_ID
diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 1ee3772154..be7951b3d2 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -80,3 +80,25 @@
             - test-output/*/.config
             - test-output/*/images/*
 
+.test_pkg:
+    stage: build
+    before_script:
+        - OUTPUT_DIR=${CI_JOB_NAME}
+    script:
+        - echo "Configure Buildroot for ${OUTPUT_DIR}"
+        - make O=${OUTPUT_DIR} syncconfig
+        - make O=${OUTPUT_DIR} savedefconfig
+        - echo 'Build buildroot'
+        - *run_make
+    needs:
+        - pipeline: $PARENT_PIPELINE_ID
+          job: generate-gitlab-ci-yml
+    artifacts:
+        when: always
+        expire_in: 2 weeks
+        paths:
+            - build.log
+            - br-test-pkg/*/.config
+            - br-test-pkg/*/defconfig
+            - br-test-pkg/*/build/build-time.log
+            - br-test-pkg/*/build/packages-file-list*.txt
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 3f498e08fd..936f755634 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -23,7 +23,7 @@ _EOF_
 
 gen_tests() {
     local -a basics defconfigs runtimes
-    local do_basics do_defconfigs do_runtime
+    local do_basics do_defconfigs do_runtime do_testpkg
     local defconfigs_ext cfg tst
 
     basics=( DEVELOPERS flake8 package )
@@ -77,9 +77,26 @@ gen_tests() {
         esac
     fi
 
+    # Retrieve defconfig for test-pkg from the git commit message (if any)
+    echo "$CI_COMMIT_DESCRIPTION" \
+        | sed -n '/^test-pkg config:$/,/^$/p' \
+        > defconfig.frag
+
+    if [ -s defconfig.frag ]; then
+        # Remove "test-pkg config:" line
+        sed -i 1d defconfig.frag
+        # Use --all since we expect the user having already pre-tested the new package
+        # with the default subset of toolchains.
+        ./utils/test-pkg --config-snippet defconfig.frag --all --build-dir br-test-pkg --keep --generate-only > test-pkg.log 2>&1
+        if [ -s br-test-pkg.yml ]; then
+            do_testpkg=yes
+        fi
+    fi
+
     # If nothing else, at least do the basics to generate a valid pipeline
     if [    -z "${do_defconfigs}" \
          -a -z "${do_runtime}" \
+         -a -z "${do_testpkg}" \
        ]
     then
         do_basics=true
@@ -101,6 +118,10 @@ gen_tests() {
     if ${do_runtime:-false}; then
         printf '%s: { extends: .runtime_test_base }\n' "${runtimes[@]}"
     fi
+
+    if [ -n "${do_testpkg}" ]; then
+        cat br-test-pkg.yml
+    fi
 }
 
 main "${@}"
diff --git a/utils/test-pkg b/utils/test-pkg
index a317d8c17a..8ba2796668 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -12,13 +12,13 @@ do_clean() {
 
 main() {
     local o O opts
-    local cfg dir pkg random toolchains_csv toolchain all number mode
+    local cfg dir pkg random toolchains_csv toolchain all number mode generate_only
     local ret nb nb_skip nb_fail nb_legal nb_tc build_dir keep
     local -a toolchains
     local pkg_br_name
 
-    o='hakc:d:n:p:r:t:'
-    O='help,all,keep,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
+    o='hakgc:d:n:p:r:t:'
+    O='help,all,keep,generate-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
     opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
 
@@ -27,6 +27,7 @@ main() {
     keep=0
     number=0
     mode=0
+    generate_only=0
     toolchains_csv="${TOOLCHAINS_CSV}"
     while [ ${#} -gt 0 ]; do
         case "${1}" in
@@ -39,6 +40,9 @@ main() {
         (-k|--keep)
             keep=1; shift 1
             ;;
+        (-g|--generate-only)
+            generate_only=1; shift 1
+            ;;
         (-c|--config-snippet)
             cfg="${2}"; shift 2
             ;;
@@ -118,6 +122,11 @@ main() {
         printf "error: no toolchain found (networking issue?)\n" >&2; exit 1
     fi
 
+    if [ ${generate_only} -eq 1  ]; then
+        # Running in generate-only imply keep the build directories.
+        keep=1
+    fi
+
     nb=0
     nb_skip=0
     nb_fail=0
@@ -127,12 +136,13 @@ main() {
         toolchain="$(basename "${toolchainconfig}" .config)"
         build_dir="${dir}/${toolchain}"
         printf "%40s [%*d/%d]: " "${toolchain}" ${#nb_tc} ${nb} ${nb_tc}
-        build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
+        build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" "${generate_only}" && ret=0 || ret=${?}
         case ${ret} in
         (0) printf "OK\n";;
         (1) : $((nb_skip++)); printf "SKIPPED\n";;
         (2) : $((nb_fail++)); printf "FAILED\n";;
         (3) : $((nb_legal++)); printf "FAILED\n";;
+        (4) printf '%s: { extends: .test_pkg }\n' "$build_dir" >> br-test-pkg.yml; printf "GENERATED\n";;
         esac
     done
 
@@ -147,6 +157,7 @@ build_one() {
     local toolchainconfig="${2}"
     local cfg="${3}"
     local pkg="${4}"
+    local generate_only="${5}"
 
     mkdir -p "${dir}"
 
@@ -166,6 +177,11 @@ build_one() {
     # Remove file, it's empty anyway.
     rm -f "${dir}/missing.config"
 
+    # Differ to gitlab pipeline
+    if [ ${generate_only} -eq 1  ]; then
+        return 4
+    fi
+
     if [ -n "${pkg}" ]; then
         if ! make O="${dir}" "${pkg}-dirclean" >> "${dir}/logfile" 2>&1; then
             return 2
-- 
2.31.1

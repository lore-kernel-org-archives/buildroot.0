From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 May 2021 19:34:52 +0200
Subject: [Buildroot] [RFC v2] utils/test-pkg: add gitlab-ci support
In-Reply-To: <20210513120701.2662330-1-romain.naour@gmail.com>
References: <20210513120701.2662330-1-romain.naour@gmail.com>
Message-ID: <98d8d505-8655-fb5a-521c-b522137d0b08@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Romain,

 Still a few comments, but they're becoming nitpicky.

On 13/05/2021 14:07, Romain Naour wrote:
> The gitlab-ci support in test-pkg allow to parallelize the test-pkg
                                    allows

> work into several gitlab jobs. It's much faster than local serialized
> testing.
> 
> The current generate-gitlab-ci-yml script is updated to detect any
> branches using a suffix "*-test-pkg" to generate a gitlab-ci pipeline
> using the newly introcuded .test_pkg job template.

 I don't like this bit (see below).

 Also s/introcuded/introduced/

> 
> The test-pkg script is executed in the generated-gitlab-ci job to
                                         generate-gitlab-ci

> create the list of jobs in the child-pipeline. There is no need to
> execute test-pkg locally. But we need to add a new --gitlab-ci (-g)
> option to generate .config and .config.old files for each

 .config.old is not needed, it's just an artifact for debugging purposes.
Actually it should be quite redundant, it will contain just the concatenation of
the different fragments.

> toolchains without building them. All configuration files are keept
                                                                kept

> as gitlab artifacts for the child-pipeline jobs.
> (We can't keep br-test-pkg directory due to a 5 Mo limit size in gilbab)
                                                     size limit    gitlab

> 
> Only valid toolchains are added to the child-pipeline job list.
> 
> To execure test-pkg we need to provide a config snippet to select
     execute

> the package we want to test. The config snippet must be added to the
> last commit log bellow the line "test-pkg config:"
                  below

> The config snipped is retrieved in generated-gitlab-ci job using
                                     generate-gitlab-ci

> CI_COMMIT_DESCRIPTION gitlab variable.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v2: Rework this patch following Arnout review
>     use CI_COMMIT_DESCRIPTION
>     remove .config from artifacts but keep images directory since
>     it can be useful for further issue investigation
>     use the "br-test-pkg" prefix for test-pkg jobs
> 
> See:
> https://gitlab.com/kubu93/buildroot/-/pipelines/302286694
> ---
>  .gitlab-ci.yml                         |  3 +++
>  support/misc/gitlab-ci.yml.in          | 25 +++++++++++++++++++++++++
>  support/scripts/generate-gitlab-ci-yml | 19 +++++++++++++++++++
>  utils/test-pkg                         | 24 ++++++++++++++++++++----
>  4 files changed, 67 insertions(+), 4 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index e85ac32033..9c8c82ac69 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -13,6 +13,9 @@ generate-gitlab-ci-yml:
>    artifacts:
>      paths:
>        - generated-gitlab-ci.yml
> +      - br-test-pkg/*/.config
> +      - br-test-pkg/*/.config.old
> +      - test-pkg.log
>  
>  buildroot-pipeline:
>    stage: build
> diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
> index fcfff5c6aa..5292f3e7f4 100644
> --- a/support/misc/gitlab-ci.yml.in
> +++ b/support/misc/gitlab-ci.yml.in
> @@ -76,3 +76,28 @@
>              - test-output/*/.config
>              - test-output/*/images/*
>  
> +.test_pkg:
> +    before_script:
> +        - TEST_PKG_BUILD=${CI_JOB_NAME}
> +    script:
> +        - echo "Configure Buildroot for ${TEST_PKG_BUILD}"
> +        - make O=${TEST_PKG_BUILD} olddefconfig
> +        - make O=${TEST_PKG_BUILD} savedefconfig
> +        - make O=${TEST_PKG_BUILD}
> +        - echo 'Build buildroot'
> +        - |
> +            make O=${TEST_PKG_BUILD} > >(tee build.log |grep '>>>') 2>&1 || {
> +                echo 'Failed build last output'
> +                tail -200 build.log
> +                exit 1
> +            }

Perhaps this should be factored out, like so:

.run_make: &run_make
  |
    make O=${TEST_PKG_BUILD} > >(tee build.log |grep '>>>') 2>&1 || {
    	echo 'Failed build last output'
    	tail -200 build.log
    	exit 1
    }


...
        - *run_make



> +    artifacts:
> +        when: always
> +        expire_in: 2 weeks
> +        paths:
> +            - build.log
> +            - br-test-pkg/*/.config
> +            - br-test-pkg/*/defconfig
> +            - br-test-pkg/*/images/

 I don't think images is very useful - there typically arent any.

> +            - br-test-pkg/*/build/build-time.log
> +            - br-test-pkg/*/build/packages-file-list.txt

 Actually, why not add the staging and host lists as well?

> diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
> index 3f498e08fd..5149bd60ee 100755
> --- a/support/scripts/generate-gitlab-ci-yml
> +++ b/support/scripts/generate-gitlab-ci-yml
> @@ -74,12 +74,25 @@ gen_tests() {
>              runtimes=( "${CI_COMMIT_REF_NAME##*-}" )
>              do_runtime=true
>              ;;
> +          (*-test-pkg)

 So this is where I beg to differ.

 Instead of relying on a branch name, I think this should be done for *any*
pipeline, whether it is triggered, scheduled, merge request, tag, or whatever.
Just move this block after the if/case nest, and before the "If nothing else".

> +            # Retrieve defconfig from the git commit message
> +            echo "$CI_COMMIT_DESCRIPTION" \
> +                | sed -n '/^test-pkg config:$/,/^$/p' \
> +                > defconfig.frag
> +            # Remove "test-pkg config:" line
> +            sed -i 1d defconfig.frag
> +            # Use -a since we expect the user having already pre-tested the new package

 I don't really expect that, but OK :-)

> +            # with the default subset of toolchains.
> +            ./utils/test-pkg -c defconfig.frag -a -d br-test-pkg -k -g 2>&1 > test-pkg.log

 (nitpick) I prefer to use long options in scripts, so --config defconfig.frag
--all etc.

 My shell-fu is not the best, but I thought the 2>&1 part had to come after the
> redirect...

 But anyway, I don't really think it's worth capturing that output. It can just
as well go into the stdout log of gitlab IMHO. (nitpick as well)


> +            toolchains=( $(find br-test-pkg -mindepth 1 -maxdepth 1 -type d '!' -exec test -e "{}/missing.config" ';' -execdir basename '{}' ';') )

Personally I find this clearer:

toolchains=( $(for toolchain in br-test-pkg/*; do
                   test -e "${toolchain}/missing.config || echo "$toolchain";
               done) )

> +            do_testpkg=yes

 In case no valid config was generated at all, we shouldn't set do_testpkg to yes.

>          esac
>      fi
>  
>      # If nothing else, at least do the basics to generate a valid pipeline
>      if [    -z "${do_defconfigs}" \
>           -a -z "${do_runtime}" \
> +         -a -z "${do_testpkg}" \
>         ]
>      then
>          do_basics=true
> @@ -101,6 +114,12 @@ gen_tests() {
>      if ${do_runtime:-false}; then
>          printf '%s: { extends: .runtime_test_base }\n' "${runtimes[@]}"
>      fi
> +
> +    if [ -n "${do_testpkg}" ]; then

 (nitpick) this is actually redundant - the loop below will just be empty.

> +        for cfg in "${toolchains[@]}"; do
> +            printf '%s: { extends: .test_pkg }\n' "br-test-pkg/${cfg}"
> +        done
> +    fi
>  }
>  
>  main "${@}"
> diff --git a/utils/test-pkg b/utils/test-pkg
> index a317d8c17a..ba479c01fa 100755
> --- a/utils/test-pkg
> +++ b/utils/test-pkg
> @@ -12,13 +12,13 @@ do_clean() {
>  
>  main() {
>      local o O opts
> -    local cfg dir pkg random toolchains_csv toolchain all number mode
> +    local cfg dir pkg random toolchains_csv toolchain all number mode gitlab_ci
>      local ret nb nb_skip nb_fail nb_legal nb_tc build_dir keep
>      local -a toolchains
>      local pkg_br_name
>  
> -    o='hakc:d:n:p:r:t:'
> -    O='help,all,keep,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
> +    o='hakgc:d:n:p:r:t:'
> +    O='help,all,keep,gitlab-ci,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
>      opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
>      eval set -- "${opts}"
>  
> @@ -27,6 +27,7 @@ main() {
>      keep=0
>      number=0
>      mode=0
> +    gitlab_ci=0
>      toolchains_csv="${TOOLCHAINS_CSV}"
>      while [ ${#} -gt 0 ]; do
>          case "${1}" in
> @@ -39,6 +40,9 @@ main() {
>          (-k|--keep)
>              keep=1; shift 1
>              ;;
> +        (-g|--gitlab-ci)

 I'm not fully happy with the option name, I think e.g. "--generate-only" is
better. But now we're bikeshedding :-)

> +            gitlab_ci=1; shift 1
> +            ;;
>          (-c|--config-snippet)
>              cfg="${2}"; shift 2
>              ;;
> @@ -118,6 +122,11 @@ main() {
>          printf "error: no toolchain found (networking issue?)\n" >&2; exit 1
>      fi
>  
> +    if [ ${gitlab_ci} -eq 1  ]; then
> +        # Running in gitlab-ci imply keep the build directories.
> +        keep=1
> +    fi
> +
>      nb=0
>      nb_skip=0
>      nb_fail=0
> @@ -127,12 +136,13 @@ main() {
>          toolchain="$(basename "${toolchainconfig}" .config)"
>          build_dir="${dir}/${toolchain}"
>          printf "%40s [%*d/%d]: " "${toolchain}" ${#nb_tc} ${nb} ${nb_tc}
> -        build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
> +        build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" "${gitlab_ci}" && ret=0 || ret=${?}
>          case ${ret} in
>          (0) printf "OK\n";;
>          (1) : $((nb_skip++)); printf "SKIPPED\n";;
>          (2) : $((nb_fail++)); printf "FAILED\n";;
>          (3) : $((nb_legal++)); printf "FAILED\n";;
> +        (4) printf "GITLAB CI\n";;

 How about "GENERATED" :-)


 Actually, if we really intend this for gitlab-ci only, we can very easily
generate the yml fragment directly from here:

printf '%s/%s: { extends: .test_pkg }\n' "$build_dir" "$toolchain" >>
br-test-pkg.yml


 Regards,
 Arnout


>          esac
>      done
>  
> @@ -147,6 +157,7 @@ build_one() {
>      local toolchainconfig="${2}"
>      local cfg="${3}"
>      local pkg="${4}"
> +    local gitlab_ci="${5}"
>  
>      mkdir -p "${dir}"
>  
> @@ -166,6 +177,11 @@ build_one() {
>      # Remove file, it's empty anyway.
>      rm -f "${dir}/missing.config"
>  
> +    # Differ to gitlab pipeline
> +    if [ ${gitlab_ci} -eq 1  ]; then
> +        return 4
> +    fi
> +
>      if [ -n "${pkg}" ]; then
>          if ! make O="${dir}" "${pkg}-dirclean" >> "${dir}/logfile" 2>&1; then
>              return 2
> 

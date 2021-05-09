From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 9 May 2021 13:38:26 +0200
Subject: [Buildroot] [RFC] utils/test-pkg: add gitlab-ci support
In-Reply-To: <20210508164815.765195-1-romain.naour@gmail.com>
References: <20210508164815.765195-1-romain.naour@gmail.com>
Message-ID: <4c072a9e-b6c1-0fcc-ec8a-e170bb204c30@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Romain,

On 08/05/2021 18:48, Romain Naour wrote:
> The gitlab-ci support in test-pkg allow to parallelize the test-pkg
> work into several gitlab jobs. It's much faster than local serialized
> testing.

 Excellent idea! I've had something similar in my head for some time now...


> The new --gitlab-ci option create a commit in a new branch. This
> commit contains all test-pkg's generated defconfig (all skipped
> configuration are not commited). The commit can be pushed to any
> gitlab Buildroot fork where runners (free or private) are available.

 What I have been thinking about however is (IMHO) even more powerful. In gitlab
CI, you can access the last commit's message with CI_COMMIT_DESCRIPTION. You can
use this to embed the config fragment in the top commit message of the branch,
and extract it from there in generate-gitlab-ci.yml. So no call to test-pkg
needed, and you can include the config that was used in the patch that is sent
upstream for easy reproducibility.

So something like:

----8<-----8<-----
package/foo: new package

Signed-off-by: The Best Contributor <best@contributor.org>
---
test-pkg config:
BR2_PACKAGE_FOO=y

https://gitlab.com/contributor/buildroot/-/pipelines?ref=add-package-foo
----8<-----8<-----

In generate-gitlab-ci-yml ou can extract the interesting part with

echo "$CI_COMMIT_DESCRIPTION" \
	| sed -n '/^test-pkg config:$/,/^$/p' \
	> test.config


The above is an example of a patch that is meant to go upstream, but you can
just as well use it for a local test:

----8<-----8<-----
Quick test of foo and bar combination

test-pkg config:
BR2_PACKAGE_FOO=y
BR2_PACKAGE_BAR=y
----8<-----8<-----

> 
> example:
> ./utils/test-pkg -c defconfig -p nano -g
> 
> The current generate-gitlab-ci-yml script is updated to detect any
> branches using a suffix "*-test-pkg" to generate a gitlab-ci pipeline
> using the newly introcuded .test_pkg job template.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  support/misc/gitlab-ci.yml.in          | 25 +++++++++++
>  support/scripts/generate-gitlab-ci-yml | 14 +++++-
>  utils/test-pkg                         | 59 ++++++++++++++++++++++++--
>  3 files changed, 92 insertions(+), 6 deletions(-)
> 
> diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
> index fcfff5c6aa..7dc93f5f72 100644
> --- a/support/misc/gitlab-ci.yml.in
> +++ b/support/misc/gitlab-ci.yml.in
> @@ -76,3 +76,28 @@
>              - test-output/*/.config
>              - test-output/*/images/*
>  
> +.test_pkg:
> +    before_script:
> +        - TOOLCHAIN_NAME=${CI_JOB_NAME}
> +    script:
> +        - echo "Configure Buildroot for ${TOOLCHAIN_NAME}"
> +        - make O=br-test-pkg/${TOOLCHAIN_NAME} defconfig BR2_DEFCONFIG=br-test-pkg/${TOOLCHAIN_NAME}/defconfig

 With my proposal, you wouldn't have this because br-test-pkg has already
created a partial .config file. Instead, you'd do a `make olddefconfig' here,
followed by 'make savedefconfig'.

> +        - make O=br-test-pkg/${TOOLCHAIN_NAME}
> +        - echo 'Build buildroot'
> +        - |
> +            make O=br-test-pkg/${TOOLCHAIN_NAME} > >(tee build.log |grep '>>>') 2>&1 || {
> +                echo 'Failed build last output'
> +                tail -200 build.log
> +                exit 1
> +            }
> +    artifacts:
> +        when: always
> +        expire_in: 2 weeks
> +        paths:
> +            - build.log
> +            - br-test-pkg/*/.config
> +            - br-test-pkg/*/defconfig
> +            - br-test-pkg/*/images/
> +            - br-test-pkg/*/build/build-time.log
> +            - br-test-pkg/*/build/packages-file-list.txt
> +            - br-test-pkg/*/build/*/.config

 I don't think we're interesting in the images or the kernel config in this
case. Both of them are likely non-existent anyway.

 It could be useful, on the other hand, to capture config.log like we do in the
autobuilders. However, for that you'll need to put the scriptlet that gathers
them in an after-script. But something like that can be added later.

> diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
> index 3f498e08fd..9881431551 100755
> --- a/support/scripts/generate-gitlab-ci-yml
> +++ b/support/scripts/generate-gitlab-ci-yml
> @@ -22,8 +22,8 @@ _EOF_
>  }
>  
>  gen_tests() {
> -    local -a basics defconfigs runtimes
> -    local do_basics do_defconfigs do_runtime
> +    local -a basics defconfigs runtimes toolchains
> +    local do_basics do_defconfigs do_runtime do_testpkg
>      local defconfigs_ext cfg tst
>  
>      basics=( DEVELOPERS flake8 package )
> @@ -74,12 +74,16 @@ gen_tests() {
>              runtimes=( "${CI_COMMIT_REF_NAME##*-}" )
>              do_runtime=true
>              ;;
> +          (*-test-pkg)
> +            toolchains=( $(cd br-test-pkg; LC_ALL=C ls -1) )
> +            do_testpkg=yes

 With my proposal instead of relying on the toolchains here, you'd just generate
the br-test-pkg directory if the config fragment generated with the sed command
above is non-empty.

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
> @@ -101,6 +105,12 @@ gen_tests() {
>      if ${do_runtime:-false}; then
>          printf '%s: { extends: .runtime_test_base }\n' "${runtimes[@]}"
>      fi
> +
> +    if [ -n "${do_testpkg}" ]; then
> +        for cfg in "${toolchains[@]}"; do
> +            printf '%s: { extends: .test_pkg }\n' "${cfg}"

 Instead of calling the job simply by the toolchain, I would include the
`br-test-pkg` part in it. So the job would be e.g. `br-test-pkg/linaro-arm'.
Almost all instances of TOOLCHAIN_NAME anyway have br-test-pkg/ in front of it,
and that way you avoid any possible confusion with a defconfig test or a runtime
test.

> +        done
> +    fi
>  }
>  
>  main "${@}"
> diff --git a/utils/test-pkg b/utils/test-pkg
> index a317d8c17a..ff502ec538 100755
> --- a/utils/test-pkg
> +++ b/utils/test-pkg
> @@ -3,22 +3,25 @@ set -e
>  
>  TOOLCHAINS_CSV='support/config-fragments/autobuild/toolchain-configs.csv'
>  TEMP_CONF=""
> +GIT_BUILD_BRANCH="$(date +%Y-%m-%d--%H-%M-%S)-test-pkg"
> +GIT_CURRENT_BRANCH=$(git symbolic-ref -q --short HEAD)
>  
>  do_clean() {
>      if [ ! -z "${TEMP_CONF}" ]; then
>          rm -f "${TEMP_CONF}"
>      fi
> +    git checkout $GIT_CURRENT_BRANCH >/dev/null 2>&1
>  }
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

 With my proposal, we wouldn't add a gitlab-ci option, but only an option to
stop after generating the .config files. This option would obviously imply
--keep as well.

 With my proposal, the rest of the changes to this script are no longer
relevant, so I haven't reviewed them.

 Regards,
 Arnout


[snip]

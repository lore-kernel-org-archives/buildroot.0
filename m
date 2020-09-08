From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 8 Sep 2020 23:14:58 +0200
Subject: [Buildroot] [PATCH 05/10] gitlab-ci: handle the run-time tests
 conditions in script
In-Reply-To: <85feac31927121c21fb135ec3c40b7897eed20d5.1599423132.git.yann.morin.1998@free.fr>
References: <cover.1599423132.git.yann.morin.1998@free.fr>
 <85feac31927121c21fb135ec3c40b7897eed20d5.1599423132.git.yann.morin.1998@free.fr>
Message-ID: <1e9ae0cc-604c-d8ae-8501-d3416ac9612c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 06/09/2020 ? 22:12, Yann E. MORIN a ?crit?:
> Note that we do not propagate the existing comment, because it is
> partially wrong; instead we just keep the per-condition comments.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  support/misc/gitlab-ci.yml.in          |  9 -------
>  support/scripts/generate-gitlab-ci-yml | 33 ++++++++++++++++++++++----
>  2 files changed, 29 insertions(+), 13 deletions(-)
> 
> diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
> index 7f2ae32725..c6c4d35a0c 100644
> --- a/support/misc/gitlab-ci.yml.in
> +++ b/support/misc/gitlab-ci.yml.in
> @@ -96,15 +96,6 @@ one-defconfig:
>  
>  .runtime_test:
>      extends: .runtime_test_base
> -    # Running the runtime tests for every push is too much, so limit to
> -    # explicit triggers through the API.
> -    rules:
> -        # For tags, create a pipeline.
> -        - if: '$CI_COMMIT_TAG'
> -        # For pipeline created by using a trigger token.
> -        - if: '$CI_PIPELINE_TRIGGERED'
> -        # For the branch or tag name named *-runtime-tests, create a pipeline.
> -        - if: '$CI_COMMIT_REF_NAME =~ /^.*-runtime-tests$/'
>      before_script:
>          - TEST_CASE_NAME=${CI_JOB_NAME}
>  
> diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
> index 23db376944..525ea8ccab 100755
> --- a/support/scripts/generate-gitlab-ci-yml
> +++ b/support/scripts/generate-gitlab-ci-yml
> @@ -8,10 +8,7 @@ main() {
>      preamble "${template}"
>  
>      gen_defconfigs
> -
> -    ./support/testing/run-tests -l 2>&1 \
> -    | sed -r -e '/^test_run \((.*)\).*/!d; s//\1: { extends: .runtime_test }/' \
> -    | LC_ALL=C sort
> +    gen_tests
>  }
>  
>  preamble() {
> @@ -55,4 +52,32 @@ gen_defconfigs() {
>      done
>  }
>  
> +gen_tests() {
> +    local -a tests
> +    local run_tests tst
> +
> +    tests=( $(./support/testing/run-tests -l 2>&1 \
> +              |sed -r -e '/^test_run \((.*)\).*/!d; s//\1/'\
> +              |LC_ALL=C sort)

Maybe we should keep the space after the pipe | ?

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> +          )
> +
> +    run_tests=false
> +    if [ -n "${CI_COMMIT_TAG}" ]; then
> +        # For tags, create a pipeline.
> +        run_tests=true
> +    fi
> +    if [ -n "${CI_PIPELINE_TRIGGERED}" ]; then
> +        # For pipeline created by using a trigger token.
> +        run_tests=true
> +    fi
> +    case "${CI_COMMIT_REF_NAME}" in
> +        # For the branch or tag name named *-runtime-tests, create a pipeline.
> +        (*-runtime-tests) run_tests=true;;
> +    esac
> +
> +    if ${run_tests}; then
> +        printf '%s: { extends: .runtime_test }\n' "${tests[@]}"
> +    fi
> +}
> +
>  main "${@}"
> 

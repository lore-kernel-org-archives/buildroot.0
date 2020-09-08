From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 8 Sep 2020 23:23:39 +0200
Subject: [Buildroot] [PATCH 07/10] gitlab-ci: handle single runtime test
 in script
In-Reply-To: <b85e6cd7a8b2d6c6f023246823f5e929b0bfcbb3.1599423132.git.yann.morin.1998@free.fr>
References: <cover.1599423132.git.yann.morin.1998@free.fr>
 <b85e6cd7a8b2d6c6f023246823f5e929b0bfcbb3.1599423132.git.yann.morin.1998@free.fr>
Message-ID: <48ef611a-4df3-0b5b-53e1-ac9d605cc29c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 06/09/2020 ? 22:12, Yann E. MORIN a ?crit?:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
>  support/misc/gitlab-ci.yml.in          | 9 ---------
>  support/scripts/generate-gitlab-ci-yml | 8 +++++++-
>  2 files changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
> index 8a94b872f3..0f93d272be 100644
> --- a/support/misc/gitlab-ci.yml.in
> +++ b/support/misc/gitlab-ci.yml.in
> @@ -82,15 +82,6 @@ check-package:
>              - test-output/*.log
>              - test-output/*/.config
>              - test-output/*/images/*
> -
> -.runtime_test:
> -    extends: .runtime_test_base
>      before_script:
>          - TEST_CASE_NAME=${CI_JOB_NAME}
>  
> -one-runtime_test:
> -    extends: .runtime_test_base
> -    rules:
> -        - if: '$CI_COMMIT_REF_NAME =~ /^.*-tests\..*$/'
> -    before_script:
> -        - TEST_CASE_NAME=$(echo ${CI_COMMIT_REF_NAME} | sed -e 's,^.*-,,g')
> diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
> index 52bec05a53..51e1625faa 100755
> --- a/support/scripts/generate-gitlab-ci-yml
> +++ b/support/scripts/generate-gitlab-ci-yml
> @@ -78,7 +78,13 @@ gen_tests() {
>      fi
>      case "${CI_COMMIT_REF_NAME}" in
>          # For the branch or tag name named *-runtime-tests, create a pipeline.
> -        (*-runtime-tests) run_tests=true;;
> +        (*-runtime-tests)
> +            run_tests=true
> +        ;;
> +        (*-tests.*)
> +            tests=( "${CI_COMMIT_REF_NAME##*-}" )
> +            run_tests=true
> +        ;;
>      esac
>  
>      if ${run_tests}; then
> 

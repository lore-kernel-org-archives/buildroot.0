From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 8 Sep 2020 23:39:39 +0200
Subject: [Buildroot] [PATCH 08/10] gitlab-ci: handle the basic tests in
 script
In-Reply-To: <e589d6f44672bbee11d96cd575ef02e8719da229.1599423132.git.yann.morin.1998@free.fr>
References: <cover.1599423132.git.yann.morin.1998@free.fr>
 <e589d6f44672bbee11d96cd575ef02e8719da229.1599423132.git.yann.morin.1998@free.fr>
Message-ID: <f7b77bb3-b641-b6c7-18d8-b43290368cd4@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 06/09/2020 ? 22:12, Yann E. MORIN a ?crit?:
> Note that those tests were so far ignored only when requesting a single
> defconfig build, or a single runtime test build; everything else
> was trigerring thoses tests.
> 
> However, it feels more natural that they are also ignored when all
> defconfigs build. or all runtime tests, are explictly requested.

Agree.


Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  support/misc/gitlab-ci.yml.in          | 15 +++------------
>  support/scripts/generate-gitlab-ci-yml | 21 +++++++++++++++++++--
>  2 files changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
> index 0f93d272be..c4a37464f6 100644
> --- a/support/misc/gitlab-ci.yml.in
> +++ b/support/misc/gitlab-ci.yml.in
> @@ -1,24 +1,15 @@
> -.check_base:
> -    rules:
> -        - if: '$CI_COMMIT_REF_NAME =~ /^.*-.*_defconfig$/ || $CI_COMMIT_REF_NAME =~ /^.*-tests\..*$/'
> -          when: never
> -        - when: always
> -
> -check-DEVELOPERS:
> -    extends: .check_base
> +.check-DEVELOPERS_base:
>      # get-developers should print just "No action specified"; if it prints
>      # anything else, it's a parse error.
>      # The initial ! is removed by YAML so we need to quote it.
>      script:
>          - "! utils/get-developers | grep -v 'No action specified'"
>  
> -check-flake8:
> -    extends: .check_base
> +.check-flake8_base:
>      script:
>          - make check-flake8
>  
> -check-package:
> -    extends: .check_base
> +.check-package_base:
>      script:
>          - make check-package
>  
> diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
> index 51e1625faa..f8b533f2c3 100755
> --- a/support/scripts/generate-gitlab-ci-yml
> +++ b/support/scripts/generate-gitlab-ci-yml
> @@ -7,6 +7,7 @@ main() {
>  
>      preamble "${template}"
>  
> +    gen_basics
>      gen_defconfigs
>      gen_tests
>  }
> @@ -23,6 +24,22 @@ preamble() {
>  _EOF_
>  }
>  
> +gen_basics() {
> +    local tst
> +
> +    # Skip basic tests when explicitly building defconfigs or runtime tests
> +    case "${CI_COMMIT_REF_NAME}" in
> +        (*-defconfigs)      return;;
> +        (*-*_defconfig)     return;;
> +        (*-runtime-tests)   return;;
> +        (*-tests.*)         return;;
> +    esac
> +
> +    for tst in DEVELOPERS flake8 package; do
> +        printf 'check-%s: { extends: .check-%s_base }\n' "${tst}" "${tst}"
> +    done
> +}
> +
>  gen_defconfigs() {
>      local -a defconfigs
>      local build_defconfigs cfg
> @@ -51,7 +68,7 @@ gen_defconfigs() {
>  
>      for cfg in "${defconfigs[@]}"; do
>          if ${build_defconfigs}; then
> -            printf '%s: { extends: .defconfig }\n' "${cfg}"
> +            printf '%s: { extends: .defconfig_base }\n' "${cfg}"
>          else
>              printf '%s_check: { extends: .defconfig_check }\n' "${cfg}"
>          fi
> @@ -88,7 +105,7 @@ gen_tests() {
>      esac
>  
>      if ${run_tests}; then
> -        printf '%s: { extends: .runtime_test }\n' "${tests[@]}"
> +        printf '%s: { extends: .runtime_test_base }\n' "${tests[@]}"
>      fi
>  }
>  
> 

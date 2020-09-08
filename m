From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 8 Sep 2020 23:19:14 +0200
Subject: [Buildroot] [PATCH 06/10] gitlab-ci: handle single defconfig in
 script
In-Reply-To: <f5bf5253a396aecaec1b712d7c20fb3a9d7d52c0.1599423132.git.yann.morin.1998@free.fr>
References: <cover.1599423132.git.yann.morin.1998@free.fr>
 <f5bf5253a396aecaec1b712d7c20fb3a9d7d52c0.1599423132.git.yann.morin.1998@free.fr>
Message-ID: <91a3602f-22a0-6f00-b2b9-494257b7ca35@gmail.com>
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
>  support/misc/gitlab-ci.yml.in          | 11 -----------
>  support/scripts/generate-gitlab-ci-yml |  8 +++++++-
>  2 files changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
> index c6c4d35a0c..8a94b872f3 100644
> --- a/support/misc/gitlab-ci.yml.in
> +++ b/support/misc/gitlab-ci.yml.in
> @@ -64,20 +64,9 @@ check-package:
>              - output/build/packages-file-list.txt
>              - output/build/*/.config
>              - runtime-test.log
> -
> -.defconfig:
> -    extends: .defconfig_base
>      before_script:
>          - DEFCONFIG_NAME=${CI_JOB_NAME}
>  
> -one-defconfig:
> -    extends: .defconfig_base
> -    rules:
> -        # For the branch or tag name named *-*_defconfigs, create a pipeline.
> -        - if: '$CI_COMMIT_REF_NAME =~ /^.*-.*_defconfig$/'
> -    before_script:
> -        - DEFCONFIG_NAME=$(echo ${CI_COMMIT_REF_NAME} | sed -e 's,^.*-,,g')
> -
>  .runtime_test_base:
>      # Keep build directories so the rootfs can be an artifact of the job. The
>      # runner will clean up those files for us.
> diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
> index 525ea8ccab..52bec05a53 100755
> --- a/support/scripts/generate-gitlab-ci-yml
> +++ b/support/scripts/generate-gitlab-ci-yml
> @@ -40,7 +40,13 @@ gen_defconfigs() {
>      fi
>      case "${CI_COMMIT_REF_NAME}" in
>          # For the branch or tag name named *-defconfigs, create a pipeline.
> -        (*-defconfigs) build_defconfigs=true;;
> +        (*-defconfigs)
> +            build_defconfigs=true
> +        ;;
> +        (*-*_defconfig)
> +            defconfigs=( "${CI_COMMIT_REF_NAME##*-}" )
> +            build_defconfigs=true
> +        ;;
>      esac
>  
>      for cfg in "${defconfigs[@]}"; do
> 

From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 8 Sep 2020 22:57:16 +0200
Subject: [Buildroot] [PATCH 02/10] gitlab-ci: share the image version
 with the child
In-Reply-To: <7d1c9b27dece827cbfb97424cc8b2c1d4fba495a.1599423132.git.yann.morin.1998@free.fr>
References: <cover.1599423132.git.yann.morin.1998@free.fr>
 <7d1c9b27dece827cbfb97424cc8b2c1d4fba495a.1599423132.git.yann.morin.1998@free.fr>
Message-ID: <543c2f9c-76da-d210-9c27-8b3872b56b3d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 06/09/2020 ? 22:12, Yann E. MORIN a ?crit?:
> Currently, the image name and version are duplicated in the main
> pipeline and the generated, child pipeline.
> 
> This is a condition for a future gaffe, so let's use the image from the
> main pipeline when generating the child one.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  support/misc/gitlab-ci.yml.in          |  5 -----
>  support/scripts/generate-gitlab-ci-yml | 14 +++++++++++++-
>  2 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
> index 0d058bdd91..f00c764aaf 100644
> --- a/support/misc/gitlab-ci.yml.in
> +++ b/support/misc/gitlab-ci.yml.in
> @@ -1,8 +1,3 @@
> -# Configuration for Gitlab-CI.
> -# Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
> -
> -image: buildroot/base:20200814.2228
> -
>  .check_base:
>      rules:
>          - if: '$CI_COMMIT_REF_NAME =~ /^.*-.*_defconfig$/ || $CI_COMMIT_REF_NAME =~ /^.*-tests\..*$/'
> diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
> index 51f7de21dd..b076b01d05 100755
> --- a/support/scripts/generate-gitlab-ci-yml
> +++ b/support/scripts/generate-gitlab-ci-yml
> @@ -5,7 +5,7 @@ set -o pipefail
>  main() {
>      local template="${1}"
>  
> -    cat "${template}"
> +    preamble "${template}"
>  
>      (
>          cd configs
> @@ -18,4 +18,16 @@ main() {
>      | LC_ALL=C sort
>  }
>  
> +preamble() {
> +    local template="${1}"
> +
> +    cat - "${template}" <<-_EOF_
> +	# This file is generated; do not edit!
> +	# Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
> +
> +	image: ${CI_JOB_IMAGE}

Note: This script must be run inside a gitlab runner where ${CI_JOB_IMAGE}, if
it used locally (for testing) this variable is not defined.

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> +
> +_EOF_
> +}
> +
>  main "${@}"
> 

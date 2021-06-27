From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 27 Jun 2021 16:42:50 +0200
Subject: [Buildroot] [PATCH 1/2 v4] support/misc/gitlab-ci.yml.in
In-Reply-To: <2dc3c5c61d8476256770c8f4b38bf687caa7ff59.1624802988.git.yann.morin.1998@free.fr>
References: <cover.1624802988.git.yann.morin.1998@free.fr>
 <2dc3c5c61d8476256770c8f4b38bf687caa7ff59.1624802988.git.yann.morin.1998@free.fr>
Message-ID: <658e7a55-8d40-23d4-b768-7a88224f3a3a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 27/06/2021 ? 16:09, Yann E. MORIN a ?crit?:
> From: Romain Naour <romain.naour@gmail.com>
> 
> In a followup commit, the make command used to log and display the last
> lines on error will be used in another job.
> Factorize it by introducing .run_make template.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> ---
>  support/misc/gitlab-ci.yml.in | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
> index fcfff5c6aa..1ee3772154 100644
> --- a/support/misc/gitlab-ci.yml.in
> +++ b/support/misc/gitlab-ci.yml.in
> @@ -26,20 +26,24 @@
>          paths:
>              - .config
>  
> +.run_make: &run_make
> +    |
> +      make O=${OUTPUT_DIR} > >(tee build.log |grep '>>>') 2>&1 || {
> +          echo 'Failed build last output'
> +          tail -200 build.log
> +          exit 1
> +      }
> +
>  .defconfig_base:
>      before_script:
>          - DEFCONFIG_NAME=${CI_JOB_NAME}
> +        - OUTPUT_DIR=output
>      script:
>          - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
>          - make ${DEFCONFIG_NAME}
>          - ./support/scripts/check-dotconfig.py .config ./configs/${DEFCONFIG_NAME}
>          - echo 'Build buildroot'
> -        - |
> -            make > >(tee build.log |grep '>>>') 2>&1 || {
> -                echo 'Failed build last output'
> -                tail -200 build.log
> -                exit 1
> -            }
> +        - *run_make
>          - |
>              ./support/scripts/boot-qemu-image.py "${DEFCONFIG_NAME}" > >(tee runtime-test.log) 2>&1 || {
>                  echo 'Failed runtime test last output'
> 

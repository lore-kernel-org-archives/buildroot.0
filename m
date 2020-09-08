From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 8 Sep 2020 23:40:54 +0200
Subject: [Buildroot] [PATCH 09/10] gitlab-ci: move before-script before
 script
In-Reply-To: <0933dd627e38379a58002fed9fb62b136ebabaf4.1599423132.git.yann.morin.1998@free.fr>
References: <cover.1599423132.git.yann.morin.1998@free.fr>
 <0933dd627e38379a58002fed9fb62b136ebabaf4.1599423132.git.yann.morin.1998@free.fr>
Message-ID: <27cd5143-7e45-a93d-510a-0bdc5357dd90@gmail.com>
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
>  support/misc/gitlab-ci.yml.in | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
> index c4a37464f6..fcfff5c6aa 100644
> --- a/support/misc/gitlab-ci.yml.in
> +++ b/support/misc/gitlab-ci.yml.in
> @@ -14,6 +14,8 @@
>          - make check-package
>  
>  .defconfig_check:
> +    before_script:
> +        - DEFCONFIG_NAME=$(echo ${CI_JOB_NAME} | sed -e 's,_check$,,g')
>      script:
>          - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
>          - make ${DEFCONFIG_NAME}
> @@ -23,10 +25,10 @@
>          expire_in: 2 weeks
>          paths:
>              - .config
> -    before_script:
> -        - DEFCONFIG_NAME=$(echo ${CI_JOB_NAME} | sed -e 's,_check$,,g')
>  
>  .defconfig_base:
> +    before_script:
> +        - DEFCONFIG_NAME=${CI_JOB_NAME}
>      script:
>          - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
>          - make ${DEFCONFIG_NAME}
> @@ -55,10 +57,10 @@
>              - output/build/packages-file-list.txt
>              - output/build/*/.config
>              - runtime-test.log
> -    before_script:
> -        - DEFCONFIG_NAME=${CI_JOB_NAME}
>  
>  .runtime_test_base:
> +    before_script:
> +        - TEST_CASE_NAME=${CI_JOB_NAME}
>      # Keep build directories so the rootfs can be an artifact of the job. The
>      # runner will clean up those files for us.
>      # Multiply every emulator timeout by 10 to avoid sporadic failures in
> @@ -73,6 +75,4 @@
>              - test-output/*.log
>              - test-output/*/.config
>              - test-output/*/images/*
> -    before_script:
> -        - TEST_CASE_NAME=${CI_JOB_NAME}
>  
> 

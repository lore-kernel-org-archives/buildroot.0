From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 30 Apr 2019 00:34:47 +0200
Subject: [Buildroot] [PATCH 7/7] gitlab.yml.in: enable Qemu gitlab
 testing
In-Reply-To: <1556555546-9246-8-git-send-email-jugurtha.belkalem@smile.fr>
References: <1556555546-9246-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1556555546-9246-8-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <363c6250-0c99-126c-3017-56160bc4ba62@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/04/2019 18:32, Jugurtha BELKALEM wrote:
> Used to launch qemu tests for various qemu
> architectures.
> Neverthless to say that this file skips any other job
> different from qemu (only qemu configurations are
> runtime tested).
> 
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> ---
>  .gitlab-ci.yml    | 3 +++
>  .gitlab-ci.yml.in | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index e9869be..5884716 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -37,6 +37,8 @@ check-package:
>  .defconfig_script:
>      script:
>          - echo 'Configure Buildroot'
> +        - main_dir=$(pwd)
> +        - ./support/scripts/qemu-boot-defconfig_config.sh "${CI_JOB_NAME}" "${main_dir}"

 ${main_dir} is still the current directory when the script is called, so it's
not needed to pass it as an argument.

>          - make ${CI_JOB_NAME}
>          - echo 'Build buildroot'
>          - |
> @@ -45,6 +47,7 @@ check-package:
>                  tail -200 build.log
>                  exit 1
>              }
> +        - ./support/scripts/qemu-boot-checker.sh "${CI_JOB_NAME}" "${main_dir}"

 Instead of calling this unconditionally for each defconfig, I'd prefer this to
be in a pipeline, i.e. the qemu run is done in a separate job and only if the
corresponding build was successful. But it will take some getting familiar with
gitlab-ci to get that correct, so this idea may be a little too ambitious.


 Regards,
 Arnout

>  
>  .defconfig:
>      extends: .defconfig_script
> diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
> index ad61643..ac5ba57 100644
> --- a/.gitlab-ci.yml.in
> +++ b/.gitlab-ci.yml.in
> @@ -37,6 +37,8 @@ check-package:
>  .defconfig_script:
>      script:
>          - echo 'Configure Buildroot'
> +        - main_dir=$(pwd)
> +        - ./support/scripts/qemu-boot-defconfig_config.sh "${CI_JOB_NAME}" "${main_dir}"
>          - make ${CI_JOB_NAME}
>          - echo 'Build buildroot'
>          - |
> @@ -45,6 +47,7 @@ check-package:
>                  tail -200 build.log
>                  exit 1
>              }
> +        - ./support/scripts/qemu-boot-checker.sh "${CI_JOB_NAME}" "${main_dir}"
>  
>  .defconfig:
>      extends: .defconfig_script
> 

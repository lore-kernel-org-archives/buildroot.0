From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 20 Oct 2018 23:54:32 -0300
Subject: [Buildroot] [PATCH] .gitlab-ci.yml: do runtime tests only on
 explicit trigger
References: <20181020224254.5895-1-arnout@mind.be>
Message-ID: <5bcbea684f4e4_3ef22b2051d8a8b4760e3@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Oct 20, 2018 at 07:42 PM, Arnout Vandecappelle (Essensium/Mind) wrote:

[snip]
> +++ b/.gitlab-ci.yml
> @@ -62,6 +62,11 @@ check-package:
>              - output/build/packages-file-list.txt
>  
>  .runtime_test: &runtime_test
> +    # Running the runtime tests for every push is too much, so limit to
> +    # explicit triggers through the API.
> +    only:
> +        - triggers
> +        - tags
>      # Keep build directories so the rootfs can be an artifact of the job. The
>      # runner will clean up those files for us.
>      # Multiply every emulator timeout by 10 to avoid sporadic failures in
> @@ -261,71 +266,3 @@ zynq_zc706_defconfig: *defconfig
>  zynq_zed_defconfig: *defconfig
>  zynq_zybo_defconfig: *defconfig
>  zynqmp_zcu106_defconfig: *defconfig
> -tests.boot.test_atf.TestATFAllwinner: *runtime_test
> -tests.boot.test_atf.TestATFMarvell: *runtime_test
> -tests.boot.test_atf.TestATFVexpress: *runtime_test
[snip]

You forgot to re-run 'make .gitlab-ci.yml'.
We don't want to remove the test list.

> +++ b/.gitlab-ci.yml.in
> @@ -62,6 +62,11 @@ check-package:
>              - output/build/packages-file-list.txt
>  
>  .runtime_test: &runtime_test
> +    # Running the runtime tests for every push is too much, so limit to
> +    # explicit triggers through the API.
> +    only:
> +        - triggers
> +        - tags

We could also allow a regexp on the branch name to trigger it:
         - /^.*-runtime_test$/

Using the same commit, I pushed 2 branches:
branch name: gitlabci-triggers, #jobs = 4
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/33723520
branch name: gitlabci-triggers-runtime_test, #jobs = 72
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/33723541

>      # Keep build directories so the rootfs can be an artifact of the job. The
>      # runner will clean up those files for us.
>      # Multiply every emulator timeout by 10 to avoid sporadic failures in
> -- 

Regards,
Ricardo

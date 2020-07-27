From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 13:52:01 +0200
Subject: [Buildroot] [PATCH v2] gitlab: generate the gitlab-ci
 configuration before each build
In-Reply-To: <20200725213558.1368219-1-romain.naour@gmail.com>
References: <20200725213558.1368219-1-romain.naour@gmail.com>
Message-ID: <20200727115201.GV19818@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-07-25 23:35 +0200, Romain Naour spake thusly:
> Since Gitlab 12.9, Gitlab allow to trigger child pipeline with generated configuration file.
> See: https://gitlab.com/gitlab-org/gitlab/-/issues/35632
> 
> This allow us to stop updating the .gitlab-ci.yml file when a
> new defconfig is added to Buildroot.
> 
> Remove check-gitlab-ci.yml job since it is now uneeded.
> Remove .gitlab-ci.yml make target.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
[--SNIP--]
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> index bde7543c25..ef3edb500d 100644
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -574,8 +574,7 @@ emulator and provide test case conditions.
>  Beyond creating the test script, there are a couple of additional steps that
>  should be taken once you have your initial test case script. The first is
>  to add yourself to the +DEVELOPERS+ file to be the maintainer of that test
> -case. The second is to update the Gitlab CI yml by executing
> -+make .gitlab-ci.yml+.
> +case. The second is to update the Gitlab CI yml.

There is not even this second step to do at all anymore, now that the
thing is generated in the pipeline. So all we need to document, now is:

    After creating the test script, add yourself to the +DEVELOPERS+ file to
    be the maintainer of that test case.

I've fixed that locally, applied to master and pushed. Thanks.

Regards,
Yann E. MORIN.

>  ==== Debugging a test case
>  
> diff --git a/.gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
> similarity index 92%
> rename from .gitlab-ci.yml.in
> rename to support/misc/gitlab-ci.yml.in
> index 1facd2a66f..cf9bf5f9cf 100644
> --- a/.gitlab-ci.yml.in
> +++ b/support/misc/gitlab-ci.yml.in
> @@ -1,8 +1,5 @@
>  # Configuration for Gitlab-CI.
>  # Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
> -# The .gitlab-ci.yml file is generated from .gitlab-ci.yml.in.
> -# It needs to be regenerated every time a defconfig is added, using
> -# "make .gitlab-ci.yml".
>  
>  image: buildroot/base:20191027.2027
>  
> @@ -32,13 +29,6 @@ check-flake8:
>      after_script:
>          - wc -l files.processed
>  
> -check-gitlab-ci.yml:
> -    extends: .check_base
> -    script:
> -        - mv .gitlab-ci.yml .gitlab-ci.yml.orig
> -        - make .gitlab-ci.yml
> -        - diff -u .gitlab-ci.yml.orig .gitlab-ci.yml
> -
>  check-package:
>      extends: .check_base
>      script:
> -- 
> 2.25.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

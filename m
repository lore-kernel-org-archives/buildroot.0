From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Apr 2020 22:23:39 +0200
Subject: [Buildroot] [PATCHv2 12/12] gitlab-ci: check all defconfigs on
 every push
In-Reply-To: <20200421172646.3340666-12-romain.naour@gmail.com>
References: <20200421172646.3340666-1-romain.naour@gmail.com>
 <20200421172646.3340666-12-romain.naour@gmail.com>
Message-ID: <20200421202339.GY5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-04-21 19:26 +0200, Romain Naour spake thusly:
> A defconfig check has been introduced by a previous
> patch to test each defconfig before the building them.
> But those builds are done every week or more.
> 
> Checking a defconfig can be done on every push to the
> repository since it take few seconds for each.
> 
> This would allow to detect as soon as possible a problem
> in a defconfig and in particular Kconfig symbols that
> disapear from the generated .config file.
> 
> Although we could have used one job for each defconfig
> check, we need to limit the number of jobs since gitlab
> can limit the number of jobs in active pipelines.
> (500 by default [1]).

So, how many jobs do we get at now?

But OK, I see the point.

> So, add a new job called defconfig_check that test all
> defconfig in one go.
> 
> The test curently take 3 minutes 31 seconds to run in
> a gitlab runner.
> 
> Tested:
> https://gitlab.com/kubu93/buildroot/-/jobs/520646767
> 
> [1] https://gitlab.com/gitlab-org/gitlab/-/blob/4108625e85990fd9d4520365a03bb1bad625ac35/doc/administration/instance_limits.md#number-of-jobs-in-active-pipelines
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  .gitlab-ci.yml    | 13 +++++++++++++
>  .gitlab-ci.yml.in | 13 +++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 0d06a1b7cf..a060b545de 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -43,6 +43,19 @@ check-package:
>      script:
>          - make check-package
>  
> +defconfig_check:
> +    extends: .check_base
> +    script:
> +        - >
> +           failed=0;

success=true
No need for the trailing semi-colon.

> +           for defconfig in $(cd configs; ls *_defconfig);
> +           do
> +               echo "Configure Buildroot for ${defconfig}";
No need for the trailing semi-colon.
> +               make ${defconfig} 2>&1 >/dev/null;
No need for the trailing semi-colon.
> +               ./support/scripts/check-dotconfig.py .config configs/${defconfig} || failed=1;

[...] || success=false
No need for the trailing semi-colon.

> +           done;

No need for the trailing semi-colon.

> +           exit ${failed};

${succes}
No need for the trailing semi-colon.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

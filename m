From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 9 Apr 2019 21:03:56 +0200
Subject: [Buildroot] [PATCH 1/1] .flake8: fix check for 80/132 columns
In-Reply-To: <20190409001729.3422-1-ricardo.martincoski@gmail.com>
References: <20190409001729.3422-1-ricardo.martincoski@gmail.com>
Message-ID: <20190409190356.GE23890@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2019-04-08 21:17 -0300, Ricardo Martincoski spake thusly:
> We recommend wrapping at 80 columns but we accept 132 columns when it
> makes more readable.
> 
> When running flake8 locally, use maximum line length 80.
> But when running in GitLab CI, keep the check-flake8 job failing only
> for lines longer than 132.

So it means that when I run it locally, I'll get failures that we
would not get on the pipelines, right? So, commits that introduced
such incorrectly formatted code will not be caught on the pipelines,
so that we can catch it and inform the author of the offending
commits, but instead, individual developpers whi try to play by the
rules and check their own code before submission, would get hit by
the limitation?

I am not too fond of this, TBH.. :-/

Besides, 80 chars does make for a narrow limit, I think.

Let's fully assume this 132-char limit. ;-)

Regards,
Yann E. MORIN.

> Reported-by: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> The result of check-flake8 does not change:
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/192997289
> ---
>  .flake8           | 2 +-
>  .gitlab-ci.yml    | 2 +-
>  .gitlab-ci.yml.in | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/.flake8 b/.flake8
> index 7dd7b541cc..ee3d5035a0 100644
> --- a/.flake8
> +++ b/.flake8
> @@ -2,4 +2,4 @@
>  exclude=
>      # copied from the kernel sources
>      utils/diffconfig
> -max-line-length=132
> +max-line-length=80
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 572868a557..e62e1c3e38 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -38,7 +38,7 @@ check-flake8:
>          - find * -type f -print0 | xargs -0 file | grep 'Python script' | cut -d':' -f1 >> files.txt
>          - sort -u files.txt | tee files.processed
>      script:
> -        - python -m flake8 --statistics --count $(cat files.processed)
> +        - python -m flake8 --statistics --count --max-line-length=132 $(cat files.processed)
>      after_script:
>          - wc -l files.processed
>  
> diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
> index a506840892..b1ec671867 100644
> --- a/.gitlab-ci.yml.in
> +++ b/.gitlab-ci.yml.in
> @@ -38,7 +38,7 @@ check-flake8:
>          - find * -type f -print0 | xargs -0 file | grep 'Python script' | cut -d':' -f1 >> files.txt
>          - sort -u files.txt | tee files.processed
>      script:
> -        - python -m flake8 --statistics --count $(cat files.processed)
> +        - python -m flake8 --statistics --count --max-line-length=132 $(cat files.processed)
>      after_script:
>          - wc -l files.processed
>  
> -- 
> 2.17.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

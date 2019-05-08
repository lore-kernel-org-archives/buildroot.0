From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 May 2019 16:43:21 +0200
Subject: [Buildroot] [PATCH 1/1] support/download/git: add branch support
In-Reply-To: <1557325351-17906-1-git-send-email-catherine@kubos.co>
References: <1557325351-17906-1-git-send-email-catherine@kubos.co>
Message-ID: <20190508144321.GE31209@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CAtherine, All,

On 2019-05-08 14:22 +0000, catherine at kubos.co spake thusly:
> From: Catherine Garabedian <catherine@kubos.co>
> 
> A prior patch added logic to verify that the given cset exists.
> 
> The command format used fails when attempting to verify a branch name, thus
> preventing Buildroot from downloading any packages whose source comes from a
> branch.

We explciitly do not want to support using a branch _by name_, because
that does not work as people expect it to work, see our manual:

    https://buildroot.org/downloads/manual/manual.html#generic-package-reference

Excerpt:

 1. due to local caching, Buildroot will not re-fetch the repository,
    so people who expect to be able to follow the remote repository
    would be quite surprised and disappointed;
 2. because two builds can never be perfectly simultaneous, and because
    the remote repository may get new commits on the branch anytime, two
    users, using the same Buildroot tree and building the same
    configuration, may get different source, thus rendering the build
    non reproducible, and people would be quite surprised and
    disappointed.

So, using a branch _by name_ can not owrk because of those two reasons,
and as such we believe this should not be supported.

Instead, there was some effort a few months ago, to actually enforce the
check that a branch was not used, and fail if that was the case.

Regards,
Yann E. MORIN.

> This patch adds a secondary check which can validate branches (but not tags).
> 
> Signed-off-by: Catherine Garabedian <catherine@kubos.co>
> ---
>  support/download/git | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/support/download/git b/support/download/git
> index 17ca04e..a25552e 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -130,8 +130,10 @@ fi
>  # scratch won't help, so we don't want to trash the repository for a
>  # missing commit. We just exit without going through the ERR trap.
>  if ! _git rev-parse --quiet --verify "'${cset}^{commit}'" >/dev/null 2>&1; then
> -    printf "Commit '%s' does not exist in this repository\n." "${cset}"
> -    exit 1
> +    if ! _git rev-parse --quiet --verify "'origin/${cset}'" >/dev/null 2>&1; then
> +        printf "'%s' does not exist in this repository\n." "${cset}"
> +        exit 1
> +    fi
>  fi
>  
>  # The new cset we want to checkout might have different submodules, or
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Apr 2018 19:42:37 +0200
Subject: [Buildroot] [RFC PATCH 1/3] download/git: fix fetch all refs
 for old git
In-Reply-To: <20180412092855.30621-2-ricardo.martincoski@gmail.com>
References: <20180412092855.30621-1-ricardo.martincoski@gmail.com>
 <20180412092855.30621-2-ricardo.martincoski@gmail.com>
Message-ID: <20180412174237.GE4221@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-04-12 06:28 -0300, Ricardo Martincoski spake thusly:
> With old versions of git, when the shallow fetch was not enough, the
> download fails like this:
>  Fetching all references
>  Could not fetch special ref 'sha1'; assuming it is not special.
>  fatal: reference is not a tree: sha1
> 
> At git version 1.9.0, the semantics of the option -t for git fetch
> changed, see upstream commit [1]:
> < 1.9.0: "fetch tags without also fetching other references";
> >=1.9.0: "fetch tags *in addition to* other stuff".
> 
> Fall back to explicit refspec to support distros that use ancient
> versions of git.
[--SNIP--]
> diff --git a/support/download/git b/support/download/git
> index 381f3ceeb3..1b09e5c750 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -76,7 +76,7 @@ if [ -n "$(_git ls-remote origin "'${cset}'" 2>&1)" ]; then
>  fi
>  if [ ${git_done} -eq 0 ]; then
>      printf "Fetching all references\n"
> -    _git fetch origin -t
> +    _git fetch origin -u "'+refs/tags/*:refs/tags/*'" "'+refs/heads/*:refs/remotes/origin/*'"

Why don't we just run:

    git fetch origin
    git fetch origin -t

As I understand it:

                    ancient git         | new git
--------------------------------------------------------------------
git fetch     | fetch all refs but tags | fetches all refs but tags
git fetch -t  | fetches only tags       | fetch all refs and tags

Right?

Regards,
Yann E. MORIN.

>  fi
>  
>  # Try to get the special refs exposed by some forges (pull-requests for
> -- 
> 2.14.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

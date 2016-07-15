From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 Jul 2016 22:47:29 +0200
Subject: [Buildroot] [PATCH v2 1/6] support/download: Add support to
 pass options directly to downloaders
In-Reply-To: <1468315820-9341-2-git-send-email-romain.perier@free-electrons.com>
References: <1468315820-9341-1-git-send-email-romain.perier@free-electrons.com>
 <1468315820-9341-2-git-send-email-romain.perier@free-electrons.com>
Message-ID: <20160715204729.GH3692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, Thomas, All,

On 2016-07-12 11:30 +0200, Romain Perier spake thusly:
> This adds support to pass options to the underlying command that is used
> by downloader. Useful for retrieving data with server-side checking for
> user login or passwords, use a proxy or use specific options for cloning
> a repository via git and hg.
> 
> Signed-off-by: Romain Perier <romain.perier@free-electrons.com>

Following the reply by Thomas, I did a second review of this patch with
an eye toward having it applied without changing the way we pass the
current options.

I still have a few comments on it (read the second comment before
reading the first).

> ---
[--SNIP--]
> diff --git a/support/download/bzr b/support/download/bzr
> index e18b01f..9443e03 100755
> --- a/support/download/bzr
> +++ b/support/download/bzr
> @@ -25,6 +25,7 @@ output="${1}"
>  repo="${2}"
>  rev="${3}"
>  basename="${4}"
> +dl_opts="${5}"

So we expect the additional options to be pased as a single string?
Why not use something like:

    shift 4 # Get rid of our options

and then:

    _bzr export ${verbose} --root="'${basename}/'" --format=tgz \
        ${timestamp_opt} - "'${repo}'" -r "'${rev}'" \
        ${timestamp_opt} - "${@}" "'${repo}'" -r "'${rev}'" \

Ditto for all backends, of course.

Note: I wrote the above after writing the comment below; that construct
above would fix the concerns I expressed below.

(I'm hard to follow, am I not? My brain is really tortuous... ;-] )

>  # Caller needs to single-quote its arguments to prevent them from
>  # being expanded a second time (in case there are spaces in them)
> @@ -49,5 +50,5 @@ if [ ${bzr_version} -ge ${bzr_min_version} ]; then
>  fi
>  
>  _bzr export ${verbose} --root="'${basename}/'" --format=tgz \
> -    ${timestamp_opt} - "'${repo}'" -r "'${rev}'" \
> +    ${timestamp_opt} - "${dl_opts}" "'${repo}'" -r "'${rev}'" \

When there are no additional options, then this passes an empty string
argument to the wrapping function. Normally, an empty string argument is
not very well handled by most programs, and bzr is no exception.

This happens to work because we then eval the arguments in the wraping
function.

However, this is not a robust solution, as we never encoded the
expectation of such behaviour.

A simple solution would be to just not quote ${dl_opts}. However, that
would not work well is such an option had an explicit space in it.

Still, that's better than nothing.

Unless you can provide convincing arguments that its better to quote
${dl_opts} (but I can't see many).

This all makes me very uneasy... :-/ Except if we follow the suggestion
I mad in the first comment, above, which you can now backtrack to. ;-)

Ditto for all backends, of course.

[--SNIP--]
> diff --git a/support/download/git b/support/download/git
> index 314b388..7fd7563 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -24,6 +24,7 @@ output="${1}"
>  repo="${2}"
>  cset="${3}"
>  basename="${4}"
> +dl_opts="${5}"
>  
>  # Caller needs to single-quote its arguments to prevent them from
>  # being expanded a second time (in case there are spaces in them)
> @@ -49,7 +50,7 @@ if [ -n "$(_git ls-remote "'${repo}'" "'${cset}'" 2>&1)" ]; then
>  fi
>  if [ ${git_done} -eq 0 ]; then
>      printf "Doing full clone\n"
> -    _git clone ${verbose} --mirror "'${repo}'" "'${basename}'"
> +    _git clone ${verbose} "${dl_opts}" --mirror "'${repo}'" "'${basename}'"

You missed the other git clone just a few lines above.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

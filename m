From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jul 2016 18:26:08 +0200
Subject: [Buildroot] [PATCH v3 1/6] support/download: Add support to
 pass options directly to downloaders
In-Reply-To: <1469521290-20446-2-git-send-email-romain.perier@free-electrons.com>
References: <1469521290-20446-1-git-send-email-romain.perier@free-electrons.com>
 <1469521290-20446-2-git-send-email-romain.perier@free-electrons.com>
Message-ID: <20160726162608.GB5925@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-07-26 10:21 +0200, Romain Perier spake thusly:
> This adds support to pass options to the underlying command that is used
> by downloader. Useful for retrieving data with server-side checking for
> user login or passwords, use a proxy or use specific options for cloning
> a repository via git and hg.

Almost good, see below...

> Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
[--SNIP--]
> diff --git a/support/download/git b/support/download/git
> index 314b388..686c26f 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -25,6 +25,8 @@ repo="${2}"
>  cset="${3}"
>  basename="${4}"
>  
> +shift 4 # Get rid of our options
> +
>  # Caller needs to single-quote its arguments to prevent them from
>  # being expanded a second time (in case there are spaces in them)
>  _git() {
> @@ -49,7 +51,7 @@ if [ -n "$(_git ls-remote "'${repo}'" "'${cset}'" 2>&1)" ]; then
>  fi
>  if [ ${git_done} -eq 0 ]; then
>      printf "Doing full clone\n"
> -    _git clone ${verbose} --mirror "'${repo}'" "'${basename}'"
> +    _git clone ${verbose} "${@}" --mirror "'${repo}'" "'${basename}'"

As I already said in the previous review [0], you forgot the git clone
just a few lines above, where we try with --depth 1.

[0] http://lists.busybox.net/pipermail/buildroot/2016-July/167691.html

Otherwise, looks good.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

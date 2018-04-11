From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Apr 2018 19:15:57 +0200
Subject: [Buildroot] [PATCH] support/download/dl-wrapper: fix passing
 remaining options to helper scripts
In-Reply-To: <20180411073121.4621-1-thomas.petazzoni@bootlin.com>
References: <20180411073121.4621-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180411171557.GA2328@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-04-11 09:31 +0200, Thomas Petazzoni spake thusly:
> When calling the backend-specific helper scripts, the remaining
> options are in ${@}. However, in order to let the helper script know
> that those remaining options should not be parsed, but instead passed
> as-is to the download tool, they must be separated from the main
> options by "--".
> 
> Without this, packages that use <pkg>_DL_OPTS, such as the
> amd-catalyst package, cannot download their tarball anymore.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/de818f6e4c8e63d5e8a49c445d10c34eccc40410/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
> Note: please review carefully. I am not sure this is the right
> fix. Looking at the history of dl-wrapper, I don't see where this --
> was passed before the recent rework, so I'm not sure my solution is
> correct.

That's because we did not separate the basic option from the extra
options.

That's because we relied on getopts to stop on the first non-option
argument, and that's how we called our wget wrapper (basically):

    support/downlaod/wget ${TMP_OUT_FILE} ${URL} ${EXTRA_OPTS}

So, getopts in the wget backend would stop on ${TMP_OUT_FILE} arg,
then shift 2, then pass the remaining args to the real wget tool.

But now, we pass every thing via option to the backen, like -u ${URL}
etc... so we now need to pass '--' to separate our internal backend
options from the real tools' extra options.

Regards,
Yann E. MORIN.

> ---
>  support/download/dl-wrapper | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index 38430738eb..3d2118a4ef 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -129,7 +129,7 @@ main() {
>                  -f "${filename}" \
>                  -u "${uri}" \
>                  -o "${tmpf}" \
> -                ${quiet} ${recurse} "${@}"
> +                ${quiet} ${recurse} -- "${@}"
>          then
>              # cd back to keep path coherence
>              cd "${OLDPWD}"
> -- 
> 2.14.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: yann.morin.1998 at free.fr <yann.morin.1998@free.fr>
Date: Wed, 23 Nov 2016 09:24:15 +0100 (CET)
Subject: [Buildroot] [PATCH] pseudo-wrapper: fix console issue
In-Reply-To: <20161123053220.1845-1-gael.portay@savoirfairelinux.com>
Message-ID: <742299100.47508539.1479889455513.JavaMail.root@zimbra96-e16.priv.proxad.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ga?l, All,

Ga?l PORTAY wrote:
> Pseudo consists in:
> * a client (cli),
> * a server (daemon) and
> * a database managed by this daemon
>   which make a relation between inode, filename, type/mode...
[--SNIP--]
> To solve this issue, this patch make the wrapper controls the life of
> the daemon. It spawns the server before running the script inside the
> pseudo context ; and kills it after the script has ended to make sure
> the server is terminated before the wrapper exits.

Almost there! but see a comment, below...

> CC: Arnout Vandecappelle <arnout@mind.be>
> CC: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
> CC: J?r?me Pouiller <jezz@sysmic.org>
> CC: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> CC: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  package/pseudo/pseudo-wrapper | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pseudo/pseudo-wrapper b/package/pseudo/pseudo-wrapper
> index 558f3ea..c6d0d10 100644
> --- a/package/pseudo/pseudo-wrapper
> +++ b/package/pseudo/pseudo-wrapper
> @@ -18,4 +18,16 @@ if [ -n "${BASE_DIR}" ]; then
>      export PSEUDO_LOCALSTATEDIR="${BASE_DIR}/build/.pseudodb"
>  fi
>  
> -exec "${0%/*}/pseudo" "${@}"
> +# spawns server manually...
> +"${0%/*}/pseudo" -f &
> +pid="$!"
> +
> +# ... run script/command...
> +"${0%/*}/pseudo" "${@}"
> +
> +# ... terminates server...
> +kill -s TERM "$pid"
> +# ... and waits for its completion to make sure database is synced before
> +# returning.
> +wait "$pid"
> +exit 0

We want the wrapper to fail if the command failed., so:

    # ... run script/command...
    "${0%/*}/pseudo" "${@}"
    ret=$?

    # ... terminates server...
    kill -s TERM "$pid"
    wait "$pid"

    exit ${ret}

Regards,
Yann E. MORIN.

> -- 
> 2.10.2

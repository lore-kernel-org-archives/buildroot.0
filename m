From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Jan 2015 17:24:55 +0100
Subject: [Buildroot] [PATCH v7 2/4] pkg-download: silence check-hash if
 it is a silent build
In-Reply-To: <1419947920-22047-3-git-send-email-fabio.porcedda@gmail.com>
References: <1419947920-22047-1-git-send-email-fabio.porcedda@gmail.com>
 <1419947920-22047-3-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150101162455.GC4360@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2014-12-30 14:58 +0100, Fabio Porcedda spake thusly:
> If it is a silent build (make -s -> QUIET=-q) silence the "check-hash"
> script.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Even though I acked it earlier, I missed something...
Sorry... :-(

> diff --git a/support/download/check-hash b/support/download/check-hash
> index b59fd2a..82f2e65 100755
> --- a/support/download/check-hash
> +++ b/support/download/check-hash
> @@ -10,6 +13,19 @@ set -e
>  #       saved as, to be able to match it to the corresponding hashes
>  #       in the .hash file
>  
> +quiet=
> +while getopts "q" opt; do
> +    case $opt in
> +	q)
> +	    quiet=-q
> +	    ;;
> +	\?)
> +	    exit 1
> +	    ;;
> +    esac

This script does not use TABs, so do not introduce any.

> +done
> +shift $((OPTIND-1))
> +
>  h_file="${1}"
>  file="${2}"
>  base="${3}"
> @@ -43,7 +59,9 @@ check_one_hash() {
>      # Do the hashes match?
>      _hash=$( ${_h}sum "${_file}" |cut -d ' ' -f 1 )
>      if [ "${_hash}" = "${_known}" ]; then
> -        printf "%s: OK (%s: %s)\n" "${base}" "${_h}" "${_hash}"
> +	if [ -z "${quiet}" ]; then
> +            printf "%s: OK (%s: %s)\n" "${base}" "${_h}" "${_hash}"
> +	fi

Ditto, do not introduce TABs.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

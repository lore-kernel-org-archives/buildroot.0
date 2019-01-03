From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Jan 2019 21:55:18 +0100
Subject: [Buildroot] [PATCH 01/11] support/download: fix scp downloads
In-Reply-To: <20190103204026.23512-2-patrickdepinguin@gmail.com>
References: <20190103204026.23512-1-patrickdepinguin@gmail.com>
 <20190103204026.23512-2-patrickdepinguin@gmail.com>
Message-ID: <20190103205518.GB5991@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-01-03 21:40 +0100, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> scp download is broken, because scp is called without filename argument and
> only the server is specified. The call is:
>     scp <server> <outputfile>
> 
> but should be:
>     scp <server>/<filename> <outputfile>
> 
> Instead of assuming '-u' lists a full URL including filename (which it is
> not), align with the wget helper where -u is the server URL and -f gives the
> filename.
> 
> With this commit, an scp download can work if FOO_SITE_METHOD is explicitly
> set to 'scp' and the server does not have a scheme prefix 'scp://'.
> The next commit will handle the case where a scheme prefix is present.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  support/download/scp | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/support/download/scp b/support/download/scp
> index 8ecf2f4b22..746c3c6ba0 100755
> --- a/support/download/scp
> +++ b/support/download/scp
> @@ -8,7 +8,8 @@ set -e
>  # Options:
>  #   -q          Be quiet.
>  #   -o FILE     Copy to local file FILE.
> -#   -u FILE     Copy from remote file FILE.
> +#   -f FILE     Copy from remote file FILE.
> +#   -u URL      Download file at URL.

This is not an URL, but an URI, and even then, this is only the
authority part [0] of the URI. ;-) But, Oh well... I'm bikeshedding
here, so:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

[0] https://en.wikipedia.org/wiki/Uniform_Resource_Identifier#Generic_syntax

Regards,
Yann E. MORIN.

>  #
>  # Environment:
>  #   SCP       : the scp command to call
> @@ -18,6 +19,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
>      case "${OPT}" in
>      q)  verbose=-q;;
>      o)  output="${OPTARG}";;
> +    f)  filename="${OPTARG}";;
>      u)  uri="${OPTARG}";;
>      :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
>      \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
> @@ -32,4 +34,4 @@ _scp() {
>      eval ${SCP} "${@}"
>  }
>  
> -_scp ${verbose} "${@}" "'${uri}'" "'${output}'"
> +_scp ${verbose} "${@}" "'${uri}/${filename}'" "'${output}'"
> -- 
> 2.18.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

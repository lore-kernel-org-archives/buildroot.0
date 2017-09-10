From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Sep 2017 11:29:55 +0200
Subject: [Buildroot] [PATCH] support/download: print dl hash if not
	provided
In-Reply-To: <20170720031836.977-1-gael.portay@savoirfairelinux.com>
References: <20170720031836.977-1-gael.portay@savoirfairelinux.com>
Message-ID: <20170910092955.GD3536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ga?l, All,

On 2017-07-19 23:18 -0400, Ga?l PORTAY spake thusly:
> When a hash file exists but the hash is not provided, the script exits
> without any information about the hash of the downloaded file.
> 
>         ERROR: No hash found for rpi-userland-771a9aa7155442615bbe4cd6cf87b29b90cd228a.tar.gz
> 
> Now, the script hashes the downloaded file and suggests its sha256 to
> the user.
> 
> 	$ make
> 	...
> 	>>> rpi-userland 771a9aa7155442615bbe4cd6cf87b29b90cd228a Downloading
> 	--2017-07-19 21:38:39--  https://github.com/raspberrypi/userland/archive/771a9aa7155442615bbe4cd6cf87b29b90cd228a/rpi-userland-771a9aa7155442615bbe4cd6cf87b29b90cd228a.tar.gz
> 	...
> 	ERROR: No hash found for rpi-userland-771a9aa7155442615bbe4cd6cf87b29b90cd228a.tar.gz
> 	ERROR: If the source is trusted, consider adding these lines to package/rpi-userland//rpi-userland.hash
> 	# Locally calculated from download
> 	sha256 771fb1be53414b00a9213f24bd9c88059cf76b72c5e21ac613b267d3e58d3715 rpi-userland-771a9aa7155442615bbe4cd6cf87b29b90cd228a.tar.gz
> 	...
> 
> It also fixes check_one_hash description. check_one_hash() takes three
> arguments:
>  - algo hash
>  - known hash
>  - file to hash
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

NAK from me.

The reason we do not want this is that we instead want the user to go
fetch the hash(es) as provided by upstream, like in an announcement
email, or in an on-the-side hash file.

Having the download infra print the locally computed hash defeats the
very purpose of hashes: check that we get what upstream provides.

We only accept local calculations of hashes for the cases where upstream
does not provide any (or too weak) hash.

As an aside, this patch does two things: fix the comment for
check_one_hash() and print the hash. It should be split.

Regards,
Yann E. MORIN.

> ---
>  support/download/check-hash | 29 +++++++++++++++++++++++------
>  1 file changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/support/download/check-hash b/support/download/check-hash
> index c1ff53c02..b18447f86 100755
> --- a/support/download/check-hash
> +++ b/support/download/check-hash
> @@ -41,13 +41,12 @@ if [ ! -f "${h_file}" ]; then
>      exit 0
>  fi
>  
> -# Check one hash for a file
> -# $1: known hash
> +# Compute hash for a file
> +# $1: algo hash
>  # $2: file (full path)
> -check_one_hash() {
> +compute_hash() {
>      _h="${1}"
> -    _known="${2}"
> -    _file="${3}"
> +    _file="${2}"
>  
>      # Note: md5 is supported, but undocumented on purpose.
>      # Note: sha3 is not supported, since there is currently no implementation
> @@ -66,8 +65,20 @@ check_one_hash() {
>              ;;
>      esac
>  
> +    ${_h}sum "${_file}" |cut -d ' ' -f 1
> +}
> +
> +# Check one hash for a file
> +# $1: algo hash
> +# $2: known hash
> +# $3: file (full path)
> +check_one_hash() {
> +    _h="${1}"
> +    _known="${2}"
> +    _file="${3}"
> +
>      # Do the hashes match?
> -    _hash=$( ${_h}sum "${_file}" |cut -d ' ' -f 1 )
> +    _hash=$( compute_hash "${_h}" "${_file}" )
>      if [ "${_hash}" = "${_known}" ]; then
>          printf "%s: OK (%s: %s)\n" "${base}" "${_h}" "${_hash}"
>          return 0
> @@ -105,6 +116,12 @@ if [ ${nb_checks} -eq 0 ]; then
>          exit 0
>          ;;
>      esac
> +
> +    h="sha256"
> +    hash=$( compute_hash "${h}" "${file}" )
>      printf "ERROR: No hash found for %s\n" "${base}" >&2
> +    printf "ERROR: If the source is trusted, consider adding these lines to ${h_file}\n" >&2
> +    printf "# Locally calculated from download\n" >&2
> +    printf "${h} ${hash} ${base}\n" >&2
>      exit 3
>  fi
> -- 
> 2.13.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

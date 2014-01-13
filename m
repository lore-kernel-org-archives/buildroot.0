From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Jan 2014 06:53:30 +0200
Subject: [Buildroot] [PATCH 5/6] pkg-infra: add possiblity to check
 downloaded files against known hashes
In-Reply-To: <dc5d6ba62805a74ef57fc2c779e97a00056cbfa6.1389569992.git.yann.morin.1998@free.fr>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
 <dc5d6ba62805a74ef57fc2c779e97a00056cbfa6.1389569992.git.yann.morin.1998@free.fr>
Message-ID: <20140113045330.GF4944@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, Jan 13, 2014 at 12:44:48AM +0100, Yann E. MORIN wrote:

[...]

> diff --git a/support/download/check-hash b/support/download/check-hash
> new file mode 100755
> index 0000000..5cf708f
> --- /dev/null
> +++ b/support/download/check-hash
> @@ -0,0 +1,38 @@
> +#!/bin/sh
> +set -e
> +
> +# Helper to check a file matches its known hash
> +# Call it with:
> +#   $1: the basename of the package's tarball
> +#   $2: the full path to the file to check
> +#   $3: the path of the file containing all the the expected hashes
> +
> +tarball="${1}"
> +file="${2}"
> +h_file="${3}"
> +
> +# Does the hash-file exist?
> +if [ ! -f "${h_file}" ]; then
> +    exit 0
> +fi
> +
> +# Do we know a hash for that tarball?
> +known=$( grep -E '^[[:xdigit:]]+[[:space:]]{2}'"${tarball}"'$$' "${h_file}" \
> +         |cut -d ' ' -f 1
> +       )
> +if [ -z "${known}" ]; then
> +    exit 0
> +fi
> +
> +# Do the hashes match?
> +hash=$( sha1sum "${file}" |cut -d ' ' -f 1 )
> +if [ "${hash}" = "${known}" ]; then
> +    exit 0
> +fi
> +
> +printf "ERROR: %s has wrong SHA256\n" "${tarball}"

That's SHA1.

> +printf "ERROR: expected: %s\n" "${known}"
> +printf "ERROR: got     : %s\n" "${hash}"
> +printf "ERROR: Incomplete download, or MITM attack\n"
> +
> +exit 1

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

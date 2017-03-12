From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Mar 2017 19:05:08 +0100
Subject: [Buildroot] [PATCH v2 2/2] Makefile: add check of binaries
	architecture
In-Reply-To: <1489340983-11806-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1489340983-11806-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1489340983-11806-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170312180508.GE3739@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-03-12 18:49 +0100, Thomas Petazzoni spake thusly:
> As shown recently by the firejail example, it is easy to miss that a
> package builds and installs binaries without actually cross-compiling
> them: they are built for the host architecture instead of the target
> architecture.
> 
> This commit adds a small helper script, check-bin-arch, called from
> the main Makefile as a TARGET_FINALIZE_HOOKS, to verify that all ELF
> binaries have been built for the correct CPU architecture.

I'd add the following:

    Two locations are excluded: /lib/firmware and /usr/lib/firmware, as
    they could contain firmware files in ELF format, for external
    processors.

[--SNIP--]
> diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
> new file mode 100755
> index 0000000..cb29ded
> --- /dev/null
> +++ b/support/scripts/check-bin-arch
> @@ -0,0 +1,33 @@
> +#!/bin/bash
> +
> +# This script looks at all files in the target filesystem, and for
> +# those that are ELF files, verifies that they have been built for the
> +# correct architecture.
> +
> +TARGET_DIR=$1
> +TARGET_CROSS=$2
> +READELF_ARCH_NAME=$3
> +
> +exitcode=0
> +
> +# In order to avoid matching firmware files that could have the ELF
> +# format, but for other architectures, we only look in bin, lib, sbin,
> +# usr/bin, usr/lib and usr/sbin

Here I'd cd into TARGET_DIR first (see [0] below for the reason):

    cd "${TARGET_DIR}"
    for f in $(find ./{usr/,}{bin,lib,sbin} -type f) ; do

> +for f in $(find ${TARGET_DIR}/{usr/,}{bin,lib,sbin} -type f) ; do
> +    # Skip non-ELF files
> +    if ! file -b ${f} | grep -q "ELF " ; then
> +	continue

You have a mix of space-and-tab indetation. Please use only one or
the other (I favour spaces, but I'm happy with tabs as long as it is
consistent).

> +    fi
> +
> +    # Get architecture using readelf
> +    farchname=$(${TARGET_CROSS}readelf -h ${f} | \
> +		       grep '^  Machine:' | \
> +		       sed 's/^  Machine: *\(.*\)/\1/')
> +
> +    if test "${farchname}" != "${READELF_ARCH_NAME}" ; then

[0] because we could then point to the offending package:

        pkg="$( sed -r -e "\:^([^,]+),${f}$:!d; s//\1/;" "${BUILD_DIR}/packages-file-list.txt" )"

Of course, do not forget to pass BUILD_DIR when calling the script. ;-)

> +	echo "ERROR: ${f} architecture is '${farchname}', should be '${READELF_ARCH_NAME}'"

    printf 'ERROR: %s (from %s) architecture is %s, should be %s\n' \
        "${f}" "${pkg}" "${farchname}" "${READELF_ARCH_NAME}"

Regards,
Yann E. MORIN.

> +	exitcode=1
> +    fi
> +done
> +
> +exit ${exitcode}
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

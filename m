From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 Jul 2017 12:36:19 +0200
Subject: [Buildroot] [RFC PATCH v5 03/11] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <1498811828-6893-4-git-send-email-wg@grandegger.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-4-git-send-email-wg@grandegger.com>
Message-ID: <e2a39afc-2f57-ce78-2a1c-9bf97fa679ae@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Wolfgang,

 First of all, let me commend you on the large number of comments and the
general clarity of this script.

On 30-06-17 10:37, Wolfgang Grandegger wrote:
> From: Samuel Martin <s.martin49@gmail.com>
> 
> The script "fix-rpath" can scan a list of files provided via
> command line argument, identify ELF files, check their RPATH and
> fix it in a proper way. The RPATH fixup is done by the patchelf
> utility using the option "--make-rpath-relative <root-directory>".
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---
>  support/scripts/fix-rpath | 100 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100755 support/scripts/fix-rpath
> 
> diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
> new file mode 100755
> index 0000000..405108d
> --- /dev/null
> +++ b/support/scripts/fix-rpath
> @@ -0,0 +1,100 @@
> +#!/usr/bin/env bash
> +
> +# Copyright (C) 2016 Samuel Martin <s.martin49@gmail.com>

 Almost nothing is left of the original version by Samuel, so I think you can
safely add your own name to the Copyright statement :-)

> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> +# General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program; if not, write to the Free Software
> +# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
> +
> +usage() {
> +  cat <<EOF >&2
> +Usage:	${0} TREE_KIND FILES_LIST_BEFORE FILELIST_AFTER_AFTER

 There is only one file list now.

> +
> +Description:
> +
> +    This script scans a tree and sanitize ELF files' RPATH found in there.

 It doesn't scan the tree anymore.

> +
> +    Sanitization behaves the same whatever the kind of the processed tree,
> +    but the resulting RPATH differs. The rpath sanitization is done using
> +    "patchelf --make-rpath-relazive".

 relazive? :-)

> +
> +Arguments:
> +
> +    TREE_KIND	Kind of tree to be processed.
> +		Allowed values: host, target, staging
> +
> +    FILELIST    File with the list of files installed by the package
> +
> +
> +Environment:
> +
> +    PATCHELF	patchelf program to use
> +		(default: HOST_DIR/usr/bin/patchelf)
> +EOF
> +}
> +
> +: ${PATCHELF:=${HOST_DIR}/usr/bin/patchelf}
> +
> +main() {
> +    local rootdir
> +    local tree="${1}"
> +    local filelist="${2}"
> +    local sanitize_extra_args=( )
> +
> +    case "${tree}" in
> +	host)
> +	    rootdir="${HOST_DIR}"
> +	    sanitize_extra_args+=( "--relative-to-file" )
> +	    ;;
> +
> +	staging)
> +	    rootdir="${STAGING_DIR}"
> +	    sanitize_extra_args+=( "--no-standard-lib-dirs" "--relative-to-file" )

 I don't think this is the right thing to do. As I wrote before, the files in
staging_dir should never ever be executed, and they are not copied to the
target. So instead, we should just --remove-rpath.

> +	    ;;
> +
> +	target)
> +	    rootdir="${TARGET_DIR}"
> +	    sanitize_extra_args+=( "--no-standard-lib-dirs" )

 Since this is the only variation between the three, I think it would be easier
to handle that from the caller. So

${0} ROOT_DIR FILES_LIST PATCHELF_ARGS...

> +	    ;;
> +
> +	*)
> +	    usage
> +	    exit 1
> +	    ;;
> +    esac
> +
> +    while read -r file ; do
> +	# check if it's an ELF file
> +	path=${rootdir}/${file}
> +	if ${PATCHELF} --print-rpath "${path}" > /dev/null 2>&1; then
> +	    # Work around file busy issue with patchelf binary
> +	    if [ "${PATCHELF}" == "${path}" ]; then
> +		cp "${PATCHELF}" "${PATCHELF}.__patched__"
> +		${PATCHELF} --debug --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${PATCHELF}.__patched__"

 Do we want to keep the --debug?

> +		mv "${PATCHELF}.__patched__" "${PATCHELF}"
> +	    else
> +		# make files writable if necessary
> +		changed=$(chmod -c u+w "${path}")

 Good call on that one!

 Regards,
 Arnout

> +		# call patchelf to sanitize the rpath
> +		${PATCHELF} --debug --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${path}"
> +		# restore the original permission
> +		test "${changed}" != "" && chmod u-w "${path}"
> +	    fi
> +	fi
> +    done < ${filelist}
> +
> +    # ignore errors
> +    return 0
> +}
> +
> +main ${@}
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

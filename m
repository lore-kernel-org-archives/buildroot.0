From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jul 2017 14:15:18 +0200
Subject: [Buildroot] [PATCH v4 03/11] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <1498559207-8050-4-git-send-email-wg@grandegger.com>
References: <1498559207-8050-1-git-send-email-wg@grandegger.com>
 <1498559207-8050-4-git-send-email-wg@grandegger.com>
Message-ID: <8aa491de-1a71-0a8e-3274-4512ec22f763@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Since you're going to revert to this v4, I'm going to add a few comments here.

On 27-06-17 12:26, Wolfgang Grandegger wrote:
> From: Samuel Martin <s.martin49@gmail.com>
> 
> This commit introduces the script "fix-rpath" able to scan a tree,
> detect ELF files, check their RPATH and fix it in a proper way.
> The RPATH fixup is done by the patchelf utility using the option
> "--make-rpath-relative <root-directory>".
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---
>  support/scripts/fix-rpath | 112 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100755 support/scripts/fix-rpath
> 
> diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
> new file mode 100755
> index 0000000..5d40657
> --- /dev/null
> +++ b/support/scripts/fix-rpath
> @@ -0,0 +1,112 @@
> +#!/usr/bin/env bash
> +
> +# Copyright (C) 2016 Samuel Martin <s.martin49@gmail.com>
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
> +Usage:	${0} TREE_KIND
> +
> +Description:
> +
> +    This script scans a tree and sanitize ELF files' RPATH found in there.
> +
> +    Sanitization behaves the same whatever the kind of the processed tree,
> +    but the resulting RPATH differs. The rpath sanitization is done using
> +    "patchelf --make-rpath-relazive".
                                  ^t
> +
> +Arguments:
> +
> +    TREE_KIND	Kind of tree to be processed.
> +		Allowed values: host, target, staging
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
> +    local find_args=( )
> +    local sanitize_extra_args=( )
> +
> +    case "${tree}" in
> +	host)

 Since now you need all this find stuff, my earlier suggestion to not pass the
tree as an argument is no longer valid.

> +	    rootdir="${HOST_DIR}"
> +
> +	    # do not process the sysroot (only contains target binaries)
> +	    find_args+=( "-path" "${STAGING_DIR}" "-prune" "-o" )
> +
> +	    # do not process the external toolchain installation directory to
> +	    # avoid breaking it.
> +	    test "${TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR}" != "" && \
> +		find_args+=( "-path" "${TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR}" "-prune" "-o" )
> +
> +	    # ELF files should not be in these sub-directories
> +	    find_args+=( "-path" "${STAGING_DIR}/usr/share/terminfo" "-prune" "-o" )

 I don't understand how this can be needed, since STAGING_DIR is already pruned
above.

> +
> +	    # do not process the patchelf binary but a copy to work-around "file in use"
> +	    find_args+=( "-path" "${PATCHELF}" "-prune" "-o" )
> +	    cp "${PATCHELF}" "${PATCHELF}.__to_be_patched"
> +
> +	    sanitize_extra_args+=( "--relative-to-file" )
> +	    ;;
> +
> +	staging)
> +	    rootdir="${STAGING_DIR}"
> +	    # supress include files
> +	    find_args+=( "-path" "${STAGING_DIR}/usr/include" "-prune" "-o" )

 Perhaps it's better to define a variable with all the paths we want to exclude
- we may want to add more. OTOH, we can do that whenever we indeed do add more.

> +	    sanitize_extra_args+=( "--no-standard-lib-dirs" "--relative-to-file" )
> +	    ;;
> +
> +	target)
> +	    rootdir="${TARGET_DIR}"
> +	    sanitize_extra_args+=( "--no-standard-lib-dirs" )
> +	    ;;
> +
> +	*)
> +	    usage
> +	    exit 1
> +	    ;;
> +    esac
> +
> +    find_args+=( "-type" "f" "-print" )
> +
> +    while read file ; do
> +	# check if it's an ELF file
> +	if ${PATCHELF} --print-rpath "${file}" > /dev/null 2>&1; then

 Wasn't "readelf -d ${file} | grep DT_RUNPATH" faster? You did some experiments
a while ago but I forgot what the conclusions were.


 Regards,
 Arnout


> +	    # make files writable if necessary
> +	    changed=$(chmod -c u+w "${file}")
> +	    # call patchelf to sanitize the rpath
> +	    ${PATCHELF} --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${file}"
> +	    # restore the original permission
> +	    test "${changed}" != "" && chmod u-w "${file}"
> +	fi
> +    done < <(find "${rootdir}" ${find_args[@]})
> +
> +    # Restore patched patchelf utility
> +    test "${tree}" = "host" && mv "${PATCHELF}.__to_be_patched" "${PATCHELF}"
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

From: Wolfgang Grandegger <wg@grandegger.com>
Date: Sat, 4 Mar 2017 16:29:03 +0100
Subject: [Buildroot] [RFC PATCH 2/9] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <d27f25a7-8a02-1da3-d9c6-8935ad01ad21@mind.be>
References: <1488550733-3956-1-git-send-email-wg@grandegger.com>
 <1488550733-3956-3-git-send-email-wg@grandegger.com>
 <d27f25a7-8a02-1da3-d9c6-8935ad01ad21@mind.be>
Message-ID: <369a0cbc-0837-fe1a-c94f-bd1d6fe19883@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Am 04.03.2017 um 12:39 schrieb Arnout Vandecappelle:
>  Hi Wolfgang,
>
>  I realize that this patch is going to be dropped because it is going to be done
> directly from the makefiles, but I have some hopefully useful comments still.

If the logic is not too complex.

>
>  First of all: make sure the original author is explicitly in Cc. git send-email
> normally does that automatically so I'm surprised Samuel isn't there.

I think the mailing-list is stripping the CC. On the mail I got, Samuel 
is on CC. I did use "git send-email" with an "-cc" to Samuel.

> On 03-03-17 15:18, Wolfgang Grandegger wrote:
>> From: Samuel Martin <s.martin49@gmail.com>
>>
>> This commit introduces a fix-rpath script able to scan a tree,
>> detect ELF files, check their RPATH and fix it in a proper way.
>> The RPATH fixup is done by the patchelf utility using the option
>> "--make-rpath-relative".
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>> ---
>>  support/scripts/fix-rpath | 106 ++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 106 insertions(+)
>>  create mode 100755 support/scripts/fix-rpath
>>
>> diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
>> new file mode 100755
>> index 0000000..bde2c17
>> --- /dev/null
>> +++ b/support/scripts/fix-rpath
>> @@ -0,0 +1,106 @@
>> +#!/usr/bin/env bash
>> +
>> +# Copyright (C) 2016 Samuel Martin <s.martin49@gmail.com>
>> +#
>> +# This program is free software; you can redistribute it and/or modify
>> +# it under the terms of the GNU General Public License as published by
>> +# the Free Software Foundation; either version 2 of the License, or
>> +# (at your option) any later version.
>> +#
>> +# This program is distributed in the hope that it will be useful,
>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
>> +# General Public License for more details.
>> +#
>> +# You should have received a copy of the GNU General Public License
>> +# along with this program; if not, write to the Free Software
>> +# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
>> +
>> +#set -e
>> +#set -v
>
>  Don't include debugging cruft in the final patch.

I agree!

>> +
>> +usage() {
>> +  cat <<EOF >&2
>> +Usage:  ${0} TREE_KIND TREE_ROOT
>> +
>> +Description:
>> +
>> +        This script scans a tree and sanitize ELF files' RPATH found in there.
>> +
>> +        Sanitization behaves the same whatever the kindd of the processed tree, but
>> +        the resulting RPATH differs.
>> +
>> +        Sanitization action:
>> +        - remove RPATH pointing outside of the tree
>> +        - for RPATH pointing in the tree:
>> +          - if they point to standard location (/lib, /usr/lib): remove them
>> +          - otherwise: make them relative using \$ORIGIN
>> +
>> +        For the target tree:
>> +        - scan the whole tree for sanitization
>> +
>> +        For the staging tree :
>> +        - scan the whole tree for sanitization
>> +
>> +        For the host tree:
>> +        - skip the staging tree for sanitization
>> +        - add \$HOST_DIR/{lib,usr/lib} to RPATH (as relative pathes)
>> +
>> +Arguments:
>> +
>> +        TREE_KIND   Kind of tree to be processed.
>> +                    Allowed values: host, target, staging
>> +
>> +        TREE_ROOT   Path to the root of the tree to be scaned
>> +
>> +Environment:
>> +
>> +        PATCHELF        patchelf program to use
>> +                        (default: patchelf)
>> +EOF
>> +}
>> +
>> +: ${PATCHELF:=patchelf}
>> +
>> +main() {
>> +    local tree="${1}"
>> +    local basedir="$(readlink -f "${2}")"
>> +
>> +    local find_args=( "${basedir}" )
>> +    local sanitize_extra_args=( )
>> +
>> +    case "${tree}" in
>> +        host)
>> +            # do not process the sysroot (only contains target binaries)
>> +            find_args+=( "-name" "sysroot" "-prune" "-o" )
>
>  I believe we should specify a full path here. If there is any other directory
> in the tree that happens to be called 'sysroot' for whatever reason, it
> shouldn't be pruned. When this is done directly from make, it's pretty easy:
> -path $(STAGING_DIR) -prune

OK.

>
>> +
>> +            # do not process the external toolchain installation directory to
>> +            # to avoid breaking it.
>> +            find_args+=( "-path" "*/opt/ext-toolchain" "-prune" "-o" )
>
>  Same here: $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR) which has the full path.

OK.

>
>  Regards,
>  Arnout
>
>> +
>> +            ;;
>> +        staging|target)
>> +            # discard ${hostdir}/lib and ${hostdir}/usr/lib
>> +            sanitize_extra_args+=( "--no-standard-lib-dirs" )
>> +
>> +            ;;
>> +        *)
>> +            usage
>> +            exit 1
>> +            ;;
>> +    esac
>> +
>> +    find_args+=( "-type" "f" "-print" )
>> +
>> +    while read file ; do
>> +        # some files are not writable
>> +        chmod u+w $file

This is just a hack because some elf files are not writable. To make all 
regular file writable is wrong. We may also want to reset the original 
permission. It needs more logic, unfortunately.

>> +        # call patchelf for each regular file; error will silently be ignored.
>> +        ${PATCHELF} --debug --make-rpath-relative "${basedir}" ${sanitize_extra_args[@]} "${file}" >> /dev/null 2>&1
>> +    done < <(find ${find_args[@]})
>> +
>> +    # ignore errors

Simply ignoring errors here is fast, but it also does not allow to print 
warnings.

Wolfgang.

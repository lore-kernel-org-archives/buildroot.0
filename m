From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Jul 2017 01:02:57 +0200
Subject: [Buildroot] [PATCH v7 2/9] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <1499273594-12106-3-git-send-email-wg@grandegger.com>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
 <1499273594-12106-3-git-send-email-wg@grandegger.com>
Message-ID: <b381421f-9595-ad2d-defb-f94b7d325c09@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-07-17 18:53, Wolfgang Grandegger wrote:
> From: Samuel Martin <s.martin49@gmail.com>
> 
> This commit introduces the script "fix-rpath" able to scan a tree,
> detect ELF files, check their RPATH and fix it in a proper way.
> The RPATH fixup is done by the patchelf utility using the option
> "--make-rpath-relative <root-directory>".
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>

 Some small comments below, but again, can be fixed in follow-up patches, so

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]
> +Description:
> +
> +    This script scans a tree and sanitize ELF files' RPATH found in there.
                                            ^s
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
> +		(default: HOST_DIR/bin/patchelf)

 And also HOST_DIR, TARGET_DIR, STAGING_DIR, and
TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR.

[snip]
> +    case "${tree}" in
> +	host)
> +	    rootdir="${HOST_DIR}"
> +
> +	    # do not process the sysroot (only contains target binaries)
> +	    find_args+=( "-path" "${STAGING_DIR}" "-prune" "-o" )
> +
> +	    # do not process the external toolchain installation directory to
> +	    # avoid breaking it.
> +	    test "${TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR}" != "" && \
> +		find_args+=( "-path" "${TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR}" "-prune" "-o" )

 Since this variable isn't exported, it doesn't actually end up being used. But
I think the solution is to pass it explicitly in patch 5.

> +
> +	    for excludepath in ${HOST_EXCLUDEPATHS}; do
> +		find_args+=( "-path" "${HOST_DIR}""${excludepath}" "-prune" "-o" );
> +	    done

 Perhaps this could be refactored into defining here:
	excludepaths="${HOST_EXCLUDEPATHS}"
and moving the loop to the generic part. It would anyway be nicer to have
TARGET_EXCLUDEPATHS, for symmetry.

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
> +
> +	    # ELF files should not be in these sub-directories
> +	    for excludepath in ${STAGING_EXCLUDEPATHS}; do
> +		find_args+=( "-path" "${STAGING_DIR}""${excludepath}" "-prune" "-o" )
> +	    done
> +
> +	    sanitize_extra_args+=( "--no-standard-lib-dirs" "--relative-to-file" )
> +	    ;;
> +
> +	target)
> +	    rootdir="${TARGET_DIR}"
> +	    sanitize_extra_args+=( "--no-standard-lib-dirs" "--relative-to-file" )

 I thought we decided that target and staging should NOT be relative-to-file,
but should be absolute paths without rootdir? Or was this a problem for staging,
because the linker would add the RUNPATH to the library search path and this
would point to the system libs instead of target libs? According to the man page
this should only be the case for a native linker, so not for a cross linker.

 I don't really like having $ORIGIN-based rpaths in target, but it's no big deal.

 Regardless, the reasoning behind the choice we make should be documented here
in comments. So for host, add something to the effect that we always want
$ORIGIN-based rpaths to make it relocatable. For staging, say that we want it to
be the same as target. And for target, explain the choice you made.


> +    while read file ; do
> +	# check if it's an ELF file

 Indentation is inconsistent: sometimes 4 spaces, sometimes 2 spaces (inside the
case, and in the condition below). And here, you're switching from spaces to tabs!

> +	if ${PATCHELF} --print-rpath "${file}" > /dev/null 2>&1; then

 It might be good to check if the file actually has a non-empty rpath. When
processing a second time, most rpaths are empty so they can be skipped.

 Maybe even add another patch to patchelf to exit early and quietly with just 0
or 1 depending on rpath presence.


 Regards,
 Arnout


[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

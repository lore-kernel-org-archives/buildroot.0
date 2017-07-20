From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 20 Jul 2017 09:31:20 +0200
Subject: [Buildroot] [PATCH v7 2/9] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <b381421f-9595-ad2d-defb-f94b7d325c09@mind.be>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
 <1499273594-12106-3-git-send-email-wg@grandegger.com>
 <b381421f-9595-ad2d-defb-f94b7d325c09@mind.be>
Message-ID: <16f616fc-173d-a201-8342-cda48dc102fe@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 20.07.2017 um 01:02 schrieb Arnout Vandecappelle:
> 
> 
> On 05-07-17 18:53, Wolfgang Grandegger wrote:
>> From: Samuel Martin <s.martin49@gmail.com>
>>
>> This commit introduces the script "fix-rpath" able to scan a tree,
>> detect ELF files, check their RPATH and fix it in a proper way.
>> The RPATH fixup is done by the patchelf utility using the option
>> "--make-rpath-relative <root-directory>".
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> 
>   Some small comments below, but again, can be fixed in follow-up patches, so
> 
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> [snip]
>> +Description:
>> +
>> +    This script scans a tree and sanitize ELF files' RPATH found in there.
>                                              ^s
>> +
>> +    Sanitization behaves the same whatever the kind of the processed tree,
>> +    but the resulting RPATH differs. The rpath sanitization is done using
>> +    "patchelf --make-rpath-relazive".
>                                    ^t
> 
>> +
>> +Arguments:
>> +
>> +    TREE_KIND	Kind of tree to be processed.
>> +		Allowed values: host, target, staging
>> +
>> +Environment:
>> +
>> +    PATCHELF	patchelf program to use
>> +		(default: HOST_DIR/bin/patchelf)
> 
>   And also HOST_DIR, TARGET_DIR, STAGING_DIR, and
> TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR.

PATCHELF points to the patchelf utility! Or what do you mean here?

> 
> [snip]
>> +    case "${tree}" in
>> +	host)
>> +	    rootdir="${HOST_DIR}"
>> +
>> +	    # do not process the sysroot (only contains target binaries)
>> +	    find_args+=( "-path" "${STAGING_DIR}" "-prune" "-o" )
>> +
>> +	    # do not process the external toolchain installation directory to
>> +	    # avoid breaking it.
>> +	    test "${TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR}" != "" && \
>> +		find_args+=( "-path" "${TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR}" "-prune" "-o" )
> 
>   Since this variable isn't exported, it doesn't actually end up being used. But
> I think the solution is to pass it explicitly in patch 5.
> 
>> +
>> +	    for excludepath in ${HOST_EXCLUDEPATHS}; do
>> +		find_args+=( "-path" "${HOST_DIR}""${excludepath}" "-prune" "-o" );
>> +	    done
> 
>   Perhaps this could be refactored into defining here:
> 	excludepaths="${HOST_EXCLUDEPATHS}"
> and moving the loop to the generic part. It would anyway be nicer to have
> TARGET_EXCLUDEPATHS, for symmetry.

Will improve that later.

> 
>> +
>> +	    # do not process the patchelf binary but a copy to work-around "file in use"
>> +	    find_args+=( "-path" "${PATCHELF}" "-prune" "-o" )
>> +	    cp "${PATCHELF}" "${PATCHELF}.__to_be_patched"
>> +
>> +	    sanitize_extra_args+=( "--relative-to-file" )
>> +	    ;;
>> +
>> +	staging)
>> +	    rootdir="${STAGING_DIR}"
>> +
>> +	    # ELF files should not be in these sub-directories
>> +	    for excludepath in ${STAGING_EXCLUDEPATHS}; do
>> +		find_args+=( "-path" "${STAGING_DIR}""${excludepath}" "-prune" "-o" )
>> +	    done
>> +
>> +	    sanitize_extra_args+=( "--no-standard-lib-dirs" "--relative-to-file" )
>> +	    ;;
>> +
>> +	target)
>> +	    rootdir="${TARGET_DIR}"
>> +	    sanitize_extra_args+=( "--no-standard-lib-dirs" "--relative-to-file" )
> 
>   I thought we decided that target and staging should NOT be relative-to-file,
> but should be absolute paths without rootdir? Or was this a problem for staging,
> because the linker would add the RUNPATH to the library search path and this
> would point to the system libs instead of target libs? According to the man page
> this should only be the case for a native linker, so not for a cross linker.

Grrr, that's wrong, cut an paste error :(. Fixed!

>   I don't really like having $ORIGIN-based rpaths in target, but it's no big deal.
> 
>   Regardless, the reasoning behind the choice we make should be documented here
> in comments. So for host, add something to the effect that we always want
> $ORIGIN-based rpaths to make it relocatable. For staging, say that we want it to
> be the same as target. And for target, explain the choice you made.
> 
> 
>> +    while read file ; do
>> +	# check if it's an ELF file
> 
>   Indentation is inconsistent: sometimes 4 spaces, sometimes 2 spaces (inside the

That's due to 8 spaces replaced by one tab.

> case, and in the condition below). And here, you're switching from spaces to tabs!

I use the default indention from emacs "Shell-script[bash]" which is 
usually not a bad choice. I'm going to replace all tabs with spaces.

>> +	if ${PATCHELF} --print-rpath "${file}" > /dev/null 2>&1; then
> 
>   It might be good to check if the file actually has a non-empty rpath. When
> processing a second time, most rpaths are empty so they can be skipped.

I already tried that. It will make the check slower, meaning it costs 
more that calling patchelf a second time.

>   Maybe even add another patch to patchelf to exit early and quietly with just 0
> or 1 depending on rpath presence.

Optimization of the execution time needs more careful analysis. I have a 
patchelf patch which just open and reads the patchelf header to check 
quickly if it's an ELF file. But that does not help a lot. readelf is 
still faster and I guess that's because it's written in C (and not C++).

Wolfgang.

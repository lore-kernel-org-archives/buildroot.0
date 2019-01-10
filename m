From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Jan 2019 22:14:22 +0100
Subject: [Buildroot] [PATCH next v6 07/10] core: implement per-package
 SDK and target
In-Reply-To: <20181227171759.0118ff77@windsurf>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-8-thomas.petazzoni@bootlin.com>
 <1f520844-5501-a60b-cf66-5bae57b9f420@andin.de>
 <20181205173103.1eb30a7b@windsurf>
 <672791f3-4383-cad2-f31c-5362b94b94fb@andin.de>
 <8a886731-26ee-ba33-f303-81d5bd0e7954@andin.de>
 <20181226183422.76c6ff6c@windsurf.home> <20181227171759.0118ff77@windsurf>
Message-ID: <fb69606e-6f02-5d81-ede1-f40a0debb100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi,

 I realize v7 is already out, but it is probably easier to reply here.


On 27/12/2018 17:17, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 26 Dec 2018 18:34:22 +0100, Thomas Petazzoni wrote:
> 
>> So, without per-package directory, we fall in case (2) above.
>>
>> With per-package directory, we fall in case (4) above, and therefore
>> the RPATH is discarded.
>>
>> At this point, I am not sure at which level and how the issue should be
>> fixed. Needs some thought. Input/ideas welcome.

 Actually, I think we have been conflating the --relative-to-file case with the
--make-rpath-relative case when we developed the patchelf modifications. For the
--relative-to-file case (i.e. for host dirs), we really don't need the rootDir
at all, we can just make all rpaths relative. Or maybe we should still pass the
per-package base directory, just to determine whether it's a system path or not.

 But of course, the staging and target directories have exactly the same
problem. And there, we really do need the correct rootDir, because it is also
prepended to the existing rpath to determine the full path for case (3). So we
still need a solution...



> So for now, the way I fixed this is by rewriting the RPATH in fix-rpath
> so that they don't point to per-package host directories.

 Why did you prefer this over Yann's proposal to do the fix-rpath after each
package installation (and making use of packages-files-list)?

> It is a bit
> annoying that we end up rewriting RPATHs twice, but it is the easiest /
> most straightforward solution to be able to move forward with the whole
> per-package directory stuff.

 To avoid rewriting it twice, we could move the logic into patchelf itself.
I.e., in addition to rootDir (which is the thing that will be used for
prepending), pass a match regex that is used for stripping off a pre-existing
rootDir.

> 
> Here is what I have locally:
> 
> diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
> index fa138ca15a..67bf1eb1b3 100755
> --- a/support/scripts/fix-rpath
> +++ b/support/scripts/fix-rpath
> @@ -127,14 +127,24 @@ main() {
>  
>      while read file ; do
>          # check if it's an ELF file
> -        if ${PATCHELF} --print-rpath "${file}" > /dev/null 2>&1; then
> -            # make files writable if necessary
> -            changed=$(chmod -c u+w "${file}")
> -            # call patchelf to sanitize the rpath
> -            ${PATCHELF} --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${file}"
> -            # restore the original permission
> -            test "${changed}" != "" && chmod u-w "${file}"
> +        rpath=$(${PATCHELF} --print-rpath "${file}" 2>&1)
> +        if test $? -ne 0 ; then
> +            continue
>          fi
> +
> +        # make files writable if necessary
> +        changed=$(chmod -c u+w "${file}")
> +
> +        # rewrite the per-package rpaths
> +        changed_rpath=$(echo ${rpath} | sed "s@${PER_PACKAGE_DIR}/[^/]*/host@${HOST_DIR}@")

 Not just host, also staging and target! Staging is already covered by host
because it's a subdirectory, but target is still needed. That said, it's
unlikely that target ever ends up in one of the rpaths, because we normally only
pass it as the DESTDIR in the installation step. Still, you never know, so I'd
include target for completeness.

 Regards,
 Arnout


> +        if test "${rpath}" != "${changed_rpath}" ; then
> +            ${PATCHELF} --set-rpath ${changed_rpath} "${file}"
> +        fi
> +
> +        # call patchelf to sanitize the rpath
> +        ${PATCHELF} --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${file}"
> +        # restore the original permission
> +        test "${changed}" != "" && chmod u-w "${file}"
>      done < <(find "${rootdir}" ${find_args[@]})
>  
>      # Restore patched patchelf utility
> 
> Best regards,
> 
> Thomas
> 

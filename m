From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 May 2016 22:16:13 +0200
Subject: [Buildroot] [PATCH 07/13 v7] support/apply-patches: bail-out on
 duplicate patch basenames
In-Reply-To: <648b1696ba75005d025780eb2ff64e8b9731a266.1462637351.git.yann.morin.1998@free.fr>
References: <cover.1462637351.git.yann.morin.1998@free.fr>
 <648b1696ba75005d025780eb2ff64e8b9731a266.1462637351.git.yann.morin.1998@free.fr>
Message-ID: <e2fdd776-d144-a0e5-61a6-89c5217e1013@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/07/16 18:14, Yann E. MORIN wrote:
> Patches we save can come from various locations;
>   - bundled with Buildroot
>   - downloaded
>   - from one or more global-patch-dir
>
> It is possible that two patches lying into different locations have the
> same basename, like so (first is bundled, second is from an hypothetical
> global-patch-dir):
>     package/foo/0001-fix-Makefile.patch
>     /path/to/my/patches/foo/0001-fix-Makefile.patch
>
> In that case, when running legal-info, we'd save only the second patch,
> overwriting the first. That would be oproblematic, because:
>
>   - either the second patch depends on the first, and thus would no longer
>     apply (this is easy to detect, though),
>
>   - or the second patch does not dpend on the first, and the compliance
>     delivery will not be complete (this is much arder to detect).
>
> We fix that by checking that no two patches have the same same basename.
> If we find that the basename of the patch to be applied collides with
> that of a previously applied patch, we error out and report the duplicate.
>
> The unfortunate side-effect is that existing setups will now break in
> that situation, but that's a minor, corner-case issue that is easily
> fixed.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout

  PS When I wrote earlier that this patch was "controversial", I actually meant 
"a patch that is not strictly needed to fix the stuff-missing-from-legal-info 
issue, and which could be skipped".

>
> ---
> Changes v6 -> v7:
>   - reword error message
>
> Changes v5 -> v6:
>   - don't renumber, detect collision and error out  (Luca, Arnout,
>     Thomas)
> ---
>  support/scripts/apply-patches.sh | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> index 20a1552..f8b6ca3 100755
> --- a/support/scripts/apply-patches.sh
> +++ b/support/scripts/apply-patches.sh
> @@ -103,6 +103,14 @@ function apply_patch {
>          echo "Error: missing patch file ${path}/$patch"
>          exit 1
>      fi
> +    existing="$( grep -E "/${patch}\$" ${builddir}/.applied_patches_list )"
> +    if [ -n "${existing}" ]; then
> +        echo "Error: duplicate filename '${patch}'"
> +        echo "Conflicting files are:"
> +        echo "  already applied: ${existing}"
> +        echo "  to be applied  : ${path}/${patch}"
> +        exit 1
> +    fi
>      echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
>      ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N $silent
>      if [ $? != 0 ] ; then
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

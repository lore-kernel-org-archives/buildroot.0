From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jun 2016 23:01:57 +0200
Subject: [Buildroot] [PATCH 07/13 v7] support/apply-patches: bail-out on
 duplicate patch basenames
In-Reply-To: <e2fdd776-d144-a0e5-61a6-89c5217e1013@mind.be>
References: <cover.1462637351.git.yann.morin.1998@free.fr>
 <648b1696ba75005d025780eb2ff64e8b9731a266.1462637351.git.yann.morin.1998@free.fr>
 <e2fdd776-d144-a0e5-61a6-89c5217e1013@mind.be>
Message-ID: <20160622210157.GB3691@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-05-07 22:16 +0200, Arnout Vandecappelle spake thusly:
> On 05/07/16 18:14, Yann E. MORIN wrote:
> >Patches we save can come from various locations;
> >  - bundled with Buildroot
> >  - downloaded
> >  - from one or more global-patch-dir
> >
> >It is possible that two patches lying into different locations have the
> >same basename, like so (first is bundled, second is from an hypothetical
> >global-patch-dir):
> >    package/foo/0001-fix-Makefile.patch
> >    /path/to/my/patches/foo/0001-fix-Makefile.patch
> >
> >In that case, when running legal-info, we'd save only the second patch,
> >overwriting the first. That would be oproblematic, because:
> >
> >  - either the second patch depends on the first, and thus would no longer
> >    apply (this is easy to detect, though),
> >
> >  - or the second patch does not dpend on the first, and the compliance
> >    delivery will not be complete (this is much arder to detect).
> >
> >We fix that by checking that no two patches have the same same basename.
> >If we find that the basename of the patch to be applied collides with
> >that of a previously applied patch, we error out and report the duplicate.
> >
> >The unfortunate side-effect is that existing setups will now break in
> >that situation, but that's a minor, corner-case issue that is easily
> >fixed.
> >
> >Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >Cc: Luca Ceresoli <luca@lucaceresoli.net>
> >Cc: Arnout Vandecappelle <arnout@mind.be>
> >Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> 
>  Regards,
>  Arnout
> 
>  PS When I wrote earlier that this patch was "controversial", I actually
> meant "a patch that is not strictly needed to fix the
> stuff-missing-from-legal-info issue, and which could be skipped".

That's not my position: this patch (or the alternate proposal) is
required.

Without it, we could end up saving two patches with the sqame basename,
the second (e.g. from a global patch dir) overwriting the first (e.g. a
bundled patch), thus rendering the legal-info moot.

I thought I had that properly explained in the commit log. Did I miss
something, or was it not clear enough?

Regards,
Yann E. MORIN.

> >---
> >Changes v6 -> v7:
> >  - reword error message
> >
> >Changes v5 -> v6:
> >  - don't renumber, detect collision and error out  (Luca, Arnout,
> >    Thomas)
> >---
> > support/scripts/apply-patches.sh | 8 ++++++++
> > 1 file changed, 8 insertions(+)
> >
> >diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> >index 20a1552..f8b6ca3 100755
> >--- a/support/scripts/apply-patches.sh
> >+++ b/support/scripts/apply-patches.sh
> >@@ -103,6 +103,14 @@ function apply_patch {
> >         echo "Error: missing patch file ${path}/$patch"
> >         exit 1
> >     fi
> >+    existing="$( grep -E "/${patch}\$" ${builddir}/.applied_patches_list )"
> >+    if [ -n "${existing}" ]; then
> >+        echo "Error: duplicate filename '${patch}'"
> >+        echo "Conflicting files are:"
> >+        echo "  already applied: ${existing}"
> >+        echo "  to be applied  : ${path}/${patch}"
> >+        exit 1
> >+    fi
> >     echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
> >     ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N $silent
> >     if [ $? != 0 ] ; then
> >
> 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

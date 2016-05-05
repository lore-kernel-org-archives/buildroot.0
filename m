From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 6 May 2016 00:38:41 +0200
Subject: [Buildroot] [PATCH 01/13 v6] support/scripts: add helper to
 hardlink-or-copy
In-Reply-To: <8e95b534-d9f0-5582-a0a8-495e018d88b8@mind.be>
References: <cover.1461881416.git.yann.morin.1998@free.fr>
 <0b6395f0d572eec63e4f14fd02d094b5b60f3de9.1461881416.git.yann.morin.1998@free.fr>
 <8e95b534-d9f0-5582-a0a8-495e018d88b8@mind.be>
Message-ID: <20160505223841.GE4367@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-05-04 00:53 +0200, Arnout Vandecappelle spake thusly:
> On 04/29/16 00:27, Yann E. MORIN wrote:
> >This helper will try to copy a source file into a destination directory,
> >by first attempting to hard-link, and falling back to a plain copy.
> >
> >In some situations, it will be necessary that the destination file is
> >named differently than the source, so if a third argument is specified,
> >it is treated as the basename of the destination file.
> >
> >Add a make variable to easily call that script.
> >
> >Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >Cc: Luca Ceresoli <luca@lucaceresoli.net>
> 
>  I agree that it's a good idea to move this to a script. I have a few coding
> style issues with it, but it's in things for we don't have a set style
> anyway so my word is not law :-). There is only one thing really wrong...
> 
> >
> >---
> >Changes v5 -> v6:
> >  - rename script  (Thomas, Arnout)
> >  - drop the macro  (Thomas, Arnout)
> >  - drop Luca's reviewed-by and tested-by tags, because the macro
> >    disapeared
> >  - fix redundancy in comments in the script
> >
> >Changes v4 -> v5:
> >  - move the body of the macro to a shell script  (Luca)
> >
> >Changes v3 -> v4:
> >  - forcibly remove destination file first  (Arnout, Luca)
> >  - typoes  (Luca)
> >  - drop trailing slash in destination directory name
> >
> >Changes v2 -> v3;
> >  - use "ln" instead of "cp -l"
> >  - accept third argument, as the basename of the destination file
> >  - drop reviewed-by and tested-by tags given in v2, due to the above
> >    two changes
> >
> >Changes RFC -> v1:
> >  - move to pkg-utils  (Luca)
> >---
> > package/pkg-utils.mk             |  4 ++++
> > support/scripts/hardlink-or-copy | 34 ++++++++++++++++++++++++++++++++++
> > 2 files changed, 38 insertions(+)
> > create mode 100755 support/scripts/hardlink-or-copy
> >
> >diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> >index f88313a..2692576 100644
> >--- a/package/pkg-utils.mk
> >+++ b/package/pkg-utils.mk
> >@@ -113,6 +113,10 @@ $$(error Package error: use $(2) instead of $(1). Please fix your .mk file)
> > endif
> > endef
> >
> >+# hardlink-or-copy -- helper script to first try to hardlink,
> >+# and fallback to copy.
> >+HARDLINK_OR_COPY := support/scripts/hardlink-or-copy
> 
>  = instead of :=
> 
> 
>  However (and here starts the difference of opinion in coding style): why do
> you need to define a variable for this? In general, I'm not a big fan of
> variables that just contain a constant string. For numbers, it makes sense,
> because a number is meaningless by itself. But a string is already something
> that is searchable and identifiable. And in this specific case, the variable
> name is even the same as the value... So what's the point? OK, you save 13
> characters in every place where you use it (that's in only 2 (TWO) places,
> by the way).
> 
>  We do have a few existing cases of such variables, but IMHO they are
> equally useless. And mostly introduced by you, BTW :-)

Well, when the thing s used in multiple places, I find it "better" to
use a variable so as to be able to change all locations at once with a
single edit (even if we don't plan on renaming or moving it).

> > #
> > # legal-info helper functions
> > #
> >diff --git a/support/scripts/hardlink-or-copy b/support/scripts/hardlink-or-copy
> >new file mode 100755
> >index 0000000..b581c51
> >--- /dev/null
> >+++ b/support/scripts/hardlink-or-copy
> >@@ -0,0 +1,34 @@
> >+#!/bin/bash
> >+
> >+# Try to hardlink a file into a directory, fallback to copy on failure.
> >+#
> >+# Hardlink-or-copy the source file in the first argument into the
> >+# destination directory in the second argument, using the basename in
> >+# the third argument as basename for the destination file. If the third
> >+# argument is missing, use the basename of the source file as basename
> >+# for the destination file.
> >+#
> >+# In either case, remove the destination prior to doing the
> >+# hardlink-or-copy.
> >+#
> >+# Note that this is NOT an atomic operation.
> >+
> >+set -e
> >+
> >+main() {
> >+    local src_f="${1}"
> 
>  Personally I prefer my variable names to be more explicit: src_file

OK

> >+    local dst_d="${2}"
> >+    local dst_f="${3}"
> >+
> >+    if [ -n "${dst_f}" ]; then
> >+        dst_f="${dst_d}/${dst_f}"
> >+    else
> >+        dst_f="${dst_d}/$( basename "${src_f}" )"
> 
>  I thought you were more into ${src_f##*/}?

Yes, but when I don't get my two cups of cofee in the morning, I can
write insanities like the above! ;-)

But seriously, it's inherited from the Makefile macro, which sould not
use the shell substituion.

I'll fix. ;-]

> >+    fi
> >+
> >+    mkdir -p "${dst_d}"
> >+    rm -f "${dst_f}"
> >+    ln -f "${src_f}" "${dst_f}" 2>/dev/null || cp -f "${src_f}" "${dst_f}"
> 
>  Since there's an rm just above, is there any point in adding the -f still
> here? Yes, for race conditions, but then the rm wasn't much use to begin
> with.

That's what was diuscussed in the previous reviews. And didn't you
explcitly mentioned we should use an explicit rm -f :

    http://lists.busybox.net/pipermail/buildroot/2016-February/151140.html

;-)

> >+}
> >+
> >+main "${@}"
> 
>  Anothing coding style disagreement. What's the point of putting your
> complete shell script in a function? I don't really have arguments against
> it, but do you have reasons why you think it's better like that?

I am not sure what advantages it has, technically-wise (i.e. I am not
sure it allows things that would not be possible without main).

I've been writing (bash) shell scripts for ages now, and I find it very
cnvenient to use a main():

  - do not use global variables (even though variables are inherited by
    sub-functions): declare all variables used in the function and only
    use that, with explciitly docuemented exceptions;

  - it helps organise the code: it is cleaner in my head;

  - I'm not the only one: https://google.github.io/styleguide/shell.xml

>  Note that currently we have both styles of shell scripts, though the ones
> with a main function are a minority.

... and probably mines. ;-)

Regards,
Yann E. MORIN.

> And none of the python scripts have a
> main.
> 
>  Regards,
>  Arnout
> 
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

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 31 Jan 2016 21:02:27 +0100
Subject: [Buildroot] [PATCH 12/16 v3] core/legal-info: renumber saved
 patches
In-Reply-To: <56AE639F.3080304@lucaceresoli.net>
References: <cover.1454004518.git.yann.morin.1998@free.fr>
 <89835259941b9067e4482d51ab2f45fa5e373262.1454004518.git.yann.morin.1998@free.fr>
 <56AE639F.3080304@lucaceresoli.net>
Message-ID: <20160131200227.GD14626@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2016-01-31 20:42 +0100, Luca Ceresoli spake thusly:
> Yann E. MORIN wrote:
> >Patches we save can come from various locations;
> >   - bundled with Buildroot
> >   - downloaded
> >   - from one or more global-patch-dir
> >
> >It is possible that two patches lying into different locations have the
> >same basename, like so (first is bundled, second is from an hypothetical
> >global-patch-dir):
> >     package/foo/0001-fix-Makefile.patch
> >     /path/to/my/patches/foo/0001-fix-Makefile.patch
> >
> >In that case, we'd save onlt the second patch, overwriting the first.
> 
> onlt -> only

Damned... ;-)

> Indeed for legal-info it would be a serious issue if we silently
> overwrite a patch, resulting in _silently_ missing a patch.

It's not only about missing a patch (althigh that is the worst
outocome), it's also about having dependent patches, like:

    /path/to/buildroot/package/foo/0001-fix-Makefile.patch
    /path/to/global/patch/dir/foo/0001-fix-Makefile.patch

with the second patch furhter changing the *same* part of the Makefile,
so it would overwrite the previous one, but fail to apply.

So, two issues;
  - patches faling to apply (bad, because technically incorrect)
  - missign patches (the worst, because legally incorrect)

> As an alternative solution, Arnout proposed to error out if two patches
> have the same basename. Even though if would avoid the ugly prefixing,
> it would unnecessarily break builds without a need (as far as the
> development is concerned).

I'm not very much in favour of erroring out either... The resulting file
names may _look_ ugly, but I don't care: they are for legal people. ;-)

Seriously, I have the same point of view as Luca here.

[--SNIP--]
> >+# Because patches may come from various places (bundled in Buildroot,
> >+# from one or more global-patch-dir), there might be collisions on the
> >+# basenames of those files.
> >+# We add a new numbering to each patch to ensure unicity of the filenames.
> >+	$$(Q)cpt=1; while read f; do \
> >+		_c=$$$$(printf "%04d" $$$${cpt}); \
> >+		$$(call hardlink-copy,$$$${f},$$($(2)_REDIST_SOURCES_DIR),\
> >+			$$$${_c}-$$$${f##*/}) || exit 1; \
> >+		printf "%s\n" "$$$${_c}-$$$${f##*/}" >>$$($(2)_REDIST_SOURCES_DIR)/series || exit 1; \
> >+		: $$$$((cpt++)); \
> 
> I must admit this is not the most readable piece of code I have seen so
> far... ;)

Hehe! ;-]

> I cannot do anything about the '$$$$'s, but at least I can
> suggest to rename the variables:
> 
>  - cpt -> patch_num
>  - _c -> prefix_num

OK, workd for me.

> But it works fine, thus:
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

Thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

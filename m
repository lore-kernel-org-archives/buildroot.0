From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 6 Feb 2019 22:28:35 +0100
Subject: [Buildroot] [PATCH] core/pkg-infra: restore completeness of
 packages files lists
In-Reply-To: <CAAXf6LXhHQZGK_py7hou1LbYw=cpYA_tp-ZBk1PrDE2U0KaRqQ@mail.gmail.com>
References: <20190206143751.5814-1-yann.morin.1998@free.fr>
 <CAAXf6LXhHQZGK_py7hou1LbYw=cpYA_tp-ZBk1PrDE2U0KaRqQ@mail.gmail.com>
Message-ID: <CAAXf6LVOUVCDPTriT+yCMvoNHEtvk=6e3DmGSwygL5trf4iH0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El mi?., 6 feb. 2019 a las 21:12, Thomas De Schampheleire
(<patrickdepinguin@gmail.com>) escribi?:
>
> Hello,
>
> El mi?., 6 feb. 2019 a las 15:38, Yann E. MORIN
> (<yann.morin.1998@free.fr>) escribi?:
> >
> > In commit 7fb6e782542f (core/instrumentation: shave minutes off the
> > build time), the built stampfile is used as a reference to detect files
> > installed by a package.
> >
> > However, packages may install files keeping their mtime intact, and we
> > end up not detecting this. For example, the internal skeleton package
> > will install (e.g.) /etc/passwd with an mtime of when the file was
> > created in $(TOP_DIR), which could be the time the git repository was
> > checked out; that mtime is always older than the build stamp file, so
> > files installed by the skeleton package are never accounted for to that
> > package, or to any other package for that matters.
> >
> > We switch to an alternate solution, which consists of storing some extra
> > metadata per file, so that we can more reasily detect modifications to
> > the files. Then we compare the state before the package is installed (by
> > reusing the existing list) and after the package is installed, compare
> > that to list any new file or modified files (in reality, ignoring
> > untouched and removed files). Finally, we store the file->package
> > association in the global list and store the new stat list as the global
> > list.
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Peter Korsgaard <peter@korsgaard.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> > Cc: Trent Piepho <tpiepho@impinj.com>
> > ---
> >  package/pkg-generic.mk | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index f5cab2b9c2..c07cb32349 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -63,13 +63,20 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
> >  # $(2): base directory to search in
> >  # $(3): suffix of file  (optional)
> >  define step_pkg_size_inner
> > +       @touch $(BUILD_DIR)/packages-file-list$(3).stat
> >         @touch $(BUILD_DIR)/packages-file-list$(3).txt
> >         $(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt
> >         cd $(2); \
> > -       find . \( -type f -o -type l \) \
> > -               -newer $($(PKG)_DIR)/.stamp_built \
> > -               -exec printf '$(1),%s\n' {} + \
> > +       LC_ALL=C find . -printf '%T@:%i:%#m:%y:%s,%p\n' \
> > +       |LC_ALL=C sort >$($(PKG)_BUILDDIR)/.files-list$(3).stat
> > +       comm -13 $(BUILD_DIR)/packages-file-list$(3).stat \
> > +               $($(PKG)_BUILDDIR)/.files-list$(3).stat \
> > +               >$($(PKG)_BUILDDIR)/.files-list$(3).new
> > +       sed -r -e 's/^[^,]+/$(1)/' \
> > +               $($(PKG)_BUILDDIR)/.files-list$(3).new \
> >                 >> $(BUILD_DIR)/packages-file-list$(3).txt
> > +       mv $($(PKG)_BUILDDIR)/.files-list$(3).stat \
> > +               $(BUILD_DIR)/packages-file-list$(3).stat
> >  endef
> >
>
> I am testing this code by building a reference build with this change
> and the original-original situation using md5sum and comparing the
> output.
> The build is not yet complete so below are not yet complete
> observations. Nevertheless, it looks very good so far.
>
> Observations:
>
> 1. The call to 'comm' should also happen with LC_ALL=C or comm may
> complain that a file is not sorted. This is noticed in tzdata, where
> there are two files differing only in a '+' and '-' sign in their
> name. Depending on the locale, the sort order is different:
>
> $ echo \
> '1549481786.6863713840:20982773:0644:f:127,./usr/share/zoneinfo/posix/Etc/GMT+0
> 1549481786.6863713840:20982773:0644:f:127,./usr/share/zoneinfo/posix/Etc/GMT-0'
> | sort
> 1549481786.6863713840:20982773:0644:f:127,./usr/share/zoneinfo/posix/Etc/GMT-0
> 1549481786.6863713840:20982773:0644:f:127,./usr/share/zoneinfo/posix/Etc/GMT+0
>
>
> $ echo \
> '1549481786.6863713840:20982773:0644:f:127,./usr/share/zoneinfo/posix/Etc/GMT+0
> 1549481786.6863713840:20982773:0644:f:127,./usr/share/zoneinfo/posix/Etc/GMT-0'
> | env LC_ALL=C sort
> 1549481786.6863713840:20982773:0644:f:127,./usr/share/zoneinfo/posix/Etc/GMT+0
> 1549481786.6863713840:20982773:0644:f:127,./usr/share/zoneinfo/posix/Etc/GMT-0
>
> The error given by 'comm' with such input is:
> comm: file 2 is not in sorted order
>
>
>
> 2. This is more an observation than a change-request: the directories
> where a package installs files, e.g. usr/bin, usr/lib, ... are
> attributed for that package. This means that 'usr/lib' is for example
> attributed to each and every library.
> In a way I like this, because it means that with the output for one
> package you have both all files and all directories that it touches,
> regardless of who created the directory first.
> But it should be checked whether other users of the output can cope
> with it, like graph-size.
>

The original code with md5sum used following code to find files:
    find . -xtype f -print0 | xargs -0 md5sum ; \
    find . -xtype d -print0 | xargs -0 -I{} printf 'directory  {}\n'; \

So files, directories, and links to files and directories would be caught.
But due to the way the rest of the code works, directories are only
attributed to the first package that creates them. For the base
directories this is the skeleton.

Due to the 'xtype', broken symbolic links are not caught (I indeed
observed this now that my test is complete). Broken links can either
be absolute links (possibly resolving correctly on the target but not
on the host) or actually broken relative links.


In the code with mtime, the find was:
    find . \( -type f -o -type l \) \

So here, files and links are found. Links to directories would be
included, but real directories are not.


And in your proposed code, the find is:
    find .

So this one includes regular files, links and directories, but also
special files.


Given all this variation, we should decide what we actually want. Most
importantly: do we want directories or not.
Regarding broken links, I think it is a good thing to have them.
Likely they are actually valid on target. Even if they are not, they
are installed by the package so it makes sense to list them.

Best regards,
Thomas

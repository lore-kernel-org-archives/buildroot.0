From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 8 Jan 2019 17:55:27 +0100
Subject: [Buildroot] [PATCH 06/19] infra/pkg-generic: only list files
 installed by the current package
In-Reply-To: <20190108160820.GI19623@scaer>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <8c891d4245028f97585d0e55ab5962e6ea337659.1546898693.git.yann.morin.1998@free.fr>
 <CAAXf6LUYuoi3Ws=kCvf-Yj-r+eWLFY217tuEHRbY_+YgJ_zbqA@mail.gmail.com>
 <20190108160820.GI19623@scaer>
Message-ID: <CAAXf6LVrVZqrCH+bwYYbAGxhDeDnYXXE8MLfFKCH75EOdz3ZVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El mar., 8 ene. 2019 a las 17:08, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Thomas DS, All,
>
> Thanks for the review! :-)
>
> On 2019-01-08 14:07 +0100, Thomas De Schampheleire spake thusly:
> > El lun., 7 ene. 2019 a las 23:05, Yann E. MORIN
> > (<yann.morin.1998@free.fr>) escribi?:
> snip
> > > We fix that by limiting the search for files that have been actually
> > > touched during the install step, now that we have the proper timestamp
> > > for it.
> [--SNIP--]
> > > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > > index 3de8a99675..42aebeb49d 100644
> > > --- a/package/pkg-generic.mk
> > > +++ b/package/pkg-generic.mk
> > > @@ -67,7 +67,7 @@ define step_pkg_size_inner
> > >         $(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt
> > >         cd $(2); \
> > >         find . \( -type f -o -type l \) \
> > > -               -newer $($(PKG)_DIR)/.stamp_built \
> > > +               -newer $@_before \
> > While it is probably not important, just noting here that if package A
> > installs a file with a modification time in the future, then package B
> > installed after A would still get that future file in its list. In
> > fact, every package built after pkg A would then get that file into
> > 'its' list.
>
> How is this different from the current situation?

Yes, it's the same as in the current situation, but not in 'my'
current situation where I'm still relying on md5sum :-)
Part of my interest in reviewing these changes is the hope that they
could remove the need for my revert of the 'shave off' commit that
switches to mtime instead of md5sum, and thus following upstream
Buildroot in this respect.

>
> Maybe in that case, it would make sense that we touch all files after a
> package installation (limited to that package's files, of course)?

But it could be that the package has good reasons to expect a specific
timestamp, or more probably a relative time order between certain
files.
I'm not sure if it is common, like I said I'd need to check in my own case.

>
> My position is that, if a package voluntarily install stuff in the
> future, it is borked. I.e. either it uses an absolute time, in which
> case that time will be in the past some time in the future, or it uses
> a delta, in which case it is not reproducible.

A time delta expected between two files is not irreproducible if both
files come from the same package.

>
> Furthermore when we do an actual reproducible build, we actually touch
> all files at the end of the build, so a package that relies on file's
> timestamp is not reproducible.

I was not aware of this. That changes things, of course.
Can you point me to the exact place in the code?

Thanks,
Thomas

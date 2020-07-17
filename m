From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 18 Jul 2020 01:09:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.55.0
In-Reply-To: <CADvTj4oXO55YM4AkwJi2eqzd6+h6ymKyjc_GrNLLja=h9YLCCA@mail.gmail.com>
References: <20200716110140.825664-1-james.hilliard1@gmail.com>
 <20200716232023.727b5303@gmx.net>
 <CADvTj4ozE24H7tRvGy2+9YOxL9Ur5aB_LuQmOPeHqFESzrvaBg@mail.gmail.com>
 <20200716235722.61bd13bf@gmx.net>
 <CADvTj4pLKMnE7G4B3SzV0A=95b=fVgBNdoW7wZvRX50HPGO9GQ@mail.gmail.com>
 <20200718000531.3366ed60@gmx.net> <20200718002344.5da14318@gmx.net>
 <CADvTj4oXO55YM4AkwJi2eqzd6+h6ymKyjc_GrNLLja=h9YLCCA@mail.gmail.com>
Message-ID: <20200718010941.7340e100@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello James,

On Fri, 17 Jul 2020 16:24:41 -0600, James Hilliard <james.hilliard1@gmail.com> wrote:

[...]

> > > > > > > > diff --git a/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch b/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
> > > > > > > > index 79e99adf4a..e098c25bbe 100644
> > > > > > > > --- a/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
> > > > > > > > +++ b/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
> > > > > > > > @@ -1,4 +1,4 @@
> > > > > > > > -From 4db4fd79d9bb2b98cea1117f22b6c97942ab2ecd Mon Sep 17 00:00:00 2001
> > > > > > > > +From bb155880bd08d7c0c9ddf0264d73016a426d8579 Mon Sep 17 00:00:00 2001
> > > > > > > >  From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> > > > > > > >  Date: Sat, 14 Jul 2018 11:18:45 +0200
> > > > > > > >  Subject: [PATCH] Only fix RPATH if install_rpath is not empty
> > > > > > > > @@ -11,20 +11,20 @@ Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > > > > > > >   1 file changed, 8 insertions(+), 2 deletions(-)
> > > > > > > >
> > > > > > > >  diff --git a/mesonbuild/minstall.py b/mesonbuild/minstall.py
> > > > > > > > -index 8ac6aab1..7ef04116 100644
> > > > > > > > +index 0be01fe75..d991cf4e7 100644
> > > > > > > >  --- a/mesonbuild/minstall.py
> > > > > > > >  +++ b/mesonbuild/minstall.py
> > > > > > > > -@@ -489,8 +489,14 @@ class Installer:
> > > > > > > > -                         printed_symlink_error = True
> > > > > > > > -             if os.path.isfile(outname):
> > > > > > > > +@@ -512,8 +512,14 @@ class Installer:
> > > > > > > > +             if file_copied:
> > > > > > > > +                 self.did_install_something = True
> > > > > > > >                   try:
> > > > > > > > --                    depfixer.fix_rpath(outname, install_rpath, final_path,
> > > > > > > > +-                    depfixer.fix_rpath(outname, t.rpath_dirs_to_remove, install_rpath, final_path,
> > > > > > >
> > > > > > > Out of interest, do you know with which commit the t.rpath_dirs_to_remove comes in (or what is
> > > > > > > the functionality of it)?
> > > > > >
> > > > > > https://github.com/mesonbuild/meson/commit/d7235c5905fa98207d90f3ad34bf590493498d5b
> > > > > > https://github.com/mesonbuild/meson/pull/7103
> > > > > >
> > > > >
> > > > > Thanks for the links, did only a very quick look at the discussion (mentioning
> > > > > buildroot), any chance the upstream commit makes this patch unnecessary?
> > > > Yeah, looks like it does, sent a v3 with that removed:
> > > > https://patchwork.ozlabs.org/project/buildroot/patch/20200717080356.3094739-1-james.hilliard1 at gmail.com/
> >
> > Did you test it or did your decide by patch description/patch review (recall the failure
> > condition was a bit tricky)?
> I did a build test and everything seemed to still compile ok.

Same simple check failed back once (see [3], [4], [5] for the history), at least
a test with one (or more) host packages build by meson needed ;-)

	$ git grep host-meson-package | cat
	docs/manual/adding-packages-meson.txt:packages is also available, with the +host-meson-package+ macro.
	package/gobject-introspection/gobject-introspection.mk:$(eval $(host-meson-package))
	package/libglib2/libglib2.mk:$(eval $(host-meson-package))
	package/orc/orc.mk:$(eval $(host-meson-package))
	package/pango/pango.mk:$(eval $(host-meson-package))
	package/pkg-meson.mk:host-meson-package = $(call inner-meson-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
	package/systemd/systemd.mk:$(eval $(host-meson-package))
	package/wayland/wayland.mk:$(eval $(host-meson-package))


Regards,
Peter

[3] http://lists.busybox.net/pipermail/buildroot/2018-July/226154.html
[4] http://lists.busybox.net/pipermail/buildroot/2018-July/226314.html
[5] http://lists.busybox.net/pipermail/buildroot/2018-October/232956.html

> >
> > The meson pull request 7103 mentions the meson issue 2567 ([1]), mentioned in the
> > original version of the buildroot meson rpath patch ([2])...
> >
> > Regards,
> > Peter
> >
> > [1] https://github.com/mesonbuild/meson/issues/2567
> > [2] https://git.buildroot.net/buildroot/commit/?id=7a23af4773665d2ee40e2d4e525746ebe38456dd
> >
> >

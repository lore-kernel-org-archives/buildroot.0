From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 3 Dec 2018 08:23:54 +0100
Subject: [Buildroot] [PATCH 1/1] libglib2: bump to version 2.58.1
In-Reply-To: <20181202172323.GB2649@scaer>
References: <20181014075852.2976-1-fontaine.fabrice@gmail.com>
 <20181202140053.6ed28a05@windsurf.home> <20181202172323.GB2649@scaer>
Message-ID: <CAPi7W802dzjZhNuw-07vtBvuoFRGnhc+qhZf=ZhH3Ra11GrHuw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,
Le dim. 2 d?c. 2018 ? 18:23, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>
> Fabrice, Thomas, All,
>
> On 2018-12-02 14:00 +0100, Thomas Petazzoni spake thusly:
> > On Sun, 14 Oct 2018 09:58:52 +0200, Fabrice Fontaine wrote:
> > > - Update second patch
> > > - Remove third and fifth patches (already in version)
> > > - Add a new patch to fix a missing header
> > > - Add LIBGLIB2_GTK_DOC_HOOK so autoreconf do not fail on the following
> > >   error:
> > >   automake: error: cannot open < gtk-doc.make: No such file or directory
> > >
> > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > > ---
> > >  package/libglib2/0002-disable-tests.patch     |  8 +--
> > >  ...code-python-path-into-various-tools.patch} |  0
> > >  ...gobject-fix-compilation-with-gcc-4.7.patch | 50 ------------------
> > >  ...0004-grefcount-add-missing-gatomic.h.patch | 38 ++++++++++++++
> > >  ...compilation-without-F_-S-G-ETPIPE_SZ.patch | 52 -------------------
> > >  package/libglib2/libglib2.hash                |  4 +-
> > >  package/libglib2/libglib2.mk                  | 11 +++-
> > >  7 files changed, 55 insertions(+), 108 deletions(-)
> > >  rename package/libglib2/{0004-Do-not-hardcode-python-path-into-various-tools.patch => 0003-Do-not-hardcode-python-path-into-various-tools.patch} (100%)
> > >  delete mode 100644 package/libglib2/0003-gobject-fix-compilation-with-gcc-4.7.patch
> > >  create mode 100644 package/libglib2/0004-grefcount-add-missing-gatomic.h.patch
> > >  delete mode 100644 package/libglib2/0005-gio-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch
> >
> > Applied to master, thanks.
>
> As you can see on the autobuilders, thius breaks all glib-using packages:
>
> libsoup-2.62.3
>     http://autobuild.buildroot.org/results/e44/e449948077bc03cee57c567332c17f51371b6086//
>     /bin/sh: /usr/bin/glib-mkenums: No such file or directory
>
> atk-2.28.1
>     http://autobuild.buildroot.org/results/e9e/e9ebc4f7d6ccf90a9a0800511472367312432137/
>     /bin/bash: /usr/bin/glib-genmarshal: No such file or directory
>
> dbus-glib-0.110
>     http://autobuild.buildroot.org/results/2e4/2e4285d47f6295e1b9f9c05abe34df443cad7f9e/
>     /bin/sh: /usr/bin/glib-genmarshal: No such file or directory
>
> And so on...
>
> I've investigated a bit, and glib-2.0.pc contains (excerpt):
>
>     exec_prefix=/usr
>     bindir=${exec_prefix}/bin
>     glib_genmarshal=${bindir}/glib-genmarshal
>     glib_mkenums=${bindir}/glib-mkenums
>
> And, for example dbus-glib, use pkg-config to get the path to, e.g.,
> glib_genmarshal:
>
>     GLIB_GENMARSHAL=`$PKG_CONFIG --variable=glib_genmarshal glib-2.0`
>     AC_SUBST(GLIB_GENMARSHAL)
>
> And if one does exaectly that:
>
>     $ /home/ymorin/dev/buildroot/O/host/bin/pkgconf --variable=glib_genmarshal glib-2.0
>     /usr/bin/glib-genmarshal
>
> Of course, on my mach8ine, that one did exist, so the build succeed. But
> most autobuilders don't have it, and the build fails.
>
> The situation is similar for the two other tools, gobject-query and
> glib-mkenums.
>
> So, the solutions I have for now are:
>
>  1- fix each package and pass them GLIB_GENMARSHAL=$(STAGING_DIR)/bin/glib-genmarshal
>     (similarly for the two other tools)
>
>  2- teach pkgconf to replace even more variables. This is not very
>     satisfying, and we won't be able to keep up in the long term. We
>     hould at least teach pkgconf to look for that list in an environment
>     variable, at least, to avoid tweaking the code over-and-over again.
>
> However, (1) is not totally free: dbus-glib does not accept it from the
> environment, because they borked the way to call glib-genmarshal (it's
> basically hard-coded). I have fixed it and submitted upstream [0], so at
> least we have that one fixed, but we still have the others, the numerous
> croud of glib-dependent packages, to test and fix one by one...
>
> [0] https://gitlab.freedesktop.org/dbus/dbus-glib/merge_requests/2
Thanks a lot for investigating, I'm more in favor of (2) because most
of the glib packages don't have any environment variables.
However, it should be noted that a lot of glib packages (libsoup,
gdk-pixpuf, atk, pango) have switched to meson in their latest
upstream versions.
Meson has a gnome module to find and call genmarshal, mkenums, etc ...
and this module does not use the pkgconfig file to find the path of
these binaries.
I'll start with atk.
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
Best Regards,

Fabrice

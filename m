From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 18 Mar 2021 18:48:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/elfutils: fix build with uclibc
In-Reply-To: <20210318183316.78e4a75c@gmx.net>
References: <20210318074219.4113728-1-fontaine.fabrice@gmail.com>
 <20210318183316.78e4a75c@gmx.net>
Message-ID: <CAPi7W812VF6BQ6HS_zuN84nkuvXnXKaN-Y3UpkYmNsMuoKmv0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Le jeu. 18 mars 2021 ? 18:33, Peter Seiderer <ps.report@gmx.net> a ?crit :
>
> Hello Fabrice,
>
> On Thu, 18 Mar 2021 08:42:19 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Update first patch to fix a build failure with uclibc and elfutils in
> > version 0.183.0 which errors out if obstack is not found since
> > https://sourceware.org/git/?p=elfutils.git;a=commit;h=da855fc9cd415c288bfcb9de1f3d5eb329de0557
> >
> > Indeed, obstack has been removed from uclibc-ng since version 1.0.21 and
> > https://github.com/wbx-github/uclibc-ng/commit/0bd6bfb2b643ea2b4b1440dfd917ba752f0c0d15
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/003ae73c7b48ad6b9837fb19ca197061d20eaf6d
> >
>
> Thanks for taking care of the build failure, but...
>
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  ...-Add-a-enable-disable-progs-configure-option.patch | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch b/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch
> > index e51f749cf6..bac9bc1245 100644
> > --- a/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch
> > +++ b/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch
> > @@ -20,6 +20,8 @@ Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> >  Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> >  [Rebased on 0.183]
> >  Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > +[Fabrice: don't error out if obstack is not found]
> > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> >  ---
> >   Makefile.am  | 6 +++++-
> >   configure.ac | 6 ++++++
> > @@ -60,6 +62,15 @@ index d345495..0dd4b1e 100644
> >   dnl zlib is mandatory.
> >   save_LIBS="$LIBS"
> >   LIBS=
> > +@@ -579,7 +585,7 @@ saved_LIBS="$LIBS"
> > + AC_SEARCH_LIBS([_obstack_free], [obstack])
> > + LIBS="$saved_LIBS"
> > + case "$ac_cv_search__obstack_free" in
> > +-        no) AC_MSG_FAILURE([failed to find _obstack_free]) ;;
> > ++        no) obstack_LIBS= ;;
> > +         -l*) obstack_LIBS="$ac_cv_search__obstack_free" ;;
> > +         *) obstack_LIBS= ;;
> > + esac
> >  --
> >  2.30.1
> >
>
> Is this not a complete unrelated/new matter (and so belongs to an extra patch)?
From my perspective, this is not unrelated as obstack has "always"
been used by some of the elfutils program but I'm open to discussion.
I can create a dedicated patch but it doesn't make sense to send it
upstream without first patch.
I don't know if first patch was sent and if so, what was upstream reaction?
An other option would be to disable elfutils on uclibc as I don't
think we should maintain not upstreamable patch forever.
>
> Regards,
> Peter
>
>
>
Best Regards,

Fabrice

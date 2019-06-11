From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Jun 2019 21:22:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/libglib2: remove bindir prefix
 from gio-2.0.pc
In-Reply-To: <CAFSsvmpxfJWxeLvm-GT3-MtGq8+jh9RYUKQH1f+Onq2HEXaP+w@mail.gmail.com>
References: <20190611173015.2205-1-fontaine.fabrice@gmail.com>
 <CAFSsvmpxfJWxeLvm-GT3-MtGq8+jh9RYUKQH1f+Onq2HEXaP+w@mail.gmail.com>
Message-ID: <20190611192244.GG13603@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2019-06-11 14:19 -0400, Adam Duskett spake thusly:
> Openembedded has a patch for this that might be even better for us to use:
> https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch

As discussed on IRC (Fabrice, you should *really* join):

Upstream glib refused that patch, because they do want to have the
paths.

So it has zero chance to be applied, so we'll have to carry it over and
over.

So, I prefer we go with the hook. Still, see comments below...

> If not, then consider this an
> Acked-by: Adam Duskett <aduskett@gmail.com>
> 
> On Tue, Jun 11, 2019 at 1:30 PM Fabrice Fontaine
> <fontaine.fabrice@gmail.com> wrote:
> >
> > Apply LIBGLIB2_REMOVE_BINDIR_PREFIX_FROM_PC_FILE to gio-2.0.pc so
> > ${bindir} prefix is also removed for gbus-codegen otherwise build of
> > packages using this binary will fail if gbus-codegen is not installed on
> > host
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/5c0e4f3d33e01198688d58388aabe159bd005234
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/libglib2/libglib2.mk | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> >
> > diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> > index 78d6e5ab32..c8db706684 100644
> > --- a/package/libglib2/libglib2.mk
> > +++ b/package/libglib2/libglib2.mk
> > @@ -85,13 +85,17 @@ endef
> >
> >  LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_DEV_FILES
> >
> > -# Newer versions of libglib2 prefix glib-genmarshal, gobject-query, and
> > -# glib-mkenums with ${bindir}. Unfortunately, this will resolve to the host
> > -# systems /bin/ directory, which will cause compilation issues if the host does
> > -# not have these programs. By removing the ${bindir}/ prefix, these programs
> > -# are resolved in PATH instead.
> > +# Newer versions of libglib2 prefix glib-genmarshal, gobject-query,
> > +# glib-mkenums, glib_compile_schemas, glib_compile_resources and gdbus-codegen
> > +# with ${bindir}. Unfortunately, this will resolve to the host systems /bin/
> > +# directory, which will cause compilation issues if the host does not have these
> > +# programs. By removing the ${bindir}/ prefix, these programs are resolved in
> > +# PATH instead.
> >  define LIBGLIB2_REMOVE_BINDIR_PREFIX_FROM_PC_FILE
> > -       $(SED) 's%$${bindir}/%%g' $(STAGING_DIR)/usr/lib/pkgconfig/glib-2.0.pc
> > +       for file in glib-2.0.pc gio-2.0.pc ; do \
> > +               $(SED) 's%$${bindir}/%%g' \
> > +                       $(STAGING_DIR)/usr/lib/pkgconfig/$$file ; \

IF the sed fails (for whatever reason), you'll miss the error, so...

> > +       done

... prefer using $(foreach ...) instead of a shell loop.

Regards,
Yann E. MORIN.

> >  endef
> >  LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_BINDIR_PREFIX_FROM_PC_FILE
> >
> > --
> > 2.20.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

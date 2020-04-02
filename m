From: Johan Derycke <johanderycke@gmail.com>
Date: Thu, 2 Apr 2020 10:43:59 +0200
Subject: [Buildroot] [PATCH v5 1/1] package/nodejs: Use zlib headers
 from HOST_ZLIB_SRCDIR for host-nodejs
In-Reply-To: <CAKHhJn3X=JxgEyMzwUG_KfEcC9WYhFq972nfL=2cQcwoHokjXA@mail.gmail.com>
References: <20200218031521.32988-1-james.hilliard1@gmail.com>
 <CAKHhJn3X=JxgEyMzwUG_KfEcC9WYhFq972nfL=2cQcwoHokjXA@mail.gmail.com>
Message-ID: <CAKHhJn0FR09jtgk3n2a-e0a0UW_tCTRLh7vecnS+Q1Y06wXoNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will probably also fix
http://autobuild.buildroot.net/results/8ad67efd68b45a7e7f7734377e3863c4ad7fa101/

Op di 31 mrt. 2020 om 15:11 schreef Johan Derycke <johanderycke@gmail.com>:
>
> Op di 18 feb. 2020 om 04:15 schreef James Hilliard <james.hilliard1@gmail.com>:
> >
> > The nodejs configure.py file orders zlib headers before the bundled ICU
> > headers. The zlib headers happen to be located in the system include
> > directory, next to some system ICU headers (not bundled). If these are
> > built before nodejs is, nodejs will get confused and try to use the
> > system ICU headers instead of the bundled ones.
> >
> > Fix this by using headers from HOST_ZLIB_SRCDIR so that the ICU headers
> > in the system include directory are not used.
> >
> > Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes v4 -> v5:
> >   - use headers from HOST_ZLIB_SRCDIR
> >   - use shared zlib instead of static zlib
> > ---
> >  package/nodejs/nodejs.mk | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> > index 0de3495df9..30f5b35809 100644
> > --- a/package/nodejs/nodejs.mk
> > +++ b/package/nodejs/nodejs.mk
> > @@ -64,6 +64,8 @@ define HOST_NODEJS_CONFIGURE_CMDS
> >                 --shared-openssl-includes=$(HOST_DIR)/include/openssl \
> >                 --shared-openssl-libpath=$(HOST_DIR)/lib \
> >                 --shared-zlib \
> > +               --shared-zlib-includes=$(HOST_ZLIB_SRCDIR) \
> > +               --shared-zlib-libpath=$(HOST_DIR)/lib \
> >                 --no-cross-compiling \
> >                 --with-intl=small-icu \
> >         )
> > --
> > 2.20.1
> >
>
> Hi,
>
> I had the same compilation issue on 2020.02. This patch fixed it for me.
>
> Tested-by: Johan Derycke <johanderycke@gmail.com>
>
> Best regards,
>
> Johan

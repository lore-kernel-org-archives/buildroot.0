From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 28 Sep 2020 22:31:55 +0200
Subject: [Buildroot] [PATCH 2/2] package/zstd: link programs dynamically
 with libzstd to save space
In-Reply-To: <20200928194739.GN11621@scaer>
References: <20200928114228.23637-1-patrickdepinguin@gmail.com>
 <20200928114228.23637-2-patrickdepinguin@gmail.com>
 <20200928194739.GN11621@scaer>
Message-ID: <CAAXf6LX6dKgr31MP+tRR-M0Y+CW1Ha5S-zMky5Jo=bZoXUTdUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 28, 2020, 21:47 Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> Thomas, All,
>
> Second review, as I forgot to read down to the end before replying...
>
> On 2020-09-28 13:42 +0200, Thomas De Schampheleire spake thusly:
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >
> > Even when a shared libzstd is built, the zstd command-line programs are
> > statically linked with libzstd, causing a large rootfs footprint.
> >
> > While the cmake backend in zstd already supported a flag
> > ZSTD_PROGRAMS_LINK_SHARED, the make backend did not.
> >
> > This commit adds support for ZSTD_PROGRAMS_LINK_SHARED in the make system
> > and applies it for the target compilation, unless only static libs are
> > supported.
> >
> > Signed-off-by: Thomas De Schampheleire <
> thomas.de_schampheleire at nokia.com>
> > ---
> [--SNIP--]
> > diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> > index 35002da332..c7b224b002 100644
> > --- a/package/zstd/zstd.mk
> > +++ b/package/zstd/zstd.mk
> > @@ -43,9 +43,19 @@ ZSTD_INSTALL_LIBS = install-static
> >  else ifeq ($(BR2_SHARED_LIBS),y)
> >  ZSTD_BUILD_LIBS = libzstd
> >  ZSTD_INSTALL_LIBS = install-shared
> > +ZSTD_OPTS += ZSTD_PROGRAMS_LINK_SHARED=1
> >  else
> >  ZSTD_BUILD_LIBS = libzstd.a libzstd
> >  ZSTD_INSTALL_LIBS = install-static install-shared
> > +ZSTD_OPTS += ZSTD_PROGRAMS_LINK_SHARED=1
> > +endif
> > +
> > +# The HAVE_THREAD flag is read by the 'programs' makefile but not by
> the 'lib'
> > +# one. Building a multi-threaded binary with a library (which defaults
> to
> > +# single-threaded) gives a runtime error when compressing files.
> > +# The 'lib' makefile provides specific '%-mt' targets for this purpose.
> > +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> > +ZSTD_BUILD_LIBS := $(addsuffix -mt,$(ZSTD_BUILD_LIBS))
> >  endif
>
> This last part seems unrelated, and should be in its own patch. If not,
> then it should be explained in the commit log.
>

The comment tries to explain it but it's probably not clear enough: the
HAVE_THREAD flag that buildroot passes is interpreted by programs/Makefile.
Before this patch, that makefile will build and link the library files
directly together with the cli programs. This means that all these
compilations use flags defined by this programs/Makefile.

When we change to use dynamic libraries, such that libzstd.so is built
first, and that the programs just dynamically link with it, then there are
two makefiles of importance:
- lib/Makefile : this makefile does not interpret HAVE_DEBUG and thus
builds a single threaded library.
- programs/Makefile: would build a multithreaded program if Buildroot
requests it.

We are thus left with a multithreaded program that links dynamically with a
library which is build for singlethreaded operation, which is checked at
runtime, resulting in an error.

As lib/Makefile already provides -mt rules to produce the libs for
multithreaded operation, use them instead.

I think we could add this change as first patch, as it seems that today
Buildroot would produce a libzstd.so supporting single-threaded operation
only?

Best regards
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200928/f20940c2/attachment.html>

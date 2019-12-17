From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Dec 2019 21:49:05 +0100
Subject: [Buildroot] [PATCH 02/12] package/pkg-utils.mk: add
 extractor-pkg-dependency macro
In-Reply-To: <20191214224208.3f2d382c@windsurf.home>
References: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
 <20191210215952.902477-3-thomas.petazzoni@bootlin.com>
 <07d07f0f-bb5f-20c9-a8db-61f9bdd496ae@smile.fr>
 <20191214224208.3f2d382c@windsurf.home>
Message-ID: <20191217204905.GA4247@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Romain, All,

On 2019-12-14 22:42 +0100, Thomas Petazzoni spake thusly:
> On Sat, 14 Dec 2019 22:20:21 +0100
> Romain Naour <romain.naour@smile.fr> wrote:
> 
> > > diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> > > index 0f916d81d8..35a441e0aa 100644
> > > --- a/package/pkg-utils.mk
> > > +++ b/package/pkg-utils.mk
> > > @@ -46,6 +46,14 @@ INFLATE.tar  = cat
> > >  # suitable-extractor(filename): returns extractor based on suffix
> > >  suitable-extractor = $(INFLATE$(suffix $(1)))
> > >    
> > 
> > What about gzip ?
> > 
> > EXTRACTOR_PKG_DEPENDENCY.gz   = $(BR2_GZIP_HOST_DEPENDENCY)
> > EXTRACTOR_PKG_DEPENDENCY.tgz  = $(BR2_GZIP_HOST_DEPENDENCY)
> 
> Because oddly enough, we are today not taking into account  the
> dependency on gzip when extracting tarballs.
> 
> We do take it into account only in:
> 
> ifneq ($$(filter cvs git svn,$$($(2)_SITE_METHOD)),)
> $(2)_DOWNLOAD_DEPENDENCIES += \
>         $(BR2_GZIP_HOST_DEPENDENCY) \
>         $(BR2_TAR_HOST_DEPENDENCY)
> endif
> 
> i.e, when we fetch from a version control system, and create our own
> tarball locally.
> 
> But if we download directly from http/ftp a .tar.gz or .tgz, we don't
> rely on BR2_GZIP_HOST_DEPENDENCY, and simply assume we can use the one
> from the host machine.
> 
> This should be fixed, I agree, but it's already broken today I believe.

In fact no. We need to build our own host-gzip only to create archives,
because some host have pigz instead of gzip, and this creates
non-reproducible archives.

However, decompressing with gzip or pigz is exactly the same; we do not
need our own host-gzip, and we can rely on the system-provided gzip,
whether that be gzip of pigz.

So, the current state of affairs is, AFAICS, correct.

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

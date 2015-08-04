From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 4 Aug 2015 13:30:17 +0200 (CEST)
Subject: [Buildroot] [PATCH 1/1] gcc: make sure we don't have a copy of
 libiberty.a in host library dir
In-Reply-To: <1430063966.4723236.1438682091364.JavaMail.root@openwide.fr>
Message-ID: <1078678722.4727495.1438687817691.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Anthony,

----- Mail original -----
> De: "Romain Naour" <romain.naour@openwide.fr>
> ?: "Viallard Anthony" <viallard@syscom-instruments.com>
> Cc: buildroot at buildroot.org
> Envoy?: Mardi 4 Ao?t 2015 11:54:51
> Objet: Re: [Buildroot] [PATCH 1/1] gcc: make sure we don't have a copy of libiberty.a in host library dir
> 
> Hi Anthony,
> 
> ----- Mail original -----
> > De: "Viallard Anthony" <viallard@syscom-instruments.com>
> > ?: "Romain Naour" <romain.naour@openwide.fr>,
> > buildroot at buildroot.org
> > Envoy?: Mardi 4 Ao?t 2015 11:42:58
> > Objet: Re: [Buildroot] [PATCH 1/1] gcc: make sure we don't have a
> > copy of libiberty.a in host library dir
> > 
> > On 07/27/2015 04:38 PM, Romain Naour wrote:
> > >
> > > The --disable-install-libiberty option was broken, that's why the
> > > internal
> > > libiberty.a was installed in HOST_DIR.
> > >
> > > Hopefully, the same patch apply on gcc-4.7:
> > > http://patchwork.ozlabs.org/patch/500445/
> > >
> > > Care to test it ?
> > >
> > 
> > Hi Romain,
> > 
> > I tested the above patch but it doesn't work. The library
> > 'libiberty.a'
> > is copied in 'output/host/usr/lib/'.
> > 
> > Maybe I missed somethings ?
> 
> Weird...
> 
> > 
> > I put the patch in the file
> > 'package/gcc/4.7.4/920-fix-disable-install-libiberty-option.patch'
> > and
> > add --disable-install-libiberty flag in HOST_GCC_COMMON_CONF_OPTS
> > variable of the gcc package.
> > 
> > ----
> > diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> > index be242cb..c23fe40 100644
> > --- a/package/gcc/gcc.mk
> > +++ b/package/gcc/gcc.mk
> > @@ -93,7 +93,8 @@ HOST_GCC_COMMON_CONF_OPTS = \
> >          --with-gmp=$(HOST_DIR)/usr \
> >          --with-mpfr=$(HOST_DIR)/usr \
> >          --with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
> > -       --with-bugurl="http://bugs.buildroot.net/"
> > +       --with-bugurl="http://bugs.buildroot.net/" \
> > +       --disable-install-libiberty
> > 
> >   # Don't build documentation. It takes up extra space / build
> >   time,
> >   # and sometimes needs specific makeinfo versions to work
> > ----
> > 
> > and did the following command:
> > $ rm -rf output && make
> > 
> > I see the flag --disable-install-libiberty in my log so it seems to
> > be
> > applied but the problem is always there.
> > 
> > Have you tried the patch on your side ?
> 
> Yes, I tried the patch and I had another issue with my host gcc
> (gcc5)
> which was fixed by :
> http://git.buildroot.net/buildroot/commit/?id=c63d2b977adf545ab733447a532cff05cb155e95
> 
> Let me give another try.
> Also, can you test against latest master ?

The gcc issue is fixed, but I tried with binutils-2.24 which is used by default.
Do you use binutils-2.23.2 or a previous version ?

Probably, the issue is not fixed with this version...
can you copy package/binutils/arc-2015.06/0001-PR-other-56780.patch into package/binutils/2.23.2/0001-PR-other-56780.patch ?

Best regards,
Romain

> 
> Best regards,
> Romain
> 
> > 
> > Regards,
> > Anthony.
> > 
> > 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

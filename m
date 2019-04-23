From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 23 Apr 2019 09:48:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/dhcp: always disable zlib in
 bind library
In-Reply-To: <20190423092825.0da99fd2@windsurf>
References: <20190421171039.26556-1-fontaine.fabrice@gmail.com>
 <20190422223952.53412a78@windsurf>
 <CAPi7W80Lee0aq4oVwg5Ssy0NZTwQzCZqSwYBZ+q+VFA3hEfAJQ@mail.gmail.com>
 <20190423092825.0da99fd2@windsurf>
Message-ID: <CAPi7W83GeG-wXs8soJBPtve7-Nxj4EcG=yV0v2CzPP+2Y6P9hQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le mar. 23 avr. 2019 ? 09:28, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> On Mon, 22 Apr 2019 23:19:04 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > > Thanks to this, zlib is properly built before dhcp, and everything
> > > works fine.
> > This is strange because I think I also tried this fix and the build
> > failure was not fixed because if no value is provided to zlib, the
> > configure script will try to find zlib header on host (see
> > dhcp/bind/bind-9.11.2-P1/configure.in):
> >
> >     auto|yes)
> >         for d in /usr /usr/local /opt/local
> >         do
> >             if test -f "${d}/include/zlib.h"
> >             then
> >                 if test ${d} != /usr
> >                 then
> >                     zlib_cflags="-I ${d}/include"
> >                     LIBS="$LIBS -L${d}/lib"
> >                 fi
> >                 have_zlib="yes"
> >             fi
> >         done
> >         ;;
> >
> > And obviously, build will fail if those headers are found on host.
> > So I think, we should also set --with-zlib=$(STAGING_DIR)/usr but it
> > was also failing.
>
> Hum, OK, I see. I do have the Zlib development files installed on my
> system though, and /usr/include/zlib.h exists.
>
> > I'll investigate a little more to find why if you think that disabling
> > zlib is not a good solution.
>
> OK. Actually, it was not really well explained in your commit log /
> comment what the problem was. It felt like "it doesn't work, so let's
> take the easy route". If indeed the zlib detection is too broken, I'm
> perfectly fine with disabling it. But the reason is not "let's disable
> it like other dependencies".
I'll send a v2 this evening to fix the zlib detection or to improve
the commit message.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Best Regards,

Fabrice

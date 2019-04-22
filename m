From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 22 Apr 2019 23:19:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/dhcp: always disable zlib in
 bind library
In-Reply-To: <20190422223952.53412a78@windsurf>
References: <20190421171039.26556-1-fontaine.fabrice@gmail.com>
 <20190422223952.53412a78@windsurf>
Message-ID: <CAPi7W80Lee0aq4oVwg5Ssy0NZTwQzCZqSwYBZ+q+VFA3hEfAJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le lun. 22 avr. 2019 ? 22:39, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> On Sun, 21 Apr 2019 19:10:39 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > +# Always disable zlib in bind library (like all other dependencies, see
> > +# bind/Makefile.in)
>
> This reason looked suspicious to me, so I investigated, and indeed, I
> think it's not the right fix.
>
> > +DHCP_BIND_CONF_OPTS = --without-zlib
> > +
> >  ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
> >  DHCP_CONF_OPTS += --enable-delayed-ack
> >  endif
> >
> > -ifeq ($(BR2_PACKAGE_ZLIB),y)
>
> The right fix is:
>
> DHCP_DEPENDENCIES += zlib
>
> > -DHCP_BIND_CONF_OPTS += --with-zlib
> > -else
> > -DHCP_BIND_CONF_OPTS += --without-zlib
> > -endif
>
> Thanks to this, zlib is properly built before dhcp, and everything
> works fine.
This is strange because I think I also tried this fix and the build
failure was not fixed because if no value is provided to zlib, the
configure script will try to find zlib header on host (see
dhcp/bind/bind-9.11.2-P1/configure.in):

    auto|yes)
        for d in /usr /usr/local /opt/local
        do
            if test -f "${d}/include/zlib.h"
            then
                if test ${d} != /usr
                then
                    zlib_cflags="-I ${d}/include"
                    LIBS="$LIBS -L${d}/lib"
                fi
                have_zlib="yes"
            fi
        done
        ;;

And obviously, build will fail if those headers are found on host.
So I think, we should also set --with-zlib=$(STAGING_DIR)/usr but it
was also failing.
I'll investigate a little more to find why if you think that disabling
zlib is not a good solution.
>
> I committed a fix that does this.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice

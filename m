From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 23 Jun 2020 14:26:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnids: new package
In-Reply-To: <CAJe0E3fg1O2n7ucLS71ZMoOrnxmSs_52KWAa_CgWhFrFMo0mnw@mail.gmail.com>
References: <20200622105359.31340-1-guillaume.bressaix@gmail.com>
 <20200622222743.4643d71d@windsurf.home>
 <CAJe0E3dU52qyQ_=eVN+1xtD8b1Kiwe=RZ7zvjpYfhZ8CDJinfQ@mail.gmail.com>
 <CAJe0E3dTThdh+xniL4P4pF9iRaJqN0YA7-OWKPmOWscqRkbmYQ@mail.gmail.com>
 <CAJe0E3fg1O2n7ucLS71ZMoOrnxmSs_52KWAa_CgWhFrFMo0mnw@mail.gmail.com>
Message-ID: <20200623142646.5d4bd105@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 23 Jun 2020 14:14:20 +0200
Guillaume Bres <guillaume.bressaix@gmail.com> wrote:

> Trying to build libnids with libnet:
> 
>    - libnet does not have a pkg-config description file, so what I
>    previously said/thought cannot apply

Gah.

>    - unfortunately because of that, removing --disable-libnet option from
>    configure, has LNETLIB & LNET_CFLAGS pointing to /usr/include

Right.

>    - they have a --with-libnet option, I tried something like
>    --with-libnet=$(STAGING_DIR), but they look for a very specific combination
> 
>      if test -f $withval/include/libnet.h -a -f $withval/lib/libnet.a -a -f
> > $withval/libnet-config ; then  (line 133 in $libnids/configure.in)

Their handling of the --with-libXXX value is completely non-standard.
They expect it to be pointed to the *build* directory of the library,
and not to a sysroot where it has been installed. I had the same issue
with libpcap, which is why I switched to using pkg-config.

>    - $withval/include/libnet.h exists, we have a $withval/lib/libnet.la but
>    that is not exactly what they want, $withval/libnet-config does not exist
>    - so at the moment I am not able to submit anything further about this
>    topic, because of the combination of files they look for. I don't think
>    messing with $libnids/configure.in is an option either, that would be
>    too dirty

Well, we already mess with the configure.in script: see my patch 0001
that changes the configure.in script to add support for using
pkg-config to check for libpcap's availability.

>    - I am not familiar with pkg-config at the moment, I don't know if we
>    can "activate libnet.pc" and have pkg-config look for it

If you don't need libnet support as you're saying at the beginning of
this e-mail, then we can simply keep the --disable-libnet and that's it.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

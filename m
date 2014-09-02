From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Tue, 2 Sep 2014 16:25:09 +0200
Subject: [Buildroot] Fwd: [PATCH v6 1/1] New package: openvmtools
In-Reply-To: <20140902141156.GC4240@free.fr>
References: <1407500851-6882-1-git-send-email-kaszak@gmail.com>
 <20140902103824.GB4240@free.fr>
 <CABbD_XDGZBqVgmMvHv365peWENui=TrXmBCBvEEuE678QA4=2Q@mail.gmail.com>
 <20140902141156.GC4240@free.fr>
Message-ID: <CABbD_XCUekkkR_LtV7_7Wk3So86wvmwawycDajBg_xzMhmjGXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And Yann's reply for the list archives.

---------- Forwarded message ----------
From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, Sep 2, 2014 at 4:11 PM
Subject: Re: [PATCH v6 1/1] New package: openvmtools
To: K?roly Kasza <kaszak@gmail.com>


Karoly, All,

On 2014-09-02 15:59 +0200, K?roly Kasza spake thusly:
[--SNIP--]
> > > +OPENVMTOOLS_AUTORECONF = YES
> > Please add a comment saying why we need to autoreconf.
> >
> OK. (It's because the package is distributed without a configure script -
> http://sourceforge.net/p/open-vm-tools/mailman/message/32550385/ )

OK, add this above the "AUTORECONF = YES" line.

> > > +ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PROCPS),y)
> > > +OPENVMTOOLS_CONF_ENV += CUSTOM_PROCPS_NAME=procps
> > LDFLAGS="-L$(TARGET_DIR)/usr/lib"
> >
> > Why do you point to TARGET_DIR?
> >
> > Usually, we consider the development files are installed in STAGING_DIR.
> > So, if you need to point to a library path, you should point to
> > STAGING_DIR here.
> >
> > But STAGING_DIR/usr/lib is already searched for by our toolchain, so it
> > should not be necessary to add it.
> >
> > If you really need that, explain why.
> >
>
> If I do not add -L$(TARGET_DIR)/usr/lib I simply get an error while
> configuring:
>
> checking for getstat in -lprocps... no
> checking for getstat in -lproc-3.2.8... no
> checking for getstat in -lproc-3.2.7... no
> configure: error: libproc not found. Please configure without procps
(using
> --without-procps) or install procps - http://procps.sourceforge.net
> make: ***
>
[/home/scythe/buildroot/output/build/openvmtools-9.4.6-1770165/.stamp_configured]
> Error 1
>
> I don't know why, but I simply can not find any procps related libraries
in
> the staging directory:
>
> scythe at buildroot-vm:~/buildroot/output$ find . | grep libproc
> ./build/procps-ng-3.3.9/proc/.libs/libprocps.lai
> ./build/procps-ng-3.3.9/proc/.libs/libprocps.so.3
> ./build/procps-ng-3.3.9/proc/.libs/libprocps.a
> ./build/procps-ng-3.3.9/proc/.libs/libprocps.so.3.0.0
> ./build/procps-ng-3.3.9/proc/.libs/libprocps.so
> ./build/procps-ng-3.3.9/proc/.libs/libprocps.la
> ./build/procps-ng-3.3.9/proc/libprocps.sym
> ./build/procps-ng-3.3.9/proc/libprocps.pc
> ./build/procps-ng-3.3.9/proc/libprocps.pc.in
> ./build/procps-ng-3.3.9/proc/libprocps.la
> ./target/usr/lib/pkgconfig/libprocps.pc
> ./target/usr/lib/libprocps.so.3
> ./target/usr/lib/libprocps.a
> ./target/usr/lib/libprocps.so.3.0.0
> ./target/usr/lib/libprocps.so
> ./target/usr/lib/libprocps.la
> scythe at buildroot-vm:~/buildroot/output$ cd staging
> scythe at buildroot-vm:~/buildroot/output/staging$ find . | grep libproc
>
> > +ifeq ($(BR2_PACKAGE_OPENVMTOOLS_DNET),y)
> > > +OPENVMTOOLS_CONF_ENV +=
> > CUSTOM_DNET_CPPFLAGS="-I$(STAGING_DIR)/usr/include"
> >
> > Ditto, STAGING_DIR/usr/include is already searched for by our toolchain,
> > so it should not be needed.
> >
> > If you really need that, explain why.
> >
>
> If I omit the CUSTOM_DNET_CPPFLAGS variable, I get an error while
> configuring:
>
> checking for dumbnet-config... no
> checking for dnet-config... no
> configure: error: dnet-config was not found on your PATH. Please configure
> without dnet (using --without-dnet) or install dnet -
> http://libdnet.sourceforge.net
> make: ***
>
[/home/scythe/buildroot/output/build/openvmtools-9.4.6-1770165/.stamp_configured]
> Error 1
>
> I think this is because the configure script is looking for a binary
called
> "dnet-config", and it needs the environment variable if the binary is not
> found in the $PATH. So I guess this can't be circumvented.

Ah, then there are a few possibilities, of which the best would be to
change configure.ac to call $DNET_CONFIG is it is set, instead of just
dnet-config, and then set DNT_CONFIG=$(STAGING_DIR)/usr/bin/dnet-config

> I would send a new version, do you have any idea why procps-ng doesn't
copy
> it's libraries into the $(STAGING_DIR)?

Yep, that's because propcs-ng.mk does not have INSTALL_STAGING = YES.
Provide a (separate) patch that adds this to procps-ng.

I'll do a further review of your comments later (~16:00 UTC), for now
I've got to go...

Regards,
Yann E. MORIN.

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
   |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is
no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
 conspiracy.  |
'------------------------------^-------^------------------^--------------------'
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140902/95ea963b/attachment.html>

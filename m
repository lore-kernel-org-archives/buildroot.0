From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Tue, 2 Sep 2014 16:23:25 +0200
Subject: [Buildroot] Fwd: [PATCH v6 1/1] New package: openvmtools
In-Reply-To: <CABbD_XDGZBqVgmMvHv365peWENui=TrXmBCBvEEuE678QA4=2Q@mail.gmail.com>
References: <1407500851-6882-1-git-send-email-kaszak@gmail.com>
 <20140902103824.GB4240@free.fr>
 <CABbD_XDGZBqVgmMvHv365peWENui=TrXmBCBvEEuE678QA4=2Q@mail.gmail.com>
Message-ID: <CABbD_XC=qJi9awpLL=MOn=Z8cLa4TxhTaunZ+tEtgQTMRj=uvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I accidentally replied instead of reply-all.

---------- Forwarded message ----------
From: K?roly Kasza <kaszak@gmail.com>
Date: Tue, Sep 2, 2014 at 3:59 PM
Subject: Re: [PATCH v6 1/1] New package: openvmtools
To: "Yann E. MORIN" <yann.morin.1998@free.fr>


Hello Yann,

thanks for reviewing this patch!


> > +config BR2_PACKAGE_OPENVMTOOLS_PAM
> > +     bool "PAM support"
> > +     select BR2_PACKAGE_LINUX_PAM
>
> linux-pam depends on !static, so you should propagate the dependency
> here.
>
>
OK.


> linux-pam also depends on locales and wchar, but they re handled by the
> main symbols of openvmtools, so it is not needed to replicate them here.
> A comment might be OK, though:
>
>     # linux-pam needs locale and wchar, but we already have this
>     # dependency on the main symbol, above.
>
>
OK.


> > +OPENVMTOOLS_AUTORECONF = YES
>
> Please add a comment saying why we need to autoreconf.
>
>
OK. (It's because the package is distributed without a configure script -
http://sourceforge.net/p/open-vm-tools/mailman/message/32550385/ )



> > +ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PROCPS),y)
> > +OPENVMTOOLS_CONF_ENV += CUSTOM_PROCPS_NAME=procps
> LDFLAGS="-L$(TARGET_DIR)/usr/lib"
>
> Why do you point to TARGET_DIR?
>
> Usually, we consider the development files are installed in STAGING_DIR.
> So, if you need to point to a library path, you should point to
> STAGING_DIR here.
>
> But STAGING_DIR/usr/lib is already searched for by our toolchain, so it
> should not be necessary to add it.
>
> If you really need that, explain why.
>

If I do not add -L$(TARGET_DIR)/usr/lib I simply get an error while
configuring:

checking for getstat in -lprocps... no
checking for getstat in -lproc-3.2.8... no
checking for getstat in -lproc-3.2.7... no
configure: error: libproc not found. Please configure without procps (using
--without-procps) or install procps - http://procps.sourceforge.net
make: ***
[/home/scythe/buildroot/output/build/openvmtools-9.4.6-1770165/.stamp_configured]
Error 1

I don't know why, but I simply can not find any procps related libraries in
the staging directory:

scythe at buildroot-vm:~/buildroot/output$ find . | grep libproc
./build/procps-ng-3.3.9/proc/.libs/libprocps.lai
./build/procps-ng-3.3.9/proc/.libs/libprocps.so.3
./build/procps-ng-3.3.9/proc/.libs/libprocps.a
./build/procps-ng-3.3.9/proc/.libs/libprocps.so.3.0.0
./build/procps-ng-3.3.9/proc/.libs/libprocps.so
./build/procps-ng-3.3.9/proc/.libs/libprocps.la
./build/procps-ng-3.3.9/proc/libprocps.sym
./build/procps-ng-3.3.9/proc/libprocps.pc
./build/procps-ng-3.3.9/proc/libprocps.pc.in
./build/procps-ng-3.3.9/proc/libprocps.la
./target/usr/lib/pkgconfig/libprocps.pc
./target/usr/lib/libprocps.so.3
./target/usr/lib/libprocps.a
./target/usr/lib/libprocps.so.3.0.0
./target/usr/lib/libprocps.so
./target/usr/lib/libprocps.la
scythe at buildroot-vm:~/buildroot/output$ cd staging
scythe at buildroot-vm:~/buildroot/output/staging$ find . | grep libproc

> +ifeq ($(BR2_PACKAGE_OPENVMTOOLS_DNET),y)
> > +OPENVMTOOLS_CONF_ENV +=
> CUSTOM_DNET_CPPFLAGS="-I$(STAGING_DIR)/usr/include"
>
> Ditto, STAGING_DIR/usr/include is already searched for by our toolchain,
> so it should not be needed.
>
> If you really need that, explain why.
>

If I omit the CUSTOM_DNET_CPPFLAGS variable, I get an error while
configuring:

checking for dumbnet-config... no
checking for dnet-config... no
configure: error: dnet-config was not found on your PATH. Please configure
without dnet (using --without-dnet) or install dnet -
http://libdnet.sourceforge.net
make: ***
[/home/scythe/buildroot/output/build/openvmtools-9.4.6-1770165/.stamp_configured]
Error 1

I think this is because the configure script is looking for a binary called
"dnet-config", and it needs the environment variable if the binary is not
found in the $PATH. So I guess this can't be circumvented.

I would send a new version, do you have any idea why procps-ng doesn't copy
it's libraries into the $(STAGING_DIR)?

Kind regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140902/83316703/attachment.html>

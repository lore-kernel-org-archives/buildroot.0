From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 12 Dec 2017 17:58:18 -0200
Subject: [Buildroot] [PATCH] wolfssl: new package
In-Reply-To: <20171212173206.vablwxvwcpjfrffn@tarshish>
References: <1513098237-18245-1-git-send-email-sergio.prado@e-labworks.com>
 <20171212173206.vablwxvwcpjfrffn@tarshish>
Message-ID: <CANu7NGt3er0OfSdH-ujY6111fdywdixTpgVRTq7C79HzZXCWvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

> On Tue, Dec 12, 2017 at 03:03:57PM -0200, Sergio Prado wrote:
> > The wolfSSL embedded SSL library is a lightweight and portable
> > SSL/TLS library.
> >
> > Tested on Beaglebone Black.
>
> How have you tested this library?

I have used a tool called testsuite that comes with wolfssl source code
inside the testsuite/ directory. To build it, you have to
pass --enable-examples in the configure, and then manually copy the binary
to the rootfs. Also, to use this tool, you will probably need to copy the
certs/* directory to the rootfs.

> > +WOLFSSL_AUTORECONF = YES
>
> Please add a comment explaining with autoreconf is needed.

OK, I will.

> > +WOLFSSL_CONF_OPTS += --disable-examples
> > +
> > +ifeq ($(BR2_PACKAGE_NGINX),y)
> > +WOLFSSL_CONF_OPTS += --enable-nginx
> > +else
> > +WOLFSSL_CONF_OPTS += --disable-nginx
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_LIGHTTPD),y)
> > +WOLFSSL_CONF_OPTS += --enable-lighty
> > +else
> > +WOLFSSL_CONF_OPTS += --disable-lighty
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT),y)
> > +WOLFSSL_CONF_OPTS += --enable-wpas --enable-sha512
> > +else
> > +WOLFSSL_CONF_OPTS += --disable-wpas
> > +endif
>
> This is strange. Usually a package using SSL/TLS library needs to be
aware of
> the library, not the other way around. Can you explain what is the effect
of
> these configure options?

It depends on the option, but in general enables some extra library
features that could be used by the specific application.

For example, if you pass --enable-nginx, it will define OPENSSL_EXTRA that
will enable the wolfSSL OpenSSL compatibility layer to ease porting wolfSSL
into existing applications which had been designed to work with OpenSSL.

Best regards,

Sergio Prado
Embedded Labworks
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171212/898aaffc/attachment.html>

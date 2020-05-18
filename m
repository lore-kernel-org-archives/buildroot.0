From: Ed Spiridonov <edo.rus@gmail.com>
Date: Mon, 18 May 2020 04:45:35 +0300
Subject: [Buildroot] [PATCH] package/openvpn: add option to use mbed TLS
 instead of OpenSSL
In-Reply-To: <20200515221042.011b8d33@windsurf.home>
References: <20200511223108.4184-1-edo.rus@gmail.com>
 <20200515221042.011b8d33@windsurf.home>
Message-ID: <CACm0Nn2ZFPuHKQoCh5pdakeHh80q-4nzt1umH0A5Rbon_ktgZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 15, 2020 at 11:10 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Could you change this to:
>
>         select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
>
> > +choice
> > +     prompt "crypto backend"
> > +     default BR2_PACKAGE_OPENVPN_OPENSSL
> > +     help
> > +       Select crypto backend (OpenSSL/LibreSSL or mbed TLS)
> > +
> > +config BR2_PACKAGE_OPENVPN_OPENSSL
> > +     bool "openssl"
> > +     select BR2_PACKAGE_OPENSSL
> > +     help
> > +       OpenSSL/LibreSSL is a default crypto backend
> > +
> > +config BR2_PACKAGE_OPENVPN_MBEDTLS
> > +     bool "mbedtls"
> > +     select BR2_PACKAGE_MBEDTLS
> > +     help
> > +       mbed TLS is a compact crypto backend
> > +
> > +       https://community.openvpn.net/openvpn/wiki/Using-mbedtls
> > +
> > +endchoice
>
> Drop this new choice.

I thought a bit about this. Any argument against the choice?

IMHO the choice is clear and understandable.
The user explicitly selects the crypto backend. He knows what is going on.

In the case proposed by you, OpenSSL is selected automagically without
ability to unselect (until mbed?TLS is selected manually).
How can the user find out that mbed?TLS could be used instead of OpenSSL?
Press help on OpenVPN item? Kconfig shows dependencies here, but not a
condition (if !BR2_PACKAGE_MBEDTLS).
Look into package/openvpn/Config.in?
Of course, detailed explanation could be added into OpenVPN help. But
nobody reads help for *all* selected items.

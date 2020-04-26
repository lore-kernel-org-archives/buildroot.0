From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Apr 2020 21:38:38 +0200
Subject: [Buildroot] [PATCH v4,
 1/1] package/uacme: don't allow mbedtls with ualpn
In-Reply-To: <CAPi7W80pWfiaoxoC4rYKv8Bj87s9TU0URBGKwXYxDU-ssNNn_A@mail.gmail.com>
References: <20200426110534.1758730-1-fontaine.fabrice@gmail.com>
 <20200426113639.GA5035@scaer>
 <20200426141309.61837b4f@windsurf.home>
 <CAPi7W80pWfiaoxoC4rYKv8Bj87s9TU0URBGKwXYxDU-ssNNn_A@mail.gmail.com>
Message-ID: <20200426193838.GE28666@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-04-26 14:30 +0200, Fabrice Fontaine spake thusly:
> Le dim. 26 avr. 2020 ? 14:13, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> a ?crit :
> > On Sun, 26 Apr 2020 13:36:39 +0200
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > > +choice
> > > > +   prompt "Crypto Backend"

Note that a choice must define its type, so use 'bool', not 'prompt'.

Yes, I know we have a lot of choices that use 'prompt' and do not spcify
their types. That's not a reason to continue begin wrong. ;-) We also
have quite a few choices that correctly use 'bool', so that would not be
a first either.

(Note: choices can be tristate, too, even if we don't use tristates in
Buildroot, hence the reason to specify the type.)

> > > > +   help
> > > > +     Select crypto library to be used in uacme.
> > > > +
> > > > +config BR2_PACKAGE_UACME_GNUTLS
> > > > +   bool "gnutls"
> > > > +   depends on BR2_PACKAGE_GNUTLS
> > > > +
> > > > +config BR2_PACKAGE_UACME_MBEDTLS
> > > > +   bool "mbedtls"
> > > > +   depends on BR2_PACKAGE_MBEDTLS
> > > > +   depends on !BR2_PACKAGE_UACME_UALPN
> > > > +
> > > > +comment "mbedtls crypto backend unavailable with ualpn"
> > > > +   depends on BR2_PACKAGE_MBEDTLS
> > > > +   depends on BR2_PACKAGE_UACME_UALPN
> > > > +
> > > > +config BR2_PACKAGE_UACME_OPENSSL
> > > > +   bool "openssl"
> > > > +   depends on BR2_PACKAGE_OPENSSL
> > > > +
> > > > +endchoice
> > >
> > > Sorry, but this is still not correct: enable mbedtls, then enable uacme
> > > and ualpn: there is no crypto backend selectable in the choice...
> >
> > Do we need a choice in the first place ?
> v2 didn't add a choice but it was a bit too confusing so I made v3/v4
> upon Yann's request. I'll wait for your feedback before making a new
> iteration.

For the record, v1 of the patchset had a choice. It was not the choice
that propmpted a respin, but the way the patches were ordered (i.e. the
fix was coming after the features).

It turns out that adding the choice can be both the fix (for the ualpn
incompatibility with mbedtls) *and* the feature (choosing the crypto
backend).

One way to solve the issue would be something like:

    diff --git a/package/uacme/Config.in b/package/uacme/Config.in
    index 58b7c534e7..53a0ab4bf2 100644
    --- a/package/uacme/Config.in
    +++ b/package/uacme/Config.in
    @@ -16,14 +16,36 @@ config BR2_PACKAGE_UACME
     
     if BR2_PACKAGE_UACME
     
    +choice
    +	bool "crypto backend"
    +
    +config BR2_PACKAGE_UACME_CRYPTO_GNUTLS
    +	bool "gnutls"
    +	depends on BR2_PACKAGE_GNUTLS
    +
    +config BR2_PACKAGE_UACME_CRYPTO_MBEDTLS
    +	bool "mbedtls"
    +	depends on BR2_PACKAGE_MBEDTLS
    +
    +config BR2_PACKAGE_UACME_CRYPTO_OPENSSL
    +	bool "openssl"
    +	depends on BR2_PACKAGE_OPENSSL
    +
    +endchoice
    +
     config BR2_PACKAGE_UACME_UALPN
     	bool "enable ualpn"
     	depends on BR2_TOOLCHAIN_HAS_THREADS
    +	depends on !BR2_PACKAGE_UACME_CRYPTO_MBEDTLS
     	select BR2_PACKAGE_LIBEV
     	help
     	  Build and install ualpn, the transparent proxying tls-alpn-01
     	  challenge responder.
     
    +comment "ualpn incompatible with the mbedtls crypto backend"
    +	depends on BR2_TOOLCHAIN_HAS_THREADS
    +	depends on !BR2_PACKAGE_UACME_CRYPTO_MBEDTLS
    +
     comment "ualpn needs a toolchain w/ threads"
     	depends on !BR2_TOOLCHAIN_HAS_THREADS
     

Regards,
Yann E. MORIN.

> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> Best Regards,
> 
> Fabrice

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

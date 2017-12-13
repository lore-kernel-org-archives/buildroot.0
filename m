From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Wed, 13 Dec 2017 15:21:37 -0200
Subject: [Buildroot] [PATCH] wolfssl: new package
In-Reply-To: <20171213060308.gosvafozfwqsdw4p@sapphire.tkos.co.il>
References: <1513098237-18245-1-git-send-email-sergio.prado@e-labworks.com>
 <20171212173206.vablwxvwcpjfrffn@tarshish>
 <CANu7NGt3er0OfSdH-ujY6111fdywdixTpgVRTq7C79HzZXCWvw@mail.gmail.com>
 <20171213060308.gosvafozfwqsdw4p@sapphire.tkos.co.il>
Message-ID: <CANu7NGsei4G9mcvMxtRRoyp9C69Yab-n6sa5htL-+==30kLBEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

> > > How have you tested this library?
> >
> > I have used a tool called testsuite that comes with wolfssl source code
> > inside the testsuite/ directory. To build it, you have to
> > pass --enable-examples in the configure, and then manually copy the
binary
> > to the rootfs. Also, to use this tool, you will probably need to copy
the
> > certs/* directory to the rootfs.
>
> Having this information in the commit log would be useful.

Sure. I'll add it in V2.

> So --enable-nginx is not nginx specific. It would probably make sense to
> enable it for other packages as well. What about the --enable-lighty and
> --enable-wpas options? How large is the target size increase of these
options?
>
> In any case we need a comment that explains all that.

To be more precise, if you pass --enable-nginx it will define the following
macros during the build process (if I'm not missing any):

-DOPENSSL_EXTRA
-DSESSION_CERTS
-DHAVE_ECC
-DHAVE_OCSP
-DHAVE_TLS_EXTENSIONS
-DHAVE_CERTIFICATE_STATUS_REQUESTENABLED_CRL
-DHAVE_TLS_EXTENSIONS
-DHAVE_SESSION_TICKET
-DHAVE_TLS_EXTENSIONS
-DHAVE_SNI
-DHAVE_MAX_FRAGMENT
-DHAVE_TRUNCATED_HMAC
-DHAVE_ALPN
-DWOLFSSL_NGINX
-DWOLFSSL_ALWAYS_VERIFY_CB
-DWOLFSSL_ALWAYS_KEEP_SNI
-DKEEP_OUR_CERT -DKEEP_PEER_CERT
-DHAVE_EXT_CACHE -DHAVE_EX_DATA

If you pass --enable-lighty:

-DOPENSSL_EXTRA
-DHAVE_LIGHTY
-DHAVE_WOLFSSL_SSL_H=1

If you pass --enable-wpas:

-DHAVE_SECRET_CALLBACK
-DWOLFSSL_STATIC_RSA
-DWOLFSSL_PUBLIC_MP
-DWOLFSSL_PUBLIC_ECC_ADD_DBL
-DATOMIC_USER
-DHAVE_EX_DATA
-DWOLFSSL_KEEP_PEER_CERT
-DHAVE_EXT_CACHE
-DWOLFSSL_ALWAYS_VERIFY_CB
-DOPENSSL_EXTRA
-DWOLFSSL_AES_DIRECT
-DWOLFSSL_DER_LOAD
-DWOLFSSL_SHA512
-DWOLFSSL_SHA384
-DWOLFSSL_KEY_GEN
-DWOLFSSL_WPAS
-DHAVE_COMP_KEY
-DHAVE_ANON
-DWOLFSSL_CMAC
-DWOLFSSL_AES_DIRECT
-DHAVE_TLS_EXTENSIONS
-DHAVE_SESSION_TICKET

I'm not a crypto or wolfssl expert, but as far as I understood, passing
these options will enable the inclusion or change the behaviour of some
crypto algorithms. And that would make nginx, lighttpd and wpa_supplicant
work with wolfssl. I know that this is strange, normally an application
depends on a library, and not the other way around.

I also discovered looking at wolfssl forums that they keep patches to be
applied in these applications, so they would work with wolfssl. And these
patches are not public [1].

So, from that point of view, it does not make sense to keep these options
in the package's makefile, since it is not useful with the upstream version
of nginx, lighttpd and wpa_supplicant. What do you think?

[1] https://www.wolfssl.com/forums/topic1015-nginx-wolfssl.html

Best regards,

Sergio Prado
Embedded Labworks
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171213/c17e2002/attachment.html>

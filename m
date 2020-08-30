From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 30 Aug 2020 22:11:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/rtty: fix build with mbedtls
 but without zlib
In-Reply-To: <20200830220205.777024e2@windsurf.home>
References: <20200830192029.1009973-1-fontaine.fabrice@gmail.com>
 <20200830220205.777024e2@windsurf.home>
Message-ID: <CAPi7W836LNsN20-Zu=WW_Z9Zp_p2DFx41TnH6cUxDrVqjmaJ3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dim. 30 ao?t 2020 ? 22:02, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Sun, 30 Aug 2020 21:20:29 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > +-        set(SSL_LIB ${MBEDTLS_LIBRARIES} ${ZLIB_LIBRARIES})
> > ++        if(ZLIB_FOUND)
> > ++            set(SSL_LIB ${MBEDTLS_LIBRARIES} ${ZLIB_LIBRARIES})
>
> Is there a reason why zlib is necessary for mbedtls support ?
zlib is not mandatory with mbedtls, only optional, however as mbedtls
does not provide a pkg-config file, we assume that if zlib is
available, we must link with it to avoid a build failure when linking
statically with a zlib-enabled mbedtls.
This change was pushed upstream with
https://github.com/zhaojh329/rtty/commit/7b8efe11dbafce97971dc130bf6cc1756f34ce07.
However, we missed that this change will raise a build failure if
ZLIB_LIBRARIES is used when zlib is not found.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice

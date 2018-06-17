From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 14:24:14 +0200
Subject: [Buildroot] [PATCH] gnutls: use included unistring unless
 libunistring is selected
In-Reply-To: <20180615085704.u3mjlz3h325wqhhs@tarshish>
References: <20180615084838.7642-1-neumann@teufel.de>
 <20180615085704.u3mjlz3h325wqhhs@tarshish>
Message-ID: <20180617142414.5c710d43@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Jun 2018 11:57:04 +0300, Baruch Siach wrote:

> > diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
> > index cfb7cb3f3b..998e213c7d 100644
> > --- a/package/gnutls/Config.in
> > +++ b/package/gnutls/Config.in
> > @@ -1,7 +1,6 @@
> >  config BR2_PACKAGE_GNUTLS
> >  	bool "gnutls"
> >  	select BR2_PACKAGE_LIBTASN1
> > -	select BR2_PACKAGE_LIBUNISTRING
> >  	select BR2_PACKAGE_NETTLE
> >  	select BR2_PACKAGE_PCRE
> >  	depends on BR2_USE_WCHAR  
> 
> Is it possible now to remove the BR2_USE_WCHAR dependency of gnutls?

gnutls indeed builds fine with wchar support now. However, looking at
the commit that introduced the wchar dependency back in 2013, it
doesn't seem it was due to the libunistring dependency (see
669de89be785f83ae4840b0ba3983d044e374172).

So it would probably be good to drop the wchar dependency in gnutls.
This requires also checking all the reverse dependencies of gnutls:

package/connman/Config.in:      select BR2_PACKAGE_GNUTLS

 -> Anyway needs wchar because of libglib2

package/libmicrohttpd/Config.in:        select BR2_PACKAGE_GNUTLS

 -> In this one, the wchar dependency can probably be dropped

package/libnice/Config.in:      select BR2_PACKAGE_GNUTLS

 -> Also uses libglib2, so wchar needed

package/libsoup/Config.in:      select BR2_PACKAGE_GNUTLS

 -> Ditto

package/network-manager/Config.in:      select BR2_PACKAGE_GNUTLS

 -> Interestingly... this one does *NOT* have the wchar dependency
    expressed directly. It works because this package depends on
    BR2_PACKAGE_HAS_UDEV, and both eudev and systemd need wchar support.

package/ntfs-3g/Config.in:      select BR2_PACKAGE_GNUTLS

 -> Will probably still need the wchar dependency.

package/samba4/Config.in:       select BR2_PACKAGE_GNUTLS

 -> Will still need the wchar dependency.

package/taskd/Config.in:        select BR2_PACKAGE_GNUTLS

 -> Might be possible to drop the wchar dependency.

package/vpnc/Config.in: select BR2_PACKAGE_GNUTLS

 -> Might be possible to drop the wchar dependency.

and these are only the first-level reverse dependencies.

Anybody interested in looking into this ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

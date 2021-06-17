From: Kamel Bouhara <kamel.bouhara@bootlin.com>
Date: Thu, 17 Jun 2021 09:49:46 +0200
Subject: [Buildroot] [git commit] package/usbguard: new package
In-Reply-To: <20210616235847.555dbf5b@windsurf>
References: <20210616211146.2B4B4815C8@busybox.osuosl.org>
 <20210616235847.555dbf5b@windsurf>
Message-ID: <YMr+mufM2YzenxNi@kb-xps>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 16, 2021 at 11:58:47PM +0200, Thomas Petazzoni wrote:
> Hello,
>

Hi,

> Didn't had the time to review the original patch, but here are some
> comments.
>
> On Wed, 16 Jun 2021 23:38:54 +0200
> Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> wrote:
>
> > +USBGUARD_VERSION = 1.0.0
> > +USBGUARD_SITE = https://github.com/USBGuard/usbguard/releases/download/usbguard-$(USBGUARD_VERSION)
> > +USBGUARD_LICENSE = GPL-2.0+
> > +USBGUARD_LICENSE_FILES = LICENSE
> > +USBGUARD_CONF_OPTS= --with-bundled-catch --with-bundled-pegtl \
> > +		    --disable-debug-build --without-dbus --without-polkit \
> > +		    --disable-seccomp --disable-umockdev --disable-systemd
>
> --disable-seccomp should go in the seccomp conditional below.
>
> --disable-systemd should go in the systemd conditional below.
>
> Nit: missing space before the "=" sign
>
> > +
> > +USBGUARD_DEPENDENCIES += libqb protobuf
>
> Should be a "=" sign.
>
> > +
> > +ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
> > +USBGUARD_CONF_OPTS += --with-crypto-library=openssl
> > +USBGUARD_DEPENDENCIES += libopenssl
> > +endif
> > +ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
> > +USBGUARD_CONF_OPTS += --with-crypto-library=gcrypt
> > +USBGUARD_DEPENDENCIES += libgcrypt
> > +endif
> > +ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
> > +USBGUARD_CONF_OPTS += --with-crypto-library=sodium
> > +USBGUARD_DEPENDENCIES += libsodium
> > +endif
>
> Based on the --with-crypto-library= option name, it seems like these
> are mutually exclusive choice, so it should be a chain of if .. else
> ifeq ... else ifeq ... else ifeq ... endif.
>
> > +
> > +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> > +USBGUARD_CONF_OPTS += --enable-systemd
> > +USBGUARD_DEPENDENCIES += systemd
>
> else
> USBGUARD_CONF_OPTS += --disable-systemd
>
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
> > +USBGUARD_CONF_OPTS += --enable-seccomp
> > +USBGUARD_DEPENDENCIES += libseccomp
>
> else
> USBGUARD_CONF_OPTS += --disable-seccomp
>
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
> > +USBGUARD_CONF_OPTS += --enable-libcapng
> > +USBGUARD_DEPENDENCIES += libcap-ng
>
> else
> USBGUARD_CONF_OPTS += --disable-libcapng
>
> > +endif

Ok, thanks for the review.

>
> Also, I think it should have been good to explain why we are using
> bundled versions of "catch" and "pegtl", as we normally don't like
> bundled libraries in Buildroot packaging.

Both libraries are meant for C++ code testing, I didn't saw any interest
in creating separate packages and choosed to let them bundled.

Kamel

>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

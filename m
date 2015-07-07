From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Jul 2015 08:42:32 +0200
Subject: [Buildroot] [PATCH 2/2] libgudev: New package
In-Reply-To: <1436201764-23614-1-git-send-email-nroach44@gmail.com> (Nathaniel
 Roach's message of "Tue, 7 Jul 2015 00:56:04 +0800")
References: <1436201764-23614-1-git-send-email-nroach44@gmail.com>
Message-ID: <87oajoo4dj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nathaniel" == Nathaniel Roach <nroach44@gmail.com> writes:

 > As libgudev recently was split from the main systemd/udev source,
 > 	this library is now required to build NetworkManager.

 > Add the package; add it as a dependency to NetworkManager; and
 > 	tweak systemd's Config.in message accordingly.

 > Signed-off-by: Nathaniel Roach <nroach44@gmail.com>

> +++ b/package/libgudev/Config.in
 > @@ -0,0 +1,11 @@
 > +config BR2_PACKAGE_LIBGUDEV
 > +	bool "libgudev"
 > +	depends on BR2_INIT_SYSTEMD

What about eudev? If it works with eudev as well then you should depend
on BR2_PACKAGE_HAS_UDEV instead.

> +	select BR2_PACKAGE_LIBGLIB2

I know the systemd dependency implies this, but for consistency (and in
case the dependency is dropped in the future) it would be good to copy
the toolchain dependencies of libglib2 (and the comment).

> +	help
 > +	  This library provides GObject bindings for libudev.
 > +	  It was originally part of udev-extras, then udev, then systemd.
 > +	  It's now a project on its own.
 > +	  Required for building NetworkManager.

gudev is probably useful for a bunch of other stuff, so I would drop the
NM reference here.

> +################################################################################
 > +#
 > +# libgudev
 > +#
 > +################################################################################
 > +
 > +LIBGUDEV_VERSION = 230
 > +LIBGUDEV_SOURCE = libgudev-$(LIBGUDEV_VERSION).tar.xz
 > +LIBGUDEV_SITE = http://ftp.gnome.org/pub/GNOME/sources/libgudev/$(LIBGUDEV_VERSION)
 > +LIBGUDEV_INSTALL_STAGING = YES
 > +
 > +LIBGUDEV_DEPENDENCIES = host-pkgconf udev libglib2
 > +
 > +LIBGUDEV_LICENSE = GPLv2

No _LICENSE_FILES ? There seems to be a COPYING file in the repo. A
bunch of files also have the 'or (at your option) any later version'
text so it should be GPLv2+.

> +
 > +$(eval $(autotools-package))
 > diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
 > index bcf8f90..8b4607c 100644
 > --- a/package/network-manager/Config.in
 > +++ b/package/network-manager/Config.in
 > @@ -11,6 +11,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 >  	select BR2_PACKAGE_GNUTLS
 >  	select BR2_PACKAGE_LIBGCRYPT
 >  	select BR2_PACKAGE_LIBNL
 > +	select BR2_PACKAGE_LIBGUDEV

Does that mean that NM doesn't build today?

NM doesn't require systemd (and shouldn't), so you cannot just select
gudev here.

-- 
Bye, Peter Korsgaard

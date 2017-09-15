From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Sep 2017 02:09:06 +0200
Subject: [Buildroot] [RFC v2] libvirt: new package
In-Reply-To: <1505421391-11951-1-git-send-email-casantos@datacom.ind.br>
References: <1505421391-11951-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20170915020906.7ea90b5e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Sep 2017 17:36:31 -0300, Carlos Santos wrote:

> +LIBVIRT_VERSION = 3.7.0
> +LIBVIRT_SITE = http://libvirt.org/sources
> +LIBVIRT_SOURCE = libvirt-$(LIBVIRT_VERSION).tar.xz
> +LIBVIRT_LICENSE = LGPL-2.1+
> +LIBVIRT_LICENSE_FILES = COPYING
> +# LIBVIRT_INSTALL_STAGING = YES

Commented line ?

> +LIBVIRT_DEPENDENCIES = libnl libtirpc libxml2 lvm2 yajl
> +
> +ifeq ($(BR2_PACKAGE_EUDEV),y)
> +LIBVIRT_DEPENDENCIES += eudev libpciaccess
> +endif

Why do you handle eudev specifically here? Isn't the udev
implementation in systemd not suitable?

I.e, I believe this should be:

ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
LIBVIRT_DEPENDENCIES += udev libpciaccess
endif

And of course, adjust Config.in accordingly.

> +LIBVIRT_CONF_ENV += \
> +	CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`" \
> +	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`"

Why is libtirpc unconditionally necessary? The RPC implementation built
into the C library is not sufficient ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 21:55:08 +0200
Subject: [Buildroot] [PATCH] libglob: new package
In-Reply-To: <20160801195836.30837-1-joerg.krause@embedded.rocks>
References: <20160801195836.30837-1-joerg.krause@embedded.rocks>
Message-ID: <20161025215508.7fe47ff8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 Aug 2016 21:58:36 +0200, J?rg Krause wrote:
> libglob is the OpenBSD implementation of glob(3).
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

I've applied your patch, with one minor change (see below).

I remember this was necessary to fix the build of a package with musl.
Do you remember which one?

> +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)

I've added:

LIBGLOB_MAKE_TARGETS += libglob.so

here.

> +# $1: destination directory
> +define LIBGLOB_INSTALL_SHARED
> +	$(INSTALL) -m 0755 -D $(@D)/libglob.so.0.0.0 \
> +		$(1)/usr/lib/libglob.so.0.0.0
> +	ln -sf libglob.so.0.0.0 $(1)/usr/lib/libglob.so.0
> +	ln -sf libglob.so.0.0.0 $(1)/usr/lib/libglob.so
> +endef
> +endif
> +
> +ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)

LIBGLOB_MAKE_TARGETS += libglob.a

here.

> +# $1: destination directory
> +define LIBGLOB_INSTALL_STATIC
> +	$(INSTALL) -m 0644 -D $(@D)/libglob.a $(1)/usr/lib/libglob.a
> +endef
> +endif
> +
> +define LIBGLOB_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +		$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),libglob.so) \
> +		$(if $(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),libglob.a)

And replaced those two lines by:

		$(LIBGLOB_MAKE_TARGETS)

This way, we have the conditions around static/shared only in one place.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 May 2020 07:19:40 +0200
Subject: [Buildroot] [PATCH 1/1] gloox: new package
In-Reply-To: <87mu652623.fsf@tarshish>
References: <G4_UACKbOFKjHR50_oA8x38rKahD3d3KT7v9YY7fcByR5rBGJhwFZfRO9mUhQhPDAsGdwahC-DSbPnuOW0keUGQYX4lIKuc3d3LGAG-Auqo=@protonmail.com>
 <87mu652623.fsf@tarshish>
Message-ID: <20200518071940.04c47501@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 May 2020 07:57:56 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> > +GLOOX_CXXFLAGS = $(TARGET_CXXFLAGS)
> > +
> > +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
> > +GLOOX_CXXFLAGS += -O0
> > +endif
> > +
> > +GLOOX_CONF_ENV = CXXFLAGS="$(GLOOX_CXXFLAGS)"
> > +
> > +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> > +GLOOX_CONF_ENV += LIBS=-latomic
> > +endif
> > +
> > +GLOOX_INSTALL_STAGING = YES

This is usually closer to the top of the file, next the
license/autoreconf variables.

> > +ifeq ($(BR2_PACKAGE_ZLIB),y)
> > +GLOOX_DEPENDENCIES += zlib
> > +endif
> > +
> > +HOST_GLOOX_CONF_ENV += CXXFLAGS="$(HOST_CXXFLAGS)"

This is this needed.

> > +
> > +GLOOX_CONF_OPTS = \
> > +		 --with-pic \

Please indent with one tab. Also --with-pic should probably only be
added when BR2_STATIC_LIBS is false.

> > +		 --with-zlib \  
> 
> This should be conditional on BR2_PACKAGE_ZLIB.
> 
> > +		 --with-libidn=no \

Please use --without-libidn

> > +		 --enable-getaddrinfo \
> > +		 --with-gnutls=no \  
> 
> It would be nice to add conditional support for GnuTLS.

And please use --with-gnutls / --without-gnutls

> 
> > +		 --with-openssl=yes  
> 
> This should be conditional on OpenSSL. You also need to add it to
> DEPENDENCIES to make sure it builds before gloox.

And use --with-openssl / --without-openssl, instead of
--with-openssl=yes / --with-openssl=no.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

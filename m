From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 22:29:57 +0100
Subject: [Buildroot] [PATCH 1/2] x265: new package
In-Reply-To: <1445716229-40660-1-git-send-email-thijsvermeir@gmail.com> (Thijs
 Vermeir's message of "Sat, 24 Oct 2015 21:50:28 +0200")
References: <1445716229-40660-1-git-send-email-thijsvermeir@gmail.com>
Message-ID: <87d1w2fxgq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thijs" == Thijs Vermeir <thijsvermeir@gmail.com> writes:

 > x265 is a H.265 / HEVC video encoder application library, designed to encode
 > video or images into an H.265 / HEVC encoded bitstream.

 > http://x265.org

 > Signed-off-by: Thijs Vermeir <thijsvermeir@gmail.com>

> +++ b/package/x265/x265.mk
 > @@ -0,0 +1,31 @@
 > +################################################################################
 > +#
 > +# x265
 > +#
 > +################################################################################
 > +
 > +X265_VERSION = 1.8
 > +X265_SOURCE = x265_$(X265_VERSION).tar.gz
 > +X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
 > +X265_LICENSE = GPLv2+
 > +X265_LICENSE_FILES = COPYING
 > +X265_SUBDIR = source/

NIT: we normally don't append the trailing '/'.

> +X265_INSTALL_STAGING = YES
 > +
 > +ifeq ($(BR2_i386)$(BR2_x86_64),y)
 > +X265_DEPENDENCIES += host-yasm
 > +endif
 > +
 > +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
 > +X265_CONF_OPTS += -DENABLE_SHARED=true -DENABLE_PIC=true
 > +else
 > +X265_CONF_OPTS += -DENABLE_SHARED=false
 > +endif

Any idea why the x265 developers don't use the "standard"
BUILD_SHARED_LIBS=ON|OFF flag like other packages?

> +
 > +ifeq ($(BR2_PACKAGE_X265_CLI),)
 > +X265_CONF_OPTS += -DENABLE_CLI=false
 > +else
 > +X265_CONF_OPTS += -DENABLE_CLI=true
 > +endif

We prefer positive logic, so I've swapped these around.

Committed, thanks.

-- 
Bye, Peter Korsgaard

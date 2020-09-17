From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 22:42:23 +0200
Subject: [Buildroot] [PATCH 2/6] package/libwpe: switch over to Meson
In-Reply-To: <20200915223053.3090447-3-aperez@igalia.com>
References: <20200915223053.3090447-1-aperez@igalia.com>
 <20200915223053.3090447-3-aperez@igalia.com>
Message-ID: <20200917224223.10a07628@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Sep 2020 01:30:49 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
> index 6c3a1d354a..369ef5824a 100644
> --- a/package/libwpe/libwpe.mk
> +++ b/package/libwpe/libwpe.mk
> @@ -14,9 +14,8 @@ LIBWPE_DEPENDENCIES = libegl libxkbcommon
>  
>  # Workaround for https://github.com/raspberrypi/userland/issues/316
>  ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
> -LIBWPE_CONF_OPTS += \
> -	-DCMAKE_C_FLAGS='$(TARGET_CFLAGS) -D_GNU_SOURCE' \
> -	-DCMAKE_CXX_FLAGS='$(TARGET_CFLAGS) -D_GNU_SOURCE'
> +LIBWPE_CFLAGS += -D_GNU_SOURCE
> +LIBWPE_CXXFLAGS += -D_GNU_SOURCE
>  endif

Unfortunately pkg-meson.mk does this:

$(2)_CFLAGS ?= $$(TARGET_CFLAGS)
$(2)_LDFLAGS ?= $$(TARGET_LDFLAGS)
$(2)_CXXFLAGS ?= $$(TARGET_CXXFLAGS)

So, with your libwpe.mk, it means that when BR2_PACKAGE_RPI_USERLAND is
disabled, LIBWPE_CFLAGS is not defined by libwpe.mk, and the
$(TARGET_CFLAGS) value will be used by pkg-meson.mk.

However, if BR2_PACKAGE_RPI_USERLAND=y, LIBWPE_CFLAGS will be non-empty
by the time the meson-package infrastructure is invoked, and so you
LIBWPE_CFLAGS will contain only -D_GNU_SOURCE and not the other
$(TARGET_CFLAGS).

I fixed that up and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

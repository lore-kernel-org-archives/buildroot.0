From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 14:45:18 +0100
Subject: [Buildroot] [PATCH v2] libvips: fix compile error for sparc64
In-Reply-To: <20151123214222.GA8423@waldemar-brodkorb.de>
References: <20151123214222.GA8423@waldemar-brodkorb.de>
Message-ID: <20151129144518.34fd1a05@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar,

On Mon, 23 Nov 2015 22:42:22 +0100, Waldemar Brodkorb wrote:

> diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
> index d6dddc8..eb034b1 100644
> --- a/package/libvips/libvips.mk
> +++ b/package/libvips/libvips.mk
> @@ -12,6 +12,17 @@ LIBVIPS_LICENSE = LGPLv2.1+
>  LIBVIPS_LICENSE_FILES = COPYING
>  # We're patching gtk-doc.make, so need to autoreconf
>  LIBVIPS_AUTORECONF = YES
> +
> +# Sparc64 compile fails, this seems to be caused by the -Os option we pass
> +# by default. To fix the problem, use -O0 with no optimization instead.
> +ifeq ($(BR2_sparc64),y)
> +LIBVIPS_CXXFLAGS = $(filter-out -Os,$(TARGET_CXXFLAGS))
> +LIBVIPS_CXXFLAGS += -O0
> +else
> +LIBVIPS_CXXFLAGS = $(TARGET_CXXFLAGS)
> +endif
> +LIBVIPS_CONF_ENV += CXXFLAGS="$(LIBVIPS_CXXFLAGS)"

I am still not super happy with this solution, since it's really work
arounding a compiler bug it seems, and the way it's implemented will
never allow to notice when the bug gets fixed. But I don't really have
a much better solution.

Has at least the problem been reported to upstream gcc? If it's already
reported, do you have a pointer to the upstream bug?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

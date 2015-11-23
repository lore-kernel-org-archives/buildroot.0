From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Nov 2015 18:34:21 +0100
Subject: [Buildroot] [PATCH] libvips: fix compile error for sparc64
In-Reply-To: <20151123164703.GA28731@waldemar-brodkorb.de>
References: <20151123164703.GA28731@waldemar-brodkorb.de>
Message-ID: <20151123183421.200180c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar,

On Mon, 23 Nov 2015 17:47:03 +0100, Waldemar Brodkorb wrote:

> +# Sparc64 compile fails, this seems to be caused by the -Os option we pass
> +# by default. To fix the problem, use -O2 with normal optimization instead.

This looks like a compiler bug. Could you check if you can reproduce it
with gcc 5.2, and if you can, submit a bug report to the gcc project ?

> +ifeq ($(BR2_sparc64),y)
> +LIBVIPS_CXXFLAGS := $(filter-out -Os,$(TARGET_CXXFLAGS))

Should be = and not :=

> +LIBVIPS_CXXFLAGS += -O2
> +else
> +LIBVIPS_CXXFLAGS := $(TARGET_CFLAGS)

You should use TARGET_CXXFLAGS here.

> +endif
> +LIBVIPS_CONF_ENV += CXXFLAGS="$(LIBVIPS_CFLAGS)"

Did you test this? The LIBVIPS_CFLAGS variable is not defined anywhere,
you're defining LIBVIPS_CXXFLAGS.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

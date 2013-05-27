From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 May 2013 11:23:45 +0200
Subject: [Buildroot] [PATCH 1/1] infra: allow running 'make clean
 menuconfig ; make *-menuconfig'
In-Reply-To: <1369645352-11942-1-git-send-email-s.martin49@gmail.com>
References: <1369645352-11942-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20130527112345.1741b563@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Mon, 27 May 2013 11:02:32 +0200, Samuel Martin wrote:

> +# Inconditionnaly add host-ccache dependency when BR2_CCACHE is enabled.
> +# This allows to run the following without failing on test the compiler
> +# because the ccache binary is not yet built:
> +#
> +# $ make clean menuconfig
> +# $ make [linux|ctng|uclibc|barebox|busybox]-menuconfig
> +ifeq ($(BR2_CCACHE),y)
> +ifneq ($(1),host-ccache)
> +$(2)_DEPENDENCIES += host-ccache
> +endif
> +endif

I am not sure we want to make this specific to the ccache problem. The
linux-menuconfig target also needs to depend on "dirs" so that the base
directories need to be created.

Shouldn't we depend on something like $(BASE_TARGETS) instead, which
will then contain "host-ccache dirs", and everything that's needed?
Also, all packages depend on the toolchain (but beware, binutils is
also a package, and is part of the toolchain).

So just like everything in the core infrastructure: I don't want a
patch that just fixes the particular problem of this bug by adding more
crap. I want something that clarifies the dependency of packages on
"base" things, and makes it work properly.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

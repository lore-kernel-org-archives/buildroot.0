From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 19:05:47 +0200
Subject: [Buildroot] [PATCH 2/3] package/libgc: add Boehm-Demers-Weiser
 gc library
In-Reply-To: <1397225156-23112-3-git-send-email-alex.bennee@linaro.org>
References: <1397225156-23112-1-git-send-email-alex.bennee@linaro.org>
 <1397225156-23112-3-git-send-email-alex.bennee@linaro.org>
Message-ID: <20140416190547.14a2dc36@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Benn?e,

I applied your patch, but there were several problems to fix. See
below for details.

On Fri, 11 Apr 2014 15:05:55 +0100, Alex Benn?e wrote:

> diff --git a/package/libgc/Config.in b/package/libgc/Config.in
> new file mode 100644
> index 0000000..5bceb3d
> --- /dev/null
> +++ b/package/libgc/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_LIBGC
> +	bool "libgc"
> +	select BR2_PACKAGE_LIBATOMIC_OPS

When you select a package, you need to duplicate the dependencies of
that package. So here, you should have duplicate the dependencies of
the libatomic_ops package. To make this easier, I've made a small
change to the libatomic_ops package so that it provides a
BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS Config.in option that other
packages can depend on.

> +	help
> +	  The Boehm-Demers-Weiser conservative garbage collector can be used
> +	  as a garbage collecting replacement for C malloc or C++ new. It allows
> +	  you to allocate memory basically as you normally would, without
> +	  explicitly deallocating memory that is no longer useful.
> +
> +	  http://www.hboehm.info/gc/
> diff --git a/package/libgc/libgc.mk b/package/libgc/libgc.mk
> new file mode 100644
> index 0000000..e3c5bf1
> --- /dev/null
> +++ b/package/libgc/libgc.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# libgc
> +#
> +################################################################################
> +
> +LIBGC_VERSION = 7.4.0
> +LIBGC_SOURCE = gc-${LIBGC_VERSION}.tar.gz

We normally use $(...) to reference make variables, not ${...}.

> +LIBGC_SITE = http://www.hboehm.info/gc/gc_source/
> +LIBGC_DEPENDANCIES += libatomic_ops

It should have been DEPENDENCIES, and the += is unnecessary, = is
enough.

> +LIBGC_LICENSE = GPLv1+

libgc is apparently not under GPLv1+, but under some X11-like
permissive license.

> +LIBGC_LICENSE_FILES = COPYING

There was no file named COPYING, the copyright details are found in the
README.md file.

> +LIBGC_INSTALL_STAGING = YES
> +
> +$(eval $(autotools-package))

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

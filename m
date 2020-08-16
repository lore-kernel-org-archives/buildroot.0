From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Aug 2020 23:46:32 +0200
Subject: [Buildroot] [PATCH 1/2] package/re2: new package
In-Reply-To: <20200813144549.1262366-2-buildroot@heine.tech>
References: <20200813144549.1262366-1-buildroot@heine.tech>
 <20200813144549.1262366-2-buildroot@heine.tech>
Message-ID: <20200816234632.1bf3fbd2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Aug 2020 16:45:48 +0200
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

> RE2 is a fast, safe, thread-friendly alternative to backtracking
> regular expression engines like those used in PCRE, Perl, and
> Python. It is a C++ library.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Thanks, I've applied to master, with a few changes.

> ---
>  package/Config.in     |  1 +
>  package/re2/Config.in | 12 ++++++++++++
>  package/re2/re2.hash  |  3 +++
>  package/re2/re2.mk    | 25 +++++++++++++++++++++++++
>  4 files changed, 41 insertions(+)

You forgot to add an entry in the DEVELOPERS file, so I've done so.

> diff --git a/package/re2/Config.in b/package/re2/Config.in
> new file mode 100644
> index 0000000000..d1dcb693ea
> --- /dev/null
> +++ b/package/re2/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_RE2
> +	bool "re2"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC

Even though it uses std::atomic, I'm not sure it needs the atomic
intrinsics of the compiler. Indeed, I tried building for SPARC, where
the atomic built-ins are implemented in the libatomic.so library, and
even without linking to this library, re2 builds fine.

So I've dropped this dependency. We'll see if we have any build
failure, and we can adjust.

> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # needs C++11
> +	help
> +	  RE2 is a fast, safe, thread-friendly alternative
> +	  to backtracking regular expression engines like
> +	  those used in PCRE, Perl, and Python.
> +	  It is a C++ library.
> +
> +	  https://github.com/google/re2

You forgot a Config.in comment about the dependency (C++, gcc >= 4.8),
so I've added that.


> +RE2_VERSION = 2020-08-01
> +RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
> +RE2_LICENSE = BSD

BSD is not specific enough. In this case, it should have been BSD-3-Clause.

> +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> +RE2_CONF_OPTS += \
> +	-DBUILD_SHARED_LIBS=ON
> +HOST_RE2_CONF_OPTS += \
> +	-DBUILD_SHARED_LIBS=ON

This was not needed: BUILD_SHARED_LIBS is handled by the cmake-package
infrastructure.

Thanks, applied with those changes!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

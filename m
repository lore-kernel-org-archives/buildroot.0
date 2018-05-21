From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 May 2018 10:29:05 +0200
Subject: [Buildroot] [PATCH 1/1] Adding support to conditionally build
 the GNAT Ada compiler in the toolchain.
In-Reply-To: <20180521013248.22532-1-glen.m.cornell@gmail.com>
References: <20180521013248.22532-1-glen.m.cornell@gmail.com>
Message-ID: <20180521102905.00f0a365@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Glen,

Thanks for this contribution! First of all, your patch didn't make it
to the Buildroot mailing list. Perhaps you forgot to subscribe to the
mailing list ? If you don't want to receive all the mailing list
traffic, you can subscribe and then disable mail delivery.

See below for some comments about your submission.

First of all, the commit title should be something like:

	gcc: add support for building the Ada compiler

On Sun, 20 May 2018 21:32:48 -0400, Glen Cornell wrote:
> Signed-off-by: Glen Cornell <glen.m.cornell@gmail.com>
> ---
>  package/gcc/Config.in.host         | 12 ++++++++++++
>  package/gcc/gcc-final/gcc-final.mk |  1 +
>  2 files changed, 13 insertions(+)
> 
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 7c08fb3596..06ffe586af 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -92,6 +92,18 @@ config BR2_TOOLCHAIN_BUILDROOT_CXX
>  	  C++ language and you want C++ libraries to be installed on
>  	  your target system.
>  
> +config BR2_TOOLCHAIN_BUILDROOT_ADA
> +	bool "Enable Ada support"
> +	select BR2_INSTALL_LIBSTDCPP
> +	select BR2_SHARED_STATIC_LIBS

You can't select BR2_SHARED_STATIC_LIBS, because this option is part of
a choice. You can only "depends on BR2_SHARED_STATIC_LIBS".

But first and foremost, why do you need BR2_SHARED_STATIC_LIBS ?

> +	help
> +	  Enable this option if you want your toolchain to support the
> +	  Ada language.  Note: Not only must your native host compiler
> +	  support Ada

For this one, we need to add something like BR2_NEEDS_HOST_GNAT in the
main Config.in option (like BR2_NEEDS_HOST_JAVAC). This option will be
selected by BR2_TOOLCHAIN_BUILDROOT_ADA, and
support/dependencies/dependencies.sh should check that a host Ada
compiler is available.

>, but also the libstdc++.a static library must be
> +	  installed on your build host.

This looks weird. Why ?

>  Selecting this option will
> +	  also build the C++ compiler and static libraries, which are
> +	  required to build support for Ada in gcc.

We don't really need this paragraph I believe.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

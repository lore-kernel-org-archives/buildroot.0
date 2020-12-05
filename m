From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 22:00:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/boost: atomics needs always
 lockfree atomic bytes
In-Reply-To: <20201127174829.172699-1-fontaine.fabrice@gmail.com>
References: <20201127174829.172699-1-fontaine.fabrice@gmail.com>
Message-ID: <20201205220006.6697e97f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri, 27 Nov 2020 18:48:29 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Since version 1.74.0, boost atomics needs a toolchain that always
> supports lockfree atomic bytes so add dependendy on
> BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS:
> https://github.com/boostorg/atomic/issues/42
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c03a786791e3aa7801cf1bff9934c4a105f54ce1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks for the research! A couple of comments/questions below.

> diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
> index 65af15293d..8c5d9fb8fa 100644
> --- a/package/bitcoin/Config.in
> +++ b/package/bitcoin/Config.in
> @@ -10,6 +10,7 @@ config BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
>  config BR2_PACKAGE_BITCOIN
>  	bool "bitcoin"
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
>  	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
> @@ -36,7 +37,8 @@ config BR2_PACKAGE_BITCOIN
>  	  https://bitcoincore.org
>  
>  comment "bitcoin needs a toolchain w/ C++, threads, wchar"
> -	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS || \

This should be a && here, as we want to see the comment only if the
arch is supported *and* lock free atomics are provided.

>  config BR2_PACKAGE_BOOST_THREAD
>  	bool "boost-thread"
> +	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
> -	select BR2_PACKAGE_BOOST_ATOMIC if !BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> +	select BR2_PACKAGE_BOOST_ATOMIC

Are you sure there ? boost-atomic was only needed by boost-thread *if*
the toolchain did not provide lock free atomic ints. But anyway, now
boost-atomic always requires lockfree atomic ints.

So are you sure boost-atomic still has to be selected here ?


>  comment "gqrx needs a toolchain w/ C++, threads, wchar, dynamic library"
>  	depends on BR2_USE_MMU # gnuradio
> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC

This should have been a && here.

> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC || \
> +		BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS

And so another && it should be there.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

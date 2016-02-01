From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2016 18:38:42 +0100
Subject: [Buildroot] [PATCH v2 3/8] mongrel2: allow using uClibc but
	only on certain architectures
In-Reply-To: <1453929930-18215-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 27 Jan 2016 22:25:25 +0100")
References: <1453929930-18215-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453929930-18215-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8760y8cov1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > mongrel2 uses  the {get,make,swap}context functions:

extra space before 'the'.

> +# mongrel2 uses {get,make,swap}context() functions, which are
 > +# available in glibc for all architectures and in uClibc only for a
 > +# subset of the architectures
 > +config BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS
 > +	bool
 > +	default y if BR2_TOOLCHAIN_USES_GLIBC
 > +	default y if BR2_TOOLCHAIN_USES_UCLIBC && \
 > +		(BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_x86_64)
 > +
 > +comment "mongrel2 needs a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library"
 >  	depends on !BR2_INSTALL_LIBSTDCPP || \
 >  		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 > -		BR2_STATIC_LIBS
 > +		BR2_STATIC_LIBS || !BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS
 
 >  config BR2_PACKAGE_MONGREL2
 >  	bool "mongrel2"
 > @@ -14,11 +20,7 @@ config BR2_PACKAGE_MONGREL2
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 >  	depends on BR2_USE_WCHAR # zeromq -> util-linux
 >  	depends on !BR2_STATIC_LIBS # uses dlopen()
 > -	# {get,make,swap}context functions present in
 > -	# {e,}glibc and in uClibc's master branch. Source has arm workaround
 > -	depends on BR2_UCLIBC_VERSION_SNAPSHOT || \
 > -		BR2_TOOLCHAIN_USES_GLIBC || \
 > -		BR2_arm
 > +	depends on BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS

So it used to be available for musl on arm, but isn't any more. Is that
on purpose?

-- 
Bye, Peter Korsgaard

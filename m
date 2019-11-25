From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 21:30:01 +0100
Subject: [Buildroot] [PATCH/next v3 1/4] spidermonkey: new package
In-Reply-To: <20191125175031.4086339-2-aduskett@gmail.com>
References: <20191125175031.4086339-1-aduskett@gmail.com>
 <20191125175031.4086339-2-aduskett@gmail.com>
Message-ID: <20191125213001.2044ce72@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Nov 2019 09:50:28 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <aduskett@greenlots.com>

The commit title should have been "package/spidermonkey: new package".

> diff --git a/package/spidermonkey/Config.in b/package/spidermonkey/Config.in
> new file mode 100644
> index 0000000000..487db6ac6d
> --- /dev/null
> +++ b/package/spidermonkey/Config.in
> @@ -0,0 +1,47 @@
> +config BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_aarch64
> +	default y if BR2_arm || BR2_armeb
> +	default y if BR2_i386 || BR2_x86_64
> +	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
> +	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
> +	default y if BR2_riscv
> +	default y if BR2_sh4 || BR2_sh4a
> +	default y if BR2_sparc || BR2_sparc64
> +
> +config BR2_PACKAGE_SPIDERMONKEY_JIT_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_aarch64  || BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64
> +
> +config BR2_PACKAGE_SPIDERMONKEY
> +	bool "spidermonkey"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnspr
> +	depends on BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # needs pthread_getattr_np()
> +	depends on BR2_USE_MMU # fork in executable tools.
> +	depends on BR2_USE_WCHAR
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # No way to check for fenv support.
> +	depends on !BR2_STATIC_LIBS # dlopen
> +	select BR2_PACKAGE_HOST_PYTHON
> +	select BR2_PACKAGE_HOST_PYTHON_SSL
> +	select BR2_PACKAGE_LIBNSPR
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  SpiderMonkey is the code-name for Mozilla Firefox's C++
> +	  implementation of JavaScript. It is intended to be embedded in
> +	  other applications that provide host environments for
> +	  JavaScript.
> +
> +	  https://developer.mozilla.org/en-US/docs/Mozilla/Projects/SpiderMonkey
> +
> +comment "spidermonkey needs a glibc or musl toolchain with C++, wchar, dynamic library, NPTL, gcc >= 4.9"
> +	depends on BR2_USE_MMU
> +	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT

You forgot BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS here. However I've
simplified things by moving the "depends on
BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT" into the definition of
BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS.

> +SPIDERMONKEY_DEPENDENCIES = \
> +	host-python \
> +	libnspr \
> +	zlib
> +
> +SPIDERMONKEY_CONF_ENV += \

= sign is sufficient here.

I've applied to next with those fixes.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

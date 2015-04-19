From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 14:49:59 +0200
Subject: [Buildroot] [PATCH v3 08/11] webkitgtk24: new package
In-Reply-To: <1429436906-15222-9-git-send-email-gustavo@zacarias.com.ar>
References: <1429436906-15222-1-git-send-email-gustavo@zacarias.com.ar>
 <1429436906-15222-9-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150419144959.330b99b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 19 Apr 2015 06:48:23 -0300, Gustavo Zacarias wrote:
> Add new webkitgtk24 package.
> 
> The difference with the legacy webkit package is that this one uses the
> new webkit2 API, and optionally the webkit1 API.
> 
> It's versioned because the latest release of midori can't use the newer
> 2.6.x or 2.8.x webkitgtk versions yet.
> 
> This paves the way for a newer webkitgtk26 or webkitgtk28 package that
> can live side-by-side with this one for other uses.

I'm a bit unhappy with webkitgtk24 as the name. Are the newer versions
API incompatible? Also, is it possible to install both webkitgtk24 and
webkitgtk26 or 28 on the same system?

> diff --git a/package/webkitgtk24/Config.in b/package/webkitgtk24/Config.in
> new file mode 100644
> index 0000000..2057546
> --- /dev/null
> +++ b/package/webkitgtk24/Config.in
> @@ -0,0 +1,56 @@
> +config BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
> +	bool
> +	# ARM needs BLX, so v5t+
> +	default y if (BR2_arm || BR2_armeb) && !BR2_ARM_CPU_ARMV4
> +	# i386 / x86_64 external toolchains have issues
> +	# https://bugs.webkit.org/show_bug.cgi?id=132231
> +	# https://stackoverflow.com/questions/9140019/yield-is-not-a-member-of-stdthis-thread
> +	default y if BR2_i386 || BR2_x86_64
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
> +	# Disabled on powerpc due to bug https://bugs.webkit.org/show_bug.cgi?id=113638
> +	# Disabled on mips due to sigbus
> +	depends on BR2_USE_MMU # libglib2

Wow, so all in all, it's only available on ARM and x86/x86-64. Not a
huge list of supported architectures. But OK.

> +
> +comment "webkitgtk24 needs libgtk2 and a toolchain w/ C++, wchar, NPTL"
> +	depends on BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
> +	depends on BR2_ARCH_HAS_ATOMICS
> +	depends on !BR2_PACKAGE_LIBGTK2 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
> +		|| !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
> +	depends on BR2_USE_MMU
> +
> +config BR2_PACKAGE_WEBKITGTK24
> +	bool "webkitgtk 2.4.x"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	depends on (BR2_PACKAGE_LIBGTK2 && BR2_PACKAGE_XORG7)

Here you require gtk2 + xorg7, but not in the comment above. Is this
expected?

> +	depends on BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
> +	depends on BR2_ARCH_HAS_ATOMICS
> +	select BR2_PACKAGE_CAIRO
> +	select BR2_PACKAGE_CAIRO_PNG
> +	select BR2_PACKAGE_ENCHANT
> +	select BR2_PACKAGE_HARFBUZZ
> +	select BR2_PACKAGE_ICU
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBSECRET
> +	select BR2_PACKAGE_LIBSOUP
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_LIBXSLT
> +	select BR2_PACKAGE_SQLITE
> +	select BR2_PACKAGE_WEBP
> +	select BR2_PACKAGE_XLIB_LIBXT if BR2_PACKAGE_XORG7
> +	# MESA3D because it wants xcomposite/xdamage if GL/glx.h is found
> +	# even if the GL* backends are disabled
> +	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_HAS_LIBGL || \
> +		(BR2_PACKAGE_HAS_LIBGLES && BR2_PACKAGE_HAS_LIBEGL) || \
> +		BR2_PACKAGE_MESA3D

The libgles + libegl case looks a bit weird. Such a configuration is
normally used *without* X.org, so why would we select some X.org
libraries in this case?


> +# make 3.81 loops into oblivion with numjobs > 1
> +ifeq ($(findstring x3.81,x$(MAKE_VERSION)),)
> +WEBKITGTK24_MAKE = $(MAKE1)
> +endif

Aah, that's how you solved the infinite loop.

> +# Give explicit path to icu-config and prevent ar to make thin archives.
> +WEBKITGTK24_CONF_ENV = ac_cv_path_icu_config=$(STAGING_DIR)/usr/bin/icu-config \
> +	AR_FLAGS="cru"

"prevent ar from making thin archives" ?

And why? :-)

> +# Some 32-bit architectures need libatomic support for 64-bit ops
> +ifeq ($(BR2_i386)$(BR2_mips)$(BR2_mipsel),y)
> +WEBKITGTK24_CONF_ENV += LIBS="-latomic"
> +endif
> +
> +WEBKITGTK24_CONF_OPTS = \
> +	--enable-dependency-tracking \

Why? Yes it is in the older webkit, but do we have a reason to have it
here?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

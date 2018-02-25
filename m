From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 17:23:34 +0100
Subject: [Buildroot] Building Kodi; dependencies
In-Reply-To: <CAPzckP6rcjcRLvdCfPYr5bFUv6JVg6PShaxzq0yirmR41_T3XQ@mail.gmail.com>
References: <CAPzckP6rcjcRLvdCfPYr5bFUv6JVg6PShaxzq0yirmR41_T3XQ@mail.gmail.com>
Message-ID: <20180225172334.131f0b72@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Feb 2018 11:59:05 +0100, Sjoerd Venema wrote:

> Coming from:
> 
> comment "kodi needs python w/ .py modules, a uClibc or glibc toolchain w/
> C++, threads, wchar, dynamic library, gcc >= 4.8, host gcc >= 4.6"
> depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
> depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS\
> || !BR2_USE_WCHAR || BR2_STATIC_LIBS \
> || !BR2_HOST_GCC_AT_LEAST_4_6 \
> || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
> || BR2_TOOLCHAIN_USES_MUSL \
> || !BR2_PACKAGE_PYTHON \
> || BR2_PACKAGE_PYTHON_PYC_ONLY
> 
> First off, I assume the ! means a Not, so, for example  !BR2_USE_WCHAR
> means that BR2_USE_WCHAR must be [=n]. Correct?

You are looking at the dependencies of the comment, not the
dependencies of the option. So they are inverted.

For Kodi to build, wchar support must be available in the toolchain,
i.e BR2_USE_WCHAR must be 'y'. Therefore BR2_PACKAGE_KODI has a
"depends on BR2_USE_WCHAR"

Due to this dependency, the "kodi" option is not visible to the user
when wchar support is not enabled. In an attempt to help the user, in
such a situation we show the comment that you have seen. And therefore,
this comment is shown when one of the dependencies missing. Hence is
has a "depends on !BR2_USE_WCHAR" so that the comment appears when
wchar is *NOT* available.

Summary: enable BR2_USE_WCHAR.

> Secondly, can I set all these dependencies via make menuconfig? Or do I
> have to configure things outside of that environment?

Everything must be configured from inside menuconfig (unless you really
know what you're doing, in which case you can manually edit the .config
file).

> Now, a "catch 22" seems to be for example: BR2_TOOLCHAIN_HAS_THREADS (must
> be false)

No, BR2_TOOLCHAIN_HAS_THREADS must be true. See above my explanation
about the comment.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

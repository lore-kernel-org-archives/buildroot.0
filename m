From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 14:55:08 +0200
Subject: [Buildroot] [PATCH] package/lame: Fix compile on 32bit Intel
 with gcc-4.9.x
In-Reply-To: <XnsA38C830E65DF6berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1408227494-20770-1-git-send-email-bernd.kuhls@t-online.de>
 <20140817093621.664fad88@free-electrons.com>
 <XnsA38C830E65DF6berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20140817145508.22d9d4ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 17 Aug 2014 12:53:00 +0200, Bernd Kuhls wrote:

> I understand, but removing the gcc version check, which would remove 
> support for xmmintrin.h in all i386 builds, would remove the mmx support 
> for lame on many builds, where it is not necessary.

Yes, understood. Maybe instead add some conditional code in lame to
enable the MMX stuff only with known working gcc versions? I think
there are some #define you can test to get the gcc version.

> Would something like this, extended to all external toolchains, be 
> acceptable?
> 
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -18,6 +18,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
>         select BR2_INSTALL_LIBSTDCPP
>         select BR2_HOSTARCH_NEEDS_IA32_LIBS
>         select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
> +       select BR2_GCC_VERSION_4_9_X
>         help
>           Linaro toolchain for the ARM architecture. It uses Linaro
>           GCC 2014.05 (based on gcc 4.9), Linaro GDB 2014.05 (based on

That works only for "known" external toolchains: it won't work with
custom external toolchains.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Justin Berger <j.david.berger@gmail.com>
Date: Tue, 5 Apr 2016 20:55:26 -0600
Subject: [Buildroot] [PATCH] ilixi: new package
In-Reply-To: <1459910836-12815-1-git-send-email-j.david.berger@gmail.com>
References: <1459910836-12815-1-git-send-email-j.david.berger@gmail.com>
Message-ID: <CAPWb3NQ6nw3r5YOV9pMZnu1X1tUbh9F7TTKXYBC_00KOrQBUjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Apologies, in getting used to the git send-mail tool, I sent it off without
any other notes.

I didn't check it explicitly against 4.7, but I looked at the supported C++
features in 4.7 vs 4.8 and it looked like it should work. Currently the
only GCC options that show up in the menuconfig though are 4.8 and onwards,
is the reason to prefer 4.7 vs 4.8 for people to backport?

Thanks for the guidance on this package!
Justin

On Tue, Apr 5, 2016 at 8:47 PM, Justin Berger <j.david.berger@gmail.com>
wrote:

> ---
>  package/Config.in                                 |  1 +
>  package/ilixi/0001-Added-ifdef-around-iconv.patch | 28
> +++++++++++++++++++++++
>  package/ilixi/Config.in                           | 26
> +++++++++++++++++++++
>  package/ilixi/ilixi.hash                          |  1 +
>  package/ilixi/ilixi.mk                            | 28
> +++++++++++++++++++++++
>  5 files changed, 84 insertions(+)
>  create mode 100644 package/ilixi/0001-Added-ifdef-around-iconv.patch
>  create mode 100644 package/ilixi/Config.in
>  create mode 100644 package/ilixi/ilixi.hash
>  create mode 100644 package/ilixi/ilixi.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 64822bf..6bbe278 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -261,6 +261,7 @@ endif
>         source "package/fbterm/Config.in"
>         source "package/fbv/Config.in"
>         source "package/freerdp/Config.in"
> +       source "package/ilixi/Config.in"
>         source "package/imagemagick/Config.in"
>         source "package/linux-fusion/Config.in"
>         source "package/lite/Config.in"
> diff --git a/package/ilixi/0001-Added-ifdef-around-iconv.patch
> b/package/ilixi/0001-Added-ifdef-around-iconv.patch
> new file mode 100644
> index 0000000..a341c8c
> --- /dev/null
> +++ b/package/ilixi/0001-Added-ifdef-around-iconv.patch
> @@ -0,0 +1,28 @@
> +From 3e2844eead42ac4e17835f5e59746a52ad0caf76 Mon Sep 17 00:00:00 2001
> +From: Justin Berger <j.david.berger@gmail.com>
> +Date: Tue, 5 Apr 2016 20:06:11 -0600
> +Subject: [PATCH] Added ifdef around iconv
> +
> +Locale support in ilixi is a conditional dependency, and is only used
> when the libwnn dependency is also met.
> +
> +---
> + ilixi/lib/InputHelperJP.cpp | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/ilixi/lib/InputHelperJP.cpp b/ilixi/lib/InputHelperJP.cpp
> +index 95d0da4..72c5f3f 100644
> +--- a/ilixi/lib/InputHelperJP.cpp
> ++++ b/ilixi/lib/InputHelperJP.cpp
> +@@ -26,7 +26,9 @@
> + #include <lib/utf8.h>
> + #include <core/Logger.h>
> + #include <directfb.h>
> ++#if ILIXI_HAVE_LIBWNN
> + #include <iconv.h>
> ++#endif
> + #include <stdlib.h>
> + #include <stdint.h>
> + #include <string.h>
> +--
> +2.1.4
> +
> diff --git a/package/ilixi/Config.in b/package/ilixi/Config.in
> new file mode 100644
> index 0000000..54e7b04
> --- /dev/null
> +++ b/package/ilixi/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_ILIXI
> +       bool "ilixi"
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
> +       depends on !BR2_TOOLCHAIN_USES_MUSL # directfb
> +       depends on BR2_TOOLCHAIN_HAS_SYNC_4 # directfb
> +       depends on BR2_USE_WCHAR
> +       select BR2_PACKAGE_DIRECTFB
> +       select BR2_PACKAGE_LIBSIGC
> +       select BR2_PACKAGE_LIBXML2
> +       help
> +         ilixi is an open-source C++ library aimed at developing rich
> +         graphical applications for embedded Linux systems. Having been
> +         actively developed since 2010, it is running on thousands of
> +         devices around the world.
> +
> +         http://www.ilixi.org
> +
> +comment "ilixi needs a toolchain w/ C++, threads, wchar, gcc >= 4.7"
> +       depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +       depends on !BR2_INSTALL_LIBSTDCPP          ||   \
> +                  !BR2_TOOLCHAIN_HAS_THREADS      ||   \
> +                  !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 ||   \
> +                  !BR2_USE_WCHAR                  ||   \
> +                  BR2_TOOLCHAIN_USES_MUSL
> diff --git a/package/ilixi/ilixi.hash b/package/ilixi/ilixi.hash
> new file mode 100644
> index 0000000..0ffe151
> --- /dev/null
> +++ b/package/ilixi/ilixi.hash
> @@ -0,0 +1 @@
> +sha256 9b0c17efa75f2dc6a6a1438580a2f01e1cdfde822b10ad8c3f3b4a641caeadce
> ilixi-1.0.0.tar.gz
> diff --git a/package/ilixi/ilixi.mk b/package/ilixi/ilixi.mk
> new file mode 100644
> index 0000000..cde9af3
> --- /dev/null
> +++ b/package/ilixi/ilixi.mk
> @@ -0,0 +1,28 @@
>
> +################################################################################
> +#
> +# ilixi
> +#
>
> +################################################################################
> +
> +ILIXI_VERSION = 1.0.0
> +ILIXI_SITE = http://ilixi.org/releases
> +ILIXI_LICENSE = LGPLv3+, GPLV3+ (osk utf8-decoder)
> +ILIXI_LICENSE_FILES = COPYING.LESSER COPYING
> +ILIXI_INSTALL_STAGING = YES
> +
> +ILIXI_DEPENDENCIES =   \
> +       libsigc         \
> +       libxml2         \
> +       directfb        \
> +       fontconfig      \
> +
> +ifeq ($(BR2_PACKAGE_SAWMAN),y)
> +       ILIXI_CONF_OPTS += --enable-sawman
> +       ILIXI_DEPENDENCIES += sawman
> +else
> +       ILIXI_CONF_OPTS += --disable-sawman
> +endif
> +
> +ILIXI_CONF_ENV = CPPFLAGS="$(TARGET_CPPFLAGS) -std=c++11"
> +
> +$(eval $(autotools-package))
> --
> 2.1.4
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160405/8bbd74d3/attachment.html>

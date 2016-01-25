From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Jan 2016 19:42:57 +0100
Subject: [Buildroot] [PATCH 05/21] icu: remove BR2_ARCH_HAS_ATOMICS
 dependency
In-Reply-To: <1453676887-31236-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453676887-31236-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160125184257.GF3386@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-01-25 00:07 +0100, Thomas Petazzoni spake thusly:
> The BR2_ARCH_HAS_ATOMICS was added because on ARC, atomic instructions
> may not be provided by the architecture and therefore the compiler
> does not provide the __sync_*() built-ins.
> 
> However, since then, icu was changed and is now able to use C++11
> atomics, or even no atomic operations at all. In fact, icu will:
> 
>  * If possible, it will use C++11 atomics, which internally rely on
>    the __atomic built-ins. These are available since gcc 4.7, and all
>    architectures provide it. On some architectures, you *must* link
>    with libatomic, on some other architectures, they are available
>    built-in, but in all cases, linking against libatomic does not
>    harm. Thanks to this, even ARC with no atomic support (which was
>    the original reason for adding the BR2_ARCH_HAS_ATOMICS) dependency
>    builds fine, provided -latomic is added to LIBS.
> 
>  * If C++11 atomics are not available, then it falls back to
>    __sync_*() built-ins, which allows compilers older than 4.7 to be
>    supported.
> 
>  * If really no atomic mechanism is available, then it falls back to a
>    basic implementation based on a mutex.
> 
> Conclusion:
> 
>  - The BR2_ARCH_HAS_ATOMICS dependency is no longer needed.
> 
>  - We need to link with -latomic when gcc >= 4.7 is used.
> 
> Note that reverse dependencies of icu are also changed accordingly.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/beecrypt/Config.in        | 2 --
>  package/cppcms/Config.in          | 1 -
>  package/icu/Config.in             | 2 --
>  package/icu/icu.mk                | 8 ++++++++
>  package/php/Config.ext            | 2 --
>  package/qt-webkit-kiosk/Config.in | 1 -
>  package/qt5/qt5base/Config.in     | 1 -
>  package/qt5/qt5webkit/Config.in   | 1 -
>  8 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/package/beecrypt/Config.in b/package/beecrypt/Config.in
> index fc93a77..069f3d5 100644
> --- a/package/beecrypt/Config.in
> +++ b/package/beecrypt/Config.in
> @@ -16,7 +16,6 @@ config BR2_PACKAGE_BEECRYPT_CPP
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_WCHAR # icu
>  	depends on !BR2_BINFMT_FLAT # icu
> -	depends on BR2_ARCH_HAS_ATOMICS # icu
>  	depends on !BR2_STATIC_LIBS
>  	select BR2_PACKAGE_ICU
>  	help
> @@ -24,7 +23,6 @@ config BR2_PACKAGE_BEECRYPT_CPP
>  
>  comment "C++ support needs a toolchain w/ C++, wchar, dynamic libraries"
>  	depends on !BR2_BINFMT_FLAT
> -	depends on BR2_ARCH_HAS_ATOMICS
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
>  		|| BR2_STATIC_LIBS
>  
> diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
> index 85ba118..79f5474 100644
> --- a/package/cppcms/Config.in
> +++ b/package/cppcms/Config.in
> @@ -26,7 +26,6 @@ if BR2_PACKAGE_CPPCMS
>  config BR2_PACKAGE_CPPCMS_ICU
>  	bool "enable icu support"
>  	depends on !BR2_BINFMT_FLAT # icu
> -	depends on BR2_ARCH_HAS_ATOMICS # icu
>  	select BR2_PACKAGE_ICU
>  	help
>  	  Using ICU allows advanced localization features into CppCMS,
> diff --git a/package/icu/Config.in b/package/icu/Config.in
> index 4d47c32..d31c1fa 100644
> --- a/package/icu/Config.in
> +++ b/package/icu/Config.in
> @@ -7,7 +7,6 @@ config BR2_PACKAGE_ICU
>  	# file, and it cannot easily be changed to generate FLAT
>  	# format.
>  	depends on !BR2_BINFMT_FLAT
> -	depends on BR2_ARCH_HAS_ATOMICS
>  	help
>  	  International Components for Unicode.
>  
> @@ -28,6 +27,5 @@ endif
>  
>  comment "icu needs a toolchain w/ C++, wchar, threads"
>  	depends on !BR2_BINFMT_FLAT
> -	depends on BR2_ARCH_HAS_ATOMICS
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>  		!BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/icu/icu.mk b/package/icu/icu.mk
> index 5604504..7bc7f93 100644
> --- a/package/icu/icu.mk
> +++ b/package/icu/icu.mk
> @@ -17,6 +17,14 @@ ICU_CONF_OPTS = \
>  	--with-cross-build=$(HOST_ICU_DIR)/source \
>  	--disable-samples \
>  	--disable-tests
> +
> +# With gcc >= 4.7, icu prefers to use C++11 atomics, which rely on the
> +# __atomic builtins. On certain architectures, this requires linking
> +# with libatomic.
> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
> +ICU_CONF_ENV += LIBS="-latomic"
> +endif
> +
>  HOST_ICU_CONF_OPTS = \
>  	--disable-samples \
>  	--disable-tests \
> diff --git a/package/php/Config.ext b/package/php/Config.ext
> index c044e45..ee51030 100644
> --- a/package/php/Config.ext
> +++ b/package/php/Config.ext
> @@ -207,13 +207,11 @@ config BR2_PACKAGE_PHP_EXT_INTL
>  	depends on BR2_USE_WCHAR
>  	depends on !BR2_BINFMT_FLAT # icu
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # icu
> -	depends on BR2_ARCH_HAS_ATOMICS # icu
>  	help
>  	  Internationalization support
>  
>  comment "intl support needs a toolchain w/ C++, wchar, threads"
>  	depends on !BR2_BINFMT_FLAT
> -	depends on BR2_ARCH_HAS_ATOMICS
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
>  
>  config BR2_PACKAGE_PHP_EXT_MBSTRING
> diff --git a/package/qt-webkit-kiosk/Config.in b/package/qt-webkit-kiosk/Config.in
> index 51383f0..32952d7 100644
> --- a/package/qt-webkit-kiosk/Config.in
> +++ b/package/qt-webkit-kiosk/Config.in
> @@ -8,7 +8,6 @@ config BR2_PACKAGE_QT_WEBKIT_KIOSK
>  	select BR2_PACKAGE_QT5MULTIMEDIA
>  	depends on !BR2_STATIC_LIBS # qt5webkit
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5webkit
> -	depends on BR2_ARCH_HAS_ATOMICS # qt5webkit
>  	depends on !BR2_BINFMT_FLAT # qt5webkit
>  	help
>  	  Simple kiosk-mode browser powered by Qt5Webkit
> diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
> index 7cadcb2..64a7f65 100644
> --- a/package/qt5/qt5base/Config.in
> +++ b/package/qt5/qt5base/Config.in
> @@ -259,7 +259,6 @@ config BR2_PACKAGE_QT5BASE_DBUS
>  config BR2_PACKAGE_QT5BASE_ICU
>  	bool "Enable ICU support"
>  	select BR2_PACKAGE_ICU
> -	depends on BR2_ARCH_HAS_ATOMICS # icu
>  	depends on !BR2_BINFMT_FLAT # icu
>  	help
>  	  This option enables ICU support in Qt5. This is for example
> diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
> index eee82e8..96d97cc 100644
> --- a/package/qt5/qt5webkit/Config.in
> +++ b/package/qt5/qt5webkit/Config.in
> @@ -9,7 +9,6 @@ config BR2_PACKAGE_QT5WEBKIT
>  	# This module does not support static linking
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
> -	depends on BR2_ARCH_HAS_ATOMICS # icu
>  	depends on !BR2_BINFMT_FLAT # icu
>  	help
>  	  Qt is a cross-platform application and UI framework for
> -- 
> 2.6.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

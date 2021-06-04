From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Jun 2021 23:15:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: allow building with
 musl and uclibc
In-Reply-To: <20210526182416.2798443-1-aperez@igalia.com>
References: <20210526182416.2798443-1-aperez@igalia.com>
Message-ID: <20210604211549.GJ168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adrian, All,

On 2021-05-26 21:24 +0300, Adrian Perez de Castro spake thusly:
> WebKitGTK 2.32.1 includes fixes for building with the Musl libc, which
> also makes it possible to use uClibc as well, therefore arrange
> dependencies to allow selecting the package any of the C libraries is in
> use. This is done by making the dependencies be more granular, basically
> following what the wpewebkit package does.
> 
> In order to make make it build against uClibc a small patch that has
> been submitted to the upstream's Bugzilla is needed.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to next, thanks.

Same tweaks as for the wpewebkit patch.

Regards,
Yann E. MORIN.

> ---
>  ...0001-Support-building-against-uClibc.patch | 76 +++++++++++++++++++
>  package/webkitgtk/Config.in                   | 10 ++-
>  2 files changed, 83 insertions(+), 3 deletions(-)
>  create mode 100644 package/webkitgtk/0001-Support-building-against-uClibc.patch
> 
> diff --git a/package/webkitgtk/0001-Support-building-against-uClibc.patch b/package/webkitgtk/0001-Support-building-against-uClibc.patch
> new file mode 100644
> index 0000000000..cbed551d2d
> --- /dev/null
> +++ b/package/webkitgtk/0001-Support-building-against-uClibc.patch
> @@ -0,0 +1,76 @@
> +From 624d3b6a99778443e35fb260bef50a3969df9215 Mon Sep 17 00:00:00 2001
> +From: Adrian Perez de Castro <aperez@igalia.com>
> +Date: Wed, 26 May 2021 01:24:59 +0300
> +Subject: [PATCH] Support building against uClibc
> + https://bugs.webkit.org/show_bug.cgi?id=226244
> +
> +Reviewed by NOBODY (OOPS!).
> +
> +Source/JavaScriptCore:
> +
> +* assembler/MacroAssemblerARM64.cpp:
> +(getauxval): Provide a fallback implementation of getauxval() for
> +systems which do not provide <sys/auxv.h>, like those using uClibc
> +as their C library.
> +
> +Source/WTF:
> +
> +* wtf/PlatformRegisters.h: Use the <sys/ucontext.h> header instead of
> +<ucontext.h>, which is enough to gain access to the type definitions
> +for CPU registers and is available on every libc. On the other hand,
> +uClibc does not have <ucontext.h>, so this fixes the build in that
> +case.
> +
> +Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> +[Upstream status: https://bugs.webkit.org/show_bug.cgi?id=226244]
> +---
> + .../assembler/MacroAssemblerARM64.cpp          | 18 ++++++++++++++++++
> + Source/WTF/wtf/PlatformRegisters.h             |  2 +-
> + 2 files changed, 19 insertions(+), 1 deletion(-)
> +
> +diff --git a/Source/JavaScriptCore/assembler/MacroAssemblerARM64.cpp b/Source/JavaScriptCore/assembler/MacroAssemblerARM64.cpp
> +index 9e5c5147ea0..d20e632d825 100644
> +--- a/Source/JavaScriptCore/assembler/MacroAssemblerARM64.cpp
> ++++ b/Source/JavaScriptCore/assembler/MacroAssemblerARM64.cpp
> +@@ -34,7 +34,25 @@
> + 
> + #if OS(LINUX)
> + #include <asm/hwcap.h>
> ++#if __has_include(<sys/auxv.h>)
> + #include <sys/auxv.h>
> ++#else
> ++#include <linux/auxvec.h>
> ++// Provide an implementation for C libraries which do not ship one.
> ++static unsigned long getauxval(unsigned long type)
> ++{
> ++    char** env = environ;
> ++    while (*env++) { /* no-op */ }
> ++
> ++    for (auto* auxv = reinterpret_cast<unsigned long*>(env); *auxv != AT_NULL; auxv += 2) {
> ++        if (*auxv == type)
> ++            return auxv[1];
> ++    }
> ++
> ++    errno = ENOENT;
> ++    return 0;
> ++}
> ++#endif
> + #endif
> + 
> + namespace JSC {
> +diff --git a/Source/WTF/wtf/PlatformRegisters.h b/Source/WTF/wtf/PlatformRegisters.h
> +index d26ef985169..e7f15b7eb62 100644
> +--- a/Source/WTF/wtf/PlatformRegisters.h
> ++++ b/Source/WTF/wtf/PlatformRegisters.h
> +@@ -35,7 +35,7 @@
> + #elif OS(WINDOWS)
> + #include <windows.h>
> + #else
> +-#include <ucontext.h>
> ++#include <sys/ucontext.h>
> + #endif
> + 
> + namespace WTF {
> +-- 
> +2.31.1
> +
> diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
> index a05161d052..425bf81e4e 100644
> --- a/package/webkitgtk/Config.in
> +++ b/package/webkitgtk/Config.in
> @@ -12,20 +12,24 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
>  
> -comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 7, host gcc >= 4.9"
> +comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 7, host gcc >= 4.9"
>  	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
> +	depends on !BR2_BINFMT_FLAT
>  	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_USES_GLIBC || \
> +		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
>  		!BR2_HOST_GCC_AT_LEAST_4_9
>  	depends on BR2_USE_MMU
>  
>  config BR2_PACKAGE_WEBKITGTK
>  	bool "webkitgtk"
> +	depends on !BR2_STATIC_LIBS # wayland
> +	depends on !BR2_BINFMT_FLAT # icu
>  	depends on BR2_HOST_GCC_AT_LEAST_4_9 # icu
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
> -	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_USE_WCHAR # icu, libsoup
>  	depends on BR2_PACKAGE_LIBGTK3
>  	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
>  	select BR2_PACKAGE_CAIRO
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

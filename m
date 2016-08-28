From: Matthew Weber <matt@thewebers.ws>
Date: Sun, 28 Aug 2016 17:20:11 -0500
Subject: [Buildroot] [PATCH 2/2] package/sconeserver: needs shared libs
	or non uClibc toolchain
In-Reply-To: <1472408394-20573-2-git-send-email-yann.morin.1998@free.fr>
References: <1472408394-20573-1-git-send-email-yann.morin.1998@free.fr>
 <1472408394-20573-2-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAFt09wOU_CWGhLc44LMRz0-5aaVPGGUwxoV97sm7kJt3aUFZHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, Aug 28, 2016 at 1:19 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> sconeserver wants to use dlopen(), unconditionally: it does not try to
> detect it, and it can't work without it (the code is not conditional).
>
> So, when the toolchain uses uClibc, and that uClibc has been configured
> with only static support, the dlopen() functions are not available at
> all, and the corresponding headers are not present:
>
>     ModuleLoader.cpp:29:19: fatal error: dlfcn.h: No such file or directory
>      #include <dlfcn.h>
>                        ^
>
> However, we can't know if uClibc has shared support or is static-only,
> especially for external toolchains.
>
> The only way is to forbid the combination {uClibc,static}. So we may
> indeed forbid working combinations, for example if the external
> toolchain is uClibc-based and has support for shared libs...
>
> Fixes:
>     http://autobuild.buildroot.org/results/e92/e929799366e6f574c7b08d8635b18623afd3e3e1/
>
> Reported-by: Matthew Weber <matt@thewebers.ws>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/sconeserver/Config.in | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
> index 4083aa7..5059570 100644
> --- a/package/sconeserver/Config.in
> +++ b/package/sconeserver/Config.in
> @@ -2,6 +2,7 @@ menuconfig BR2_PACKAGE_SCONESERVER
>         bool "sconeserver"
>         depends on BR2_INSTALL_LIBSTDCPP
>         depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +       depends on !BR2_TOOLCHAIN_USES_UCLIBC || !BR2_STATIC_LIBS # dlopen()
>         select BR2_PACKAGE_PCRE
>         help
>           Sconeserver is a modular, object-orientated and extremely versatile
> @@ -103,4 +104,9 @@ comment "ui module requires X.org"
>  endif # BR2_PACKAGE_SCONESERVER

Should a comment be added for the toolchain C++ and NPTL are good but
dyn lib support is not?

comment "sconeserver needs a toolchain w/ dynamic library"
        depends on BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS_NPTL
        depends on BR2_TOOLCHAIN_USES_UCLIBC && BR2_STATIC_LIBS

I'd also be good with just disabling static build per follow on parts
of this thread.

Thanks,
Matt

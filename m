From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2020 22:50:31 +0200
Subject: [Buildroot] [PATCH 1/2] package/fluidsynth: needs dynamic
 library
In-Reply-To: <20200628142647.742636-1-fontaine.fabrice@gmail.com>
References: <20200628142647.742636-1-fontaine.fabrice@gmail.com>
Message-ID: <20200629205031.GT20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-06-28 16:26 +0200, Fabrice Fontaine spake thusly:
> applications, such as mpd, fail to build statically with fluidsynth
> because fluidsynth does not fill Libs.Private in their pkg-config file
> 
> Because fluidsynth is a cmake-package with many dependencies, it is not
> easy to fix so just add a dynamic library dependency
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ec9dd2903359b9bf6b15c8cb69e732f8cb6c4d39
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/fluidsynth/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/fluidsynth/Config.in b/package/fluidsynth/Config.in
> index c1cb923489..4fcbfa7411 100644
> --- a/package/fluidsynth/Config.in
> +++ b/package/fluidsynth/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_FLUIDSYNTH
>  	depends on BR2_USE_WCHAR # libglib2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
>  	depends on BR2_USE_MMU # libglib2
> +	depends on !BR2_STATIC_LIBS

You forgot to propagate to BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH

However, I am not too fond of the i!static addition.

Looking at the failed build log, it seems that the bulk is missing link
to some libglib2 library, because it can't resolve a few g_-prefixed
symbols:

    g_rec_mutex_lock
    g_rec_mutex_unlock
    g_get_monotonic_time
    g_usleep
    g_thread_try_new
    g_return_if_fail_warning
    g_thread_unref
    g_clear_error

Could you at least give a try to see if linking to libglib2 would be
solve it?

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_LIBGLIB2
>  	help
>  	  FluidSynth is a real-time software synthesizer based on the
> @@ -115,6 +116,7 @@ config BR2_PACKAGE_FLUIDSYNTH_READLINE
>  
>  endif # BR2_PACKAGE_FLUIDSYNTH
>  
> -comment "fluidsynth needs a toolchain w/ threads, wchar"
> +comment "fluidsynth needs a toolchain w/ threads, wchar, dynamic library"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		BR2_STATIC_LIBS
> -- 
> 2.26.2
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

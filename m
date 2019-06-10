From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Jun 2019 11:37:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/weston: needs headers >= 4.4
In-Reply-To: <20190609222703.30345-1-fontaine.fabrice@gmail.com>
References: <20190609222703.30345-1-fontaine.fabrice@gmail.com>
Message-ID: <20190610093702.GD13603@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-06-10 00:27 +0200, Fabrice Fontaine spake thusly:
> weston includes input-event-codes.h since version 5.0.91 and
> https://github.com/wayland-project/weston/commit/6e229ca26381bc8191fd9af1e439c311da709aff

Actually, that include is in fact not needed. Just remove it, and it
still builds! ;-)

The only #define that is needed from that header is EV_KEY, which
before 4.4 was provided in linux/input.h

So, I'd rather we find a solution with upstream to include the correct
header, along the lines of:

    diff --git a/compositor/main.c b/compositor/main.c
    index 945f99ae..d3fdb1e4 100644
    --- a/compositor/main.c
    +++ b/compositor/main.c
    @@ -42,7 +42,11 @@
     #include <sys/socket.h>
     #include <libinput.h>
     #include <libevdev/libevdev.h>
    +#if define HAS_LINUX_INPUT_EVENT_CODES_H
     #include <linux/input-event-codes.h>
    +#else
    +#include <linux/input.h>
    +#endif
     #include <sys/time.h>
     #include <linux/limits.h>
     

I'll let you come up with the meson part of that ;-)

(Note: it works if we just remove the include, because linux/input.h
seems to be pulled by another header, but for correctness-sake, we have
to include it explicitly.)

Regards,
Yann E. MORIN.

> input-event-codes.h is available only since kernel 4.4 and
> https://github.com/torvalds/linux/commit/f902dd893427eade90f7eaf858e5ff8b150a5a12
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/210c2759900f15ea0030d088f6f45cd8bb199b29
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/weston/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/weston/Config.in b/package/weston/Config.in
> index f874b0cc6a..1b1882b388 100644
> --- a/package/weston/Config.in
> +++ b/package/weston/Config.in
> @@ -1,6 +1,6 @@
> -comment "weston needs udev and a toolchain w/ locale, threads, dynamic library, headers >= 3.0"
> +comment "weston needs udev and a toolchain w/ locale, threads, dynamic library, headers >= 4.4"
>  	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4 || BR2_STATIC_LIBS || \
>  		!BR2_ENABLE_LOCALE
>  
>  config BR2_PACKAGE_WESTON
> @@ -9,7 +9,7 @@ config BR2_PACKAGE_WESTON
>  	depends on BR2_PACKAGE_HAS_UDEV
>  	depends on !BR2_STATIC_LIBS # wayland
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4 # input-event-codes.h
>  	select BR2_PACKAGE_WAYLAND
>  	select BR2_PACKAGE_WAYLAND_PROTOCOLS
>  	select BR2_PACKAGE_LIBXKBCOMMON
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

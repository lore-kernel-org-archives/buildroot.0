From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Sep 2014 19:53:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/wayland: requires shared library
In-Reply-To: <1411838282-17247-1-git-send-email-bernd.kuhls@t-online.de>
References: <1411838282-17247-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140927175310.GF4298@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-09-27 19:18 +0200, Bernd Kuhls spake thusly:
> Fixes
>   CC       src/libwayland_server_la-wayland-server.lo
> src/wayland-server.c:36:19: error: dlfcn.h: No such file or directory
> 
> using this defconfig
> http://autobuild.buildroot.net/results/dfd/dfd81f1f1f0f315317b2a85d24b286a277ac7c16/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/wayland/Config.in |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/wayland/Config.in b/package/wayland/Config.in
> index c92f9ea..0f78f15 100644
> --- a/package/wayland/Config.in
> +++ b/package/wayland/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_WAYLAND
>  	bool "wayland"
>  	depends on !BR2_avr32 # no epoll_create1, timerfd_create or timerfd_settime
> +	depends on !BR2_PREFER_STATIC_LIB # dlfcn.h
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_LIBFFI
>  	select BR2_PACKAGE_EXPAT
> @@ -14,3 +15,4 @@ config BR2_PACKAGE_WAYLAND
>  comment "wayland needs a toolchain w/ threads"
>  	depends on !BR2_avr32
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_PREFER_STATIC_LIB

You forgot to propagate this new dependency to packages that select
wayland: weston and gst1-plugins-bad.

Although weston already indirectly depends on !static (because it
depends on _HAS_UDEV, and that only get selected by eudev or systemd,
and they both depend on !static), it would be better to propagate this
new !static dependency to weston too (in case one of the udev provider
one day drop its !static dep).

Regards,
Yann E. MORIN.

> -- 
> 1.7.10.4
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

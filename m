From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Sep 2020 23:44:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/wlroots: always disable
 xcb-errors
In-Reply-To: <20200909213756.1945855-1-aperez@igalia.com>
References: <20200909213756.1945855-1-aperez@igalia.com>
Message-ID: <20200909214414.GU14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adrian, All,

On 2020-09-10 00:37 +0300, Adrian Perez de Castro spake thusly:
> Stop trying to enable the xcb-errors Meson option and always disable it:
> there is no xcb-util-errors package in Buildroot. The build recipe was
> wrongly assuming that the XCB errors library would be installed as part
> of the xcb-util package, which is not the case.
> 
> Fixes the following autobuilder failure:
> 
>   http://autobuild.buildroot.net/results/1891aa624b29e4bbcbbe6bc752a1cc90c316024e/
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wlroots/wlroots.mk | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
> index 27ccc8d5f3..c1771df41d 100644
> --- a/package/wlroots/wlroots.mk
> +++ b/package/wlroots/wlroots.mk
> @@ -21,7 +21,7 @@ WLROOTS_DEPENDENCIES = \
>  	wayland \
>  	wayland-protocols
>  
> -WLROOTS_CONF_OPTS = -Dexamples=false
> +WLROOTS_CONF_OPTS = -Dexamples=false -Dxcb-errors=disabled
>  
>  ifeq ($(BR2_PACKAGE_FFMPEG),y)
>  WLROOTS_DEPENDENCIES += ffmpeg
> @@ -52,13 +52,6 @@ else
>  WLROOTS_CONF_OPTS += -Dxwayland=disabled
>  endif
>  
> -ifeq ($(BR2_PACKAGE_XCB_UTIL),y)
> -WLROOTS_CONF_OPTS += -Dxcb-errors=enabled
> -WLROOTS_DEPENDENCIES += xcb-util
> -else
> -WLROOTS_CONF_OPTS += -Dxcb-errors=disabled
> -endif
> -
>  ifeq ($(BR2_PACKAGE_XCB_UTIL_WM),y)
>  WLROOTS_CONF_OPTS += -Dxcb-icccm=enabled
>  WLROOTS_DEPENDENCIES += xcb-util-wm
> -- 
> 2.28.0
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

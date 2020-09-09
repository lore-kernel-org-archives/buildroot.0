From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 10 Sep 2020 00:41:27 +0300
Subject: [Buildroot] [PATCH 1/1] package/wlroots: disable xcb-errors
In-Reply-To: <20200909210022.2822148-1-fontaine.fabrice@gmail.com>
References: <20200909210022.2822148-1-fontaine.fabrice@gmail.com>
Message-ID: <20200910004127.GB206374@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

I submitted basically the same patch a couple of minutes after you.
Let's use yours instead, I'll withdraw mine from Patchwork.

On Wed, 09 Sep 2020 23:00:22 +0200 Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> wlroots enable or disable xcb-errors depending on xcb-util availability
> since its addition with commit db5bccc04489672ded8a639f97b19a18e85ddd70
> 
> However xcb-errors is not provided by xcb-util, it is provided by
> xcb-util-errors (https://cgit.freedesktop.org/xcb/util-errors) which is
> not yet available in buildroot
> 
> As a result, the build will fail on:
> 
> Run-time dependency xcb-errors found: NO (tried pkgconfig)
> Message: Install "xcb-errors" or pass "-Dxcb-errors=disabled".
> Required for printing X11 errors.
> 
> ../output-1/build/wlroots-0.11.0/xwayland/meson.build:42:1: ERROR: Dependency "xcb-errors" not found, tried pkgconfig
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1891aa624b29e4bbcbbe6bc752a1cc90c316024e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Acked-by: Adrian Perez de Castro <aperez@igalia.com>

> ---
>  package/wlroots/wlroots.mk | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
> index 27ccc8d5f3..fb26593073 100644
> --- a/package/wlroots/wlroots.mk
> +++ b/package/wlroots/wlroots.mk
> @@ -21,7 +21,9 @@ WLROOTS_DEPENDENCIES = \
>  	wayland \
>  	wayland-protocols
>  
> -WLROOTS_CONF_OPTS = -Dexamples=false
> +WLROOTS_CONF_OPTS = \
> +	-Dexamples=false \
> +	-Dxcb-errors=disabled
>  
>  ifeq ($(BR2_PACKAGE_FFMPEG),y)
>  WLROOTS_DEPENDENCIES += ffmpeg
> @@ -52,13 +54,6 @@ else
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
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200910/30309b86/attachment.asc>

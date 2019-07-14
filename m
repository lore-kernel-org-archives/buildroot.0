From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 15:07:10 +0200
Subject: [Buildroot] [PATCH] package/x11r7/xlib_libXfont: work around
 gcc bug 85180
In-Reply-To: <20190713115309.88559-1-giulio.benetti@micronovasrl.com>
References: <20190713115309.88559-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190714150710.3f4f42fc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 13 Jul 2019 13:53:09 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> With Microblaze Gcc version < 8.x the build hangs due to gcc bug
> 85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
> shows up when building xlib_libXfont with optimization but not when
> building with -O0. To work around this, if
> BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we force using -O0.
> 
> Fixes:
> http://autobuild.buildroot.net/results/7c6/7c64becbf06a1e00e41b7ddb95dd0c65bf364eb7/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/x11r7/xlib_libXfont/xlib_libXfont.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
> index a1acfba83b..ba41970289 100644
> --- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
> +++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
> @@ -30,5 +30,13 @@ ifeq ($(BR2_microblaze),y)
>  XLIB_LIBXFONT_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D__ELF__"
>  endif
>  
> +XLIB_LIBXFONT_CFLAGS = $(TARGET_CFLAGS)
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
> +XLIB_LIBXFONT_CFLAGS += -O0
> +endif
> +
> +XLIB_LIBXFONT_CONF_OPTS += CFLAGS="$(XLIB_LIBXFONT_CFLAGS)"

We normally use the <pkg>_CONF_ENV variable to override CFLAGS, so I
fixed that up and applied. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Apr 2020 22:50:42 +0200
Subject: [Buildroot] [PATCH 1/2] package/cegui: force libglew when
 libepoxy is also enabled
In-Reply-To: <20200428195844.48124-1-b.bilas@grinn-global.com>
References: <20200428195844.48124-1-b.bilas@grinn-global.com>
Message-ID: <20200429225042.65fcccd0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Apr 2020 21:58:43 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> Cegui doesn't allow to have enabled both opengl libraries so disable
> libepoxy when both are enabled.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/2881bbcc2dcfcaa5ed663817ff39f7574430ba5a/build-end.log
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  package/cegui/cegui.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
> index 434201b1f8..0e3d015948 100644
> --- a/package/cegui/cegui.mk
> +++ b/package/cegui/cegui.mk
> @@ -18,7 +18,7 @@ CEGUI_DEPENDENCIES = glm \
>  		$(if $(BR2_PACKAGE_LIBGLEW),libglew) \
>  		$(if $(BR2_PACKAGE_LIBICONV),libiconv)
>  
> -ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
> +ifeq ($(BR2_PACKAGE_LIBEPOXY)$(BR2_PACKAGE_LIBGLEW),y)

This way of solving the problem doesn't work: if BR2_PACKAGE_LIBEPOXY
is false, but BR2_PACKAGE_LIBGLEW=y, then the condition is true, and we
add a dependency on libepoxy. Not what we want. So I've replaced with

+# libepoxy support cannot be enabled together with libglew
+ifeq ($(BR2_PACKAGE_LIBEPOXY):$(BR2_PACKAGE_LIBGLEW),y:)

instead.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

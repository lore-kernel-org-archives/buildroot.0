From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 17:38:44 +0200
Subject: [Buildroot] [PATCH 2/2 v4] package/mesa3d: make it aware of
 libglvnd and support it when present
In-Reply-To: <c48baa11cd0c06ec5af3fd4989306c3ec581d0e9.1595839612.git.yann.morin.1998@free.fr>
References: <cover.1595839612.git.yann.morin.1998@free.fr>
 <c48baa11cd0c06ec5af3fd4989306c3ec581d0e9.1595839612.git.yann.morin.1998@free.fr>
Message-ID: <20200727173844.2ac2945f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Jul 2020 10:47:02 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> From: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>
> 
> When libglvnd is enabled, mesa3d must be told so, so as it installs its
> libraries with the vendor suffix (e.g. libEGL_mesa.so instead of
> libEGL.so).
> 
> Additionally, the provider (in Buildroot parlance) is libglvnd, not mesa3d.
> 
> Signed-off-by: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>
> [yann.morin.1998 at free.fr:
>   - don't override the _PROVIDES variable, only assign when needed
> ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/mesa3d/Config.in | 15 +++++++++------
>  package/mesa3d/mesa3d.mk | 15 +++++++++++----
>  2 files changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 11d04b7a3f..5417aeda1a 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -422,7 +422,8 @@ comment "gbm support needs a dri driver or a gallium driver w/ EGL support."
>  config BR2_PACKAGE_MESA3D_OPENGL_GLX
>  	bool "OpenGL GLX"
>  	depends on BR2_PACKAGE_XORG7
> -	select BR2_PACKAGE_HAS_LIBGL
> +	select BR2_PACKAGE_HAS_LIBGL if !BR2_PACKAGE_LIBGLVND
> +	select BR2_PACKAGE_LIBGLVND_DISPATCH_GL if BR2_PACKAGE_LIBGLVND

I don't immediately see a good solution for this, but I find that
solution to be quite annoying :-/

Indeed, I understand that once libglvnd is enabled, the GL-provider is
libglvnd, which in the background is using mesa3d. The dance to handle
libglvnd in mesa3d is already not nice, and we would have to have the
same dance in other GL providers that support libglvnd.

OK, here is some vague idea for a possible solution:

 - We introduce an intermediate "layer" between libgl and GL providers.

 - GL provides no longer provide directly libgl, but instead some kind
   of libgl-low, libgl-real (or some better name)

 - libgl is then provided either by libglvnd on top of
   libgl-low/libgl-real, *or* on top of some simple libgl-proxy package
   that does nothing but make libgl depend on libgl-low

I *think* this would perhaps avoid that complexity in mesa3d...
obviously for additional complexity in terms of how the virtual
packages in GL world all work together.

Would this make sense ? Is it over-engineered ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

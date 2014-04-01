From: Paul Cercueil <paul@crapouillou.net>
Date: Tue, 01 Apr 2014 09:48:07 +0200
Subject: [Buildroot] [PATCH 3/6] package/mesa3d: is a full-openGL
 provider if X.org is present
In-Reply-To: <7b289a2d0fd88d16d66a9ce87db4a3a43821c630.1396302677.git.yann.morin.1998@free.fr>
References: <cover.1396302677.git.yann.morin.1998@free.fr>
 <7b289a2d0fd88d16d66a9ce87db4a3a43821c630.1396302677.git.yann.morin.1998@free.fr>
Message-ID: <533A6F37.9050805@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

I don't see the "if X.org is present" part in your patch, what would 
prevent me from trying to enable OpenGL on a X11-less system?

You make BR2_PACKAGE_MESA3D_DRIVER select BR2_PACKAGE_HAS_OPENGL but 
that is wrong. Typically a X11-less system will enable a Gallium driver, 
while Mesa's OpenGL requires a DRI driver (hence the dependency on X11).

What I suggest is to select BR2_PACKAGE_HAS_OPENGL only from 
BR2_PACKAGE_MESA3D_DRI_DRIVER, and make BR2_PACKAGE_MESA3D_DRI_DRIVER 
available only if X11 is enabled, since it makes no sense building 
X11-only drivers in that case.

Also, the original Config.in has options to enable EGL/GLES, having an 
option to toggle OpenGL would be nice too, I think (and OpenVG, but 
that's a separate issue).

Bye,
Paul


On 03/31/2014 11:59 PM, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> In combination with X.org, mesa3d is a full-openGL provider, as long
> as at least one driver is being built.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Bernd Kuhls <berndkuhls@hotmail.com>
>
> ---
> Thanks to Paul for explaining this on IRC! :-)
> In parallel, Bernd posted his patch to the list, which was very similar
> to this one.
> ---
>   package/mesa3d/Config.in | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 8ed0c07..f3d855b 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -34,6 +34,7 @@ comment "DRI drivers need shared libdrm"
>
>   config BR2_PACKAGE_MESA3D_DRIVER
>   	bool
> +	select BR2_PACKAGE_HAS_OPENGL
>
>   menu "Drivers"
>
> @@ -106,6 +107,9 @@ config BR2_PACKAGE_MESA3D_OPENGL_ES
>
>   endmenu
>
> +config BR2_PACKAGE_PROVIDES_OPENGL
> +	default "mesa3d" if BR2_PACKAGE_MESA3D_DRIVER
> +
>   config BR2_PACKAGE_PROVIDES_OPENGL_EGL
>   	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_EGL
>
>

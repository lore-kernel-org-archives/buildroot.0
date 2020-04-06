From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Apr 2020 22:25:40 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: Select more options for
 freedreno
In-Reply-To: <20200330231114.22168-1-festevam@gmail.com>
References: <20200330231114.22168-1-festevam@gmail.com>
Message-ID: <20200406222540.424c13f8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Mar 2020 20:11:14 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Currently it is not possible to select KMSCUBE on a target that uses
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO due to the missing
> dependency.
> 
> Fix this problem by selecting BR2_PACKAGE_LIBDRM_FREEDRENO and
> BR2_PACKAGE_MESA3D_OPENGL_EGL, just like Etnaviv does.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  package/mesa3d/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 16d77f42c2..3225aa7598 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -113,7 +113,9 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
>  	bool "Gallium freedreno driver"
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	select BR2_PACKAGE_LIBDRM_FREEDRENO

So I kind of agree with this one, because the mesa3d freedreno driver
is not usable without the libdrm support for this platform. However,
this is not really explained in your commit log.

>  	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
> +	select BR2_PACKAGE_MESA3D_OPENGL_EGL

However, this one I disagree, and I also disagree for it on etnaviv.
Indeed, even with this, you still can't enable kmscube, which requires
EGL *and* OpenGL ES, but you're not forcefully enabling OpenGL ES. And
I don't think it makes sense to forcefully enable EGL and OpenGL ES.

So, what I'd prefer to see is:

 - A patch that drops the select BR2_PACKAGE_MESA3D_OPENGL_EGL from the
   etnaviv mesa3d option.

 - A patch that adds just the select BR2_PACKAGE_LIBDRM_FREEDRENO,
   perhaps with a comment that says it's a runtime dependency.

What do you think ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

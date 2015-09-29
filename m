From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 29 Sep 2015 20:01:41 +0300
Subject: [Buildroot] [PATCH] glmark2: add missing dependencies
In-Reply-To: <1443545373-9115-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1443545373-9115-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150929170140.GB2309@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

On Tue, Sep 29, 2015 at 05:49:33PM +0100, Vicente Olivert Riera wrote:
> There are some missing dependencies which are in fact stated in the
> comment, and due to that you can select the package despite of not
> satisfying them.
> Also propagate the !STATIC dependency from mesa3d and add some comments.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/glmark2/Config.in |   12 +++++++++---
>  1 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
> index 052e820..6ab4f5b 100644
> --- a/package/glmark2/Config.in
> +++ b/package/glmark2/Config.in
> @@ -15,6 +15,12 @@ comment "glmark2 needs an OpenGL or an openGL ES and EGL backend provided by mes
>  config BR2_PACKAGE_GLMARK2
>  	bool "glmark2"
>  	depends on BR2_PACKAGE_GLMARK2_GL || BR2_PACKAGE_GLMARK2_EGL_GLES
> +	# glmark2-gl and glmark2-egl-gles depend on mesa3d, which intruduces
> +	# dependencies on NPTL, STDCPP and !STATIC.
> +	depends on BR2_INSTALL_LIBSTDCPP # mesa3d
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mesa3d
> +	depends on !BR2_STATIC_LIBS # mesa3d
> +	depends on BR2_PACKAGE_HAS_UDEV

Why would that be needed? Kconfig 'depends' is transitive. That is, since 
glmark2 depends on glmark2-gl/glmark2-egl-gles, that in turn depend on mesa3d, 
glmark2 automatically also depends on mesa3d dependencies. It is only for 
'select' that we need to manually propagate dependencies.

Did you hit any specific problem?

baruch

>  	select BR2_PACKAGE_JPEG
>  	select BR2_PACKAGE_LIBPNG
>  	help
> @@ -22,6 +28,6 @@ config BR2_PACKAGE_GLMARK2
>  
>  	  https://github.com/glmark2/glmark2
>  
> -comment "glmark2 needs udev /dev management and a toolchain w/ C++, NPTL"
> -	depends on !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_HAS_UDEV
> +comment "glmark2 needs udev and a toolchain w/ C++, NPTL, shared library"
> +	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 02 Apr 2014 08:13:05 +0200
Subject: [Buildroot] [PATCH 1/6] package/libevas: quick fix to get rid
 of circular deps
In-Reply-To: <eb47cebc21e1bc07000dd375c77a28b362e281e0.1396302677.git.yann.morin.1998@free.fr>
References: <cover.1396302677.git.yann.morin.1998@free.fr>
 <eb47cebc21e1bc07000dd375c77a28b362e281e0.1396302677.git.yann.morin.1998@free.fr>
Message-ID: <533BAA71.4050104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31/03/14 23:59, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> This is a quick workaround against the recently-introduced circular
> dependencies hell:
> 
>     package/xbmc/Config.in:10:error: recursive dependency detected!
>     package/xbmc/Config.in:10:      symbol BR2_PACKAGE_XBMC depends on BR2_PACKAGE_HAS_OPENGL_EGL
>     package/opengl/libegl/Config.in:1:      symbol BR2_PACKAGE_HAS_OPENGL_EGL is selected by BR2_PACKAGE_MESA3D_OPENGL_EGL
>     package/mesa3d/Config.in:92:    symbol BR2_PACKAGE_MESA3D_OPENGL_EGL depends on BR2_PACKAGE_MESA3D
>     package/mesa3d/Config.in:1:     symbol BR2_PACKAGE_MESA3D is selected by BR2_PACKAGE_LIBEVAS_GL
>     package/efl/libevas/Config.in:149:      symbol BR2_PACKAGE_LIBEVAS_GL is part of choice <choice>
>     package/efl/libevas/Config.in:144:      choice <choice> contains symbol <choice>
>     package/efl/libevas/Config.in:144:      choice <choice> contains symbol BR2_PACKAGE_LIBEVAS_SDL_GL
>     package/efl/libevas/Config.in:90:       symbol BR2_PACKAGE_LIBEVAS_SDL_GL depends on BR2_PACKAGE_SDL_X11
>     package/sdl/Config.in:24:       symbol BR2_PACKAGE_SDL_X11 depends on BR2_PACKAGE_SDL
>     package/sdl/Config.in:1:        symbol BR2_PACKAGE_SDL is selected by BR2_PACKAGE_PYTHON_PYGAME
>     package/python-pygame/Config.in:1:      symbol BR2_PACKAGE_PYTHON_PYGAME depends on BR2_PACKAGE_PYTHON
>     package/python/Config.in:1:     symbol BR2_PACKAGE_PYTHON is selected by BR2_PACKAGE_XBMC
> 
> Until this is properly fixed with the addition of a virtual package for
> full-openGL providers, just depend on mesa3d instead of selecting it.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <berndkuhls@hotmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 This should indeed go in quickly!

 But shouldn't your series also include a patch that undoes this change?

 Regards,
 Arnout


> ---
>  package/efl/libevas/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
> index 2afa888..8eea23d 100644
> --- a/package/efl/libevas/Config.in
> +++ b/package/efl/libevas/Config.in
> @@ -148,7 +148,7 @@ choice
>  
>  config BR2_PACKAGE_LIBEVAS_GL
>  	bool "generic OpenGL"
> -	select BR2_PACKAGE_MESA3D
> +	depends on BR2_PACKAGE_MESA3D
>  	select BR2_PACKAGE_LIBEET
>  
>  config BR2_PACKAGE_LIBEVAS_GLES_SGX
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

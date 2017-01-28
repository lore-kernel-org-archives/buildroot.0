From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Jan 2017 09:56:51 +0100
Subject: [Buildroot] [RFC] package/sdl2_ttf: include GL/gl.h while
 checking for OpenGL support
In-Reply-To: <20161229004735.6293-1-romain.naour@gmail.com>
References: <20161229004735.6293-1-romain.naour@gmail.com>
Message-ID: <20170128085651.GA3512@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-12-29 01:47 +0100, Romain Naour spake thusly:
> Since SDL2 2.0.4, SDL2 OpenGL headers (SDL_opengl.h) are unconditionally
> installed even if the OpenGL support has been disabled. So the SDL_ttf
> build system enable the OpenGL support without checking for a GL
> provider.
> 
> Include GL/gl.h in the compile test.
> 
> Fixes:
> http://autobuild.buildroot.net/results/639/6397856cae5a7e139b449435feadaafaff312870

So, I missed that patch of yours when I previously sent an (crude)
analysis of that build failure.

In the meantime, upstream has done a fix, whjich we should carry until
they next cut out a release:
    https://hg.libsdl.org/SDL_ttf/rev/3b93536d291a

Regards,
Yann E. MORIN.

> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...nclude-GL-gl.h-while-checking-for-OpenGL-.patch | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/sdl2_ttf/0001-configure-include-GL-gl.h-while-checking-for-OpenGL-.patch
> 
> diff --git a/package/sdl2_ttf/0001-configure-include-GL-gl.h-while-checking-for-OpenGL-.patch b/package/sdl2_ttf/0001-configure-include-GL-gl.h-while-checking-for-OpenGL-.patch
> new file mode 100644
> index 0000000..c2808b4
> --- /dev/null
> +++ b/package/sdl2_ttf/0001-configure-include-GL-gl.h-while-checking-for-OpenGL-.patch
> @@ -0,0 +1,38 @@
> +From 90874329ef6af3a7b74c5e9e2389fc2dad9a6044 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Thu, 29 Dec 2016 01:35:18 +0100
> +Subject: [PATCH] configure: include GL/gl.h while checking for OpenGL support
> +
> +Since SDL2 2.0.4, SDL2 OpenGL headers (SDL_opengl.h) are unconditionally
> +installed even if the OpenGL support has been disabled. So the SDL_ttf
> +build system enable the OpenGL support without checking for a GL
> +provider.
> +
> +Include GL/gl.h in the compile test.
> +
> +Fixes:
> +http://autobuild.buildroot.net/results/639/6397856cae5a7e139b449435feadaafaff312870
> +
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> +Maybe we should also check for libGL:
> +AC_CHECK_LIB([GL], [glXCreateContext]...
> +---
> + configure.in | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/configure.in b/configure.in
> +index 9b36e15..daa1be3 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -165,6 +165,7 @@ esac
> + AC_MSG_CHECKING(for OpenGL support)
> + have_opengl=no
> + AC_TRY_COMPILE([
> ++ #include <GL/gl.h>
> +  #include "SDL_opengl.h"
> + ],[
> +  GLuint texture;
> +-- 
> +2.9.3
> +
> -- 
> 2.9.3
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

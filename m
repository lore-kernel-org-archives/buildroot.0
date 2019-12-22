From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 11:28:28 +0100
Subject: [Buildroot] [PATCH] sdl2: add patch to fix busy-loop in C
 library
In-Reply-To: <20191220160438.102444-1-paul@crapouillou.net>
References: <20191220160438.102444-1-paul@crapouillou.net>
Message-ID: <20191222102828.GT26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul, All,

On 2019-12-20 17:04 +0100, Paul Cercueil spake thusly:
> For some obscure reason, the order in which the libdrm/libgbm libraries
> are loaded matters.
> 
> Without this fix, the first call to check_modesetting() will work and
> load then unload all symbols properly, but the second call to this
> function will lock up as soon as dlopen() is called on libdrm.
> 
> Swapping the order in which the libdrm and libgbm libraries are loaded
> is enough to fix (or work around?) this issue.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied to master, after adding a URL to the upstream commit.
Thanks!

Regards,
Yann E. MORIN.

> ---
>  .../sdl2/0002-fix-busy-loop-in-dlopen.patch   | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/sdl2/0002-fix-busy-loop-in-dlopen.patch
> 
> diff --git a/package/sdl2/0002-fix-busy-loop-in-dlopen.patch b/package/sdl2/0002-fix-busy-loop-in-dlopen.patch
> new file mode 100644
> index 0000000000..984a80d9c1
> --- /dev/null
> +++ b/package/sdl2/0002-fix-busy-loop-in-dlopen.patch
> @@ -0,0 +1,37 @@
> +
> +# HG changeset patch
> +# User Paul Cercueil <paul@crapouillou.net>
> +# Date 1576820863 28800
> +# Node ID 4f5bef55183c677d12a7da8f3392879ed50670a3
> +# Parent  01f16d7f36cb9f4fa02016e57fbe915fdea71cc8
> +kmsdrm: Fix busy-loop within libc's dlopen()
> +For some obscure reason, the order in which the libdrm/libgbm libraries
> +are loaded matters.
> +
> +Without this fix, the first call to check_modesetting() will work and
> +load then unload all symbols properly, but the second call to this
> +function will lock up as soon as dlopen() is called on libdrm.
> +
> +Swapping the order in which the libdrm and libgbm libraries are loaded
> +is enough to fix (or work around?) this issue.
> +
> +Fixes #4891:
> +https://bugzilla.libsdl.org/show_bug.cgi?id=4891
> +
> +Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> +
> +diff -r 01f16d7f36cb -r 4f5bef55183c src/video/kmsdrm/SDL_kmsdrmdyn.c
> +--- a/src/video/kmsdrm/SDL_kmsdrmdyn.c	Thu Dec 19 21:45:44 2019 -0800
> ++++ b/src/video/kmsdrm/SDL_kmsdrmdyn.c	Thu Dec 19 21:47:43 2019 -0800
> +@@ -50,8 +50,8 @@
> + #endif
> + 
> + static kmsdrmdynlib kmsdrmlibs[] = {
> +-    {NULL, SDL_VIDEO_DRIVER_KMSDRM_DYNAMIC},
> +-    {NULL, SDL_VIDEO_DRIVER_KMSDRM_DYNAMIC_GBM}
> ++    {NULL, SDL_VIDEO_DRIVER_KMSDRM_DYNAMIC_GBM},
> ++    {NULL, SDL_VIDEO_DRIVER_KMSDRM_DYNAMIC}
> + };
> + 
> + static void *
> +
> -- 
> 2.24.0
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

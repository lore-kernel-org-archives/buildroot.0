From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Feb 2017 14:26:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/mpv: fixup fix build on
 powerpc64 w/ altivec
In-Reply-To: <51f5a34879535401d9769f0aa92fe5b3959784c2.1482103876.git.sam.bobroff@au1.ibm.com>
References: <51f5a34879535401d9769f0aa92fe5b3959784c2.1482103876.git.sam.bobroff@au1.ibm.com>
Message-ID: <20170219132602.GC3450@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sam, All,

On 2016-12-19 10:31 +1100, Sam Bobroff spake thusly:
> The initial fix for this issue, re-including stdbool.h, is not
> working.
> 
> Instead, fix using the method used for other packages with a similar
> problem: add -std=gnu99, which prevents bool from being redefined and
> removes the need for any source code change.
> 
> Fixes: 64904f0f6d691cfea5ae1c8f58e2d61aac0684c2
> 
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> 
>  .../mpv/0002-Fix-build-on-powerpc64-altivec.patch  | 28 -------------------
>  package/mpv/0002-fix-powerpc64-altivec.patch       | 32 ++++++++++++++++++++++
>  2 files changed, 32 insertions(+), 28 deletions(-)
>  delete mode 100644 package/mpv/0002-Fix-build-on-powerpc64-altivec.patch
>  create mode 100644 package/mpv/0002-fix-powerpc64-altivec.patch
> 
> diff --git a/package/mpv/0002-Fix-build-on-powerpc64-altivec.patch b/package/mpv/0002-Fix-build-on-powerpc64-altivec.patch
> deleted file mode 100644
> index 6db911d7c..000000000
> --- a/package/mpv/0002-Fix-build-on-powerpc64-altivec.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Subject: [PATCH] Work around bool type redefinition by altivec
> -
> -On powerpc64le, the SDL header from SDL2 may include altivec.h and this
> -(combined with -std=c99) will cause a compile failure due to bool being
> -redefined as a vector type.
> -
> -Re-include stdbool.h after SDL.h to restore the normal bool type.
> -
> -Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ----
> - audio/out/ao_sdl.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/audio/out/ao_sdl.c b/audio/out/ao_sdl.c
> -index d9d0062..0cb80d6 100644
> ---- a/audio/out/ao_sdl.c
> -+++ b/audio/out/ao_sdl.c
> -@@ -29,6 +29,7 @@
> - #include "osdep/timer.h"
> - 
> - #include <SDL.h>
> -+#include <stdbool.h>
> - 
> - struct priv
> - {
> --- 
> -2.10.0.297.gf6727b0
> -
> diff --git a/package/mpv/0002-fix-powerpc64-altivec.patch b/package/mpv/0002-fix-powerpc64-altivec.patch
> new file mode 100644
> index 000000000..45983fec8
> --- /dev/null
> +++ b/package/mpv/0002-fix-powerpc64-altivec.patch
> @@ -0,0 +1,32 @@
> +Subject: [PATCH] Work around bool type redefinition by altivec
> +
> +On powerpc64le, the SDL header may include altivec.h and this
> +(combined with -std=c99) will cause a compile failure due to bool
> +being redefined as a vector type.
> +
> +Adjust the compiler flags to add -std=gnu99 (which is compatible with
> +altivec) when using gcc. The generic flag '-std=c99' is left in place for other
> +compilers (in the gcc case it is overridden by the (later) gnu flag).
> +
> +Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> +---
> + waftools/detections/compiler.py | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/waftools/detections/compiler.py b/waftools/detections/compiler.py
> +index 5bbba87..50836a2 100644
> +--- a/waftools/detections/compiler.py
> ++++ b/waftools/detections/compiler.py
> +@@ -43,7 +43,8 @@ def __add_gcc_flags__(ctx):
> +                        "-Wno-switch", "-Wparentheses", "-Wpointer-arith",
> +                        "-Wno-pointer-sign",
> +                        # GCC bug 66425
> +-                       "-Wno-unused-result"]
> ++                       "-Wno-unused-result",
> ++                       "-std=gnu99"]
> + 
> + def __add_clang_flags__(ctx):
> +     ctx.env.CFLAGS += ["-Wno-logical-op-parentheses", "-fcolor-diagnostics",
> +-- 
> +2.10.0.297.gf6727b0
> +
> -- 
> 2.11.0
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
